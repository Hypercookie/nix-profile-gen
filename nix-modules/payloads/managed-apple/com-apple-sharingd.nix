# Auto-generated from ProfileManifests: com.apple.sharingd.plist
# Domain: com.apple.sharingd
# Title: AirDrop Discoverability (macOS)
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-sharingd" = {
    enable = lib.mkEnableOption "AirDrop Discoverability (macOS)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.sharingd";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    DiscoverableMode = lib.mkOption {
      type = types.nullOr (types.enum [ "Off" "Contacts Only" "Everyone" ]);
      default = null;
      description = "Configure the AirDrop option \"Allow me to be discovered by:\"";
    };

  };
}