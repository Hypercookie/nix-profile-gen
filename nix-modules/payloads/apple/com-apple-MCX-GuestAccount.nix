# Auto-generated from ProfileManifests: com.apple.MCX-GuestAccount.plist
# Domain: com.apple.MCX
# Title: Guest Account
# Platforms: macOS
# Unique: no
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Guest Account";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.MCX";
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
        default = [ "EnableGuestAccount" "DisableGuestAccount" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      EnableGuestAccount = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system enables the guest account.";
      };

      DisableGuestAccount = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system disables the guest account. This property has no effect if 'EnableGuestAccount' is 'true'.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-MCX-GuestAccount" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Guest Account (com.apple.MCX) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}