# Auto-generated from ProfileManifests: com.apple.mobiledevice.passwordpolicy.plist
# Domain: com.apple.mobiledevice.passwordpolicy
# Title: Passcode
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-mobiledevice-passwordpolicy" = {
    enable = lib.mkEnableOption "Passcode";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.mobiledevice.passwordpolicy";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    allowSimple = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents use of a simple passcode. A simple passcode contains repeated characters, or increasing or decreasing characters, such as '123' or 'CBA'.";
    };

    requireAlphanumeric = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system requires alphabetic characters instead of only numeric characters.";
    };

    minLength = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The minimum overall length of the passcode. This value is independent of the value for 'minComplexChars'.";
    };

    minComplexChars = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The minimum number of complex characters that a passcode needs to contain. A complex character is a character other than a number or a letter, such as '&', '%', '$', and '#'.\n\nThe system ignores this property for user enrollments.";
    };

    customRegex = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          passwordContentRegex = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A regular expression string that the system matches against the password to determine whether it complies with a policy. The regular expression uses the ICU syntax ([https://unicode-org.github.io/icu/userguide/strings/regexp.html](https://unicode-org.github.io/icu/userguide/strings/regexp.html)). The string must not exceed 2048 characters in length.";
          };
          passwordContentDescription = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                __key__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                };
                __value__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A localized description.";
                };
              };
            });
            default = null;
            description = "Contains a dictionary of keys for supported OS language IDs (for example, \"en-US\"), and whose values represent a localized description of the policy enforced by the regular expression. Use the special 'default' key can for languages that aren't contained in the dictionary.";
          };
        };
      });
      default = null;
      description = "Specifies a regular expression, and its description, used to enforce password compliance. Use the simpler passcode restrictions whenever possible, and rely on regular expression matching only when necessary. Mistakes in regular expressions can lead to frustrating user experiences, such as unsatisfiable passcode policies, or policy descriptions that don't match the enforced policy.\n\nAvailable in macOS 14 and later.";
    };

    maxPINAgeInDays = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The number of days for which the passcode can remain unchanged. After this number of days, the system forces the user to change the passcode before it unlocks the device.";
    };

    pinHistory = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "This value defines N, where the new passcode must be unique within the last N entries in the passcode history.";
    };

    changeAtNextAuth = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system causes a password reset to occur the next time the user tries to authenticate. If this key is set in a device profile, the setting takes effect for all users, and admin authentications may fail until the admin user password is also reset. Available in macOS 10.13 and later.";
    };

    forcePIN = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system forces the user to enter a PIN.";
    };

    maxInactivity = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The maximum number of minutes for which the device can be idle without the user unlocking it, before the system locks it. When this limit is reached, the system locks the device and the passcode is required to unlock it. The user can edit this setting, but the value can't exceed the 'maxInactivity' value.\n\nOn macOS, the system translates this inactivity value to screen-saver settings. The maximum value for macOS is '60'.\n\nSetting this key removes the 'never' option in the Settings UI on user enrolled devices.";
    };

    maxGracePeriod = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The maximum grace period, in minutes, to unlock the phone without entering a passcode. The default is '0', which is no grace period and requires a passcode immediately. On macOS, the system translates this grace period value to screen-saver settings.";
    };

    maxFailedAttempts = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The number of failed passcode attempts that the system allows the user before it erases or locks the device. After six failed attempts, the device imposes a time delay before the user can enter a passcode again. The time delay increases with each failed attempt. On macOS, set 'minutesUntilFailedLoginReset' to define the time delay. The time delay begins after the sixth attempt, so if 'MaximumFailedAttempts' is six or lower, the system has no time delay and triggers the erase or lock as soon as the user exceeds the limit.\n\nAfter the final failed attempt, the system locks a macOS device, or securely erases all data and settings from an iOS, visionOS, or watchOS device.";
    };

    minutesUntilFailedLoginReset = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The number of minutes before the system resets the login after the maximum number of unsuccessful login attempts is reached. This key requires setting 'maxFailedAttempts'. Available in macOS 10.10 and later.";
    };

  };
}