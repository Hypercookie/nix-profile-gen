# Listing macprofile Options

This module provides several ways to discover and list available options for macOS configuration profiles.

## Using the Python Script

The easiest way to list options is using the provided Python script:

### List All Available Payloads

```bash
python3 list-macprofile-options.py
```

This will show all available payloads grouped by category (apple, managed-apple, managed-applications, etc.).

### Show Options for a Specific Payload

```bash
python3 list-macprofile-options.py apple-com-apple-airplay
```

This will show detailed information about the payload including:
- Title and domain
- Supported platforms
- All available options with descriptions

## Using Nix Commands

Since the options are defined in the Nix module system, you can also query them using standard Nix/Home Manager tools.

### List All Payload Options

```bash
home-manager-options | grep "programs.macprofile.payloads"
```

### Query a Specific Payload

```bash
home-manager-options programs.macprofile.payloads."apple-com-apple-airplay"
```

### Using nix eval (Advanced)

You can also use `nix eval` to programmatically query options:

```bash
nix eval --expr '
  let
    hm = import (builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz");
    eval = hm.lib.evalModules {
      modules = [ ./nix-modules/generateMacOSProfile.nix ];
    };
  in
    builtins.attrNames eval.options.programs.macprofile.payloads
'
```

## Finding Payload Names

Payload names follow the pattern: `<category>-<manifest-name>`

For example:
- `apple-com-apple-airplay` - AirPlay settings (from apple category)
- `managed-apple-com-apple-finder` - Finder settings (from managed-apple category)
- `managed-applications-com-google-Chrome` - Chrome managed preferences

The category prefix ensures uniqueness when the same manifest exists in multiple directories.

## Example Configuration

Once you know the payload name, you can configure it:

```nix
programs.macprofile = {
  enable = true;
  payloads = {
    "apple-com-apple-airplay" = {
      enable = true;
      AllowList = [
        { DeviceName = "Conference Room A"; }
      ];
    };
    
    "apple-com-apple-dnsSettings-managed" = {
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
