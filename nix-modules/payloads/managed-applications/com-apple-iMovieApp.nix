# Auto-generated from ProfileManifests: com.apple.iMovieApp.plist
# Domain: com.apple.iMovieApp
# Title: iMovie
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "iMovie";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.iMovieApp";
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
        default = [ "FFiMovieUpgradeFirstRun" "LKWelcomeDisplayedForAppVersion" "LKWhatsNewDisplayedForAppVersion" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-apple-iMovieApp" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "iMovie (com.apple.iMovieApp) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}