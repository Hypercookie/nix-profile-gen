# macOS Configuration Profile Generator for Nix/Home Manager

Generate NixOS/Home Manager modules from Apple ProfileManifests for managing macOS configuration profiles declaratively.

## Features

- 🍎 Converts Apple ProfileManifests to Nix module options
- 🔧 Generates `.mobileconfig` files from Nix configuration
- 📋 Supports all Apple payload types (Apple, ManagedPreferences, etc.)
- 🔍 Browse options interactively with optnix
- 🚀 Easy development workflow with devshell

## Quick Start

include 
```
nix-profile-gen.url = "github:Hypercookie/nix-profile-gen";
```
in your flake inputs. 
Then import `inputs.nix-profile-gen.homeModules.profiles` inside your home manager config.

Find configurable options.
```shell
optnix
```
You can also use the free software [ProfileCreator](https://github.com/ProfileCreator/ProfileManifests) and then export the profile to find the names
of options. (That is sometimes easier because of weird naming).
## Usage in Home Manager

Add this module to your Home Manager configuration:

```nix
{
  imports = [
     inputs.nix-profile-gen.homeModules.profiles
  ];

  programs.macprofile = {
            enable = true;
            profileName = "NixOS Enforced Config";
            organizationIdentifier = "eu.faustinus";
            scope = "System"; # System-level for network settings
            consentText = "This profile enforces nixos settings";

            payloads = {
              "managed-applications-com-1password-1password" = {
                enable = true;
                "updates.autoUpdate" = false;
              };
              "apple-com-apple-applicationaccess-macOS" = {
                enable = true;
                allowAppleIntelligenceReport = false;
                allowGenmoji = false;
                allowImagePlayground = false;
              };
              "apple-com-apple-loginwindow" = {
                enable = true;
                SHOWFULLNAME = false;
                LoginwindowText = "Welcome to faustinus.eu";
              };
            };
          };
}
```

This project uses ProfileManifests from [ProfileCreator](https://github.com/ProfileCreator/ProfileManifests), which is licensed under the Apache License 2.0.
