# Auto-generated from ProfileManifests: com.apple.Dictionary.plist
# Domain: com.apple.Dictionary
# Title: Parental Controls: Dictionary
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-Dictionary" = {
    enable = lib.mkEnableOption "Parental Controls: Dictionary";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.Dictionary";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    parentalControl = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', enables parental controls dictionary restrictions.";
    };

  };
}