# Auto-generated from ProfileManifests: com.apple.notificationsettings-iOS.plist
# Domain: com.apple.notificationsettings
# Title: Notifications
# Platforms: iOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Notifications";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.notificationsettings";
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
        default = [ "NotificationSettings" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      NotificationSettings = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            NotificationsEnabled = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', enables notifications for this app.\nAvailable in iOS 9.3 and later and macOS 10.15 and later.";
            };
            BundleIdentifier = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The bundle identifier of the app to which to apply these notification settings.\nAvailable in iOS 9.3 and later and macOS 10.15 and later.";
            };
            ShowInNotificationCenter = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', enables notifications in the notification center for this app.\nAvailable in iOS 9.3 and later and macOS 10.15 and later.";
            };
            ShowInLockScreen = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', enables notifications on the Lock Screen for this app.\nAvailable in iOS 9.3 and later and macOS 10.15 and later.";
            };
            ShowInCarPlay = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', enables notifications in CarPlay for this app.\nAvailable in iOS 12 and later.";
            };
            SoundsEnabled = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', enables sounds for this app.";
            };
            BadgesEnabled = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', enables badges for this app.\nAvailable in iOS 9.3 and later and macOS 10.15 and later.";
            };
            AlertType = lib.mkOption {
              type = types.nullOr (types.enum [ 0 1 2 ]);
              default = null;
              description = "The type of alert for notifications for this app:\n'0': None\n'1': Temporary Banner\n'2': Persistent Banner\nAvailable in iOS 9.3 and later and macOS 10.15 and later.";
            };
            PreviewType = lib.mkOption {
              type = types.nullOr (types.enum [ 0 1 2 ]);
              default = null;
              description = "The type previews for notifications. This key overrides the value at Settings>Notifications>Show Previews.\n'0' - Always: Previews will be shown when the device is locked and unlocked\n'1' - When Unlocked: Previews will only be shown when the device is unlocked\n'2' - Never: Previews will never be shown\nAvailable in iOS 14 and later.";
            };
            GroupingType = lib.mkOption {
              type = types.nullOr (types.enum [ 0 1 2 ]);
              default = null;
              description = "The type of grouping for notifications for this app:\n'0': Automatic: Group notifications into app-specified groups.\n'1': By app: Group notifications into one group.\n'2': Off: Don't group notifications.\nAvailable in iOS 12 and later.";
            };
            CriticalAlertEnabled = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', enables critical alerts that can ignore Do Not Disturb and ringer settings for this app.\nAvailable in iOS 12 and later and macOS 10.15 and later.";
            };
          };
        }));
        default = null;
        description = "An array of notification settings dictionaries.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-notificationsettings-iOS" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Notifications (com.apple.notificationsettings) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}