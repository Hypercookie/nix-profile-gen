# Auto-generated from ProfileManifests: com.apple.screencapture.plist
# Domain: com.apple.screencapture
# Title: Screencapture
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-screencapture" = {
    enable = lib.mkEnableOption "Screencapture";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.screencapture";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    disable_shadow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    location = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "File system path (can start with ~) where screenshots will be saved.";
    };

  };
}