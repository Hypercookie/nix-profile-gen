# Auto-generated from ProfileManifests: com.twocanoes.dfu-blaster-pro.plist
# Domain: com.twocanoes.dfu-blaster-pro
# Title: DFU Blaster Pro
# Platforms: macOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "DFU Blaster Pro";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.twocanoes.dfu-blaster-pro";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
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
        default = [ "system" "user" ];
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
        default = [ "showDebug" "LogFileName" "checkForUpdates" "shouldUseEventScript" "shouldPlaySoundWhenComplete" "stayInFrontAfterDFUSecs" "removeACCache" "shouldDisableLocalAutoDFU" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      showDebug = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Turn on vebose logging.";
      };

      LogFileName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Set log file name.";
      };

      checkForUpdates = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Check and prompt if an update is available.";
      };

      shouldUseEventScript = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Use event script to export computer information on attached devices.";
      };

      shouldPlaySoundWhenComplete = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Play sound when restore completes.";
      };

      stayInFrontAfterDFUSecs = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Keep DFU Blaster in front after putting into DFU mode (seconds).";
      };

      removeACCache = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Remove Apple Configurator temporary cache before each restore.";
      };

      shouldDisableLocalAutoDFU = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When AutoDFU is enabled, only put devices plugged into an Acroname Hub into DFU mode. This setting turns off sending the DFU command to the local DFU USB port.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-twocanoes-dfu-blaster-pro" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "DFU Blaster Pro (com.twocanoes.dfu-blaster-pro) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}