# Auto-generated from ProfileManifests: com.apple.screensaver.user.plist
# Domain: com.apple.screensaver.user
# Title: Screensaver User
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-screensaver-user" = {
    enable = lib.mkEnableOption "Screensaver User";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.screensaver.user";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    modulePath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A full path to the screen saver module to use.";
    };

    idleTime = lib.mkOption {
      type = types.nullOr (types.int);
      default = 300;
      description = "The number of seconds of inactivity before the screen saver activates ('0' = Never activate).";
    };

    moduleName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The name of the screen saver module.";
    };

  };
}