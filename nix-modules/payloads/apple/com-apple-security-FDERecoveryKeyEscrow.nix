# Auto-generated from ProfileManifests: com.apple.security.FDERecoveryKeyEscrow.plist
# Domain: com.apple.security.FDERecoveryKeyEscrow
# Title: FileVault Recovery Key Escrow
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-security-FDERecoveryKeyEscrow" = {
    enable = lib.mkEnableOption "FileVault Recovery Key Escrow";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.security.FDERecoveryKeyEscrow";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Location = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The description of the location where the system escrows the recovery key. The system inserts this text into the message the user sees when it enables FileVault.";
    };

    EncryptCertPayloadUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The UUID of a payload within the same profile that contains the certificate that the system uses to encrypt the recovery key. The referenced payload must be of type 'com.apple.security.pkcs1'.";
    };

    DeviceKey = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The string that's included in help text if the user appears to have forgotten the password. Site admins can use this key to look up the escrowed key for the particular computer.\n\nThis key replaces the 'RecordNumber' key used in the previous escrow mechanism. If the key is missing, the system uses the device serial number instead.";
    };

  };
}