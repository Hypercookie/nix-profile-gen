# Auto-generated from ProfileManifests: com.apple.security.pkcs1.plist
# Domain: com.apple.security.pkcs1
# Title: Certificate (PKCS #1)
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-security-pkcs1" = {
    enable = lib.mkEnableOption "Certificate (PKCS #1)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.security.pkcs1";
      description = "The payload domain (PayloadType) for this manifest.";
    };

  };
}