# AGENTS.md — AI Agent Guide for nixmagic (nix-profile-gen)

## Project Overview

**nixmagic** (published as `nix-profile-gen`) generates macOS `.mobileconfig` Configuration Profiles from declarative Nix/Home Manager configurations. It bridges Apple's [ProfileManifests](https://github.com/ProfileManifests/ProfileManifests) (a community-maintained registry of macOS/iOS preference manifests) with the Nix module system.

**Key insight**: The ~260 `.nix` files in `nix-modules/payloads/` are **auto-generated** — do not edit them by hand. The authoritative source is `nix_o_s_module_generator.py` + the `ProfileManifests/` git submodule.

---

## Repository Structure

```
nixmagic/
├── flake.nix                        # Nix flake; exports homeModules.profiles
├── flake.lock                       # Pinned dependency versions
├── nix_o_s_module_generator.py      # Python script that generates all payload .nix files
├── README.md                        # User-facing quick-start docs
├── OPTIONS.md                       # How to discover available payload options
├── optnix.toml                      # optnix CLI config for interactive option browsing
├── optnix-config.toml.example       # Example optnix config for home-manager integration
├── tests/
│   └── default.nix                  # Test suite, run with `nix flake check`
├── ProfileManifests/                # Git submodule — upstream Apple .plist manifest files
│   └── Manifests/
│       ├── ManifestsApple/          # Core Apple payloads (Dock, Finder, WiFi, ...)
│       ├── ManagedPreferencesApple/ # Apple app managed preferences (Safari, Siri, ...)
│       ├── ManagedPreferencesApplications/ # Third-party apps (Chrome, 1Password, ...)
│       └── ManagedPreferencesDeveloper/    # Developer/testing manifests
└── nix-modules/
    ├── generateMacOSProfile.nix     # Core Home Manager module (hand-written)
    ├── lib/
    │   └── parseUrl.nix             # Minimal http(s) URL splitter for CalDAV/CardDAV
    ├── bridges/                     # Home Manager accounts.* -> payload mappings
    │   ├── default.nix
    │   ├── email.nix                # accounts.email    -> com.apple.mail.managed
    │   ├── calendar.nix             # accounts.calendar -> com.apple.caldav.account
    │   └── contact.nix              # accounts.contact  -> com.apple.carddav.account
    └── payloads/
        ├── all-payloads.nix         # Auto-generated imports list
        ├── apple/                   # ~100 auto-generated payload modules
        ├── managed-apple/           # ~30 auto-generated modules
        ├── managed-applications/    # ~120 auto-generated modules (3rd-party apps)
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
nix-modules/generateMacOSProfile.nix  (core Home Manager module)
        |
        |  used in end-user Home Manager config
        v
programs.macprofile { enable = true; payloads."apple-com-apple-dock".default = { ... }; }
        |
        |  at `home-manager switch`, split by pfm_targets
        v
~/Library/.../profile-user.mobileconfig   (+ profile-system.mobileconfig)
```

### Key Components

1. **`nix_o_s_module_generator.py`** — Developer tool (Python stdlib only). Reads each `.plist` manifest, converts pfm types to Nix types, and emits a complete `.nix` module file. Also generates `all-payloads.nix`.

2. **`nix-modules/generateMacOSProfile.nix`** — The hand-written Home Manager module. Defines top-level `programs.macprofile` options (profileName, scope, outputPath, etc.), collects enabled payloads, strips null values, and uses an inline Python script in a `pkgs.runCommand` derivation to write the final `.mobileconfig` binary plist.

3. **`ProfileManifests/`** — Git submodule. Source of truth for all Apple preference keys. Update via `git submodule update --remote ProfileManifests`, then regenerate.

4. **`nix-modules/bridges/`** — Hand-written. Maps Home Manager's `accounts.*` option tree onto payload instances. Importing the module is the opt-in; all mapped values use `lib.mkDefault` so users override through the normal typed payload path.

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
the bridges, and the two eval-time assertions.

Two traps worth remembering when extending it:

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
options.programs.macprofile.payloads."<manifest>" = lib.mkOption {
  type = types.attrsOf (types.submodule payloadModule);
  default = { };
};
```

so a profile can hold several instances of the same payload type. The key
options are emitted once into a `let`-bound `payloadModule` and reused.

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

Payloads are addressed as `programs.macprofile.payloads.<manifest>.<instance>.<key>`.

- The instance name `default` is special-cased: its `PayloadIdentifier` gets no
  suffix, keeping identifiers and UUIDs stable for single-instance configs.
- Any other instance name is appended, giving `<org>.<domain>.<instance>`.

Every instance carries four internal options emitted by the generator:

| Option         | Purpose                                                               |
| -------------- | --------------------------------------------------------------------- |
| `_domain`      | `PayloadType` for the manifest                                        |
| `_unique`      | From `pfm_unique`; drives the "only one instance" assertion           |
| `_displayName` | Per-instance `PayloadDisplayName`                                     |
| `_keyNames`    | Payload key names, used to detect the pre-instance flat syntax        |
| `_targets`     | From `pfm_targets`; routes the instance to the User or System profile |
| `_scope`       | User-facing override for `_targets` (not internal)                    |

`internalKeys` in `generateMacOSProfile.nix` must be kept in sync with these,
otherwise plumbing leaks into the generated plist.

## Profile Scope Routing

`pfm_targets` decides which profile a payload belongs in: 95 manifests are
system-only, 12 are user-only, 159 accept either, and 16 declare nothing
(treated as "either").

- `scopeOf` in `generateMacOSProfile.nix` resolves `_scope` first, then falls
  back to `_targets`; payloads accepting either follow the top-level `scope`.
- Up to two `.mobileconfig` files are produced. `outputPath` is a **base**
  name; `outputPathFor` appends `-user` / `-system` before the extension.
- Only scopes with payloads are written. `outputPaths` is a read-only option
  exposing the resolved paths, keyed by scope, and is what the tests use.
- The profile whose scope equals the `scope` preference keeps the bare
  `organizationIdentifier`; the other is suffixed so identifiers and UUIDs
  cannot collide.
- Forcing `_scope` against `_targets` warns rather than errors, because
  upstream metadata is sometimes absent or wrong.

## Important Constraints

- **Do not hand-edit files in `nix-modules/payloads/`** — they are overwritten by `nix_o_s_module_generator.py`.
- **Do not edit `nix-modules/payloads/all-payloads.nix`** — also auto-generated.
- The generator uses only Python stdlib — do not add third-party dependencies.
- `generateMacOSProfile.nix` must remain compatible with Home Manager's module system (`lib.mkOption`, `lib.types`, `config`, `pkgs`).
- The inline Python script inside `generateMacOSProfile.nix` must handle the JSON → binary plist conversion at Nix build time (it receives data via `pkgs.writeText` JSON, not via Python imports).
- Nix identifiers with dots/dashes in Apple key names are sanitized by `sanitize_nix_identifier()` in the generator — follow the same convention if adding new keys manually.
- `collect_key_names()` mirrors the skip/dedupe logic of `generate_option()`. If you change which subkeys are emitted, change both.
- The generator **deletes** `.nix` files in an output directory that no manifest produced. Stale outputs from renamed upstream manifests would otherwise keep being imported by `all-payloads.nix` in an outdated format.
- Bridges must guard with `config ? accounts && config.accounts ? <ns>` so they stay evaluable outside Home Manager.
- Home Manager's option is `accounts.contact` (**singular**), even though its module file is `contacts.nix`.
- Never emit password keys from a bridge: the profile is built in a derivation and lands in the world-readable Nix store.

---

## Technologies

- **Nix / Nix Flakes** — package and module system
- **Home Manager** — consumed as `homeModules.profiles`
- **Python 3** (stdlib: `plistlib`, `re`, `pathlib`, `json`) — generator and plist serialization
- **nixpkgs (nixos-unstable)** — base package set
- **flake-utils** — cross-system flake helpers
- **optnix** — optional CLI for interactive option browsing

---

## Flake Outputs

| Output                       | Contents                                            |
| ---------------------------- | --------------------------------------------------- |
| `homeModules.profiles`       | Core module + all payload options                   |
| `homeModules.bridges`        | Home Manager account bridges                        |
| `homeModules.default`        | Both                                                |
| `checks.<system>.*`          | Test suite, plus `treefmt`, `lint` and `pre-commit` |
| `formatter.<system>`         | treefmt wrapper backing `nix fmt`                   |
| `devShells.<system>.default` | Python 3, the generator, and all lint/format tools  |

`homeModules` is deliberately declared **outside** `flake-utils.lib.eachDefaultSystem`;
Home Manager modules are system-independent, and nesting them made them
reachable only as `homeModules.<system>.profiles`.

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

| File                                     | Purpose                                     |
| ---------------------------------------- | ------------------------------------------- |
| `treefmt.nix`                            | Formatters and the shared exclude list      |
| `ruff.toml`                              | `ruff check` rules for the two Python files |
| `statix.toml`                            | statix ignores and disabled lints           |
| `.github/workflows/ci.yml`               | `check`, `format`, `lint`, `generator` jobs |
| `.github/workflows/update-manifests.yml` | Daily ProfileManifests sync, opens a PR     |

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
