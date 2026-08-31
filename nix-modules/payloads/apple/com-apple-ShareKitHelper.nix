# Auto-generated from ProfileManifests: com.apple.ShareKitHelper.plist
# Domain: com.apple.ShareKitHelper
# Title: ShareKit
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "ShareKit";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.ShareKitHelper";
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

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "system" "user" ];
        description = "Profile scopes this payload may be installed into (pfm_targets).";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "SHKAllowedShareServices" "SHKDeniedShareServices" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      SHKAllowedShareServices = lib.mkOption {
        type = types.nullOr (types.listOf (types.enum [ "com.apple.share.AirDrop" "com.apple.share.Facebook" "com.apple.share.LinkedIn.post" "com.apple.share.Twitter" "com.apple.share.Mail" "com.apple.share.Messages" "com.apple.Notes.SharingExtension" "com.apple.reminders.RemindersShareExtension" "com.apple.share.Video" "com.apple.share.addtoiphoto" "com.apple.share.addtoaperture" "com.apple.share.readlater" "com.apple.share.SinaWeibo" ]));
        default = null;
        description = "The list of plugin IDs that show up in the user's Share menu. If this array exists, only these items are permitted.";
      };

      SHKDeniedShareServices = lib.mkOption {
        type = types.nullOr (types.listOf (types.enum [ "com.apple.share.AirDrop" "com.apple.share.Facebook" "com.apple.share.LinkedIn.post" "com.apple.share.Twitter" "com.apple.share.Mail" "com.apple.share.Messages" "com.apple.Notes.SharingExtension" "com.apple.reminders.RemindersShareExtension" "com.apple.share.Video" "com.apple.share.addtoiphoto" "com.apple.share.addtoaperture" "com.apple.share.readlater" "com.apple.share.SinaWeibo" ]));
        default = null;
        description = "The list of plugin IDs that won't show up in the user's Share menu. This key is used only if there is no 'SHKAllowedShareServices' key.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-ShareKitHelper" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "ShareKit (com.apple.ShareKitHelper) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}