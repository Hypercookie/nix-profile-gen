# Listing macprofile Options

Payload options live at:

```
programs.macprofile.payloads.<manifest>.<instance>.<key>
```

`<manifest>` identifies the ProfileManifests plist, `<instance>` is a name you
choose (use `default` for a single instance), and `<key>` is an Apple
preference key.

## Using optnix

```bash
optnix
```

`optnix.toml` in the repository root is preconfigured to evaluate
`nix-modules/payloads/all-payloads.nix` and list every visible, non-internal
option.

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
    builtins.attrNames eval.options.programs.macprofile.payloads
'
```

### Query a specific payload

```bash
home-manager-options | grep "programs.macprofile.payloads"
home-manager-options 'programs.macprofile.payloads."apple-com-apple-airplay"'
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
programs.macprofile = {
  enable = true;
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

| Option | Purpose |
|---|---|
| `_domain` | `PayloadType` for the manifest |
| `_unique` | Whether macOS allows only one instance |
| `_displayName` | Per-instance `PayloadDisplayName` (defaults to the domain) |
| `_keyNames` | Payload keys, used to detect the pre-instance flat syntax |
