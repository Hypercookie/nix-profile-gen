# Auto-generated from ProfileManifests: com.macpaw.site.theunarchiver.plist
# Domain: com.macpaw.site.theunarchiver
# Title: The Unarchiver (Standalone)
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-macpaw-site-theunarchiver" = {
    enable = lib.mkEnableOption "The Unarchiver (Standalone)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.macpaw.site.theunarchiver";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    userAgreedToNewTOSAndPrivacy = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enable this option to automatically accept the Privacy Policy and Terms of Service for users.";
    };

    SUEnableAutomaticChecks = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Automatically check for The Unarchiver (Standalone) updates";
    };

  };
}