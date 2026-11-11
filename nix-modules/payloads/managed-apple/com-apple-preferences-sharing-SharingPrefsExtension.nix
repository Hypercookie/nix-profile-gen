# Auto-generated from ProfileManifests: com.apple.preferences.sharing.SharingPrefsExtension.plist
# Domain: com.apple.preferences.sharing.SharingPrefsExtension
# Title: Media Sharing
# Platforms: macOS
# Unique: yes
# Targets: system

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
        default = [ "system" ];
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
  options.payloads."managed-apple-com-apple-preferences-sharing-SharingPrefsExtension" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Media Sharing (com.apple.preferences.sharing.SharingPrefsExtension) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}