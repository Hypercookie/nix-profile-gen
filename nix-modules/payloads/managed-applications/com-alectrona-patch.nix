# Auto-generated from ProfileManifests: com.alectrona.patch.plist
# Domain: com.alectrona.patch
# Title: Alectrona Patch Command Line Tool
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-alectrona-patch" = {
    enable = lib.mkEnableOption "Alectrona Patch Command Line Tool";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.alectrona.patch";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    License = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Your license key provided upon subscription to Alectrona Patch.";
    };

  };
}