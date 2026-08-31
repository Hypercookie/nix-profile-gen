# Auto-generated from ProfileManifests: com.todesktop.230313mzl4w4u92.plist
# Domain: com.todesktop.230313mzl4w4u92
# Title: Cursor
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Cursor";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.todesktop.230313mzl4w4u92";
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
        default = [ "AllowedExtensions" "AllowedTeamId" "ExtensionGalleryServiceUrl" "NetworkDisableHttp2" "UpdateMode" "WorkspaceTrustEnabled" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AllowedExtensions = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Controls which extensions can be installed.";
      };

      AllowedTeamId = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Controls which team IDs are allowed to log in. Users with unauthorized team IDs are forcefully logged out.";
      };

      ExtensionGalleryServiceUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Configures a custom extension marketplace URL.";
      };

      NetworkDisableHttp2 = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disables HTTP/2 for all requests, using HTTP/1.1 instead.";
      };

      UpdateMode = lib.mkOption {
        type = types.nullOr (types.enum [ "none" "manual" "start" "default" "silentlyApplyOnQuit" ]);
        default = null;
        description = "Controls automatic update behavior. Set to 'none' to disable updates.";
      };

      WorkspaceTrustEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls whether Workspace Trust is enabled.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-todesktop-230313mzl4w4u92" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Cursor (com.todesktop.230313mzl4w4u92) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}