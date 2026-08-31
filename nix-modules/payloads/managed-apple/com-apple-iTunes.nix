# Auto-generated from ProfileManifests: com.apple.iTunes.plist
# Domain: com.apple.iTunes
# Title: iTunes
# Platforms: macOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "iTunes";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.iTunes";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
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
        default = [ "license_agreements" "disableShareLibraryInfo" "DisableDeviceBackups" "disableAppleMusic" "disableMusicSocial" "disableCheckForUpdates" "disableMusicStore" "disablePodcasts" "disableRadio" "disableSharedMusic" "dontAutomaticallySyncIPods" "restrictExplicit" "restrictExplicitBooks" "restrictGames" "restrictMovies" "restrictTVShows" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      license_agreements = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            EA1510 = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Automatically accept the iTunes Software Licence Agreement on launch.";
            };
          };
        });
        default = null;
        description = "Agrees to the license agreement prompt when first opening iTunes";
      };

      disableShareLibraryInfo = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Share details about your library with Apple.";
      };

      DisableDeviceBackups = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disable Device Backups";
      };

      disableAppleMusic = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disable Apple Music";
      };

      disableMusicSocial = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disable Music Profiles and Posts";
      };

      disableCheckForUpdates = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disable Checking for Updates";
      };

      disableMusicStore = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disable iTunes Store";
      };

      disablePodcasts = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disable Podcasts";
      };

      disableRadio = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disable Internet Radio";
      };

      disableSharedMusic = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disable Shared Libraries";
      };

      dontAutomaticallySyncIPods = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Prevent iPods, iPhones and iPads from syncing automatically";
      };

      restrictExplicit = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Restrict Music with explicit content";
      };

      restrictExplicitBooks = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Restrict Books with explicit sexual content";
      };

      restrictGames = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Restrict Games";
      };

      restrictMovies = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Restrict Movies";
      };

      restrictTVShows = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Restrict TV Shows";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-iTunes" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "iTunes (com.apple.iTunes) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}