# Auto-generated from ProfileManifests: com.parallels.dektop.managedprefs.plist
# Domain: com.parallels.desktop.managedprefs
# Title: Parallels Desktop for Mac
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-parallels-dektop-managedprefs" = {
    enable = lib.mkEnableOption "Parallels Desktop for Mac";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.parallels.desktop.managedprefs";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    ActivationExperience = lib.mkOption {
      type = types.nullOr (types.enum [ "License Key" "SSO" ]);
      default = null;
      description = "Select a method for activating Parallels Desktop for Mac";
    };

    LicenseKey = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enter your 30-character license key:";
    };

  };
}