# Auto-generated from ProfileManifests: com.apple.MCX.TimeMachine.plist
# Domain: com.apple.MCX.TimeMachine
# Title: Time Machine
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-MCX-TimeMachine" = {
    enable = lib.mkEnableOption "Time Machine";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.MCX.TimeMachine";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    BackupDestURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The URL of the backup destination.";
    };

    BackupAllVolumes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', backs up only the startup volume by default.";
    };

    BackupSkipSys = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', skips system files and folders by default.";
    };

    AutoBackup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', performs automatic backups at regular intervals.";
    };

    MobileBackups = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', create local backup snapshots when not connected to the network.";
    };

    BackupSizeMB = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The backup size limit, in megabytes. Set to 0 for unlimited.";
    };

    SkipPaths = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The path to skip from start volume.";
    };

    BasePaths = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The list of paths to back up besides the startup volume.";
    };

  };
}