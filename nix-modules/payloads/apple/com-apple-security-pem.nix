# Auto-generated from ProfileManifests: com.apple.security.pem.plist
# Domain: com.apple.security.pem
# Title: Certificate (PEM)
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-security-pem" = {
    enable = lib.mkEnableOption "Certificate (PEM)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.security.pem";
      description = "The payload domain (PayloadType) for this manifest.";
    };

  };
}