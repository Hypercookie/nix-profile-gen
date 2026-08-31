# Auto-generated from ProfileManifests: com.apple.preferences.sharing.SharingPrefsExtension.plist
# Domain: com.apple.preferences.sharing.SharingPrefsExtension
# Title: Media Sharing
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Media Sharing";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.preferences.sharing.SharingPrefsExtension";
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
        default = [ "homeSharingUIStatus" "legacySharingUIStatus" "mediaSharingUIStatus" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      homeSharingUIStatus = lib.mkOption {
        type = types.nullOr (types.enum [ 0 1 ]);
        default = null;
        description = "When Media Sharing is enabled, the computer starts a network listening service that shares the contents of the user’s music collection with other users in the same subnet.";
      };

      legacySharingUIStatus = lib.mkOption {
        type = types.nullOr (types.enum [ 0 1 ]);
        default = null;
        description = "When Media Sharing is enabled, the computer starts a network listening service that shares the contents of the user’s music collection with other users in the same subnet.";
      };

      mediaSharingUIStatus = lib.mkOption {
        type = types.nullOr (types.enum [ 0 1 ]);
        default = null;
        description = "When Media Sharing is enabled, the computer starts a network listening service that shares the contents of the user’s music collection with other users in the same subnet.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-preferences-sharing-SharingPrefsExtension" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Media Sharing (com.apple.preferences.sharing.SharingPrefsExtension) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}