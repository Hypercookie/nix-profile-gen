# Auto-generated from ProfileManifests: com.apple.FinalCut.plist
# Domain: com.apple.FinalCut
# Title: Final Cut Pro
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-apple-FinalCut" = {
    enable = lib.mkEnableOption "Final Cut Pro";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.FinalCut";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    LKWelcomeDisplayedForAppVersion = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          __key__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
          __value__ = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
        };
      });
      default = null;
      description = "Suppress the Welcome screen on the selected versions of Final Cut Pro.";
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
            default = null;
          };
        };
      });
      default = null;
      description = "Suppress the Whats New screen on the selected versions of Final Cut Pro.";
    };

  };
}