# Listing programs.appleProfile Options

Payload options live at:

```
programs.appleProfile.profiles.<name>.payloads.<manifest>.<instance>.<key>
```

`<manifest>` identifies the ProfileManifests plist, `<instance>` is a name you
choose (use `default` for a single instance), and `<key>` is an Apple
preference key. `<name>` is the profile.

## Using optnix

```bash
optnix
```

`optnix.toml` in the repository root is preconfigured to evaluate the profile
module (`nix-modules/profile`) and list every visible, non-internal option
under `programs.appleProfile.profiles.<name>`. The Home Manager-only
options (`enable`, `autoInstall`, the top-level `organization*` and `mdm`)
are not part of that module and are not listed.

## Using Nix Commands

### List all payload manifests

```bash
nix eval --impure --json --expr '
  let
    pkgs = import <nixpkgs> {};
    lib = pkgs.lib;
    eval = lib.evalModules {
      modules = [ ./nix-modules/payloads/all-payloads.nix ];
    };
  in
    builtins.attrNames eval.options.payloads
'
```

### Query a specific payload

```bash
home-manager-options | grep "programs.appleProfile.profiles"
home-manager-options 'programs.appleProfile.profiles.<name>.payloads."apple-com-apple-airplay"'
```

## Finding Payload Names

Payload names follow the pattern: `<category>-<manifest-name>`

For example:

- `apple-com-apple-airplay` - AirPlay settings (from apple category)
- `managed-apple-com-apple-finder` - Finder settings (from managed-apple category)
- `managed-applications-com-google-Chrome` - Chrome managed preferences

The category prefix ensures uniqueness when the same manifest exists in multiple directories.

You can also use [ProfileCreator](https://github.com/ProfileCreator/ProfileManifests)
to build a profile in a GUI and export it, which is sometimes the quickest way
to discover an awkwardly named key.

## Example Configuration

```nix
programs.appleProfile.profiles.mac = {
  payloads = {
    "apple-com-apple-airplay".default = {
      enable = true;
      AllowList = [
        { DeviceName = "Conference Room A"; }
      ];
    };

    "apple-com-apple-dnsSettings-managed".default = {
      enable = true;
      DNSSettings = {
        DNSProtocol = "HTTPS";
        ServerAddresses = [ "1.1.1.1" ];
        ServerURL = "https://cloudflare-dns.com/dns-query";
      };
    };
  };
};
```

## Multiple instances

Manifests whose plist sets `pfm_unique = false` may appear more than once in a
profile. Give each one its own instance name:

```nix
payloads."apple-com-apple-caldav-account" = {
  work    = { enable = true; CalDAVHostName = "dav.work.example"; };
  private = { enable = true; CalDAVHostName = "dav.home.example"; };
};
```

Enabling two instances of a `pfm_unique` payload is rejected at evaluation
time. Each generated module records this in its header comment (`# Unique: yes`
or `# Unique: no`).

## Internal options

Every instance carries a few internal options, hidden from `optnix` but usable
if you need them:

| Option          | Purpose                                                    |
| --------------- | ---------------------------------------------------------- |
| `_domain`       | `PayloadType` for the manifest                             |
| `_unique`       | Whether only one instance is allowed per profile           |
| `_displayName`  | Per-instance `PayloadDisplayName` (defaults to the domain) |
| `_keyNames`     | Payload keys, used to detect the pre-instance flat syntax  |
| `_targets`      | From `pfm_targets`; decides User vs System profile         |
| `_platforms`    | From `pfm_platforms`; checked against `platform`           |
| `_keyPlatforms` | Keys restricted to fewer platforms than their manifest     |

`_allowUnsupportedPlatform` is _not_ internal either: set it to emit an
instance whose payload or keys the manifest marks as unavailable on the
profile's `platform`. It downgrades that error to a warning.

`_scope` is _not_ internal: set it to `"User"` or `"System"` to force an
instance into a particular profile when the manifest's `pfm_targets` is wrong
or missing. A warning is emitted if the forced scope is not advertised by the
manifest. Each generated module records its targets in the header comment
(`# Targets: user`).
