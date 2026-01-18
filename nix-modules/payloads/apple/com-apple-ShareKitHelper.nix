# Auto-generated from ProfileManifests: com.apple.ShareKitHelper.plist
# Domain: com.apple.ShareKitHelper
# Title: ShareKit
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-ShareKitHelper" = {
    enable = lib.mkEnableOption "ShareKit";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.ShareKitHelper";
      description = "The payload domain (PayloadType) for this manifest.";
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
}