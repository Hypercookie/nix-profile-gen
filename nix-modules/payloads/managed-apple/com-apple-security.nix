# Auto-generated from ProfileManifests: com.apple.security.plist
# Domain: com.apple.security
# Title: Security
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-security" = {
    enable = lib.mkEnableOption "Security";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.security";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    GKAutoRearm = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

  };
}