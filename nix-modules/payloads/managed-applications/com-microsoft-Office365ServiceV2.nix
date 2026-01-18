# Auto-generated from ProfileManifests: com.microsoft.Office365ServiceV2.plist
# Domain: com.microsoft.Office365ServiceV2
# Title: Microsoft Office 365 Service
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-Office365ServiceV2" = {
    enable = lib.mkEnableOption "Microsoft Office 365 Service";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.microsoft.Office365ServiceV2";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    SendAllTelemetryEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Set to false to send minimal heartbeat data, no application usage, and no environment details.";
    };

  };
}