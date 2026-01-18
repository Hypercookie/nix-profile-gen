# Auto-generated from ProfileManifests: com.apple.NetworkBrowser.plist
# Domain: com.apple.NetworkBrowser
# Title: AirDrop (macOS)
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-NetworkBrowser" = {
    enable = lib.mkEnableOption "AirDrop (macOS)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.NetworkBrowser";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    DisableAirDrop = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

  };
}