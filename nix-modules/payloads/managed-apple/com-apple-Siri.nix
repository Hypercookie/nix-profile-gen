# Auto-generated from ProfileManifests: com.apple.Siri.plist
# Domain: com.apple.Siri
# Title: Siri
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-Siri" = {
    enable = lib.mkEnableOption "Siri";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.Siri";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    StatusMenuVisible = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    UserHasDeclinedEnable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

  };
}