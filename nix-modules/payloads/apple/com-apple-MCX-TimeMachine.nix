# Auto-generated from ProfileManifests: com.apple.MCX.TimeMachine.plist
# Domain: com.apple.MCX.TimeMachine
# Title: Time Machine
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Time Machine";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.MCX.TimeMachine";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
        description = "Whether macOS allows only one instance of this payload per profile.";
      };

      _displayName = lib.mkOption {
        internal = true;
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "PayloadDisplayName for this instance. Defaults to the domain.";
      };

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "system" ];
        description = "Profile scopes this payload may be installed into (pfm_targets).";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "BackupDestURL" "BackupAllVolumes" "BackupSkipSys" "AutoBackup" "MobileBackups" "BackupSizeMB" "SkipPaths" "BasePaths" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-MCX-TimeMachine" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Time Machine (com.apple.MCX.TimeMachine) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}