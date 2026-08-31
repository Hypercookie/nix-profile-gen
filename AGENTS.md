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
        |  at `home-manager switch`
        v
~/Library/Application Support/HomeManager/profile.mobileconfig
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

---

## Type Mapping (plist → Nix)

The generator (`nix_o_s_module_generator.py`) maps Apple pfm manifest types to Nix types:

| pfm type | Nix type |
|---|---|
| `string` | `types.str` |
| `boolean` | `types.bool` |
| `integer` | `types.int` |
| `real` | `types.float` |
| `array` | `types.listOf <element-type>` |
| `dictionary` | `types.submodule` or `types.attrs` |
| enum with range list | `types.enum [...]` |
| any pfm type | `types.nullOr <type>` (default: `null`) |

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

| Category | Prefix | Example |
|---|---|---|
| `ManifestsApple/` | `apple-` | `apple-com-apple-dock` |
| `ManagedPreferencesApple/` | `managed-apple-` | `managed-apple-com-apple-finder` |
| `ManagedPreferencesApplications/` | `managed-applications-` | `managed-applications-com-google-Chrome` |
| `ManagedPreferencesDeveloper/` | `managed-developer-` | `managed-developer-com-github-GitHubDesktop` |

---

## Payload Instance Convention

Payloads are addressed as `programs.macprofile.payloads.<manifest>.<instance>.<key>`.

- The instance name `default` is special-cased: its `PayloadIdentifier` gets no
  suffix, keeping identifiers and UUIDs stable for single-instance configs.
- Any other instance name is appended, giving `<org>.<domain>.<instance>`.

Every instance carries four internal options emitted by the generator:

| Option | Purpose |
|---|---|
| `_domain` | `PayloadType` for the manifest |
| `_unique` | From `pfm_unique`; drives the "only one instance" assertion |
| `_displayName` | Per-instance `PayloadDisplayName` |
| `_keyNames` | Payload key names, used to detect the pre-instance flat syntax |

`internalKeys` in `generateMacOSProfile.nix` must be kept in sync with these,
otherwise plumbing leaks into the generated plist.

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

| Output | Contents |
|---|---|
| `homeModules.profiles` | Core module + all payload options |
| `homeModules.bridges` | Home Manager account bridges |
| `homeModules.default` | Both |
| `checks.<system>.*` | Test suite |
| `devShells.<system>.default` | Python 3 for running the generator |

`homeModules` is deliberately declared **outside** `flake-utils.lib.eachDefaultSystem`;
Home Manager modules are system-independent, and nesting them made them
reachable only as `homeModules.<system>.profiles`.
