# Auto-generated from ProfileManifests: com.apple.MCX-MobileAccounts.plist
# Domain: com.apple.MCX
# Title: Mobile Accounts
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-MCX-MobileAccounts" = {
    enable = lib.mkEnableOption "Mobile Accounts";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.MCX";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    cachedaccounts_askForSecureTokenAuthBypass = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system bypasses the secure token authorization dialog. This dialog only appears on APFS volumes.";
    };

    cachedaccounts_expiry_delete_disusedSeconds = lib.mkOption {
      type = types.nullOr (types.int);
      default = -1;
      description = "The minimum number of seconds a mobile account can exist before the system makes an automatic attempt to remove the mobile account. Set to '0' to attempt removing it at the next login or logout. Set to '-1' to never attempt removing the mobile account.";
    };

    cachedaccounts_WarnOnCreate_allowNever = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system allows the user to stop the prompts about mobile account creation every time the user logs in. This key is only valid if 'com.apple.cachedaccounts.WarnOnCreate' is 'true'.";
    };

    com_apple_cachedaccounts_CreateAtLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system creates the mobile account at login time.";
    };

    com_apple_cachedaccounts_WarnOnCreate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system asks the user whether to create the mobile account and it allows the user to not create it.";
    };

  };
}