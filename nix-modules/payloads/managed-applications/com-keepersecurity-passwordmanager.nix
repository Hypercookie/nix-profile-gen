# Auto-generated from ProfileManifests: com.keepersecurity.passwordmanager.plist
# Domain: com.keepersecurity.passwordmanager
# Title: Keeper Security Password Manager
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-keepersecurity-passwordmanager" = {
    enable = lib.mkEnableOption "Keeper Security Password Manager";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.keepersecurity.passwordmanager";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    DomainName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enterprise SSO Domain to pre-populate on app launch.";
    };

    Region = lib.mkOption {
      type = types.nullOr (types.enum [ "us" "eu" "au" "usg" ]);
      default = null;
      description = "Region identifier where your Keeper tenant is hosted.";
    };

    HideCreateAccount = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Hides the Create Account button from the start page";
    };

    UseDefaultBrowserForSSO = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Routes the user to their default web browser for SSO authentication instead of using a popup window.";
    };

  };
}