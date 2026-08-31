# Auto-generated from ProfileManifests: com.apple.freeform.plist
# Domain: com.apple.freeform
# Title: Freeform
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Freeform";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.freeform";
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
        default = [ "CRLConnectICloudDialogShown" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      CRLConnectICloudDialogShown = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Enabling this preference and using the default value will suppress a prompt offering to sign in to iCloud.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-freeform" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Freeform (com.apple.freeform) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}