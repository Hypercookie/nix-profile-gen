# Auto-generated from ProfileManifests: com.apple.Compressor.plist
# Domain: com.apple.Compressor
# Title: Compressor
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-apple-Compressor" = {
    enable = lib.mkEnableOption "Compressor";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.Compressor";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    FFCheckedUpgrade = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Suppresses the popup to upgrade Compressor on first run.";
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
      description = "Suppress the Whats New screen on the selected versions of Compressor.";
    };

  };
}