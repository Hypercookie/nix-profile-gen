# Auto-generated from ProfileManifests: com.profilecreator.developer.exclude.plist
# Domain: com.profilecreator.developer.exclude
# Title: Developer: Exclude
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-exclude" = {
    enable = lib.mkEnableOption "Developer: Exclude";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.profilecreator.developer.exclude";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Exclude00 = lib.mkOption {
      type = types.nullOr (types.enum [ "Item01" "Item02" "Item03" "Item04" "Item05" "Item06" ]);
      default = null;
      description = "Exclude condition target.";
    };

    Exclude01 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Exclude always if Item01 is selected.";
    };

    Exclude02 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Exclude always if Item02 or Item03 is selected.";
    };

    Exclude03 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Exclude always if Item04 is NOT selected.";
    };

    Exclude04 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Exclude always if Item05 or Item06 is NOT selected.";
    };

  };
}