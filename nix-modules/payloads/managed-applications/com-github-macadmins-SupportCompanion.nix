# Auto-generated from ProfileManifests: com.github.macadmins.SupportCompanion.plist
# Domain: com.github.macadmins.SupportCompanion
# Title: Support Companion
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-github-macadmins-SupportCompanion" = {
    enable = lib.mkEnableOption "Support Companion";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.github.macadmins.SupportCompanion";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    KnowledgeBaseUrl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If configured, a menu item \"Knowledge base\" will show up where the user can browse the page from the UI.";
    };

    MenuShowIdentity = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Configures whether to show the Identity menu item. Defaults to true";
    };

    MenuShowApps = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Configures whether to show the Apps menu item. Defaults to true";
    };

    MenuShowSelfService = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Configures whether to show the Self Service menu item. Defaults to true";
    };

    MenuShowCompanyPortal = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Configures whether to show the Company Portal menu item. Defaults to true";
    };

    MenuShowKnowledgeBase = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Configures whether to show the Knowledge Base menu item. Defaults to true";
    };

    BrandName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the name shown in the navigation menu.";
    };

    AccentColor = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the brand color shown in the app, specify in hex format.";
    };

    BrandLogo = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the brand logo shown in the apps side menu. Specify a Base64 string.";
    };

    BrandLogoLight = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the brand logo shown in the apps side menu when light theme is used. Specify a base64 string";
    };

    SupportPageUrl = lib.mkOption {
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

    HiddenCards = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configures which cards to hide, available cards are: DeviceInformation, Evergreen, Battery, Actions, ApplicationInstallProgress, Storage, DeviceManagement, PendingAppUpdates.";
    };

    HiddenActions = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configures which actions to hide, available actions are: ChangePassword, Reboot, OpenManagementApp, GetSupport, GatherLogs, SoftwareUpdates, RestartIntuneAgent.";
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
      default = "Software Updates Available. Please update your device to the latest version.";
      description = "Configures the message for notifications for Software Updates notifications. Defaults to \"Software Updates Available. Please update your device to the latest version.\" if not configured.";
    };

    SoftwareUpdateNotificationButtonText = lib.mkOption {
      type = types.nullOr (types.str);
      default = "Update Now 🚀";
      description = "Configures the button text for notifications for Software Updates notifications. Defaults to \"Update Now 🚀\" if not configured.";
    };

    AppUpdateNotificationMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = "App Updates Available. Please update your apps to the latest version.";
      description = "Configures the message for notifications for App Updates notifications. Defaults to \"App Updates Available. Please update your apps to the latest version.\" if not configured.";
    };

    AppUpdateNotificationButtonText = lib.mkOption {
      type = types.nullOr (types.str);
      default = "Update Now 🚀";
      description = "Configures the button text for notifications for App Updates notifications. Defaults to \"Update Now 🚀\" if not configured.";
    };

    Mode = lib.mkOption {
      type = types.nullOr (types.enum [ "Munki" "Intune" "SystemProfiler" ]);
      default = null;
      description = "Configures the app to show application info for either Munki, Intune or to use System profiler for app info. The app tries to dynamically detect which mode to use.";
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
            description = "SF Symbol to show in the Self Service page in the UI.";
          };
          IsPrivileged = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "SF Symbol to show in the Self Service page in the UI.";
          };
          Description = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Description to show in the Self Service page in the UI.";
          };
          ButtonLabel = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Configures the button label for the action.";
          };
        };
      }));
      default = null;
      description = "Configures custom actions to add to the tray menu. See example below.";
    };

    ShowDesktopInfo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Configures the desktop info widget.";
    };

    DesktopInfoWindowPosition = lib.mkOption {
      type = types.nullOr (types.enum [ "UpperLeft" "UpperRight" "LowerLeft" "LowerRight" ]);
      default = "LowerRight";
      description = "Configures the position of the desktop info. Defaults to Lower Right.";
    };

    DesktopInfoLevel = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 3 4 5 ]);
      default = null;
      description = "Configures the level of information to show on the desktop. Defaults to 4.";
    };

    DesktopInfoHideItems = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "HostName" "Model" "SerialNumber" "Processor" "IPAddress" "Memory" "OSBuild" "OSVersion" "LastRestart" "FileVault" "StorageName" "SupportPhone" "SupportEmail" "Hardware Specifications" "System Information" "Network Information" "Storage" "Support" "Category" "Divider" ]));
      default = null;
      description = "Use this array to determine which information to hide. Available items are: HostName, Model, SerialNumber, Processor, IPAddress, Memory, OSBuild, OSVersion, LastRestart, FileVault, StorageName, SupportPhone, SupportEmail. It is also possible to hide entire sections: Hardware Specifications, System Information, Network Information, Storage, Support.";
    };

    DesktopInfoBackgroundOpacity = lib.mkOption {
      type = types.nullOr (types.float);
      default = 1.0;
      description = "Configures the opacity of the desktop info. Defaults to 0%.";
    };

    DesktopInfoBackgroundFrosted = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables a frosted glass look on the desktop info when set to true.";
    };

    DesktopInfoFontSize = lib.mkOption {
      type = types.nullOr (types.int);
      default = 14;
      description = "Configures the font size for the desktop info. Defaults to 14.";
    };

    CustomCardPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures a path to a JSON file containing custom widgets to show on the Home view.";
    };

    EnableElevation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "When set to true allows the user to elevate to admin during a set time frame. Defaults to false.";
    };

    RequireResonForElevation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Requires the user to enter a reason for the elevation. Defaults to false.";
    };

    ReasonMinLength = lib.mkOption {
      type = types.nullOr (types.int);
      default = 10;
      description = "Set a minimum amount of characters the user must enter as the reason. Defaults to 10.";
    };

    MaxElevationTime = lib.mkOption {
      type = types.nullOr (types.int);
      default = 5;
      description = "The amount of time (in minutes) the user is elevated. Defaults to 5.";
    };

    ElevationWebhookUrl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "When configured, sends the entered elevation reason to a webhook instead of saving to disk.";
    };

    ShowElevateTrayCard = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Configure wether to show the elevate button in the tray menu or not. Defaults to false.";
    };

    ElevationSeverity = lib.mkOption {
      type = types.nullOr (types.int);
      default = 6;
      description = "Configure the elevation severity. Defaults to 6 (Informational).";
    };

    MarkdownFilePath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configure a path to a Markdown file to show in the menu.";
    };

    MarkdownMenuLabel = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configure the menu label for the custom Markdown view.";
    };

    MarkdownMenuIcon = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configure the icon for the custom Markdown menu item.";
    };

    CustomCardsMenuLabel = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configure the menu label for the custom cards view.";
    };

    CustomCardsMenuIcon = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configure the icon for the custom cards menu item.";
    };

    RequirePrivilegedActionAuthentication = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Disables the requirement for the user to enter their credentials when running privileged actions via the CLI.";
    };

  };
}