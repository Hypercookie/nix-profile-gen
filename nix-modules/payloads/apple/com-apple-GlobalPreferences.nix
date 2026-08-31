# Auto-generated from ProfileManifests: com.apple.GlobalPreferences.plist
# Domain: .GlobalPreferences
# Title: Global Preferences
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Global Preferences";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = ".GlobalPreferences";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "com.apple.autologout.AutoLogOutDelay" "MultipleSessionEnabled" "CSUIDisable32BitWarning" "NSDocumentSaveNewDocumentsToCloud" "AppleShowScrollBars" "AppleShowAllExtensions" "TSMLanguageIndicatorEnabled" "NSMenuEnableActionImages" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      "com.apple.autologout.AutoLogOutDelay" = lib.mkOption {
        type = types.nullOr (types.float);
        default = null;
        description = "The 'autologout' delay, in seconds. A value of '0' means 'autologout' is off. In some cases, this delay may be restricted to values between 5 minutes and 24 hours.";
      };

      MultipleSessionEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'false', disables fast user switching.";
      };

      CSUIDisable32BitWarning = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Hides the one-time alert shown when opening a 32-bit application.";
      };

      NSDocumentSaveNewDocumentsToCloud = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to false, applications won't default to save to iCloud.";
      };

      AppleShowScrollBars = lib.mkOption {
        type = types.nullOr (types.enum [ "Automatic" "WhenScrolling" "Always" ]);
        default = null;
        description = "When should the scroll bars be shown?";
      };

      AppleShowAllExtensions = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable to forcibly show all file extensions in Finder.";
      };

      TSMLanguageIndicatorEnabled = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "If enabled, a language indicator pops up next to the text cursor throughout the system when the user is editing text.";
      };

      NSMenuEnableActionImages = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'false', menu item icons added in macOS Tahoe (26.0) are removed.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-GlobalPreferences" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Global Preferences (.GlobalPreferences) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}