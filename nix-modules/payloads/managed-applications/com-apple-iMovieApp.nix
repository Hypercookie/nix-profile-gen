# Auto-generated from ProfileManifests: com.apple.iMovieApp.plist
# Domain: com.apple.iMovieApp
# Title: iMovie
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-apple-iMovieApp" = {
    enable = lib.mkEnableOption "iMovie";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.iMovieApp";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    FFiMovieUpgradeFirstRun = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Suppresses the popup to upgrade an iMovie library on first run.";
    };

    LKWelcomeDisplayedForAppVersion = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          __key__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
          __value__ = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
        };
      });
      default = null;
      description = "Suppress the Welcome screen on the selected versions of iMovie.";
    };

    LKWhatsNewDisplayedForAppVersion = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          __key__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
          __value__ = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
        };
      });
      default = null;
      description = "Suppress the Whats New screen on the selected versions of iMovie.";
    };

  };
}