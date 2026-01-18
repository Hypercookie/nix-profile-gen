# Auto-generated from ProfileManifests: com.apple.security.certificatepreference.plist
# Domain: com.apple.security.certificatepreference
# Title: Certificate Preference
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-security-certificatepreference" = {
    enable = lib.mkEnableOption "Certificate Preference";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.security.certificatepreference";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Name = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "An email address (in RFC 822 format) or other name for which a preferred certificate is requested.";
    };

  };
}