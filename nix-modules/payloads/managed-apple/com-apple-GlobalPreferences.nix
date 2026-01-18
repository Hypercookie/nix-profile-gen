# Auto-generated from ProfileManifests: com.apple.GlobalPreferences.plist
# Domain: .GlobalPreferences
# Title: Global Preferences
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-GlobalPreferences" = {
    enable = lib.mkEnableOption "Global Preferences";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = ".GlobalPreferences";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    com_apple_autologout_AutoLogOutDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The autologout delay, in seconds. A value of 0 means autologout is off. In some cases, this delay may be restricted to values between 5 minutes and 24 hours.";
    };

    MultipleSessionEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If set to false, fast user switching is disabled.";
    };

    CSUIDisable32BitWarning = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Hides the one-time alert shown when opening a 32-bit application.";
    };

    NSDocumentSaveNewDocumentsToCloud = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If set to false, applications won't default to save to iCloud.";
    };

    AppleShowScrollBars = lib.mkOption {
      type = types.nullOr (types.enum [ "Automatic" "WhenScrolling" "Always" ]);
      default = "Automatic";
      description = "When should the scroll bars be shown?";
    };

    AppleShowAllExtensions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enable to forcibly show all file extensions in Finder.";
    };

    TSMLanguageIndicatorEnabled = lib.mkOption {
      type = types.nullOr (types.int);
      default = 1;
      description = "If enabled, a language indicator pops up next to the text cursor throughout the system when the user is editing text.";
    };

  };
}