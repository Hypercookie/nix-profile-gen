# Auto-generated from ProfileManifests: com.electron.dialpad.plist
# Domain: com.electron.dialpad
# Title: Dialpad
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Dialpad";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.electron.dialpad";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
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
        default = [ "DIALPAD_DISABLE_UPDATES" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      DIALPAD_DISABLE_UPDATES = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Prevents Dialpad from automatically checking for updates.\nAlso hides the \"Check for Update\" option from the Dialpad menu.";
      };

    };
  };
in
{
  options.payloads."managed-applications-com-electron-dialpad" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Dialpad (com.electron.dialpad) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}