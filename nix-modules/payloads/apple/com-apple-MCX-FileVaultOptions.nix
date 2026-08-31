# Auto-generated from ProfileManifests: com.apple.MCX-FileVaultOptions.plist
# Domain: com.apple.MCX
# Title: FDE FileVault Options
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "FDE FileVault Options";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.MCX";
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
        default = [ "dontAllowFDEDisable" "dontAllowFDEEnable" "DestroyFVKeyOnStandby" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      dontAllowFDEDisable = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system won't disable FileVault.";
      };

      dontAllowFDEEnable = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system won't enable FileVault.";
      };

      DestroyFVKeyOnStandby = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system won't store th FileVault key across restarts.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-MCX-FileVaultOptions" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "FDE FileVault Options (com.apple.MCX) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}