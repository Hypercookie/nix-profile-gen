# Auto-generated from ProfileManifests: Configuration.plist
# Domain: Configuration
# Title: General
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-Configuration" = {
    enable = lib.mkEnableOption "General";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "Configuration";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    RemovalDate = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The date when the system automatically removes the profile.";
    };

    DurationUntilRemoval = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "The number of seconds until the profile is automatically removed. If the 'RemovalDate' key is present, the system uses whichever field yields the earliest date.";
    };

    ConsentText = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          __key__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The IETF BCP 47 identifier for that language (for example, en or jp).";
          };
          __value__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The agreement localized to that language.";
          };
          default = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The system chooses a localized version in the order of preference specified by the user (macOS) or based on the user's current language setting (iOS). If no exact match is found, the default localization is used. If there is no default localization, the en localization is used. If there is no en localization, then the first available localization is used.";
          };
        };
      });
      default = null;
      description = "A dictionary that includes:\n\n- A key that contains the IETF BCP 47 identifier for a language, such as en or jp\n- A value that contains the agreement localized to language specified by the key\n\nThe dictionary can also contain an optional key, 'default', with its value consisting of the unlocalized (usually in en) agreement.\n\nThe system always displays the agreement in a dialog, and the user needs to agree before the system can install the profile.\n\nThe system chooses a localized version in the order of preference that the user specifies in macOS, or based on the user's current language setting in iOS. If there's no exact match, the system uses the default localization. If there's no default localization, the system uses the en localization. If there's no en localization, the system uses the first available localization.\n\nTip:\nProvide a default value, if possible. The system won't display a warning if the user's locale doesn't match any localization in the 'ConsentText' dictionary.";
    };

    HasRemovalPasscode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set to 'true' if there's a removal passcode.";
    };

    TargetDeviceType = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 4 5 6 ]);
      default = null;
      description = "The type of platform of the target device. Specifying the platform type helps prevent unintended installations.\n\nFor interactive installations on iOS devices, specifying a target platform avoids interstitial alerts that prompt the user to choose a profile target when multiple targets are eligible.\n\nAllowed values:\n\n- '0': Any/unspecified\n- '1': iPhone/iPad/iPod Touch\n- '2': Apple Watch\n- '3': HomePod\n- '4': Apple TV\n- '5': Mac\n- '6': Vision Pro";
    };

  };
}