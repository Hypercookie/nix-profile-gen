# macOS Configuration Profile Generator for Nix/Home Manager

Generate NixOS/Home Manager modules from Apple ProfileManifests for managing macOS configuration profiles declaratively.

## Features

- 🍎 Converts Apple ProfileManifests to Nix module options
- 🔧 Generates `.mobileconfig` files from Nix configuration
- 📋 Supports all Apple payload types (Apple, ManagedPreferences, etc.)
- 🔍 Browse options interactively with optnix
- 🚀 Easy development workflow with devshell

## Quick Start

### Using the DevShell

```bash
# Enter the devshell
nix develop

# Generate payload modules from ProfileManifests
generate-payloads

# Browse options with optnix
optnix search programs.macprofile
```

### Using direnv (Recommended)

If you have [direnv](https://direnv.net/) installed:

```bash
# Allow direnv
direnv allow

# The devshell will automatically activate
```

## Usage in Home Manager

Add this module to your Home Manager configuration:

```nix
{
  imports = [
    /path/to/nixmagic/nix-modules/generateMacOSProfile.nix
  ];

  programs.macprofile = {
    enable = true;
    profileName = "My Profile";
    organizationIdentifier = "com.example";
    
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
}
```

## Discovering Options

### Using optnix (Recommended)

```bash
# Enter devshell
nix develop

# Search for options
optnix search programs.macprofile.payloads

# Show specific option
optnix show programs.macprofile.payloads."apple-com-apple-airplay"
```

### Using Python Script

```bash
# List all payloads
python3 list-macprofile-options.py

# Show options for a specific payload
python3 list-macprofile-options.py apple-com-apple-airplay
```

### Using Home Manager Commands

```bash
# List all macprofile options
home-manager-options | grep "programs.macprofile"

# Show specific option
home-manager-options programs.macprofile.payloads."apple-com-apple-airplay"
```

## Project Structure

```
.
├── flake.nix                    # Nix flake with devshell
├── nix_o_s_module_generator.py  # Python script to generate modules
├── list-macprofile-options.py   # Helper script to list options
├── nix-modules/
│   ├── generateMacOSProfile.nix # Main Home Manager module
│   └── payloads/                # Generated payload modules
│       ├── all-payloads.nix     # Auto-generated imports
│       ├── apple/               # Apple payloads
│       ├── managed-apple/       # Managed Apple preferences
│       └── managed-applications/ # Application preferences
└── ProfileManifests/            # Source Apple manifests
```

## Development

### Regenerating Payload Modules

After updating ProfileManifests or modifying the generator:

```bash
nix develop
generate-payloads
```

### Adding New Payloads

1. Add new `.plist` files to `ProfileManifests/Manifests/`
2. Run `generate-payloads`
3. The new payloads will be available in `nix-modules/payloads/`

## Finding Payload Names

Payload names follow the pattern: `<category>-<manifest-name>`

Examples:
- `apple-com-apple-airplay` - AirPlay settings
- `managed-apple-com-apple-finder` - Finder managed preferences
- `managed-applications-com-google-Chrome` - Chrome preferences

Use `list-macprofile-options.py` or `optnix search` to discover available payloads.

## License

This project uses ProfileManifests from [ProfileCreator](https://github.com/ProfileCreator/ProfileManifests), which is licensed under the Apache License 2.0.
