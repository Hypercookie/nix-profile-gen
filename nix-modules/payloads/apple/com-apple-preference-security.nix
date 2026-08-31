# Auto-generated from ProfileManifests: com.apple.preference.security.plist
# Domain: com.apple.preference.security
# Title: Security Preferences
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Security Preferences";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.preference.security";
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
        default = [ "dontAllowPasswordResetUI" "dontAllowLockMessageUI" "dontAllowFireWallUI" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      dontAllowPasswordResetUI = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', disables user changes to the password.";
      };

      dontAllowLockMessageUI = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', disables user changes to the lock message.";
      };

      dontAllowFireWallUI = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', disables user changes to the firewall settings.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-preference-security" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Security Preferences (com.apple.preference.security) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}