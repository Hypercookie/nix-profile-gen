#!/usr/bin/env python3
"""Setup and push CLI for the nixmagic local MDM server.

nixmagic generates macOS ``.mobileconfig`` Configuration Profiles from a
declarative Home Manager configuration.  Normally the user installs those by
double-clicking them.  This CLI drives a *local* NanoMDM instance instead, so
that ``home-manager switch`` can push freshly generated profiles to the same
machine and have macOS install them without further interaction.

Responsibilities:

* ``csr``       -- create the API key, the local CA and the APNs push CSR, and
                   explain how to get the CSR signed.
* ``pushcert``  -- upload the signed APNs certificate to NanoMDM.
* ``init``      -- create the device identity, a PKCS#12 bundle and an
                   enrollment ``.mobileconfig`` the user installs once.
* ``push``      -- enqueue ``InstallProfile`` commands for generated profiles.
* ``status``    -- report what exists and what the server thinks.

Command order
-------------

``csr`` -> get the CSR signed -> ``pushcert`` -> ``init`` -> install the
enrollment profile -> ``push``.

The order is forced by two dependencies that would otherwise deadlock.  The
server refuses to start without the CA, and ``pushcert`` needs the API key, so
``csr`` creates both before anything else exists; ``init`` repeats that step
idempotently for anyone who skipped ``csr``.  The enrollment profile embeds the
real APNs topic and cannot be corrected without re-enrolling, so ``init`` still
has to wait for ``pushcert``.

Security posture
----------------

Every piece of key material lives *only* in the state directory
(``$XDG_STATE_HOME/nixmagic-mdm``, default ``~/.local/state/nixmagic-mdm``),
created ``0700``, with each secret file created ``0600``.  Nothing secret is
ever written into the repository or into the Nix store: the Nix store is
world-readable and its contents are permanent, so a leaked private key there
cannot be recalled.  ``csr`` and ``init`` -- the two commands that create key
material -- refuse to run when the state directory resolves to somewhere inside
a git work tree, which is the most likely way a user would accidentally commit
their MDM identity.

Implementation constraints (repo rule): Python 3 standard library only.  All
asymmetric crypto is delegated to the ``openssl`` binary; HTTP goes through
``urllib.request`` with an explicit ``ssl.SSLContext``.
"""

from __future__ import annotations

import argparse
import base64
import json
import os
import plistlib
import re
import secrets
import shutil
import socket
import ssl
import subprocess
import sys
import tempfile
import urllib.error
import urllib.request
import uuid
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Sequence, Tuple

DEFAULT_SERVER_URL = "https://localhost:9443"

# NanoMDM's HTTP API authenticates with HTTP basic auth and ignores the
# username; upstream documentation and examples use "nanomdm" literally.
API_USERNAME = "nanomdm"

CA_CN = "nixmagic MDM local CA"
PUSH_CN = "nixmagic MDM push"

PROFILE_IDENTIFIER = "com.github.nixmagic.mdm.enrollment"

# Caddy's internal issuer writes its root here under the configured data dir.
CADDY_ROOT_RELATIVE = Path("caddy/pki/authorities/local/root.crt")

# Bucket directories NanoMDM's filekv backend (storage/diskv) creates directly
# under its DSN directory: users, cert_auth, queue, push_cert, devices,
# enrollments.  The older, deprecated "file" backend instead puts one directory
# per enrollment ID there.  Both shapes are scanned, so every known bucket name
# (including spellings from older releases) must be excluded from the results.
DB_BUCKET_NAMES = {
    "users",
    "cert_auth",
    "cert-auth",
    "certauth",
    "queue",
    "push_cert",
    "pushcert",
    "push",
    "devices",
    "enrollments",
    "migration",
    "certauth-assoc",
    "tokenupdate",
}

# The two filekv buckets whose keys are exactly ``<enrollment-id>.<sub-key>``.
# Scanning only these avoids the queue and cert_auth buckets, whose keys carry
# extra components (command UUIDs, certificate hashes) that would produce
# garbage candidates.
DB_ENROLLMENT_BUCKETS = ("devices", "enrollments", "users")

# Trailing key components NanoMDM's kv storage appends to an enrollment ID
# (storage/kv/*.go).  Enrollment IDs may themselves contain dots -- a Shared
# iPad user channel is ``<udid>:<appleid@example.com>`` -- so the suffix has to
# be matched against this list rather than cut at the last dot.
DB_KEY_SUFFIXES = (
    "auth",
    "cert",
    "serial",
    "tok_upd",
    "disabled",
    "user_ch",
    "unl_tok",
    "tok_tal",
    "type",
    "enrolled_at",
    "device_ch",
    "user_auth",
    "user_auth_digest",
    "last_seen_at",
    "topic",
    "push_magic",
    "token",
    "bstoken",
)

# Bit mask of every MDM access right macOS defines for a non-DEP enrollment.
# 8191 == 2**13 - 1, i.e. "grant everything"; a narrower mask would silently
# reject InstallProfile later, which is the one command this tool exists for.
MDM_ACCESS_RIGHTS = 8191

# A device-channel ID is a UDID or EnrollmentID; the optional part after the
# colon is the user channel.  "@" is allowed there because a Shared iPad user
# channel is identified by an Apple ID short name.
ENROLLMENT_ID_RE = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._%-]{7,}(:[A-Za-z0-9._%@-]+)?$")


# ---------------------------------------------------------------------------
# state directory
# ---------------------------------------------------------------------------


def default_state_dir() -> Path:
    base = os.environ.get("XDG_STATE_HOME") or "~/.local/state"
    return Path(base).expanduser() / "nixmagic-mdm"


def state_paths(state_dir: Path) -> Dict[str, Path]:
    """Single source of truth for the on-disk layout."""
    return {
        "state": state_dir,
        "ca_dir": state_dir / "ca",
        "ca_key": state_dir / "ca" / "ca.key",
        "ca_cert": state_dir / "ca" / "ca.pem",
        "device_dir": state_dir / "device",
        "device_key": state_dir / "device" / "device.key",
        "device_cert": state_dir / "device" / "device.pem",
        "device_p12": state_dir / "device" / "device.p12",
        "device_p12_pass": state_dir / "device" / "p12.pass",
        "push_dir": state_dir / "push",
        "push_key": state_dir / "push" / "push.key",
        "push_csr": state_dir / "push" / "push.csr",
        "push_cert": state_dir / "push" / "push.pem",
        "push_topic": state_dir / "push" / "topic",
        "api_key": state_dir / "api.key",
        "enrollment": state_dir / "enrollment.mobileconfig",
        "enrollment_id": state_dir / "enrollment-id",
        "uuids": state_dir / "uuids.json",
        "db": state_dir / "db",
        "caddy": state_dir / "caddy",
        "caddy_root": state_dir / CADDY_ROOT_RELATIVE,
    }


# Files ``status`` reports on, in presentation order.
STATE_FILE_KEYS = [
    "ca_key",
    "ca_cert",
    "device_key",
    "device_cert",
    "device_p12",
    "device_p12_pass",
    "push_key",
    "push_csr",
    "push_cert",
    "push_topic",
    "api_key",
    "enrollment",
    "uuids",
]


def ensure_dir(path: Path, mode: int = 0o700) -> None:
    path.mkdir(parents=True, exist_ok=True, mode=mode)
    # mkdir's mode is masked by umask and is a no-op when the directory already
    # exists, so tighten explicitly.  A directory is not secret content, so
    # there is no create-time race to worry about here.
    os.chmod(path, mode)


def write_secret(path: Path, data: bytes) -> None:
    """Write ``data`` to ``path``, never observable at wider than 0600.

    ``open()`` then ``chmod()`` leaves a window in which the file exists with
    the umask-derived mode; a local attacker can open a handle during that
    window and keep reading the file afterwards.  ``os.open`` with the mode
    argument sets the permissions in the same syscall that creates the file.

    The mode argument only applies when the file is created, so a file left
    over from an older run -- or planted by a local attacker -- would keep its
    old, possibly world-readable mode; ``fchmod`` on the open descriptor fixes
    that without a second path lookup.  ``O_NOFOLLOW`` makes a planted symlink
    fail instead of redirecting the secret somewhere readable.
    """
    ensure_dir(path.parent)
    fd = os.open(str(path), os.O_WRONLY | os.O_CREAT | os.O_TRUNC | os.O_NOFOLLOW, 0o600)
    with os.fdopen(fd, "wb") as handle:
        os.fchmod(handle.fileno(), 0o600)
        handle.write(data)


def write_public(path: Path, data: bytes, mode: int = 0o644) -> None:
    """Write non-secret material (certificates, topic string)."""
    ensure_dir(path.parent)
    # O_NOFOLLOW for the same reason as in write_secret: a symlink here would
    # let an attacker choose where the file lands, e.g. over a private key.
    fd = os.open(str(path), os.O_WRONLY | os.O_CREAT | os.O_TRUNC | os.O_NOFOLLOW, mode)
    with os.fdopen(fd, "wb") as handle:
        # os.open masks the mode with the umask and ignores it entirely for an
        # existing file, so set it explicitly on the descriptor.
        os.fchmod(handle.fileno(), mode)
        handle.write(data)


def inside_git_work_tree(path: Path) -> Optional[Path]:
    """Return the work tree root if ``path`` is inside one, else ``None``.

    Walks parents looking for a ``.git`` entry (a directory for a normal clone,
    a file for a worktree or submodule) instead of shelling out to git, so the
    check also works when the directory does not exist yet.
    """
    candidate = path if path.is_absolute() else path.resolve()
    for parent in [candidate] + list(candidate.parents):
        if (parent / ".git").exists():
            return parent
    return None


# ---------------------------------------------------------------------------
# openssl
# ---------------------------------------------------------------------------


class OpenSSLError(RuntimeError):
    pass


def run_openssl(
    args: Sequence[str],
    check: bool = True,
    env: Optional[Dict[str, str]] = None,
) -> subprocess.CompletedProcess:
    """Run ``openssl`` with ``args``, capturing both streams.

    Never pass a passphrase as ``pass:...`` on the command line: argv is
    visible to every process on the machine via ``ps``.  Pass it through
    ``env`` instead and reference it with openssl's ``env:VARNAME`` syntax; the
    environment of another user's process is not readable on macOS.
    """
    binary = shutil.which("openssl")
    if binary is None:
        raise OpenSSLError("openssl not found on PATH")
    child_env = None
    if env is not None:
        child_env = dict(os.environ)
        child_env.update(env)
    proc = subprocess.run(
        [binary, *args],
        capture_output=True,
        text=True,
        env=child_env,
    )
    if check and proc.returncode != 0:
        raise OpenSSLError(
            "openssl {} failed ({}):\n{}".format(
                " ".join(args[:2]), proc.returncode, proc.stderr.strip()
            )
        )
    return proc


# ---------------------------------------------------------------------------
# HTTP
# ---------------------------------------------------------------------------


def build_ssl_context(paths: Dict[str, Path]) -> ssl.SSLContext:
    """Verifying context that also trusts Caddy's internal root, if present.

    The server presents a certificate issued by Caddy's local authority, which
    is not in the system trust store from this process's point of view.  Adding
    it explicitly keeps hostname and chain verification on; disabling
    verification instead would make a man-in-the-middle on the API key silent.
    """
    context = ssl.create_default_context()
    root = paths["caddy_root"]
    if root.exists():
        context.load_verify_locations(cafile=str(root))
    return context


def http_request(
    method: str,
    url: str,
    *,
    data: Optional[bytes] = None,
    api_key: Optional[str] = None,
    content_type: Optional[str] = None,
    context: Optional[ssl.SSLContext] = None,
    timeout: int = 30,
) -> Tuple[int, bytes]:
    """Perform one HTTP request and return ``(status, body)``.

    Basic auth is set unconditionally rather than via ``HTTPBasicAuthHandler``:
    the handler only authenticates after seeing a 401 challenge, which costs a
    round trip and breaks for endpoints that answer 403 instead.
    """
    request = urllib.request.Request(url, data=data, method=method)
    if api_key is not None:
        token = base64.b64encode("{}:{}".format(API_USERNAME, api_key).encode("utf-8")).decode(
            "ascii"
        )
        request.add_header("Authorization", "Basic " + token)
    if content_type is not None:
        request.add_header("Content-Type", content_type)
    try:
        with urllib.request.urlopen(request, timeout=timeout, context=context) as resp:
            return resp.status, resp.read()
    except urllib.error.HTTPError as exc:
        # The body of an error response carries NanoMDM's explanation; losing it
        # would make every failure indistinguishable.
        return exc.code, exc.read()
    except urllib.error.URLError as exc:
        raise RuntimeError("request to {} failed: {}".format(url, exc.reason)) from exc


def read_api_key(path: Path) -> str:
    if not path.exists():
        # 'csr' creates it, not 'init': 'init' cannot run before a topic
        # exists, and producing a topic already needs this key.
        raise RuntimeError("API key file {} does not exist; run 'csr' first".format(path))
    return path.read_text(encoding="utf-8").strip()


# ---------------------------------------------------------------------------
# misc helpers
# ---------------------------------------------------------------------------


def hardware_uuid() -> str:
    """Stable per-machine identifier, used as the device certificate CN.

    The CN must not change between runs of ``init``: it is what NanoMDM's
    certificate auth ties the enrollment to.  The IOKit platform UUID survives
    hostname changes, so it is preferred over ``gethostname()``.
    """
    ioreg = shutil.which("ioreg")
    if ioreg is not None:
        proc = subprocess.run(
            [ioreg, "-d2", "-c", "IOPlatformExpertDevice"],
            capture_output=True,
            text=True,
        )
        if proc.returncode == 0:
            match = re.search(r'"IOPlatformUUID"\s*=\s*"([^"]+)"', proc.stdout)
            if match:
                return match.group(1)
    return socket.gethostname()


def load_uuids(paths: Dict[str, Path]) -> Dict[str, str]:
    """Persisted payload UUIDs.

    macOS keys installed profiles by ``PayloadUUID``.  Regenerating them on
    every ``init`` would turn each re-run into a different profile, so they are
    written once and reused.
    """
    path = paths["uuids"]
    if path.exists():
        try:
            data = json.loads(path.read_text(encoding="utf-8"))
        except json.JSONDecodeError:
            data = {}
        if isinstance(data, dict):
            return {str(k): str(v) for k, v in data.items()}
    return {}


def get_uuid(store: Dict[str, str], key: str) -> str:
    if key not in store:
        store[key] = str(uuid.uuid4()).upper()
    return store[key]


# Mirrors the default of programs.macprofile.outputPath, which is relative to
# $HOME.
DEFAULT_PROFILE_BASE = "Library/Application Support/HomeManager/profile.mobileconfig"

PROFILE_EXTENSION = ".mobileconfig"


def profile_paths_for_base(base: str) -> Dict[str, Path]:
    """Per-scope profile paths derived from an ``outputPath`` base name.

    ``programs.macprofile.outputPath`` is a *base* name, relative to ``$HOME``:
    ``outputPathFor`` in generateMacOSProfile.nix inserts ``-user`` /
    ``-system`` before a ``.mobileconfig`` extension, and otherwise appends the
    scope to the whole name.  The rule is reproduced exactly, because guessing
    differently here means pushing nothing at all.
    """
    path = Path(base).expanduser()
    if not path.is_absolute():
        path = Path.home() / path

    def with_scope(scope: str) -> Path:
        if path.name.endswith(PROFILE_EXTENSION):
            stem = path.name[: -len(PROFILE_EXTENSION)]
            return path.parent / "{}-{}{}".format(stem, scope, PROFILE_EXTENSION)
        return path.parent / "{}-{}".format(path.name, scope)

    return {scope: with_scope(scope) for scope in ("system", "user")}


def strip_db_key_suffix(key: str) -> Optional[str]:
    """Turn a filekv key file name into the enrollment ID it belongs to.

    Keys are ``<enrollment-id>.<sub-key>``.  The one exception is the
    user-channel association ``<device-id>.user_ch.<user-channel-id>``, whose
    tail is itself a full enrollment ID and therefore the more useful answer.
    """
    marker = ".user_ch."
    position = key.find(marker)
    if position >= 0:
        return key[position + len(marker) :]
    for suffix in DB_KEY_SUFFIXES:
        if key.endswith("." + suffix):
            return key[: -(len(suffix) + 1)]
    # An unrecognised sub-key means this nanomdm is newer than the list above.
    # Cutting at the last dot recovers the ID for every ID shape that has no
    # dot of its own, which is all of them except Shared iPad user channels.
    head, dot, _ = key.rpartition(".")
    return head if dot else None


def discover_enrollment_ids(db_dir: Path) -> List[str]:
    """Best-effort enrollment ID discovery from NanoMDM's file storage.

    NanoMDM has shipped two on-disk shapes.  The deprecated ``file`` backend
    puts one directory per enrollment ID directly under the DSN directory.  The
    current ``filekv`` backend (storage/diskv) uses diskv buckets with
    ``Split2X2Transform``, so a key lands at ``db/<bucket>/<xx>/<yy>/<key>``:
    two shard directories named after the first four characters of the key.

    The shard depth is a diskv detail that upstream is free to change, so this
    walks the enrollment-bearing buckets to arbitrary depth and derives the ID
    from the leaf file name instead of hardcoding the ``xx/yy`` level.

    The result is only ever used as a *candidate list*; callers refuse to act
    when it is ambiguous, so a false positive cannot cause a wrong push.
    """
    if not db_dir.is_dir():
        return []
    found = set()

    def consider(name: str) -> None:
        if name.lower() in DB_BUCKET_NAMES:
            return
        if ENROLLMENT_ID_RE.match(name):
            found.add(name)

    def walk_bucket(bucket: Path) -> None:
        # Only the leaf file names carry the key; the directories in between
        # are shards, and their two-character names never match an ID.
        for _root, _dirs, files in os.walk(str(bucket)):
            for name in files:
                stem = strip_db_key_suffix(name)
                if stem:
                    consider(stem)

    try:
        entries = sorted(db_dir.iterdir())
    except OSError:
        return []
    for entry in entries:
        if not entry.is_dir():
            continue
        if entry.name in DB_ENROLLMENT_BUCKETS:
            walk_bucket(entry)
        elif entry.name.lower() not in DB_BUCKET_NAMES:
            # Legacy "file" backend: the directory name is the enrollment ID.
            consider(entry.name)
    return sorted(found)


def split_channels(ids: Iterable[str]) -> Tuple[List[str], List[str]]:
    """Split IDs into ``(device, user)`` channel lists.

    macOS addresses the per-user channel with ``<device-id>:<user-id>``.  An ID
    without a colon is therefore the device channel, and only the device
    channel can install a system-scope profile.
    """
    device = sorted(i for i in ids if ":" not in i)
    user = sorted(i for i in ids if ":" in i)
    return device, user


# ---------------------------------------------------------------------------
# init
# ---------------------------------------------------------------------------


def generate_ca(paths: Dict[str, Path]) -> None:
    with tempfile.TemporaryDirectory() as tmp:
        tmp_dir = Path(tmp)
        key = tmp_dir / "ca.key"
        cert = tmp_dir / "ca.pem"
        # Generated inside a 0700 temp dir and then copied through
        # write_secret(); letting openssl create the key directly at its final
        # path would leave it umask-readable for an instant.
        run_openssl(
            [
                "req",
                "-x509",
                "-newkey",
                "rsa:4096",
                "-nodes",
                "-sha256",
                "-days",
                "3650",
                "-keyout",
                str(key),
                "-out",
                str(cert),
                "-subj",
                "/CN={}".format(CA_CN),
                "-addext",
                "basicConstraints=critical,CA:TRUE",
                "-addext",
                "keyUsage=critical,keyCertSign,cRLSign",
            ]
        )
        write_secret(paths["ca_key"], key.read_bytes())
        write_public(paths["ca_cert"], cert.read_bytes())


def generate_device_identity(paths: Dict[str, Path], common_name: str) -> bool:
    """Create the device key/cert/p12.  Returns True if ``-legacy`` was used."""
    with tempfile.TemporaryDirectory() as tmp:
        tmp_dir = Path(tmp)
        key = tmp_dir / "device.key"
        csr = tmp_dir / "device.csr"
        cert = tmp_dir / "device.pem"
        p12 = tmp_dir / "device.p12"
        ext = tmp_dir / "device.ext"
        ext.write_text(
            "basicConstraints=critical,CA:FALSE\n"
            "keyUsage=critical,digitalSignature,keyEncipherment\n"
            "extendedKeyUsage=clientAuth\n",
            encoding="utf-8",
        )
        run_openssl(
            [
                "req",
                "-new",
                "-newkey",
                "rsa:2048",
                "-nodes",
                "-sha256",
                "-keyout",
                str(key),
                "-out",
                str(csr),
                "-subj",
                "/CN={}".format(common_name),
            ]
        )
        run_openssl(
            [
                "x509",
                "-req",
                "-in",
                str(csr),
                "-CA",
                str(paths["ca_cert"]),
                "-CAkey",
                str(paths["ca_key"]),
                "-CAcreateserial",
                "-days",
                "730",
                "-sha256",
                "-extfile",
                str(ext),
                "-out",
                str(cert),
            ]
        )

        passphrase = secrets.token_urlsafe(24)
        export_args = [
            "pkcs12",
            "-export",
            "-inkey",
            str(key),
            "-in",
            str(cert),
            "-certfile",
            str(paths["ca_cert"]),
            "-name",
            common_name,
            "-out",
            str(p12),
            # env: keeps the passphrase out of argv, which every local user can
            # read with 'ps -ax'.
            "-passout",
            "env:P12PASS",
        ]
        export_env = {"P12PASS": passphrase}
        # macOS' profile installer cannot open PKCS#12 files that use the
        # modern AES/PBKDF2 defaults of OpenSSL 3; it needs the legacy
        # RC2/3DES encryption, which OpenSSL 3 only emits with -legacy.
        # OpenSSL 1.x has no such flag and produces legacy output anyway, so
        # fall back when the flag is rejected.
        legacy = True
        proc = run_openssl(
            ["pkcs12", "-export", "-legacy", *export_args[2:]],
            check=False,
            env=export_env,
        )
        if proc.returncode != 0:
            legacy = False
            run_openssl(export_args, env=export_env)

        write_secret(paths["device_key"], key.read_bytes())
        write_public(paths["device_cert"], cert.read_bytes())
        write_secret(paths["device_p12"], p12.read_bytes())
        write_secret(paths["device_p12_pass"], (passphrase + "\n").encode("utf-8"))
        return legacy


def build_enrollment_profile(
    paths: Dict[str, Path],
    server_url: str,
    topic: str,
    uuids: Dict[str, str],
    root_cert: Optional[bytes],
) -> bytes:
    identity_uuid = get_uuid(uuids, "pkcs12")
    payloads = []

    payloads.append(
        {
            "PayloadType": "com.apple.security.pkcs12",
            "PayloadIdentifier": PROFILE_IDENTIFIER + ".identity",
            "PayloadUUID": identity_uuid,
            "PayloadVersion": 1,
            "PayloadDisplayName": "nixmagic MDM device identity",
            "PayloadCertificateFileName": "device.p12",
            # plistlib serialises bytes as <data>, which is what the pkcs12
            # payload expects.
            "PayloadContent": paths["device_p12"].read_bytes(),
            "Password": paths["device_p12_pass"].read_text(encoding="utf-8").strip(),
        }
    )

    if root_cert is not None:
        payloads.append(
            {
                "PayloadType": "com.apple.security.root",
                "PayloadIdentifier": PROFILE_IDENTIFIER + ".root",
                "PayloadUUID": get_uuid(uuids, "root"),
                "PayloadVersion": 1,
                "PayloadDisplayName": "nixmagic MDM TLS root",
                "PayloadCertificateFileName": "root.crt",
                "PayloadContent": root_cert,
            }
        )

    payloads.append(
        {
            "PayloadType": "com.apple.mdm",
            "PayloadIdentifier": PROFILE_IDENTIFIER + ".mdm",
            "PayloadUUID": get_uuid(uuids, "mdm"),
            "PayloadVersion": 1,
            "PayloadDisplayName": "nixmagic MDM enrollment",
            "ServerURL": server_url.rstrip("/") + "/mdm",
            "CheckInURL": server_url.rstrip("/") + "/checkin",
            # Must be the topic Apple issued for this push certificate.  A
            # mismatch enrolls fine and then never receives a single push.
            "Topic": topic,
            # Binds the MDM payload to the pkcs12 payload above; macOS uses that
            # identity as the TLS client certificate for check-ins.
            "IdentityCertificateUUID": identity_uuid,
            "AccessRights": MDM_ACCESS_RIGHTS,
            # Makes the client CMS-sign every check-in with the identity cert,
            # which is what lets NanoMDM's cert-auth tie a request to an
            # enrollment behind TLS termination.
            "SignMessage": True,
            "CheckOutWhenRemoved": True,
            # Enables the per-user channel, i.e. the ``device:user`` enrollment
            # IDs that user-scope profiles have to be pushed to.
            "ServerCapabilities": ["com.apple.mdm.per-user-connections"],
        }
    )

    profile = {
        "PayloadType": "Configuration",
        "PayloadVersion": 1,
        "PayloadIdentifier": PROFILE_IDENTIFIER,
        "PayloadUUID": get_uuid(uuids, "profile"),
        "PayloadDisplayName": "nixmagic MDM enrollment",
        "PayloadDescription": "Enrolls this Mac with the local nixmagic MDM server.",
        "PayloadOrganization": "nixmagic",
        "PayloadRemovalDisallowed": False,
        "PayloadContent": payloads,
    }
    return plistlib.dumps(profile, fmt=plistlib.FMT_XML)


def guard_state_dir(state_dir: Path) -> Optional[int]:
    """Refuse to create key material inside a git work tree.

    Returns an exit code to propagate, or ``None`` when the path is safe.
    Every command that writes a private key calls this, not just ``init``:
    ``csr`` creates the CA and the push key just as irrevocably.
    """
    work_tree = inside_git_work_tree(state_dir)
    if work_tree is None:
        return None
    print(
        "error: state directory {} is inside the git work tree {}.\n"
        "       Refusing to write private keys somewhere that can be "
        "committed.\n"
        "       Pass --state-dir or set XDG_STATE_HOME to a path outside "
        "the repository.".format(state_dir, work_tree),
        file=sys.stderr,
    )
    return 2


def ensure_base_material(paths: Dict[str, Path], force_ca: bool = False) -> None:
    """Create the state directory skeleton, the API key and the CA.

    None of this needs a running server or an APNs topic, and *everything*
    else needs it: NanoMDM will not start without ``ca/ca.pem`` (it calls
    ``stdlog.Fatal`` when ``-ca`` is unreadable), and every API call, including
    the ``pushcert`` upload that first produces a topic, needs ``api.key``.  So
    this runs from ``csr`` -- the documented first command -- and is idempotent
    so that ``init`` can also perform it if ``csr`` was skipped.
    """
    ensure_dir(paths["state"])
    for key in ("ca_dir", "device_dir", "push_dir", "db", "caddy"):
        ensure_dir(paths[key])

    if not paths["api_key"].exists():
        write_secret(paths["api_key"], (secrets.token_urlsafe(32) + "\n").encode())
        print("generated API key: {}".format(paths["api_key"]))
    else:
        print("API key present: {}".format(paths["api_key"]))

    ca_exists = paths["ca_key"].exists() and paths["ca_cert"].exists()
    if ca_exists and not force_ca:
        print("CA present, keeping it: {}".format(paths["ca_cert"]))
        return
    if ca_exists:
        print(
            "WARNING: --force given, regenerating the CA.\n"
            "WARNING: the existing enrollment becomes invalid. You must "
            "remove the old\n"
            "WARNING: profile in System Settings and install the new "
            "enrollment profile."
        )
    generate_ca(paths)
    print("generated CA: {}".format(paths["ca_cert"]))


def cmd_init(args: argparse.Namespace) -> int:
    """Third step: build the device identity and the enrollment profile.

    Valid command order: ``csr`` -> (get the CSR signed) -> ``pushcert`` ->
    ``init`` -> install the enrollment profile -> ``push``.
    """
    paths = state_paths(args.state_dir)
    state_dir = paths["state"]

    guarded = guard_state_dir(state_dir)
    if guarded is not None:
        return guarded

    # Ordering constraint: the enrollment profile embeds the APNs topic, and it
    # cannot be corrected afterwards without re-enrolling the machine.  So the
    # push certificate has to exist before the profile is generated.  Only this
    # part of init depends on the server; the CA and API key are created by
    # 'csr', which is why that is the first command and not this one.
    if not paths["push_topic"].exists():
        print(
            "error: no APNs topic at {}.\n"
            "       The enrollment profile must carry the real push topic; a "
            "placeholder\n"
            "       produces an enrollment that never receives pushes.\n"
            "       Run 'nixmagic-mdm csr' first, get the CSR signed, then "
            "'nixmagic-mdm pushcert <cert>'.".format(paths["push_topic"]),
            file=sys.stderr,
        )
        return 1

    ensure_base_material(paths, force_ca=args.force)

    device_cn = args.device_cn or hardware_uuid()
    device_exists = (
        paths["device_key"].exists()
        and paths["device_cert"].exists()
        and paths["device_p12"].exists()
        and paths["device_p12_pass"].exists()
    )
    if device_exists and not args.force:
        print("device identity present: {}".format(paths["device_cert"]))
    else:
        legacy = generate_device_identity(paths, device_cn)
        print("generated device identity (CN={}): {}".format(device_cn, paths["device_p12"]))
        if not legacy:
            print(
                "note: this openssl rejected '-legacy'; the PKCS#12 was exported "
                "without it.\n"
                "      If macOS refuses to install the profile, that flag is the "
                "usual cause."
            )

    root_cert: Optional[bytes] = None
    if paths["caddy_root"].exists():
        root_cert = paths["caddy_root"].read_bytes()
        print("embedding Caddy root CA: {}".format(paths["caddy_root"]))
    else:
        print(
            "WARNING: Caddy root certificate not found at {}.\n"
            "WARNING: The Caddy agent has probably not started yet, so this "
            "profile will\n"
            "WARNING: contain no TLS trust anchor and check-ins will fail TLS "
            "validation.\n"
            "WARNING: Start the MDM service, then re-run 'init' to regenerate "
            "the profile.".format(paths["caddy_root"])
        )

    uuids = load_uuids(paths)
    topic = paths["push_topic"].read_text(encoding="utf-8").strip()
    profile = build_enrollment_profile(paths, args.server_url, topic, uuids, root_cert)
    write_secret(paths["enrollment"], profile)
    # Not secret, but it is regenerated whenever a payload UUID is minted.
    write_public(paths["uuids"], json.dumps(uuids, indent=2, sort_keys=True).encode())

    print("")
    print("enrollment profile: {}".format(paths["enrollment"]))
    print("next steps:")
    print("  1. open '{}'".format(paths["enrollment"]))
    print("  2. approve it in System Settings -> Privacy & Security -> Profiles")
    return 0


# ---------------------------------------------------------------------------
# csr
# ---------------------------------------------------------------------------

CSR_INSTRUCTIONS = """
The CSR above still needs to be signed by an Apple-recognised MDM vendor before
Apple will issue a push certificate for it. There are two routes.

Recommended route -- Apple Developer Program
  1. Join the Apple Developer Program (99 USD per year).
  2. Go to the Apple Push Certificates Portal at https://identity.apple.com and
     sign in with the Apple ID attached to that membership.
  3. Upload the CSR and download the resulting push certificate.
  This is the official, supported path. Nobody else's signing certificate sits
  between you and Apple, so the certificate cannot be invalidated by a third
  party.

Default free route -- mdmcert.download
  1. Go to https://mdmcert.download and register with your email address.
  2. Submit the CSR printed above. mdmcert.download acts as a pre-approved MDM
     vendor and returns a signed request, usually by email.
  3. Upload that signed request to https://identity.apple.com using any free
     Apple ID.
  4. Download the resulting push certificate and pass it to
     'nixmagic-mdm pushcert <cert-file>'.

  Caveats you should weigh before using mdmcert.download:
    - The service is not sanctioned by Apple.
    - Its vendor signing certificate could be revoked at any time, which would
      break your enrollment with no warning and no recourse.
    - The push certificate must be renewed once a year, and losing it means
      re-enrolling every managed device.
    - The service is intended for legitimate IT management use only.
"""


def cmd_csr(args: argparse.Namespace) -> int:
    """First step: create the API key, the CA and the APNs push CSR.

    Valid command order: ``csr`` -> (get the CSR signed) -> ``pushcert`` ->
    ``init`` -> install the enrollment profile -> ``push``.  Nothing here needs
    the server or a topic, so this is what breaks the bootstrap cycle: the
    server needs the CA to start, and ``pushcert`` needs the API key.
    """
    paths = state_paths(args.state_dir)

    guarded = guard_state_dir(paths["state"])
    if guarded is not None:
        return guarded

    # --force here means "new push key", never "new CA": regenerating the CA
    # would silently invalidate an existing enrollment.  Use 'init --force'
    # for that, which says so out loud.
    ensure_base_material(paths)

    exists = paths["push_key"].exists() and paths["push_csr"].exists()
    if exists and not args.force:
        print("push CSR present, keeping it (use --force to regenerate)")
    else:
        if exists:
            print(
                "WARNING: --force given, regenerating the push key and CSR.\n"
                "WARNING: any certificate Apple already issued for the old key "
                "becomes unusable."
            )
        with tempfile.TemporaryDirectory() as tmp:
            tmp_dir = Path(tmp)
            key = tmp_dir / "push.key"
            csr = tmp_dir / "push.csr"
            run_openssl(
                [
                    "req",
                    "-new",
                    "-newkey",
                    "rsa:2048",
                    "-nodes",
                    "-sha256",
                    "-keyout",
                    str(key),
                    "-out",
                    str(csr),
                    "-subj",
                    "/CN={}".format(PUSH_CN),
                ]
            )
            write_secret(paths["push_key"], key.read_bytes())
            write_public(paths["push_csr"], csr.read_bytes())
        print("generated push key and CSR")

    print("")
    print("CSR file: {}".format(paths["push_csr"]))
    print(CSR_INSTRUCTIONS)
    print("CSR file: {}".format(paths["push_csr"]))
    print("next step: start the MDM service, then run 'nixmagic-mdm pushcert <cert-file>'")
    return 0


# ---------------------------------------------------------------------------
# pushcert
# ---------------------------------------------------------------------------


def cmd_pushcert(args: argparse.Namespace) -> int:
    """Second step: upload the signed APNs certificate and record the topic.

    Valid command order: ``csr`` -> (get the CSR signed) -> ``pushcert`` ->
    ``init`` -> install the enrollment profile -> ``push``.  This needs only
    the API key and a running server, never a completed ``init``: ``init``
    cannot run until the topic this command records exists.
    """
    paths = state_paths(args.state_dir)
    cert_file = Path(args.cert_file).expanduser()
    if not cert_file.exists():
        print("error: {} does not exist".format(cert_file), file=sys.stderr)
        return 1

    key_file = Path(args.key_file).expanduser() if args.key_file else paths["push_key"]
    if not key_file.exists():
        print(
            "error: push private key {} does not exist; run 'csr' first".format(key_file),
            file=sys.stderr,
        )
        return 1

    cert_pem = cert_file.read_bytes()
    key_pem = key_file.read_bytes()
    # NanoMDM's /v1/pushcert endpoint takes the certificate and the matching
    # private key concatenated in a single PEM body.
    body = cert_pem
    if not body.endswith(b"\n"):
        body += b"\n"
    body += key_pem

    api_key = read_api_key(Path(args.api_key_file))
    url = args.server_url.rstrip("/") + "/v1/pushcert"
    status, response = http_request(
        "PUT",
        url,
        data=body,
        api_key=api_key,
        content_type="application/x-pem-file",
        context=build_ssl_context(paths),
    )
    if not 200 <= status < 300:
        print("error: server returned HTTP {}".format(status), file=sys.stderr)
        print(response.decode("utf-8", "replace"), file=sys.stderr)
        return 1

    try:
        payload = json.loads(response.decode("utf-8"))
    except (UnicodeDecodeError, json.JSONDecodeError):
        print("error: could not parse server response:", file=sys.stderr)
        print(response.decode("utf-8", "replace"), file=sys.stderr)
        return 1

    topic = payload.get("topic")
    if not topic:
        print("error: server response contained no topic:", file=sys.stderr)
        print(json.dumps(payload, indent=2), file=sys.stderr)
        return 1

    write_public(paths["push_topic"], (topic + "\n").encode("utf-8"))
    # Keep our own copy so 'status' and re-uploads do not depend on wherever the
    # user happened to download the certificate to.
    write_secret(paths["push_cert"], cert_pem)

    print("APNs topic: {}".format(topic))
    print("topic written to {}".format(paths["push_topic"]))
    print("certificate copied to {}".format(paths["push_cert"]))
    print("next step: run 'nixmagic-mdm init' to build the enrollment profile")
    return 0


# ---------------------------------------------------------------------------
# push
# ---------------------------------------------------------------------------


def resolve_enrollment_ids(
    paths: Dict[str, Path], explicit: Optional[str]
) -> Tuple[List[str], str]:
    """Return ``(ids, source)`` following the documented resolution order."""
    if explicit:
        return [explicit], "--enrollment-id"
    id_file = paths["enrollment_id"]
    if id_file.exists():
        value = id_file.read_text(encoding="utf-8").strip()
        if value:
            return [value], str(id_file)
    return discover_enrollment_ids(paths["db"]), "autodiscovery in {}".format(paths["db"])


def enqueue_profile(
    args: argparse.Namespace,
    paths: Dict[str, Path],
    api_key: str,
    context: ssl.SSLContext,
    enrollment_id: str,
    profile_path: Path,
) -> bool:
    command = {
        "Command": {
            "RequestType": "InstallProfile",
            # Raw profile bytes; plistlib emits them as <data>, which is what
            # the InstallProfile command expects.
            "Payload": profile_path.read_bytes(),
        },
        "CommandUUID": str(uuid.uuid4()),
    }
    body = plistlib.dumps(command, fmt=plistlib.FMT_XML)
    url = "{}/v1/enqueue/{}".format(args.server_url.rstrip("/"), enrollment_id)
    status, response = http_request(
        "PUT",
        url,
        data=body,
        api_key=api_key,
        content_type="application/x-plist",
        context=context,
    )
    if not 200 <= status < 300:
        print(
            "error: enqueue for {} returned HTTP {}".format(enrollment_id, status),
            file=sys.stderr,
        )
        print(response.decode("utf-8", "replace"), file=sys.stderr)
        return False

    text = response.decode("utf-8", "replace")
    try:
        payload = json.loads(text)
    except json.JSONDecodeError:
        print("{}: {} -> {}".format(enrollment_id, profile_path.name, text.strip()))
        return True

    command_uuid = payload.get("command_uuid", "?")
    push_result = payload.get("push_result", payload.get("push_error", "?"))
    print(
        "{}: {} command_uuid={} push_result={}".format(
            enrollment_id, profile_path.name, command_uuid, push_result
        )
    )
    return True


def cmd_push(args: argparse.Namespace) -> int:
    paths = state_paths(args.state_dir)

    candidates, source = resolve_enrollment_ids(paths, args.enrollment_id)
    device_ids, user_ids = split_channels(candidates)

    if args.scope == "user":
        selected = user_ids
        if not selected:
            # Expected on a Mac where nobody has logged in through the user
            # channel yet, or where per-user connections are not in use.
            print(
                "no user-channel enrollment exists (no enrollment ID containing "
                "':' was found via {}).\n"
                "Nothing to push for --scope user; this is a normal "
                "configuration, not an error.".format(source)
            )
            return 0
    elif args.scope == "system":
        selected = device_ids
    else:
        selected = device_ids + user_ids

    for label, group in (("device", device_ids), ("user", user_ids)):
        if args.scope == "system" and label == "user":
            continue
        if args.scope == "user" and label == "device":
            continue
        if not group and label == "device":
            print(
                "error: no device-channel enrollment ID found via {}.\n"
                "       Is the Mac enrolled? Pass --enrollment-id explicitly.".format(source),
                file=sys.stderr,
            )
            return 1
        if len(group) > 1:
            print(
                "error: {} {}-channel enrollment IDs found via {}:".format(
                    len(group), label, source
                ),
                file=sys.stderr,
            )
            for candidate in group:
                print("         {}".format(candidate), file=sys.stderr)
            print(
                "       Refusing to guess. Pass --enrollment-id or write the "
                "chosen ID to {}.".format(paths["enrollment_id"]),
                file=sys.stderr,
            )
            return 1

    if not selected:
        print(
            "error: no enrollment ID resolved via {}".format(source),
            file=sys.stderr,
        )
        return 1

    # (profile, scope) pairs.  Explicit --profile arguments carry no scope
    # information, so they go to every selected enrollment.
    jobs: List[Tuple[Path, Optional[str]]] = []
    if args.profile:
        for raw in args.profile:
            path = Path(raw).expanduser()
            if not path.exists():
                print("error: profile {} does not exist".format(path), file=sys.stderr)
                return 1
            jobs.append((path, None))
    else:
        defaults = profile_paths_for_base(args.profile_base)
        for scope_name in ("system", "user"):
            if args.scope != "both" and args.scope != scope_name:
                continue
            path = defaults[scope_name]
            if path.exists():
                jobs.append((path, scope_name))
            else:
                # A missing file is normal when that scope has no payloads, but
                # it is also exactly what an overridden outputPath looks like,
                # so say which knob decides the path.
                print(
                    "WARNING: no {} profile at {}.\n"
                    "WARNING: Nothing will be pushed for that scope. If "
                    "programs.macprofile.outputPath\n"
                    "WARNING: was overridden, pass --profile-base with the "
                    "same base path (currently\n"
                    "WARNING: {}).".format(scope_name, path, args.profile_base),
                    file=sys.stderr,
                )

    if not jobs:
        # Exiting 0 here would report success for a push that moved nothing,
        # which is the one failure mode the caller cannot notice.
        print(
            "error: no profile found to push; nothing was sent",
            file=sys.stderr,
        )
        return 1

    api_key = read_api_key(Path(args.api_key_file))
    context = build_ssl_context(paths)

    ok = True
    for path, scope_name in jobs:
        if scope_name == "system":
            targets = device_ids
        elif scope_name == "user":
            # No fallback to the device channel: a User-scope profile installed
            # over the device channel lands system-wide, which is not what the
            # user asked for.  --scope user refuses this too.
            targets = user_ids
        else:
            targets = selected
        if not targets:
            # Reached with --scope both on a Mac that has no user-channel
            # enrollment.  Not an error, but it must not look like a push.
            print("skipping {}: no {}-channel enrollment exists".format(path.name, scope_name))
            continue
        for enrollment_id in targets:
            if not enqueue_profile(args, paths, api_key, context, enrollment_id, path):
                ok = False
    return 0 if ok else 1


# ---------------------------------------------------------------------------
# status
# ---------------------------------------------------------------------------


def cmd_status(args: argparse.Namespace) -> int:
    paths = state_paths(args.state_dir)
    context = build_ssl_context(paths)

    print("state directory: {}".format(paths["state"]))
    print("server URL:      {}".format(args.server_url))
    print("")

    print("server:")
    version_url = args.server_url.rstrip("/") + "/version"
    try:
        status, body = http_request("GET", version_url, context=context)
        print(
            "  GET /version -> HTTP {} {}".format(status, body.decode("utf-8", "replace").strip())
        )
    except RuntimeError as exc:
        print("  GET /version -> unreachable ({})".format(exc))

    topic = None
    if paths["push_topic"].exists():
        topic = paths["push_topic"].read_text(encoding="utf-8").strip()
    if topic:
        print("  APNs topic: {}".format(topic))
        try:
            api_key = read_api_key(Path(args.api_key_file))
        except RuntimeError as exc:
            api_key = None
            print("  pushcert lookup skipped: {}".format(exc))
        if api_key is not None:
            url = "{}/v1/pushcert?topic={}".format(args.server_url.rstrip("/"), topic)
            try:
                status, body = http_request("GET", url, api_key=api_key, context=context)
            except RuntimeError as exc:
                print("  GET /v1/pushcert -> unreachable ({})".format(exc))
            else:
                if 200 <= status < 300:
                    try:
                        payload = json.loads(body.decode("utf-8"))
                    except (UnicodeDecodeError, json.JSONDecodeError):
                        print("  pushcert: unparseable response")
                    else:
                        print(
                            "  pushcert topic={} not_after={}".format(
                                payload.get("topic", "?"),
                                payload.get("not_after", "?"),
                            )
                        )
                else:
                    print("  GET /v1/pushcert -> HTTP {}".format(status))
    else:
        print("  APNs topic: not set (run 'csr' then 'pushcert')")

    print("")
    print("enrollments discovered in {}:".format(paths["db"]))
    ids = discover_enrollment_ids(paths["db"])
    if not ids:
        print("  (none)")
    for enrollment_id in ids:
        channel = "user" if ":" in enrollment_id else "device"
        print("  {} ({} channel)".format(enrollment_id, channel))

    print("")
    print("state files:")
    for key in STATE_FILE_KEYS:
        path = paths[key]
        if path.exists():
            # Contents are never printed: several of these are private keys.
            print("  {:<12} present  mode {:o}  {}".format(key, path.stat().st_mode & 0o777, path))
        else:
            print("  {:<12} MISSING           {}".format(key, path))

    print("")
    caddy_root = paths["caddy_root"]
    print(
        "caddy root cert: {} ({})".format(
            caddy_root, "present" if caddy_root.exists() else "MISSING"
        )
    )
    return 0


# ---------------------------------------------------------------------------
# argument parsing
# ---------------------------------------------------------------------------


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="nixmagic-mdm",
        description=(
            "Set up and drive a local NanoMDM server that installs the macOS "
            "configuration profiles generated by nixmagic.\n"
            "\n"
            "Command order: csr -> (get the CSR signed) -> pushcert -> init -> "
            "install the enrollment profile -> push."
        ),
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument(
        "--state-dir",
        type=lambda value: Path(value).expanduser(),
        default=default_state_dir(),
        help="directory holding CA, identity and push material (default: %(default)s)",
    )
    parser.add_argument(
        "--server-url",
        default=DEFAULT_SERVER_URL,
        help="base URL of the local NanoMDM server (default: %(default)s)",
    )
    parser.add_argument(
        "--api-key-file",
        default=None,
        help="file holding the NanoMDM API key (default: <state-dir>/api.key)",
    )

    sub = parser.add_subparsers(dest="command", metavar="<command>")

    p_init = sub.add_parser(
        "init",
        help="create the device identity and the enrollment profile",
        description=(
            "Third step. Create the device identity and the enrollment "
            "profile, and create the API key and the CA if 'csr' has not "
            "already done so. Requires the APNs topic, so run 'csr' and then "
            "'pushcert' first."
        ),
    )
    p_init.add_argument(
        "--force",
        action="store_true",
        help="regenerate the CA and device identity even if they exist "
        "(invalidates the current enrollment)",
    )
    p_init.add_argument(
        "--device-cn",
        default=None,
        help="common name for the device certificate (default: hardware UUID, else hostname)",
    )
    p_init.set_defaults(func=cmd_init)

    p_csr = sub.add_parser(
        "csr",
        help="create the API key, the CA and the APNs push CSR",
        description="First step. Create the state directory, the API key and "
        "the local CA (all of which the server needs to start), then the APNs "
        "push key and CSR, and explain how to get the CSR signed.",
    )
    p_csr.add_argument(
        "--force",
        action="store_true",
        help="regenerate the push key and CSR even if they exist",
    )
    p_csr.set_defaults(func=cmd_csr)

    p_pushcert = sub.add_parser(
        "pushcert",
        help="upload the signed APNs certificate to NanoMDM",
        description="Second step. Upload the APNs certificate plus its private "
        "key to NanoMDM and record the returned topic. Needs the API key from "
        "'csr' and a running server; run 'init' afterwards.",
    )
    p_pushcert.add_argument("cert_file", metavar="<cert-file>", help="APNs certificate (PEM)")
    p_pushcert.add_argument(
        "--key-file",
        default=None,
        help="push private key (default: <state-dir>/push/push.key)",
    )
    p_pushcert.set_defaults(func=cmd_pushcert)

    p_push = sub.add_parser(
        "push",
        help="enqueue InstallProfile commands for generated profiles",
        description="Enqueue an InstallProfile command per profile and enrollment.",
    )
    p_push.add_argument(
        "--scope",
        choices=("user", "system", "both"),
        default="both",
        help="which profile scope to push (default: %(default)s)",
    )
    p_push.add_argument(
        "--profile",
        action="append",
        default=[],
        metavar="PATH",
        help="profile to push; repeatable. Defaults to the Home Manager generated profiles.",
    )
    p_push.add_argument(
        "--profile-base",
        default=DEFAULT_PROFILE_BASE,
        metavar="PATH",
        help="base path of the generated profiles, i.e. the value of "
        "programs.macprofile.outputPath; relative paths are taken from $HOME "
        "and the scope is appended to the file name (default: %(default)s)",
    )
    p_push.add_argument(
        "--enrollment-id",
        default=None,
        help="target enrollment ID; skips autodiscovery",
    )
    p_push.set_defaults(func=cmd_push)

    p_status = sub.add_parser(
        "status",
        help="report server, certificate and state-file status",
        description="Report server version, push certificate, discovered "
        "enrollments and which state files exist. Never prints secrets.",
    )
    p_status.set_defaults(func=cmd_status)

    return parser


def main(argv: Optional[Sequence[str]] = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    if getattr(args, "func", None) is None:
        parser.print_help()
        return 1
    if args.api_key_file is None:
        args.api_key_file = state_paths(args.state_dir)["api_key"]
    try:
        return args.func(args)
    except (OpenSSLError, RuntimeError) as exc:
        print("error: {}".format(exc), file=sys.stderr)
        return 1
    except KeyboardInterrupt:
        return 130


if __name__ == "__main__":
    sys.exit(main())
