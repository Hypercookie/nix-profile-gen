# Auto-generated from ProfileManifests: com.apple.screensaver.plist
# Domain: com.apple.screensaver
# Title: Screensaver
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-screensaver" = {
    enable = lib.mkEnableOption "Screensaver";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.screensaver";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    askForPassword = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the user is prompted for a password when the screen saver is unlocked or stopped. When you use this prompt, you must also provide 'askForPasswordDelay'. Available in macOS 10.13 and later.";
    };

    askForPasswordDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = 0;
      description = "The number of seconds to delay before the password will be required to unlock or stop the screen saver (the grace period). A value of '2147483647' (for example, '0x7FFFFFFF') disables this requirement. To use this option, you must set 'askForPassword' to 'true'. Available in macOS 10.13 and later.";
    };

    loginWindowModulePath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The full path to the screen-saver module to use.";
    };

    loginWindowIdleTime = lib.mkOption {
      type = types.nullOr (types.int);
      default = 300;
      description = "The number of seconds of inactivity before the screen saver activates (0 = Never activate).";
    };

    idleTime = lib.mkOption {
      type = types.nullOr (types.int);
      default = 300;
      description = "The number of seconds of inactivity before the screen saver activates (0 = Never activate).";
    };

    moduleName = lib.mkOption {
      type = types.nullOr (types.str);
      default = "Flurry";
      description = "The name of the screen saver module.";
    };

  };
}