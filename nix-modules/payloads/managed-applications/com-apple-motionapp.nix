# Auto-generated from ProfileManifests: com.apple.motionapp.plist
# Domain: com.apple.motionapp
# Title: Motion
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-apple-motionapp" = {
    enable = lib.mkEnableOption "Motion";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.motionapp";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    FFCheckedUpgrade = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Suppresses the popup to upgrade an Motion on first run.";
    };

    LKWhatsNewDisplayedForAppVersion = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          __key__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
          __value__ = lib.mkOption {
            type = types.nullOr (types.bool);
            default = true;
          };
        };
      });
      default = null;
      description = "Suppress the Whats New screen on the selected versions of Motion.";
    };

  };
}