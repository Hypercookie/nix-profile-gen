# AGENTS.md — AI Agent Guide for nixmagic (nix-profile-gen)

## Project Overview

**nixmagic** (published as `nix-profile-gen`) generates Apple `.mobileconfig` Configuration Profiles for macOS, iOS and tvOS from declarative Nix/Home Manager configurations. It bridges Apple's [ProfileManifests](https://github.com/ProfileManifests/ProfileManifests) (a community-maintained registry of macOS/iOS preference manifests) with the Nix module system.

**Key insight**: The ~290 `.nix` files in `nix-modules/payloads/` are **auto-generated** — do not edit them by hand. The authoritative source is `nix_o_s_module_generator.py` + the `ProfileManifests/` git submodule.

---

## Repository Structure

```
nixmagic/
├── flake.nix                        # Nix flake; homeModules, lib.mkProfile, packages, checks
├── flake.lock                       # Pinned dependency versions
├── nix_o_s_module_generator.py      # Python script that generates all payload .nix files
├── README.md                        # User-facing quick-start docs
├── OPTIONS.md                       # How to discover available payload options
├── optnix.toml                      # optnix CLI config for interactive option browsing
├── optnix-config.toml.example       # Example optnix config for home-manager integration
├── ruff.toml / statix.toml / treefmt.nix  # Lint and format config
├── .github/workflows/               # ci.yml, update-manifests.yml
├── tests/
│   └── default.nix                  # Test suite, run with `nix flake check`
├── mdm/                             # Optional local NanoMDM server (hand-written)
│   ├── README.md                    # Setup, security model, option reference
│   ├── cli/nixmagic_mdm.py          # Setup/push CLI (Python stdlib only)
│   ├── nix-modules/mdm.nix          # Home Manager module: programs.appleProfile.mdm
│   └── packages/                    # nanomdm.nix (Go, v0.9.0), nixmagic-mdm.nix (CLI wrapper)
├── ProfileManifests/                # Git submodule — upstream Apple .plist manifest files
│   └── Manifests/
│       ├── ManifestsApple/          # Core Apple payloads (Dock, Finder, WiFi, ...)
│       ├── ManagedPreferencesApple/ # Apple app managed preferences (Safari, Siri, ...)
│       ├── ManagedPreferencesApplications/ # Third-party apps (Chrome, 1Password, ...)
│       └── ManagedPreferencesDeveloper/    # Developer/testing manifests
└── nix-modules/
    ├── home-manager.nix             # HM module: programs.appleProfile.profiles.<name>
    ├── profile/
    │   └── default.nix              # One profile, HM-agnostic: payloads, checks, plist build
    ├── lib/
    │   └── parseUrl.nix             # Minimal http(s) URL splitter for CalDAV/CardDAV
    ├── bridges/                     # accounts.* -> payload mappings (profile-level)
    │   ├── profile.nix              # Imports the three bridges into the profile module
    │   ├── email.nix                # accounts.email    -> com.apple.mail.managed
    │   ├── calendar.nix             # accounts.calendar -> com.apple.caldav.account
    │   └── contact.nix              # accounts.contact  -> com.apple.carddav.account
    └── payloads/
        ├── all-payloads.nix         # Auto-generated imports list
        ├── apple/                   # ~118 auto-generated payload modules
        ├── managed-apple/           # ~30 auto-generated modules
        ├── managed-applications/    # ~128 auto-generated modules (3rd-party apps)
        └── managed-developer/       # ~11 auto-generated modules
```

---

## Architecture

```
ProfileManifests/ (.plist files, git submodule)
        |
        |  nix_o_s_module_generator.py  (run once by developer)
        v
nix-modules/payloads/  (auto-generated .nix modules)
        |
        |  imported by
        v
nix-modules/profile/default.nix  (one profile; + bridges/profile.nix)
        |
        |  evaluated three ways
        v
  programs.appleProfile.profiles.<name>  one per profile (home-manager.nix)
  lib.mkProfile                          plain lib.evalModules, no Home Manager
        |
        |  split by pfm_targets (macOS only), checked against platform
        v
autoInstall = true  (macOS default): ~/Library/.../<name>-<scope>.mobileconfig,
        |                            installed on change
        |  MDM on: nixmagic-mdm push -> Caddy (TLS :9443) -> NanoMDM -> APNs
        |  MDM off: /usr/bin/open -> System Settings
autoInstall = false (default elsewhere): written to outputPath if set, else
                                         only `package`
```

`programs.macprofile` is a `mkRemovedOptionModule` with a migration message.

### Key Components

1. **`nix_o_s_module_generator.py`** — Developer tool (Python stdlib only). Reads each `.plist` manifest, converts pfm types to Nix types, and emits a complete `.nix` module file. Also generates `all-payloads.nix`.

2. **`nix-modules/profile/default.nix`** — Hand-written, Home Manager-agnostic profile module. Declares the per-profile options (platform, profileName, scope, outputPath, ...), imports all payloads and bridges, runs the platform/scope/unique/legacy checks into its own internal `assertions`/`warnings`, and builds `packages`/`package` with an inline Python script in `pkgs.runCommand`. Needs special args `pkgs` and `hmConfig`.

   **`nix-modules/home-manager.nix`** — Declares `programs.appleProfile` (top-level `organization`, `organizationIdentifier`, `profiles`) where `profiles` is `attrsOf (submoduleWith { modules = [ ./profile hmProfileModule ]; })`. `hmProfileModule` adds `enable` and `autoInstall` and the per-name defaults. The file forwards every profile's assertions and warnings, writes `home.file`, owns the install `onChange` hooks, and exposes `_installedFiles` for the MDM module.

3. **`ProfileManifests/`** — Git submodule. Source of truth for all Apple preference keys. Update via `git submodule update --remote ProfileManifests`, then regenerate.

4. **`mdm/`** — Hand-written, optional. A local NanoMDM server plus Caddy as
   launchd agents, and the `nixmagic-mdm` CLI (`csr`, `pushcert`, `init`,
   `push`, `status`). Pushes generated profiles automatically on change so
   they install without a double-click. Inert until
   `programs.appleProfile.mdm.enable = true`; pushes only `autoInstall` profiles. `mdm/README.md` is the detailed
   reference; read it before touching anything here.

5. **`nix-modules/bridges/`** — Hand-written. Profile-level modules mapping `hmConfig.accounts.*` onto payload instances. Off by default on every profile; enabled per profile. All mapped values use `lib.mkDefault` so users override through the normal typed payload path.

---

## Common Tasks

### Regenerate all payload modules

Run after updating `ProfileManifests/` or modifying the generator:

```bash
python3 nix_o_s_module_generator.py
```

This reads `ProfileManifests/Manifests/` and writes `nix-modules/payloads/`. No dependencies beyond Python stdlib.

### Update the ProfileManifests submodule

```bash
git submodule update --remote ProfileManifests
python3 nix_o_s_module_generator.py
```

`.github/workflows/update-manifests.yml` does this daily and opens a pull
request when upstream has moved. Note that `--remote` above means `master`,
because `.gitmodules` declares no `branch`; the workflow resolves the remote's
own `HEAD` instead so an upstream default-branch rename cannot silently
freeze the sync.

Review those pull requests even when green. The generator deletes modules for
manifests that vanished upstream, and a renamed or retyped option evaluates
fine while silently changing the option surface users configure against.

### Build a standalone profile (no Home Manager activation)

```nix
nix-profile-gen.lib.mkProfile {
  pkgs = nixpkgs.legacyPackages.aarch64-darwin;
  platform = "iOS";                 # required
  name = "iphone";                  # derivation name only
  homeConfig = hmConfig;            # optional, for bridges
  modules = [{ payloads."apple-com-apple-dnsSettings-managed".default = { ... }; }];
}
```

Plain `lib.evalModules` over `lib.profileModule`; throws on failed
assertions, traces warnings. Module options are profile-relative (no
`programs.appleProfile.profiles.<name>` prefix).

### Browse available options interactively

```bash
optnix
```

Or list options with `nix eval` as configured in `optnix.toml`.

### Run the tests

```bash
nix flake check
```

`tests/default.nix` builds real Home Manager configurations, generates the
`.mobileconfig`, and asserts against the parsed plist. It covers payload
evaluation across all manifests, multi-instance identifier/UUID uniqueness,
scope routing, the bridges, multiple profiles and autoInstall (platform checks at payload and
key level, per-profile bridges, shared `imports`, output-path collisions),
`lib.mkProfile`, the MDM module (wrapper, Caddyfile, push hook, API-key
handling, shell-injection escaping), and the eval-time assertions.

Traps worth remembering when extending it:

- **Do not `builtins.deepSeq` a derivation.** Derivations are self-referential
  (`drvPath`/`outPath`), so deepSeq recurses until the evaluator segfaults.
  `tryEval` then reports failure unconditionally and any "this must fail" test
  becomes vacuous. Force the finite `.outPath` string instead.
- **Always negative-control a new check.** Break the assertion deliberately and
  confirm the check actually fails before trusting a green run.
- **`evalFailureTest` must not route through `mkProfileScope`.** That helper
  throws when the requested scope produced no profile, which would make a
  "must fail" test pass for the wrong reason. It forces `home.file`'s
  attribute names instead, which runs moduleChecks without assuming a scope.
- **Never name a `runCommand` attribute `system`.** Nix already sets `system`
  in every build environment and it silently shadows yours.
- **`evalFailureTest` cannot see the message.** Before trusting a new one,
  evaluate the same config outside the test and read the `Failed assertions`
  text, so it does not pass on an unrelated error (a typo'd option, say).

---

## Type Mapping (plist → Nix)

The generator (`nix_o_s_module_generator.py`) maps Apple pfm manifest types to Nix types:

| pfm type             | Nix type                                |
| -------------------- | --------------------------------------- |
| `string`             | `types.str`                             |
| `boolean`            | `types.bool`                            |
| `integer`            | `types.int`                             |
| `real`               | `types.float`                           |
| `array`              | `types.listOf <element-type>`           |
| `dictionary`         | `types.submodule` or `types.attrs`      |
| enum with range list | `types.enum [...]`                      |
| any pfm type         | `types.nullOr <type>` (default: `null`) |

Each manifest as a whole becomes:

```nix
options.payloads."<manifest>" = lib.mkOption {
  type = types.attrsOf (types.submodule payloadModule);
  default = { };
};
```

so a profile can hold several instances of the same payload type. The key
options are emitted once into a `let`-bound `payloadModule` and reused. The
path is relative to the profile module, which is what lets every profile
carry its own copy.

---

## Payload Naming Convention

Payload names follow the pattern `<category>-<manifest-stem>` with dots replaced by dashes:

| Category                          | Prefix                  | Example                                      |
| --------------------------------- | ----------------------- | -------------------------------------------- |
| `ManifestsApple/`                 | `apple-`                | `apple-com-apple-dock`                       |
| `ManagedPreferencesApple/`        | `managed-apple-`        | `managed-apple-com-apple-finder`             |
| `ManagedPreferencesApplications/` | `managed-applications-` | `managed-applications-com-google-Chrome`     |
| `ManagedPreferencesDeveloper/`    | `managed-developer-`    | `managed-developer-com-github-GitHubDesktop` |

---

## Payload Instance Convention

Payloads are addressed as `<profile>.payloads.<manifest>.<instance>.<key>`,
where `<profile>` is `programs.appleProfile.profiles.<name>`.

- The instance name `default` is special-cased: its `PayloadIdentifier` gets no
  suffix, keeping identifiers and UUIDs stable for single-instance configs.
- Any other instance name is appended, giving `<org>.<domain>.<instance>`.

Every instance carries these options emitted by the generator:

| Option                      | Purpose                                                               |
| --------------------------- | --------------------------------------------------------------------- |
| `_domain`                   | `PayloadType` for the manifest                                        |
| `_unique`                   | From `pfm_unique`; drives the "only one instance" assertion           |
| `_displayName`              | Per-instance `PayloadDisplayName`                                     |
| `_keyNames`                 | Payload key names, used to detect the pre-instance flat syntax        |
| `_targets`                  | From `pfm_targets`; routes the instance to the User or System profile |
| `_platforms`                | From `pfm_platforms`; checked against `platform` by an assertion      |
| `_keyPlatforms`             | `[{ path; platforms; }]` for keys narrower than their manifest        |
| `_allowUnsupportedPlatform` | User-facing; downgrades platform errors to warnings                   |
| `_scope`                    | User-facing override for `_targets` (not internal)                    |

`internalKeys` in `nix-modules/profile/default.nix` (these plus `enable`) must
be kept in sync, otherwise plumbing leaks into the generated plist.

## Profile Scope Routing

`pfm_targets` decides which profile a payload belongs in. Of 287 generated
modules, 98 are system-only, 12 are user-only, and 177 accept either; the
generator maps missing metadata (16 manifests) to `[ "system" "user" ]`.
These counts drift with every upstream sync.

- `scopeOf` in `nix-modules/profile/default.nix` resolves `_scope` first, then
  falls back to `_targets`; payloads accepting either follow `scope`.
- Only macOS splits. Up to two `.mobileconfig` files are produced there;
  `outputPath` is a **base** name and `outputPathFor` appends `-user` /
  `-system`. Other platforms produce one System profile at `outputPath`
  unchanged, without `PayloadScope`.
- Only scopes with payloads are written. `outputPaths` is a read-only option
  exposing the resolved paths, keyed by scope, and is what the tests use.
- The profile whose scope equals the `scope` preference keeps the bare
  `organizationIdentifier`; the other is suffixed so identifiers and UUIDs
  cannot collide.
- Forcing `_scope` against `_targets` warns rather than errors, because
  upstream metadata is sometimes absent or wrong.

## Platform

`platform` is one of `macOS` (default), `iOS`, `tvOS`. No manifest lists
watchOS or visionOS, so they are not offered.

- Each enabled instance is asserted against `_platforms` (empty list passes),
  and every non-null key in `_keyPlatforms` against its own list. The
  generator's `collect_key_platforms()` walks the same tree as
  `generate_option()`; keep the two in sync. Lists are descended into, so a
  key inside an array of dictionaries is found in any element.
- Non-macOS forces a single System profile: `scope` defaults to `System`, an
  assertion rejects `User`, and `_scope = "User"` on any instance fails eval.
- Only `autoInstall` profiles are opened or pushed, and those must be macOS.
- Bridges must only set keys valid for `config.platform`, e.g.
  `CardDAVPrincipalURL` is iOS-only and is nulled on macOS.

## Profiles and installation

- Profile defaults from `hmProfileModule`: `profileName = <name>`,
  `organization` from the top level, `organizationIdentifier =
<top level>.<name>`, `_name = <name>` (derivation and file name).
- `autoInstall` defaults to `platform == "macOS"` and asserts macOS. When on,
  `outputPath` defaults to `Library/Application Support/HomeManager/<name>.mobileconfig`
  and the file gets an `onChange` hook: MDM push when
  `programs.appleProfile.mdm.enable`, otherwise `/usr/bin/open`. MDM
  replaces the open hook, it does not add to it.
- When off, `outputPath` defaults to `null` (no `home.file`); `package` is
  the escape hatch.
- Assertions across profiles: duplicate written paths, and duplicate
  `organizationIdentifier` among auto-installed profiles (they would replace
  each other on the Mac).
- The wrapped `nixmagic-mdm` gets `--profile-manifest <store json>` listing
  `_installedFiles`, so a manual `push` sends exactly the auto-installed
  profiles. The CLI must keep accepting that flag.

## Important Constraints

- **Do not hand-edit files in `nix-modules/payloads/`** — they are overwritten by `nix_o_s_module_generator.py`.
- **Do not edit `nix-modules/payloads/all-payloads.nix`** — also auto-generated.
- The generator uses only Python stdlib — do not add third-party dependencies.
- `nix-modules/profile/` must not depend on Home Manager (no `lib.hm`, no `home.*`); `lib.mkProfile` and optnix evaluate it with plain `lib.evalModules`.
- The inline Python script inside `nix-modules/profile/default.nix` must handle the JSON → binary plist conversion at Nix build time (it receives data via `pkgs.writeText` JSON, not via Python imports).
- Nix identifiers with dots/dashes in Apple key names are sanitized by `sanitize_nix_identifier()` in the generator — follow the same convention if adding new keys manually.
- `collect_key_names()` mirrors the skip/dedupe logic of `generate_option()`. If you change which subkeys are emitted, change both.
- The generator **deletes** `.nix` files in an output directory that no manifest produced. Stale outputs from renamed upstream manifests would otherwise keep being imported by `all-payloads.nix` in an outdated format.
- Bridges must guard with `hmConfig ? accounts && hmConfig.accounts ? <ns>` so they stay evaluable outside Home Manager (`hmConfig = { }`).
- Home Manager's option is `accounts.contact` (**singular**), even though its module file is `contacts.nix`.
- Never emit password keys from a bridge: the profile is built in a derivation and lands in the world-readable Nix store.
- MDM: no secret (API key, CA key, push key, PKCS#12 passphrase) may enter the Nix store, `argv`, or a launchd plist. `apiKeyFile` is a path for that reason. Every path interpolated into shell goes through `lib.escapeShellArg`. See the Security section of `mdm/README.md`.
- `mdm/nix-modules/mdm.nix` imports `nix-modules/home-manager.nix` itself, so `homeModules.mdm` works standalone.

---

## Technologies

- **Nix / Nix Flakes** — package and module system
- **Home Manager** — consumed as `homeModules.*`
- **NanoMDM** (Go, built from source) + **Caddy** — optional local MDM server
- **Python 3** (stdlib: `plistlib`, `re`, `pathlib`, `json`) — generator and plist serialization
- **nixpkgs (nixos-unstable)** — base package set
- **flake-utils** — cross-system flake helpers
- **optnix** — optional CLI for interactive option browsing

---

## Flake Outputs

| Output                           | Contents                                            |
| -------------------------------- | --------------------------------------------------- |
| `homeModules.profiles`           | `programs.appleProfile.profiles.<name>`, bridges    |
| `homeModules.mdm`                | Local MDM server module (imports `profiles` itself) |
| `homeModules.default`            | Both                                                |
| `lib.mkProfile`                  | Standalone `.mobileconfig` builder, no Home Manager |
| `lib.profileModule`              | The profile module itself                           |
| `packages.<system>.nanomdm`      | NanoMDM 0.9.0                                       |
| `packages.<system>.nixmagic-mdm` | MDM setup/push CLI                                  |
| `apps.<system>.nixmagic-mdm`     | Same CLI, for `nix run .#nixmagic-mdm -- <cmd>`     |
| `checks.<system>.*`              | Test suite, plus `treefmt`, `lint` and `pre-commit` |
| `formatter.<system>`             | treefmt wrapper backing `nix fmt`                   |
| `devShells.<system>.default`     | Python 3, optnix, and all lint/format tools         |

`homeModules` is deliberately declared **outside** `flake-utils.lib.eachDefaultSystem`;
Home Manager modules are system-independent, and nesting them made them
reachable only as `homeModules.<system>.profiles`. `lib` lives outside for the
same reason; `mkProfile` takes `pkgs` from the caller.

---

## Formatting, Linting and CI

### Commands

| Command                                                                               | What it does                                                      |
| ------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `nix fmt`                                                                             | Format the tree with treefmt                                      |
| `nix build .#checks.$(nix eval --raw --impure --expr builtins.currentSystem).treefmt` | Check formatting **without writing**                              |
| `nix build .#checks.<system>.lint`                                                    | ruff + statix + deadnix                                           |
| `nix flake check`                                                                     | Everything: the profile tests, `treefmt`, `lint` and `pre-commit` |
| `nix develop`                                                                         | Dev shell; its shell hook installs the git pre-commit hook        |

> **`nix fmt -- --ci` rewrites files in place.** treefmt's `--ci` is
> `--no-cache --fail-on-change`: it still formats, then fails if anything
> changed. Use it only where the working tree is disposable (CI). To _check_
> formatting non-destructively, build `checks.<system>.treefmt`, which runs in
> a sandbox against a copy of the source.

### Configuration

| File                                     | Purpose                                                                          |
| ---------------------------------------- | -------------------------------------------------------------------------------- |
| `treefmt.nix`                            | Formatters and the shared exclude list                                           |
| `ruff.toml`                              | `ruff check` rules for the generator and `mdm/cli/nixmagic_mdm.py`               |
| `statix.toml`                            | statix ignores and disabled lints                                                |
| `.github/workflows/ci.yml`               | `check` (ubuntu + macos), `eval-all-systems`, `format`, `lint`, `generator` jobs |
| `.github/workflows/update-manifests.yml` | Daily ProfileManifests sync, opens a PR                                          |

Formatters: **nixpkgs-fmt** (Nix), **ruff-format** (Python), **prettier**
(Markdown/YAML/JSON), **shfmt** (`.sh`/`.bash` only). nixpkgs-fmt was chosen
over nixfmt-rfc-style because the existing modules already match it: 170
changed lines versus 1817 across the 11 hand-written `.nix` files.

There is a lot of shell embedded in Nix strings (activation scripts, `onChange`
hooks, `runCommand` bodies). treefmt cannot reach it and does not try.

### The two exclusions

`ProfileManifests/` and `nix-modules/payloads/` are excluded from **every**
formatter and linter. They are declared in three places that must stay in
sync — `treefmt.nix` (`settings.excludes`), `statix.toml` (`ignore`), and
`flake.nix` (`lintSrc` for the lint check, `preCommitExcludes` for the hooks).
The pre-commit path needs its own copy because pre-commit passes staged
filenames straight to each hook.

Reformatting `nix-modules/payloads/` would be actively harmful: the next
generator run overwrites it, and the CI `generator` job compares the generated
output byte-for-byte against what is checked in.

### Pre-commit hooks

Provided by `cachix/git-hooks.nix` and installed by entering `nix develop`.
Hooks: `treefmt` (the same wrapper `nix fmt` uses), `ruff`, `statix`,
`deadnix`, `check-merge-conflicts`, `check-added-large-files`, and
`no-commit-to-branch` guarding `master`.

`no-commit-to-branch` is installed by the shell hook but deliberately **left
out of `checks.<system>.pre-commit`**: that check runs
`pre-commit run --all-files` inside a sandbox where git-hooks.nix `git init`s a
throwaway repo whose own default branch is `master`, so the guard would always
trip. `flake.nix` therefore builds two hook sets from one shared definition.
