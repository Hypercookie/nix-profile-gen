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

    "app.startAtLogin" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Force 1Password 8 to start at login";
    };

    "privacy.checkCompromisedWebsites" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Check for compromised websites";
    };

    "privacy.checkMfa" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Check for two-factor authentication";
    };

    "privacy.checkPasskeys" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Check for passkeys";
    };

    "security.blockSleepEnabled" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Prevents device from sleeping while 1Password is active";
    };

    "security.revealWifiQrCodes" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Always show Wi-Fi QR codes";
    };

    "browsers.other_trusted_apps.enabled" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow connecting to a custom browser";
    };

    "security.autofill.autosubmit" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "You can fill your usernames and passwords everywhere you need to sign in on your Mac";
    };

    "security.authenticatedUnlock.requireAccountPasswordAfter" = lib.mkOption {
      type = types.nullOr (types.enum [ "one-day" "thirty-days" "two-weeks" "never" ]);
      default = null;
      description = "Set the password requirement timeframe";
    };

    "security.authenticatedUnlock.appleTouchId" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If present enforces whether biometric unlock is allowed (Preferences > Security > Unlock).";
    };

    "security.authenticatedUnlock.appleWatchUnlock" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If present enforces whether Apple Watch unlock is allowed (Preferences > Security > Unlock).";
    };

    "security.revealPasswords" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces showing passwords and full credit card numbers (Preferences > Security > Conceal Fields).";
    };

    "security.autolock.onDeviceLock" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces the configured locked on sleep,screensaver, or switching users (Preferences > Security > Auto-lock).";
    };

    "security.autolock.onWindowClose" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces the configured lock on app exit preference";
    };

    "security.autolock.minutes" = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Enforces the lock on idle time preference (Preferences > Security > Lock).";
    };

    "security.clipboard.clearAfter" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "The amount of time after copying a 1Password item that it is cleared from the clipboard (Preferences > Security > Clipboard).";
    };

    "security.deviceClipboardSharing" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces whether the clear clipboard preference is enabled or disabled (Preferences > Security > Clear clipboard contents).";
    };

    "privacy.downloadRichIcons" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show app and website icons";
    };

    "privacy.checkHibp" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Check for vulnerable passwords";
    };

    "updates.autoUpdate" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Automatically check for updates";
    };

    "updates.updateChannel" = lib.mkOption {
      type = types.nullOr (types.enum [ "PRODUCTION" "BETA" "NIGHTLY" ]);
      default = null;
      description = "Set release channel";
    };

  };
}