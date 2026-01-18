# Auto-generated from ProfileManifests: SupportCompanion.plist
# Domain: SupportCompanion
# Title: Support Companion v1
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-SupportCompanion" = {
    enable = lib.mkEnableOption "Support Companion v1";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "SupportCompanion";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    BrandName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the name shown in the navigation menu.";
    };

    BrandColor = lib.mkOption {
      type = types.nullOr (types.enum [ "Blue" "Green" "Red" "Orange" ]);
      default = null;
      description = "Configures the brand color shown in the app, available colors are: Blue, Green, Red, Orange. Defaults to Blue if not configured.";
    };

    BrandLogo = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the brand logo shown in the apps side menu. Specify a local path or Base64 string.";
    };

    SupportUrl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the URL to open when the user clicks on the Get Support button.";
    };

    ChangePasswordUrl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the URL to open when the user clicks on the Change Password button.";
    };

    ChangePasswordMode = lib.mkOption {
      type = types.nullOr (types.enum [ "local" "SSOExtension" "url" ]);
      default = null;
      description = "Configures the mode for the Change Password button, available modes are: local, SSOExtension, url. Defaults to local if not configured.";
    };

    SupportEmail = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the email address shown when the user clicks on the Support Info button.";
    };

    SupportPhone = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the phone number shown when the user clicks on the Support Info button.";
    };

    ShowMenuToggle = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Configures whether to show the menu toggle button in the apps side menu.";
    };

    HiddenWidgets = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configures which widgets to hide, available widgets are: DeviceInfo, MunkiPendingApps, MunkiUpdates, IntunePendingApps, IntuneUpdates, Storage, MdmStatus, Actions, Battery, EvergreenInfo.";
    };

    HiddenActions = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configures which actions to hide, available actions are: Support, ManagedSoftwareCenter, ChangePassword, Reboot, KillAgent, SoftwareUpdates, GatherLogs.";
    };

    NotificationInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Configures the interval for notifications in hours for Application Updates and Software Updates notifications.";
    };

    NotificationTitle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the title for notifications for notifications. Defaults to Support Companion if not configured.";
    };

    NotificationImage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures an image to add to notifications. Local path should be specified.";
    };

    SoftwareUpdateNotificationMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the message for notifications for Software Updates notifications. Defaults to \"You have software updates available. Take action now! \\ud83c\\udf89\" if not configured.";
    };

    SoftwareUpdateNotificationButtonText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the button text for notifications for Software Updates notifications. Defaults to \"Details \\ud83d\\udc40\" if not configured.";
    };

    AppUpdateNotificationMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the message for notifications for App Updates notifications. Defaults to \"You have app updates available. Take action now! \\ud83c\\udf89\" if not configured.";
    };

    AppUpdateNotificationButtonText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the button text for notifications for App Updates notifications. Defaults to \"Details \\ud83d\\udc40\" if not configured.";
    };

    CustomColors = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          PrimaryColor = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Configures the Primary Color for the app.";
          };
          AccentColor = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Configures the Accent Color for the app.";
          };
        };
      }));
      default = null;
      description = "Configures custom colors for the app, should be specified in hex format, see example below. Do not use BrandColor in conjunction with this key.";
    };

    IntuneMode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Configures the app to use Intune for application information. Only supports PKG and DMG type apps, not LOB.";
    };

    SystemProfilerApps = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Configures the app to list all applications installed under /Applications and their versions. Useful if Munki or Intune is not used.";
    };

    LogFolders = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configures the log folders to gather logs from. Only used when gathering logs. Defaults to \"/Library/Logs/Microsoft\" if not configured.";
    };

    Actions = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Name of the action to show in the menu.";
          };
          Command = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Command to run when to item is clicked.";
          };
          Icon = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Icon to show in the Self Service page in the UI.";
          };
        };
      }));
      default = null;
      description = "Configures custom actions to add to the tray menu. See example below.";
    };

    ShowDesktopInfo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Configures the desktop info widget.";
    };

    DesktopPosition = lib.mkOption {
      type = types.nullOr (types.enum [ "TopLeft" "TopRight" "BottomLeft" "BottomRight" ]);
      default = null;
      description = "Configures the position of the desktop info. Defaults to TopRight.";
    };

    DesktopInfoLevel = lib.mkOption {
      type = types.nullOr (types.enum [ "Full" "Minimal" "Hardware" "Custom" ]);
      default = null;
      description = "Configures the level of information to show on the desktop. Defaults to Full.";
    };

    DesktopInfoCustomItems = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "If DesktopInfoLevel is set to Custom, use this array to determine which information to show. Available info are: HostName, Model, SerialNumber, Processor, IpAddress, MemSize, OsBuild, OsVersion, LastBootTime, StorageInfo, SupportPhone, SupportEmail, Separator.";
    };

    DesktopInfoBackgroundColor = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the background color for the desktop info. Configure using Hex format. Defaults to Transparent";
    };

    DesktopInfoBackgroundOpacity = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "Configures the position of the desktop info. Defaults to 100%.";
    };

    DesktopInfoColorHighlight = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Configures whether to highlight the text in the desktop info. Defaults to true.";
    };

    DesktopInfoFontSize = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Configures the font size for the desktop info. Defaults to 17.";
    };

    CustomWidgetsPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures a path to a JSON file containing custom widgets to show on the Home view.";
    };

  };
}