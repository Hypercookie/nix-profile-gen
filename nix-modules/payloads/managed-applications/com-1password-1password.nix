# Auto-generated from ProfileManifests: com.1password.1password.plist
# Domain: com.1password.1password
# Title: 1Password 8
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-1password-1password" = {
    enable = lib.mkEnableOption "1Password 8";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.1password.1password";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    app_startAtLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Force 1Password 8 to start at login";
    };

    privacy_checkCompromisedWebsites = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Check for compromised websites";
    };

    privacy_checkMfa = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Check for two-factor authentication";
    };

    privacy_checkPasskeys = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Check for passkeys";
    };

    security_blockSleepEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Prevents device from sleeping while 1Password is active";
    };

    security_revealWifiQrCodes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Always show Wi-Fi QR codes";
    };

    browsers_other_trusted_apps_enabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow connecting to a custom browser";
    };

    security_autofill_autosubmit = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "You can fill your usernames and passwords everywhere you need to sign in on your Mac";
    };

    security_authenticatedUnlock_requireAccountPasswordAfter = lib.mkOption {
      type = types.nullOr (types.enum [ "one-day" "thirty-days" "two-weeks" "never" ]);
      default = null;
      description = "Set the password requirement timeframe";
    };

    security_authenticatedUnlock_appleTouchId = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If present enforces whether biometric unlock is allowed (Preferences > Security > Unlock).";
    };

    security_authenticatedUnlock_appleWatchUnlock = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If present enforces whether Apple Watch unlock is allowed (Preferences > Security > Unlock).";
    };

    security_revealPasswords = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces showing passwords and full credit card numbers (Preferences > Security > Conceal Fields).";
    };

    security_autolock_onDeviceLock = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces the configured locked on sleep,screensaver, or switching users (Preferences > Security > Auto-lock).";
    };

    security_autolock_onWindowClose = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces the configured lock on app exit preference";
    };

    security_autolock_minutes = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Enforces the lock on idle time preference (Preferences > Security > Lock).";
    };

    security_clipboard_clearAfter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "The amount of time after copying a 1Password item that it is cleared from the clipboard (Preferences > Security > Clipboard).";
    };

    security_deviceClipboardSharing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces whether the clear clipboard preference is enabled or disabled (Preferences > Security > Clear clipboard contents).";
    };

    privacy_downloadRichIcons = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show app and website icons";
    };

    privacy_checkHibp = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Check for vulnerable passwords";
    };

    updates_autoUpdate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Automatically check for updates";
    };

    updates_updateChannel = lib.mkOption {
      type = types.nullOr (types.enum [ "PRODUCTION" "BETA" "NIGHTLY" ]);
      default = null;
      description = "Set release channel";
    };

  };
}