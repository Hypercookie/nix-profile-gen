# Auto-generated from ProfileManifests: com.microsoft.autoupdate.fba.plist
# Domain: com.microsoft.autoupdate.fba
# Title: Microsoft AutoUpdate FBA
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-autoupdate-fba" = {
    enable = lib.mkEnableOption "Microsoft AutoUpdate FBA";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.microsoft.autoupdate.fba";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    SendAllTelemetryEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Controls wether diagnostic data transmission is on or off.";
    };

  };
}