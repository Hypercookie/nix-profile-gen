# Auto-generated from ProfileManifests: com.apple.MCX-MobileAccounts.plist
# Domain: com.apple.MCX
# Title: Mobile Accounts
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Mobile Accounts";

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
        default = [ "cachedaccounts.askForSecureTokenAuthBypass" "cachedaccounts.expiry.delete.disusedSeconds" "cachedaccounts.WarnOnCreate.allowNever" "com.apple.cachedaccounts.CreateAtLogin" "com.apple.cachedaccounts.WarnOnCreate" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      "cachedaccounts.askForSecureTokenAuthBypass" = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system bypasses the secure token authorization dialog. This dialog only appears on APFS volumes.";
      };

      "cachedaccounts.expiry.delete.disusedSeconds" = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The minimum number of seconds a mobile account can exist before the system makes an automatic attempt to remove the mobile account. Set to '0' to attempt removing it at the next login or logout. Set to '-1' to never attempt removing the mobile account.";
      };

      "cachedaccounts.WarnOnCreate.allowNever" = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system allows the user to stop the prompts about mobile account creation every time the user logs in. This key is only valid if 'com.apple.cachedaccounts.WarnOnCreate' is 'true'.";
      };

      "com.apple.cachedaccounts.CreateAtLogin" = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system creates the mobile account at login time.";
      };

      "com.apple.cachedaccounts.WarnOnCreate" = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system asks the user whether to create the mobile account and it allows the user to not create it.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-MCX-MobileAccounts" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Mobile Accounts (com.apple.MCX) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}