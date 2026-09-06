# Automatic profile installation via a local MDM server

## What this is

`programs.macprofile` generates `.mobileconfig` Configuration Profiles, but
macOS will not install them by itself: someone has to double-click the file and
approve it in System Settings. This directory adds an optional, local
[NanoMDM](https://github.com/micromdm/nanomdm) server so that the profiles
produced by `home-manager switch` are pushed to the same Mac and installed
without further interaction. Everything runs on loopback under your own user
account — there is no cloud MDM vendor, no other machine, and no part of the
setup leaves the host except the APNs push notification itself, which Apple
requires.

```
home-manager switch
       |
       v
programs.macprofile writes profile-system.mobileconfig / profile-user.mobileconfig
       |
       |  home.file onChange  (fires only when the content changed)
       v
nixmagic-mdm push  ->  PUT https://localhost:9443/v1/enqueue/<enrollment-id>
       |
       v
Caddy (TLS, `tls internal`)  ->  NanoMDM on 127.0.0.1:9000
       |
       |  APNs push
       v
this Mac checks in, receives InstallProfile, installs the profile
```

Two launchd agents run in the background, both defined by the Home Manager
module in `nix-modules/mdm.nix`:

| Agent           | Role                                                                     |
| --------------- | ------------------------------------------------------------------------ |
| `nanomdm`       | The MDM server. Plaintext HTTP on `127.0.0.1:9000`, file-backed storage. |
| `nanomdm-caddy` | Terminates TLS on `:9443` and reverse-proxies to NanoMDM.                |

## Requirements

- A Mac. The server itself evaluates on Linux too (so `nix flake check` passes),
  but the launchd agents and the enrollment only exist on macOS.
- An APNs push certificate from Apple. Without one, MDM cannot wake the device,
  and the CLI refuses to build an enrollment profile. See the next section.
- Realistic expectations. This is a single-machine convenience layer, not a
  substitute for a real MDM in a real organisation. It cannot supervise the Mac,
  it cannot make profiles unremovable, and it has no fleet management, no
  reporting and no recovery story beyond the files in your state directory.

## Getting an APNs push certificate

Apple only issues MDM push certificates against a certificate signing request
that has been countersigned by an Apple-recognised MDM vendor. There are two
ways to obtain that countersignature.

### Recommended: the Apple Developer Program

Join the [Apple Developer Program](https://developer.apple.com/programs/)
(99 USD per year), then upload your CSR directly at the
[Apple Push Certificates Portal](https://identity.apple.com).

This is the official, supported path. The certificate is issued to you against
your own membership, and no third party's signing certificate sits between you
and Apple. Nothing can be revoked out from under you except by Apple itself.

### Default free route: mdmcert.download

The tooling assumes this route, because it is the one that works without a paid
membership. [mdmcert.download](https://mdmcert.download) is a community-run
service that acts as a pre-approved MDM vendor: you submit your CSR, it returns
a signed request by email, and you upload that to `identity.apple.com` with any
free Apple ID.

Weigh these caveats before choosing it:

- The service is **not sanctioned by Apple**.
- Its vendor signing certificate could be revoked at any time. If that happens,
  your enrollment breaks with no warning and no recourse.
- The push certificate must be **renewed annually**, like any MDM push
  certificate. Losing it means re-enrolling the device.
- The service is intended for **legitimate IT management**, not for novelty or
  experimentation. Use it accordingly.

Neither route is more capable than the other; they differ only in who
countersigns and in what can be taken away from you later.

## Two ways to invoke the CLI

The same binary is reachable two ways, and they are not interchangeable:

- **`nixmagic-mdm`, from a Home Manager shell.** Enabling the module puts a
  _wrapped_ copy on your `PATH` that already carries the module's
  `--state-dir`, `--server-url` and `--api-key-file`. If you changed
  `stateDir`, `hostname` or `tlsPort`, this is the invocation that knows about
  it.
- **`nix run .#nixmagic-mdm -- <command>`.** The plain, unwrapped CLI. It falls
  back to its own defaults — `~/.local/state/nixmagic-mdm` (or
  `$XDG_STATE_HOME/nixmagic-mdm`) and `https://localhost:9443` — and knows
  nothing about your configuration. Use it only before the first
  `home-manager switch`, and pass `--state-dir`, `--server-url` and
  `--api-key-file` by hand if you moved any of them.

Mixing the two against different state directories is the easiest way to end up
with a server and a client that disagree about where the API key lives.

## Setup walkthrough

The order matters, for two independent reasons.

- NanoMDM will not start without the local CA at `ca/ca.pem`, and every API
  call needs the API key. `csr` creates both, along with the state directory,
  before anything else exists — which is why it is the first command and can
  run before the server does.
- The enrollment profile embeds the APNs _topic_ that Apple assigns to your
  push certificate, and that value cannot be corrected afterwards without
  re-enrolling the machine. `init` therefore refuses to run until the topic is
  known, which is what puts `pushcert` in front of it.

`init` also calls the same CA/API-key step, idempotently, so it still works if
you skipped `csr` — but you cannot usefully skip `csr`, because the server it
needs would not have started.

```bash
# 1. Create the state directory, the API key, the local CA, and the APNs push
#    key and CSR, then print signing instructions. Run this before the first
#    switch: the server refuses to start without the CA.
nix run .#nixmagic-mdm -- csr

# 2. Enable the Home Manager module and switch. This starts the two agents and
#    puts the wrapped `nixmagic-mdm` on your PATH.
home-manager switch

# 3. Get the CSR signed at mdmcert.download or the Apple Developer portal,
#    then download the push certificate from https://identity.apple.com.

# 4. Upload the certificate (plus the matching private key) to NanoMDM and
#    record the topic it returns.
nixmagic-mdm pushcert /path/to/push.pem

# 5. Create the device identity and the enrollment profile.
nixmagic-mdm init

# 6. Install the enrollment profile once, by hand.
open ~/.local/state/nixmagic-mdm/enrollment.mobileconfig
# then approve it in System Settings > Privacy & Security > Profiles
```

Only `pushcert` talks to the running NanoMDM instance over HTTP. `init` reads
the topic and Caddy's root certificate off disk, so it needs the agents to have
_run_ at least once, but not to be up at that moment.

If you run the commands out of order, the CLI says so rather than producing a
broken enrollment. `init` without a topic prints:

```
error: no APNs topic at <state-dir>/push/topic.
       The enrollment profile must carry the real push topic; a placeholder
       produces an enrollment that never receives pushes.
       Run 'nixmagic-mdm csr' first, get the CSR signed, then 'nixmagic-mdm pushcert <cert>'.
```

`pushcert` before `csr` fails on whichever piece is missing first — the push
key, with

```
error: push private key <state-dir>/push/push.key does not exist; run 'csr' first
```

or the API key, with

```
error: API key file <state-dir>/api.key does not exist; run 'csr' first
```

### The first-run ordering wrinkle

The enrollment profile carries Caddy's internal root certificate as a
`com.apple.security.root` payload, because that root is deliberately _not_
installed into the system trust store. But Caddy only mints that root the first
time its agent starts. On a completely fresh machine, `init` may therefore run
before the root exists, and it will print:

```
WARNING: Caddy root certificate not found at ...
WARNING: Start the MDM service, then re-run 'init' to regenerate the profile.
```

That profile would enroll and then fail TLS validation on every check-in. Let
the agents start, then run `init` again — it keeps the existing CA, device
identity and payload UUIDs, so re-running is cheap and does not invalidate
anything.

### Commands

| Command                | What it does                                                                                                      |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `csr`                  | Create the state directory, the API key, the local CA, and the APNs push key and CSR; print signing instructions. |
| `pushcert <cert-file>` | Upload the APNs certificate and key to NanoMDM, record the topic.                                                 |
| `init`                 | Create the device identity and the enrollment profile, and create the API key and CA if `csr` has not.            |
| `push`                 | Enqueue `InstallProfile` commands for the generated profiles.                                                     |
| `status`               | Report server, certificate and state-file status. Never prints secrets.                                           |

`csr` is **not** a read-only command. It writes the API key and the local CA
private key as well as the push key, so it is covered by the same refusal to
write into a git work tree that `init` is — see "Security".

Global flags, valid before the subcommand:

| Flag                  | Default                                                            |
| --------------------- | ------------------------------------------------------------------ |
| `--state-dir PATH`    | `$XDG_STATE_HOME/nixmagic-mdm`, else `~/.local/state/nixmagic-mdm` |
| `--server-url URL`    | `https://localhost:9443`                                           |
| `--api-key-file PATH` | `<state-dir>/api.key`                                              |

Per-subcommand flags:

| Subcommand | Flags                                                                                                                     |
| ---------- | ------------------------------------------------------------------------------------------------------------------------- |
| `init`     | `--force`, `--device-cn CN`                                                                                               |
| `csr`      | `--force`                                                                                                                 |
| `pushcert` | `<cert-file>` (positional), `--key-file PATH`                                                                             |
| `push`     | `--scope {user,system,both}` (default `both`), `--profile PATH` (repeatable), `--profile-base PATH`, `--enrollment-id ID` |
| `status`   | none                                                                                                                      |

The two `--force` flags deliberately do different things:

- `csr --force` regenerates **only** the push key and CSR. It leaves the CA
  alone, because silently replacing the CA would invalidate an existing
  enrollment as a side effect of asking for a new push certificate. Any
  certificate Apple already issued for the old push key becomes unusable.
- `init --force` regenerates the CA **and** the device identity, and says so
  out loud before doing it. That invalidates the current enrollment; you would
  have to remove the old profile in System Settings and install the new one.

`push` defaults to the Home Manager generated profiles, derived from
`--profile-base` (default
`Library/Application Support/HomeManager/profile.mobileconfig`, relative to
`$HOME`) by inserting
`-system` / `-user` before the extension, exactly as
`programs.macprofile.outputPath` does. If you overrode `outputPath`, pass the
same base path here. When no profile is found at all, `push` prints
`error: no profile found to push; nothing was sent` and exits non-zero, rather
than reporting a success that moved nothing.

### State directory layout

```
~/.local/state/nixmagic-mdm/        0700
├── api.key                         0600  NanoMDM API key
├── enrollment.mobileconfig         0600  the profile you install once
├── enrollment-id                         optional pinned enrollment ID
├── uuids.json                            persisted payload UUIDs
├── ca/
│   ├── ca.key                      0600  local CA private key
│   └── ca.pem                            local CA certificate
├── device/
│   ├── device.key                  0600
│   ├── device.pem
│   ├── device.p12                  0600  identity embedded in the profile
│   └── p12.pass                    0600  passphrase for the bundle above
├── push/
│   ├── push.key                    0600  APNs private key
│   ├── push.csr                          CSR you get signed
│   ├── push.pem                    0600  signed APNs certificate
│   └── topic                             APNs topic returned by NanoMDM
├── db/                                   NanoMDM filekv storage
├── caddy/                                Caddy's internal PKI and storage
└── log/                                  agent stdout/stderr
```

## Home Manager configuration

```nix
{ inputs, ... }:
{
  imports = [ inputs.nix-profile-gen.homeModules.default ];

  programs.macprofile = {
    enable = true;
    profileName = "Nix Enforced Config";
    organizationIdentifier = "com.example";
    scope = "System";

    payloads."apple-com-apple-dock".default = {
      enable = true;
      autohide = true;
    };

    mdm = {
      enable = true;
      # Optional. Defaults to "${stateDir}/api.key", which is where the CLI
      # generates and reads the key, so server and client cannot disagree.
      # Always a file path, never a literal key: the key must not enter the
      # Nix store.
      # apiKeyFile = "/Users/jane/.config/nixmagic-mdm/api-key";
      #
      # Optional. Left unset, the CLI autodiscovers the enrollment from
      # NanoMDM's database, which is the usual case for one machine.
      enrollmentId = "00000000-0000-0000-0000-000000000000";
    };
  };
}
```

`programs.macprofile.mdm.enable` requires `programs.macprofile.enable`, enforced
by an assertion at evaluation time. `apiKeyFile` is _not_ required: it always
has a value, so there is nothing to assert about it.

### Option reference

| Option             | Type            | Default                                                    | Purpose                                                                                                              |
| ------------------ | --------------- | ---------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `enable`           | bool            | `false`                                                    | Run a local NanoMDM server that installs generated profiles automatically.                                           |
| `package`          | package         | `pkgs.callPackage ../packages/nanomdm.nix { }`             | The NanoMDM package providing `bin/nanomdm`.                                                                         |
| `cliPackage`       | package         | `pkgs.callPackage ../packages/nixmagic-mdm.nix { }`        | The package providing `bin/nixmagic-mdm`.                                                                            |
| `listen`           | str             | `"127.0.0.1:9000"`                                         | Address of NanoMDM's plaintext listener. Must stay on loopback.                                                      |
| `hostname`         | str             | `"localhost"`                                              | Host name the device uses to reach the server; must match Caddy's certificate.                                       |
| `tlsPort`          | port            | `9443`                                                     | Port of Caddy's HTTPS listener, i.e. the port the device connects to.                                                |
| `stateDir`         | str             | `"${config.home.homeDirectory}/.local/state/nixmagic-mdm"` | Directory holding the CA, push certificate, device database, logs and Caddy's PKI.                                   |
| `apiKeyFile`       | str             | `"${stateDir}/api.key"`                                    | File containing NanoMDM's API key. Optional; the default is the path the CLI generates the key at and reads it from. |
| `enrollmentId`     | null or str     | `null`                                                     | Device-channel enrollment ID (the hardware UDID). Autodiscovered when null.                                          |
| `enrollmentIdFile` | null or str     | `null`                                                     | File containing the device-channel enrollment ID, for keeping it out of the configuration.                           |
| `userEnrollmentId` | null or str     | `null`                                                     | User-channel enrollment ID in `UUID:UUID` form. Needed for User-scope profiles.                                      |
| `pushOnChange`     | bool            | `true`                                                     | Push the generated profiles when they change, instead of only on an explicit `nixmagic-mdm push`.                    |
| `caddy.enable`     | bool            | `true`                                                     | Run Caddy as the TLS front end. Disable only if another proxy already terminates TLS for `serverUrl`.                |
| `caddy.package`    | package         | `pkgs.caddy`                                               | The Caddy package used for TLS termination.                                                                          |
| `debug`            | bool            | `false`                                                    | Run NanoMDM with `-debug`, which logs full protocol traffic.                                                         |
| `serverUrl`        | str (read-only) | `"https://${hostname}:${tlsPort}"`                         | Resolved base URL, shared by the push hook and the enrollment profile.                                               |
| `caRootPath`       | str (read-only) | `"${stateDir}/caddy/pki/authorities/local/root.crt"`       | Root certificate of Caddy's internal CA.                                                                             |

Enabling the module also adds `nixmagic-mdm` to `home.packages`, wrapped with
`--state-dir`, `--server-url` and `--api-key-file` taken from the options
above. So the CLI on your `PATH` after the first switch follows this
configuration, and `nix run` — which does not — is only needed for the initial
bootstrap. See "Two ways to invoke the CLI".

## How the automatic push works

1. Home Manager writes the generated `.mobileconfig` files through `home.file`.
2. The `onChange` hook runs **only when the file actually differs** from the
   previous generation. That is what makes the push idempotent: re-running
   `home-manager switch` with unchanged payloads enqueues nothing.
3. The hook invokes `nixmagic-mdm push` with the resolved `--state-dir`,
   `--server-url`, `--api-key-file`, `--scope` and `--profile`, plus
   `--enrollment-id` when one is configured. It passes every flag explicitly
   and calls `cliPackage` directly, so it does not depend on what is on your
   `PATH`. Because it always passes `--profile`, `--profile-base` never comes
   into play here; that flag only matters for a manual `push`.
4. The CLI `PUT`s an `InstallProfile` command as an XML plist to
   `<serverUrl>/v1/enqueue/<enrollment-id>`, authenticated with HTTP basic auth
   using the API key.
5. NanoMDM stores the command and sends an APNs push to the device.
6. The Mac checks in over TLS, fetches the command, and installs the profile.

**A failed push does not fail the activation.** The hook ends in
`|| echo "nixmagic-mdm push failed; the profile is still at ..."`, so a
`home-manager switch` still succeeds if the server happens to be down. The
profile is already on disk and can be installed by hand or pushed later with
`nixmagic-mdm push`.

Set `pushOnChange = false` to keep the server but drive the push manually.

## Scopes and channels

`programs.macprofile` splits payloads into a System profile and a User profile
based on each manifest's `pfm_targets`. MDM delivers profiles over two different
channels, and the scope decides which one applies:

| Profile scope | Channel | Enrollment ID form | Configuration                                        |
| ------------- | ------- | ------------------ | ---------------------------------------------------- |
| System        | device  | `UUID`             | `enrollmentId`, `enrollmentIdFile`, or autodiscovery |
| User          | user    | `UUID:UUID`        | `userEnrollmentId` (no autodiscovery)                |

MDM normally delivers on the device channel, so `userEnrollmentId` stays `null`
in most setups. If a User-scope profile is generated while it is unset, the
module emits a warning and the push hook for that scope is omitted entirely,
rather than emitting a command that would fail on every activation:

```
programs.macprofile generates a User-scope profile, but
programs.macprofile.mdm.userEnrollmentId is null, so that profile
will not be pushed ...
```

A manual `nixmagic-mdm push --scope both` behaves the same way: a User-scope
profile is only ever sent to a user-channel enrollment. There is no fallback to
the device channel, because a User profile installed over the device channel
lands system-wide, which is not what was asked for. With no user-channel
enrollment present, `push` prints `skipping <file>: no user-channel enrollment
exists` and carries on with the System profile. `--scope user` on such a
machine is likewise reported as a normal configuration, not an error, and exits
zero.

Either move the affected payloads to the System scope, or set
`userEnrollmentId` to the `UUID:UUID` identifier of the enrolled user channel.
The enrollment profile requests `com.apple.mdm.per-user-connections`, so the
user channel is available; `nixmagic-mdm status` lists any user-channel
enrollment it finds, marked `(user channel)`.

## Security

Read this section before enabling anything.

The state directory holds three things that matter: a **private certificate
authority**, the **device identity** issued by it, and the **APNs push
credential**. Taken together, they are management authority over this Mac.
Anyone who can read them can enroll a device as you, or issue MDM commands to
your machine. Treat them the way you would treat an SSH private key.

Accordingly:

- Everything lives in `$XDG_STATE_HOME/nixmagic-mdm` (default
  `~/.local/state/nixmagic-mdm`). The directory is created `0700` and every
  secret file is created `0600` by `os.open` with the mode set in the same
  syscall, so there is no window in which the file exists world-readable. The
  same `open` passes `O_NOFOLLOW`, so a symlink planted at the target path
  fails the write instead of redirecting the secret somewhere readable, and an
  `fchmod` on the resulting descriptor tightens a file left over from an older
  run — `os.open`'s mode argument only applies to files it creates.
- **Nothing secret is ever written into the Nix store.** The store is
  world-readable and its contents are permanent — a private key leaked there
  cannot be recalled. This is why `apiKeyFile` is a path rather than a value,
  and why the launchd wrapper reads the file at start time instead of embedding
  the key.
- **No secret is ever passed on the command line.** `argv` is visible to
  every local process via `ps`. NanoMDM reads the API key from the
  `NANOMDM_API` environment variable, which the wrapper script sets from the
  file; it is also kept out of the launchd plist, because Home Manager writes
  agent plists into `~/Library/LaunchAgents` world-readable. The same applies
  to the randomly generated PKCS#12 passphrase: `openssl pkcs12 -export` is
  given `-passout env:P12PASS` rather than `pass:<secret>`, so the passphrase
  reaches openssl through its environment, which another user's process cannot
  read on macOS.
- **The CLI refuses to write secrets into a git work tree.** Both commands that
  create key material — `csr` and `init` — walk the parents of the state
  directory looking for a `.git` entry and exit with an error if they find one.
  Accidentally committing your MDM identity is the most likely way to lose
  control of it.
- **Every path interpolated into a shell snippet is escaped.** The launchd
  wrapper, the activation script and the `onChange` push hook all pass paths
  through `lib.escapeShellArg`. Without that, a home directory containing a
  space would split one argument into two and put NanoMDM into a
  `KeepAlive` restart loop, and a `programs.macprofile.outputPath` containing
  `$(...)` or backticks would execute at activation time. `$HOME` is left to
  the shell and only the relative remainder is escaped, so the two concatenate
  into a single word.
- **Caddy's internal root is not installed into the system trust store.**
  `skip_install_trust` keeps it out, both to avoid a sudo prompt on every
  service start and to avoid adding a machine-wide trust anchor. The root is
  handed only to the enrolled device inside the enrollment profile, and the CLI
  loads it explicitly as a verification anchor rather than disabling TLS
  verification — which would make a man-in-the-middle on the API key silent.
  A `storage file { root ... }` block in the Caddyfile is the single mechanism
  that decides where that root lands: it replaces Caddy's default storage
  location outright, so the environment variables that would otherwise select
  it have no effect, and the launchd agent deliberately sets none. That block
  is what makes the root appear at `caRootPath`.
- **Caddy's admin API is disabled** (`admin off`). It is unused here, and
  binding it would expose a local socket that can reconfigure the server.
- `status` deliberately prints only presence and file mode, never contents.

There is no SCEP server in this design. The device identity is a PKCS#12 bundle
issued by the local CA and embedded in the enrollment profile, referenced by
`IdentityCertificateUUID`. For a single self-managed Mac, SCEP would add a
second daemon and a second trust anchor while providing no benefit: SCEP exists
to enroll identities at fleet scale, and here there is exactly one device whose
identity can simply be generated in place. The enrollment profile sets
`SignMessage = true`, so the client CMS-signs each check-in and NanoMDM
authenticates the device from the `Mdm-Signature` header. That is what allows
TLS to be terminated by a plain reverse proxy without mTLS passthrough.

## Limitations

| Goal                                                       | Achievable?                 |
| ---------------------------------------------------------- | --------------------------- |
| Profiles install automatically after `home-manager switch` | Yes                         |
| Works without a 99 USD Apple Developer account             | Yes, via mdmcert.download   |
| Fully local — no cloud MDM vendor                          | Yes, everything on loopback |
| Profiles truly unremovable by the user                     | **No**                      |

`PayloadRemovalDisallowed` exists as a profile flag, but macOS only _enforces_
it on **supervised** devices. Supervision on macOS requires Automated Device
Enrollment (ADE/DEP), which requires Apple Business Manager, which requires a
DUNS number and a registered organisation. On iOS, Apple Configurator 2 can
supervise a device locally over USB; macOS has no equivalent. A local MDM
server cannot close this gap, and no amount of configuration here will.

Two further operational limits:

- **The server must be reachable when the device checks in.** APNs pushes are
  delivered even when the Mac is away from the server, but the check-in HTTP
  call goes to loopback, so a push issued while you are travelling on another
  network only takes effect once the machine is back and the agents are running.
- **The APNs certificate expires annually** and must be renewed through the same
  route you used to obtain it. Re-run `pushcert` with the new certificate. If
  the topic changes you must re-run `init` and reinstall the enrollment profile.

## Troubleshooting

Start here:

```bash
nixmagic-mdm status
```

It reports the server version, the push certificate and its `not_after` date,
every enrollment it can discover, and which state files exist with their modes.
It never prints secret contents.

Check the agents and their logs:

```bash
launchctl list | grep nanomdm

tail -f ~/.local/state/nixmagic-mdm/log/nanomdm.err.log
tail -f ~/.local/state/nixmagic-mdm/log/caddy.err.log
```

| Symptom                                                   | Where to look                                                                                                                    |
| --------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `GET /version -> unreachable`                             | The agents are not running, or Caddy has no certificate yet. Check `log/caddy.err.log`.                                          |
| `nanomdm: API key file ... is missing or unreadable`      | `apiKeyFile` points somewhere that does not exist. Run `csr` to generate one, or fix the path.                                   |
| `error: API key file ... does not exist; run 'csr' first` | Same cause, seen from the CLI side.                                                                                              |
| `error: no APNs topic at ...` from `init`                 | `pushcert` has not run successfully. Do `csr` → sign → `pushcert` → `init`.                                                      |
| `error: no profile found to push; nothing was sent`       | No generated profile at the expected path. Pass `--profile`, or `--profile-base` matching your `programs.macprofile.outputPath`. |
| `error: no device-channel enrollment ID found`            | The Mac is not enrolled, or `db/` is empty. Install the enrollment profile, or pass `--enrollment-id`.                           |
| `error: N device-channel enrollment IDs found`            | Autodiscovery is ambiguous and refuses to guess. Pass `--enrollment-id`, or write the chosen ID to `<state-dir>/enrollment-id`.  |
| macOS refuses to install the enrollment profile           | Usually the PKCS#12 encryption. `init` prints a note if your `openssl` rejected `-legacy`.                                       |

**Push reports success but nothing installs.** The enqueue returning
`push_result` only means NanoMDM accepted the command and APNs accepted the
push; it says nothing about the device acting on it. Check, in order:

1. The APNs **topic** in the enrollment profile matches the certificate. A
   mismatch enrolls cleanly and then never receives a single push. Compare
   `status` output against the profile in System Settings. Fixing it requires
   `init` and a fresh enrollment.
2. The **TLS trust anchor**. If `init` ran before Caddy minted its root, the
   profile has no `com.apple.security.root` payload and check-ins fail TLS
   validation silently. `status` reports whether the root exists; re-run `init`
   and reinstall the profile.
3. The **channel**. A User-scope profile pushed to the device channel will not
   install. See "Scopes and channels".
4. Set `programs.macprofile.mdm.debug = true` and switch. NanoMDM then logs the
   full protocol exchange to `log/nanomdm.log`, which shows whether the device
   checked in at all.

## Flake outputs

| Output                           | Contents                                                          |
| -------------------------------- | ----------------------------------------------------------------- |
| `packages.<system>.nanomdm`      | NanoMDM 0.9.0 (`bin/nanomdm`, `bin/nano2nano`).                   |
| `packages.<system>.nixmagic-mdm` | The setup and push CLI (`bin/nixmagic-mdm`).                      |
| `apps.<system>.nixmagic-mdm`     | The same CLI, for `nix run .#nixmagic-mdm -- <command>`.          |
| `homeModules.mdm`                | This Home Manager module. Also included in `homeModules.default`. |

`homeModules.mdm` imports `generateMacOSProfile.nix` itself, so it can be
imported on its own — you do not have to combine it with
`homeModules.profiles`. Importing both is harmless: the module system keys
modules by file path and evaluates each path exactly once, so the repeated
import is deduplicated rather than merged twice. That is also why listing both
in `homeModules.default` costs nothing.

`homeModules.mdm` is inert until `programs.macprofile.mdm.enable = true`, so
importing `homeModules.default` costs nothing if you do not want an MDM server.
