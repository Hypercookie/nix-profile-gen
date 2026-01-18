# Auto-generated from ProfileManifests: com.apple.SetupAssistant.managed.plist
# Domain: com.apple.SetupAssistant.managed
# Title: Setup Assistant
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-SetupAssistant-managed" = {
    enable = lib.mkEnableOption "Setup Assistant";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.SetupAssistant.managed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    SkipSetupItems = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "Accessibility" "ActionButton" "AgeAssurance" "AgeBasedSafetySettings" "Android" "Appearance" "AppleID" "AppStore" "Biometric" "CameraButton" "DeviceToDeviceMigration" "Diagnostics" "DisplayTone" "EnableLockdownMode" "FileVault" "HomeButtonSensitivity" "iCloudDiagnostics" "iCloudStorage" "iMessageAndFaceTime" "Intelligence" "Keyboard" "Location" "MessagingActivationUsingPhoneNumber" "Multitasking" "OnBoarding" "OSShowcase" "Passcode" "Payment" "Privacy" "Restore" "RestoreCompleted" "Safety" "SafetyAndHandling" "ScreenTime" "SIMSetup" "Siri" "SpokenLanguage" "SoftwareUpdate" "TermsOfAddress" "TOS" "Tips" "UnlockWithWatch" "UpdateCompleted" "Wallpaper" "WatchMigration" "Welcome" "Zoom" ]));
      default = null;
      description = "An array of strings that describe the setup items to skip. 'SkipKeys' provides a list of valid strings and their meanings. Available in iOS 14 and later, and macOS 15 and later.";
    };

    SkipAppearance = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system skips the Choose Your Look pane.";
    };

    SkipCloudSetup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system skips the Apple Account setup pane.";
    };

    SkipiCloudStorageSetup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system skips the iCloud Storage pane.";
    };

    SkipPrivacySetup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system skips the Privacy consent pane.";
    };

    SkipSiriSetup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system skips the Siri setup pane.";
    };

    SkipTrueTone = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system skips the True Tone Display pane.";
    };

    SkipScreenTime = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system skips the Screen Time pane.";
    };

    SkipTouchIDSetup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system skips the Touch ID setup pane.";
    };

    SkipUnlockWithWatch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system skips the Unlock With Apple Watch pane.";
    };

    SkipAccessibility = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system skips the Accessibility pane.";
    };

    SkipWallpaper = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system skips the Wallpaper selection window.";
    };

  };
}