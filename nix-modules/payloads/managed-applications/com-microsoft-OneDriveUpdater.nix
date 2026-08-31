# Auto-generated from ProfileManifests: com.microsoft.OneDriveUpdater.plist
# Domain: com.microsoft.OneDriveUpdater
# Title: Microsoft OneDrive Updater
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Microsoft OneDrive Updater";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.microsoft.OneDriveUpdater";
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
        default = [ "Tier" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Tier = lib.mkOption {
        type = types.nullOr (types.enum [ "Production" "Insiders" "Enterprise" ]);
        default = null;
        description = "Defines the update ring.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-OneDriveUpdater" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Microsoft OneDrive Updater (com.microsoft.OneDriveUpdater) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}