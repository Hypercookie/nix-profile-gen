# Auto-generated from ProfileManifests: com.apple.security.scep.plist
# Domain: com.apple.security.scep
# Title: SCEP
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-security-scep" = {
    enable = lib.mkEnableOption "SCEP";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.security.scep";
      description = "The payload domain (PayloadType) for this manifest.";
    };

  };
}