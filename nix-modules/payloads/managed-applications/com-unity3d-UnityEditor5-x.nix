# Auto-generated from ProfileManifests: com.unity3d.UnityEditor5.x.plist
# Domain: com.unity3d.UnityEditor5.x
# Title: Unity Editor
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Unity Editor";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.unity3d.UnityEditor5.x";
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
        default = [ "EditorUpdateShowAtStartup" "ReopenLastUsedProjectOnStartup" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      EditorUpdateShowAtStartup = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Check to show the Unity Editor updater at launch";
      };

      ReopenLastUsedProjectOnStartup = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Check to open the previously opened project at launch";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-unity3d-UnityEditor5-x" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Unity Editor (com.unity3d.UnityEditor5.x) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}