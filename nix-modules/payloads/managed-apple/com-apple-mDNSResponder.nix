# Auto-generated from ProfileManifests: com.apple.mDNSResponder.plist
# Domain: com.apple.mDNSResponder
# Title: Bonjour
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-mDNSResponder" = {
    enable = lib.mkEnableOption "Bonjour";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.mDNSResponder";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    NoMulticastAdvertisements = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

  };
}