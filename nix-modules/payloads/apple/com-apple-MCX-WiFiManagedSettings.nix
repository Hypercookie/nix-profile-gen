# Auto-generated from ProfileManifests: com.apple.MCX-WiFiManagedSettings.plist
# Domain: com.apple.MCX
# Title: Wi-Fi Managed Settings
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-MCX-WiFiManagedSettings" = {
    enable = lib.mkEnableOption "Wi-Fi Managed Settings";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.MCX";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    RequireAdminToTurnAirPortOnOff = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', requires administrator authorization to turn Wi-Fi on or off.";
    };

    RequireAdminForAirPortNetworkChange = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', requires administrator authorization for network changes.";
    };

    RequireAdminForIBSS = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', requires administrator authorization to enable IBSS.";
    };

  };
}