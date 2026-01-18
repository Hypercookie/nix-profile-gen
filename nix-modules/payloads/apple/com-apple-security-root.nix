# Auto-generated from ProfileManifests: com.apple.security.root.plist
# Domain: com.apple.security.root
# Title: Certificate (Root)
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-security-root" = {
    enable = lib.mkEnableOption "Certificate (Root)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.security.root";
      description = "The payload domain (PayloadType) for this manifest.";
    };

  };
}