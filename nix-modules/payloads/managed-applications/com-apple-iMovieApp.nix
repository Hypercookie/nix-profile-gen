# Auto-generated from ProfileManifests: com.apple.iMovieApp.plist
# Domain: com.apple.iMovieApp
# Title: iMovie
# Platforms: macOS
# Unique: yes
# Targets: system, user

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
        default = [ "macOS" ];
        description = "Supported Apple platforms (pfm_platforms).";
      };

      _keyPlatforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.attrs;
        default = [ ];
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
  options.payloads."managed-applications-com-apple-iMovieApp" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "iMovie (com.apple.iMovieApp) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}