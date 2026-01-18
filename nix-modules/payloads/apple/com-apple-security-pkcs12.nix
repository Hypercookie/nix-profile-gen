# Auto-generated from ProfileManifests: com.apple.security.pkcs12.plist
# Domain: com.apple.security.pkcs12
# Title: Certificate (PKCS #12)
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-security-pkcs12" = {
    enable = lib.mkEnableOption "Certificate (PKCS #12)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.security.pkcs12";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Password = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The password to the identity.";
    };

    AllowAllAppsAccess = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system allows apps access to the private key. Available in macOS 10.10 and later.";
    };

    KeyIsExtractable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system doesn't tag the private key data as extractable in the keychain.";
    };

  };
}