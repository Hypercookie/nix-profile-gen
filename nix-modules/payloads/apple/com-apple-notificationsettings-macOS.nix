# Auto-generated from ProfileManifests: com.apple.notificationsettings-macOS.plist
# Domain: com.apple.notificationsettings
# Title: Notifications
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-notificationsettings-macOS" = {
    enable = lib.mkEnableOption "Notifications";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.notificationsettings";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    NotificationSettings = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          NotificationsEnabled = lib.mkOption {
            type = types.nullOr (types.bool);
            default = true;
            description = "If 'true', enables notifications for this app.\n\nAvailable in iOS 9.3 and later and macOS 10.15 and later.";
          };
          BundleIdentifier = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The bundle identifier of the app to which to apply these notification settings.\n\nAvailable in iOS 9.3 and later and macOS 10.15 and later.";
          };
          ShowInNotificationCenter = lib.mkOption {
            type = types.nullOr (types.bool);
            default = true;
            description = "If 'true', enables notifications in the notification center for this app.\n\nAvailable in iOS 9.3 and later and macOS 10.15 and later.";
          };
          ShowInLockScreen = lib.mkOption {
            type = types.nullOr (types.bool);
            default = true;
            description = "If 'true', enables notifications on the Lock Screen for this app.\n\nAvailable in iOS 9.3 and later and macOS 10.15 and later.";
          };
          SoundsEnabled = lib.mkOption {
            type = types.nullOr (types.bool);
            default = true;
            description = "If 'true', enables sounds for this app.";
          };
          BadgesEnabled = lib.mkOption {
            type = types.nullOr (types.bool);
            default = true;
            description = "If 'true', enables badges for this app.\n\nAvailable in iOS 9.3 and later and macOS 10.15 and later.";
          };
          AlertType = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 2 ]);
            default = 1;
            description = "The type of alert for notifications for this app:\n\n- '0': None\n- '1': Temporary Banner\n- '2': Persistent Banner\n\nAvailable in iOS 9.3 and later and macOS 10.15 and later.";
          };
          CriticalAlertEnabled = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "If 'true', enables critical alerts that can ignore Do Not Disturb and ringer settings for this app.\n\nAvailable in iOS 12 and later and macOS 10.15 and later.";
          };
        };
      }));
      default = null;
      description = "An array of notification settings dictionaries.";
    };

  };
}