# Auto-generated from ProfileManifests: com.apple.iWork.Pages.plist
# Domain: com.apple.iWork.Pages
# Title: Pages
# Platforms: macOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Pages";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.iWork.Pages";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
        description = "Whether only one instance of this payload is allowed per profile.";
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

      _platforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "macOS" ];
        description = "Supported Apple platforms (pfm_platforms).";
      };

      _keyPlatforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.attrs;
        default = [ ];
        description = "Keys restricted to a subset of the manifest's platforms (key-level pfm_platforms).";
      };

      _allowUnsupportedPlatform = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Emit this instance even if its manifest says the target platform does not support it or some of its keys. Produces a warning instead of an error.";
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
  options.payloads."managed-apple-com-apple-iWork-Pages" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Pages (com.apple.iWork.Pages) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}