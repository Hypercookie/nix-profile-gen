# Auto-generated from ProfileManifests: com.apple.SetupAssistant.managed.plist
# Domain: com.apple.SetupAssistant.managed
# Title: Setup Assistant
# Platforms: iOS, macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Setup Assistant";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.SetupAssistant.managed";
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
        default = [ "iOS" "macOS" ];
        description = "Supported Apple platforms (pfm_platforms).";
      };

      _keyPlatforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.attrs;
        default = [
          { path = [ "SkipAppearance" ]; platforms = [ "macOS" ]; }
          { path = [ "SkipCloudSetup" ]; platforms = [ "macOS" ]; }
          { path = [ "SkipiCloudStorageSetup" ]; platforms = [ "macOS" ]; }
          { path = [ "SkipPrivacySetup" ]; platforms = [ "macOS" ]; }
          { path = [ "SkipSiriSetup" ]; platforms = [ "macOS" ]; }
          { path = [ "SkipTrueTone" ]; platforms = [ "macOS" ]; }
          { path = [ "SkipScreenTime" ]; platforms = [ "macOS" ]; }
          { path = [ "SkipTouchIDSetup" ]; platforms = [ "macOS" ]; }
          { path = [ "SkipUnlockWithWatch" ]; platforms = [ "macOS" ]; }
          { path = [ "SkipAccessibility" ]; platforms = [ "macOS" ]; }
          { path = [ "SkipWallpaper" ]; platforms = [ "macOS" ]; }
        ];
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
        default = [ "SkipSetupItems" "SkipAppearance" "SkipCloudSetup" "SkipiCloudStorageSetup" "SkipPrivacySetup" "SkipSiriSetup" "SkipTrueTone" "SkipScreenTime" "SkipTouchIDSetup" "SkipUnlockWithWatch" "SkipAccessibility" "SkipWallpaper" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      SkipSetupItems = lib.mkOption {
        type = types.nullOr (types.listOf (types.enum [ "Accessibility" "ActionButton" "Android" "Appearance" "AppleID" "AppStore" "Biometric" "CameraButton" "DeviceToDeviceMigration" "Diagnostics" "DisplayTone" "EnableLockdownMode" "FileVault" "HomeButtonSensitivity" "iCloudDiagnostics" "iCloudStorage" "iMessageAndFaceTime" "Intelligence" "Keyboard" "Location" "MessagingActivationUsingPhoneNumber" "Multitasking" "OnBoarding" "OSShowcase" "Passcode" "Payment" "Privacy" "Restore" "RestoreCompleted" "Safety" "SafetyAndHandling" "ScreenTime" "SIMSetup" "Siri" "SpokenLanguage" "SoftwareUpdate" "TermsOfAddress" "TOS" "Tips" "UnlockWithWatch" "UpdateCompleted" "Wallpaper" "WatchMigration" "Welcome" "Zoom" ]));
        default = null;
        description = "An array of strings that describe the setup items to skip. 'SkipKeys' provides a list of valid strings and their meanings.";
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
  };
in
{
  options.payloads."apple-com-apple-SetupAssistant-managed" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Setup Assistant (com.apple.SetupAssistant.managed) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}