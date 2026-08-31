# Auto-generated from ProfileManifests: com.apple.iWork.Numbers.plist
# Domain: com.apple.iWork.Numbers
# Title: Numbers
# Platforms: macOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Numbers";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.iWork.Numbers";
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
        default = [ "TMAFirstLaunchVersion" "TSURemoteDefaultsNextUpdate" "TMAApplicationUpdateNotifier.MigrationAlertToInstallCallCounter" "TMAApplicationUpdateNotifier.MigrationAlertToInstallLastShownTimeStamp" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      TMAFirstLaunchVersion = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Suppress Welcome Dialog";
      };

      TSURemoteDefaultsNextUpdate = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Suppress iWork Update Messages";
      };

      "TMAApplicationUpdateNotifier.MigrationAlertToInstallCallCounter" = lib.mkOption {
        type = types.nullOr (types.enum [ 99 ]);
        default = null;
        description = "Set to 99 as part of suppressing the dialog asking to switch to the Creator Studio version.";
      };

      "TMAApplicationUpdateNotifier.MigrationAlertToInstallLastShownTimeStamp" = lib.mkOption {
        type = types.nullOr (types.float);
        default = null;
        description = "Set to 4068144000000 as part of suppressing the dialog asking to switch to the Creator Studio version.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-iWork-Numbers" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Numbers (com.apple.iWork.Numbers) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}