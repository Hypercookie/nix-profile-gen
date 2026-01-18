# Auto-generated from ProfileManifests: com.agilebits.onepassword7.plist
# Domain: com.agilebits.onepassword7
# Title: 1Password 7
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-agilebits-onepassword7" = {
    enable = lib.mkEnableOption "1Password 7";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.agilebits.onepassword7";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    OPPrefBiometryAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If present enforces whether biometric unlock is allowed (Preferences > Security > Unlock using ...).";
    };

    OPPrefPINAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If present enforces whether PIN unlock is allowed.";
    };

    OPPrefAppleWatchAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If present enforces whether Apple Watch unlock is allowed (Preferences > Security > Unlock using ...).";
    };

    OPPrefMasterPasswordTimeoutInMinutesKey = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Enforces a configured master password timeout (Preferences > Security > Require Master Password every ...) if:\n\n1) Biometric or Apple Watch unlock is possible based on the related preferences and the hardware configuration\n2) The user has configured one of these unlock mechanisms\n";
    };

    ConcealPasswords = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces the configured conceal passwords setting (Preferences > Security > Conceal Passwords).";
    };

    LockOnSleep = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces the configured lock on sleep setting (Preferences > Security > Lock on sleep).";
    };

    LockOnScreenSaver = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces the configured lock on screen saver setting (Preferences > Security > Lock when screen saver is activated).";
    };

    LockOnMainAppExit = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces the configured lock on app exit preference (Preferences > Security > Lock when main window is closed).";
    };

    LockOnUserSwitch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces the configured lock on user switch preference (Preferences > Security > Lock when fast user switching).";
    };

    LockOnIdle = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces whether the lock on idle preference is enabled or disabled (Preferences > Security > Lock after computer is idle).";
    };

    LockTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Enforces the lock on idle time preference (Preferences > Security > Lock after computer is idle).";
    };

    settingClearPasteboardAfterTimeout = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces whether the clear clipboard preference is enabled or disabled (Preferences > Security > Clear clipboard contents).";
    };

    PasteboardClearTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Enforces the clear clipboard contents after X seconds preference (Preferences > Security > Clipboard)";
    };

    OPPreferencesNotifyCompromisedWebsites = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, creates a user notification when Watchtower detects a compromised website.";
    };

    OPPreferencesNotifyVaultAddedRemoved = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, creates a user notification when vault access is added or removed.";
    };

    OPPreferencesNotifyOfTOTPCopy = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, creates a user notification when a vault item's OTP code is copied to the clipboard.";
    };

    OPPreferencesWhatsNewDialogDisabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, on app launch following an update a What's New dialog box is presented to the user.";
    };

    CheckForSoftwareUpdatesEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enforces whether to automatically check for available updates.";
    };

    AutoInstallSoftwareUpdatesEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Should 1Password attempt to automatically install updates?";
    };

  };
}