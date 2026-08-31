# Auto-generated from ProfileManifests: com.apple.dt.Xcode.plist
# Domain: com.apple.dt.Xcode
# Title: Xcode
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Xcode";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.dt.Xcode";
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
        default = [ "IDEProhibitOnDeviceModelInteraction" "IDEProhibitRemoteModelInteraction" "CodingAssistantAllowExternalIntegrations" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      IDEProhibitOnDeviceModelInteraction = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls whether Xcode Predictive Code Completion is allowed.";
      };

      IDEProhibitRemoteModelInteraction = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls whether Swift Assist is allowed.";
      };

      CodingAssistantAllowExternalIntegrations = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls whether the coding assistant is allowed.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-dt-Xcode" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Xcode (com.apple.dt.Xcode) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}