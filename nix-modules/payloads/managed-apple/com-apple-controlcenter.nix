# Auto-generated from ProfileManifests: com.apple.controlcenter.plist
# Domain: com.apple.controlcenter
# Title: Control Center
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-controlcenter" = {
    enable = lib.mkEnableOption "Control Center";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.controlcenter";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AirplayRecieverEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Airplay Receiver allows you to send content from another Apple device to be displayed on the screen as it's being played from your other device.";
    };

  };
}