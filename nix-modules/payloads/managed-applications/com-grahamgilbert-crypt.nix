# Auto-generated from ProfileManifests: com.grahamgilbert.crypt.plist
# Domain: com.grahamgilbert.crypt
# Title: Crypt
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-grahamgilbert-crypt" = {
    enable = lib.mkEnableOption "Crypt";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.grahamgilbert.crypt";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    ServerURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    RemovePlist = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "By default, the plist at /var/root/crypt_output.plist with the FileVault Key will be removed once it has been escrowed. If this is set to True the key will remain as root read only.";
    };

    RotateUsedKey = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If the recovery key plist is still present on the disk, rotates the recovery key after the key is used to unlock the disk.";
    };

    ValidateKey = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If the recovery key plist is still present on the disk, validates the recovery key. If the key fails validation, the plist is removed so it can be regenerated on next login.";
    };

    OutputPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = "/var/root/crypt_output.plist";
      description = "Path where the recovery key plist is written to disk.";
    };

    KeyEscrowInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = 1;
      description = "Time interval in Hours for how often Crypt tries to re-escrow the key to Crypt-Server after the first successful escrow.";
    };

    SkipUsers = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Local users that will not be forced to enable FileVault.";
    };

    PostRunCommand = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Command that is run after Crypt has detected an error condition with a stored key that cannot be resolved silently - either it has failed validation or the server has instructed the client to rotate the key. These cannot be resolved silently on APFS volumes, so the user will need to log in again. If you have a tool that can enforce a logout or a reboot, you can run it here.";
    };

  };
}