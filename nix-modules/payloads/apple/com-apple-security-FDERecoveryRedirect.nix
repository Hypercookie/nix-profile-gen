# Auto-generated from ProfileManifests: com.apple.security.FDERecoveryRedirect.plist
# Domain: com.apple.security.FDERecoveryRedirect
# Title: FileVault Recovery Key Redirection Payload
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-security-FDERecoveryRedirect" = {
    enable = lib.mkEnableOption "FileVault Recovery Key Redirection Payload";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.security.FDERecoveryRedirect";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    RedirectURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The URL to which FDE recovery keys should be sent instead of to Apple. The URL must begin with https://.";
    };

    EncryptCertPayloadUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The UUID of a payload within the same profile that contains a certificate used to encrypt the recovery key when it's sent to the redirected URL. The referenced payload must be of type \\'com.apple.security.pkcs1\\'.";
    };

  };
}