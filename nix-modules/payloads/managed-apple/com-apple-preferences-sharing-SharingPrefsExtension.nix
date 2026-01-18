# Auto-generated from ProfileManifests: com.apple.preferences.sharing.SharingPrefsExtension.plist
# Domain: com.apple.preferences.sharing.SharingPrefsExtension
# Title: Media Sharing
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-preferences-sharing-SharingPrefsExtension" = {
    enable = lib.mkEnableOption "Media Sharing";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.preferences.sharing.SharingPrefsExtension";
      description = "The payload domain (PayloadType) for this manifest.";
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
}