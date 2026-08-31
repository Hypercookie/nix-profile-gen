# Auto-generated from ProfileManifests: org.sveinbjorn.Platypus.plist
# Domain: org.sveinbjorn.Platypus
# Title: Platypus
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Platypus";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "org.sveinbjorn.Platypus";
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
        default = [ "PFC_SegmentedControl_0" "DefaultBundleIdentifierPrefix" "DefaultAuthor" "DefaultEditor" "RevealApplicationWhenCreated" "OpenApplicationWhenCreated" "SUAutomaticallyUpdate" "SUEnableAutomaticChecks" "SUFeedURL" "SUSendProfileInfo" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      PFC_SegmentedControl_0 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      DefaultBundleIdentifierPrefix = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Enter the desired default bundle identifier prefix for apps built with Platypus. This string must end with a period.";
      };

      DefaultAuthor = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The default name to have listed as the application author.";
      };

      DefaultEditor = lib.mkOption {
        type = types.nullOr (types.enum [ "Atom" "BBEdit" "Sublime Text" "TextEdit" ]);
        default = null;
        description = "The default text editor to use with Platypus. If you want to use built-in Platypus editor, don't enable this preference.";
      };

      RevealApplicationWhenCreated = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "After building an application with Platypus, reveal the application in the Finder.";
      };

      OpenApplicationWhenCreated = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "After building an appliction with Platypus, launch the application.";
      };

      SUAutomaticallyUpdate = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Automatically download available updates for Platypus. When combined with SUEnableAutomaticChecks, Platypus will automatically check and download these updates. Updates are subsequently installed when the user quits the app.";
      };

      SUEnableAutomaticChecks = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Automatically check for Platypus software updates.";
      };

      SUFeedURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Sparkle update framework key. While automatic update checks can be disabled via the SUEnableAutomaticChecks key, this does not prevent users from manually running a software update check via the GUI. Setting this key to a non-existant local address will prevent users from manually triggering and/or installing updates themselves.";
      };

      SUSendProfileInfo = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When running software update checks, submit anonymous computer profile data to Platypus.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-org-sveinbjorn-Platypus" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Platypus (org.sveinbjorn.Platypus) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}