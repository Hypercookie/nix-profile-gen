# Auto-generated from ProfileManifests: com.github.macadmins.SupportCompanion.plist
# Domain: com.github.macadmins.SupportCompanion
# Title: Support Companion
# Platforms: macOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Support Companion";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.github.macadmins.SupportCompanion";
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
        default = [ "PFC_SegmentedControl_0" "KnowledgeBaseUrl" "MenuShowIdentity" "MenuShowApps" "MenuShowSelfService" "MenuShowCompanyPortal" "MenuShowKnowledgeBase" "BrandName" "AccentColor" "BrandLogo" "BrandLogoLight" "SupportPageUrl" "ChangePasswordUrl" "ChangePasswordMode" "SupportEmail" "SupportPhone" "HiddenCards" "HiddenActions" "NotificationInterval" "NotificationTitle" "NotificationImage" "SoftwareUpdateNotificationMessage" "SoftwareUpdateNotificationButtonText" "AppUpdateNotificationMessage" "AppUpdateNotificationButtonText" "RebootReminderDays" "Mode" "RefreshSelfService" "JamfLogPollHours" "LogFolders" "ExcludedLogFolders" "Actions" "ShowLogoInTrayMenu" "TrayMenuBrandingIcon" "TrayMenuShowIcon" "ShowDesktopInfo" "DesktopInfoWindowPosition" "DesktopInfoLevel" "DesktopInfoHideItems" "DesktopInfoBackgroundOpacity" "DesktopInfoBackgroundFrosted" "DesktopInfoFontSize" "CustomCardPath" "DebugLogging" "EnableElevation" "RequireResonForElevation" "ReasonMinLength" "MaxElevationTime" "ElevationWebhookUrl" "ShowElevateTrayCard" "ElevationSeverity" "MarkdownFilePath" "MarkdownMenuLabel" "MarkdownMenuIcon" "CustomCardsMenuLabel" "CustomCardsMenuIcon" "RequirePrivilegedActionAuthentication" "EnforceAdminAllowlist" "PermanentAdmins" "ElevationAllowedAdmins" "EnableUserInstalls" "ShowInstallerServiceMenuItem" "RequireAuthenticationForInstalls" "UserInstallFallback" "SkipHelperInstall" "FleetUrl" "FleetRecommendedApps" "FleetRecommendedTitle" "FleetIconsFromGitHub" "FleetAppOpenMessages" "FleetButtonLabels" "FleetNotifyUpdates" "FleetNotifyInstallResults" "FleetNotifyPolicies" "FleetNotifySignIn" "CompanyPortalUrl" "SoftwareUpdateNotificationCommand" "AppUpdateNotificationCommand" "FileDebugLogging" "AllowedInstallers" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
        default = null;
        description = "Configures whether to show the Identity menu item. Defaults to true";
      };

      MenuShowApps = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Configures whether to show the Apps menu item. Defaults to true";
      };

      MenuShowSelfService = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Configures whether to show the Self Service menu item. Defaults to true";
      };

      MenuShowCompanyPortal = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Configures whether to show the Company Portal menu item. Defaults to true";
      };

      MenuShowKnowledgeBase = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
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
        type = types.nullOr (types.listOf (types.enum [ "DeviceInformation" "Evergreen" "Battery" "Actions" "ApplicationInstallProgress" "Storage" "DeviceManagement" "PendingAppUpdates" "Jamf" "Fleet" "FleetPolicies" ]));
        default = null;
        description = "Configures which cards to hide, available cards are: DeviceInformation, Evergreen, Battery, Actions, ApplicationInstallProgress, Storage, DeviceManagement, PendingAppUpdates, Jamf, Fleet, FleetPolicies.";
      };

      HiddenActions = lib.mkOption {
        type = types.nullOr (types.listOf (types.enum [ "ChangePassword" "Reboot" "OpenManagementApp" "GetSupport" "GatherLogs" "SoftwareUpdates" "RestartIntuneAgent" ]));
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
        default = null;
        description = "Configures the message for notifications for Software Updates notifications. Defaults to \"Software Updates Available. Please update your device to the latest version.\" if not configured.";
      };

      SoftwareUpdateNotificationButtonText = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Configures the button text for notifications for Software Updates notifications. Defaults to \"Update Now 🚀\" if not configured.";
      };

      AppUpdateNotificationMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Configures the message for notifications for App Updates notifications. Defaults to \"App Updates Available. Please update your apps to the latest version.\" if not configured.";
      };

      AppUpdateNotificationButtonText = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Configures the button text for notifications for App Updates notifications. Defaults to \"Update Now 🚀\" if not configured.";
      };

      RebootReminderDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Configures the number of days after which the user will be reminded to reboot. Defaults to 0 days if not configured (no reminder).";
      };

      Mode = lib.mkOption {
        type = types.nullOr (types.enum [ "Munki" "Intune" "Jamf" "Fleet" "SystemProfiler" ]);
        default = null;
        description = "Configures which source the app reads application information from. Detection runs only when this is empty: Fleet is chosen on Macs running Fleet's agent (orbit) when no other mode matches.";
      };

      RefreshSelfService = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Configures whether to refresh the Self Service+ app data in the background when in Jamf mode. Defaults to true";
      };

      JamfLogPollHours = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Configures how often to poll Jamf logs in hours. Only used when in Jamf mode. Defaults to 36 if not configured.";
      };

      LogFolders = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Configures the log folders to gather logs from. Only used when gathering logs. Defaults to \"/Library/Logs/Microsoft\" if not configured.";
      };

      ExcludedLogFolders = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Configures the log folders to exclude when gathering logs. Only used when gathering logs.";
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
        description = "Configures custom actions to add to the tray menu. Actions defined in the user's own preferences still run, but IsPrivileged is honored only when the action comes from a configuration profile. From 3.0 the app sends only the action's name and the helper looks the command up itself, so a privileged action must be defined in a profile to run at all.";
      };

      ShowLogoInTrayMenu = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Configures whether to show the branding logo in the tray menu. Defaults to true.";
      };

      TrayMenuBrandingIcon = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Configures the icon to show in the tray menu. Specify a Base64 string.";
      };

      TrayMenuShowIcon = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Configures whether to show the tray menu icon. Useful if you only want to show desktop information for example. Defaults to true.";
      };

      ShowDesktopInfo = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Configures the desktop info widget.";
      };

      DesktopInfoWindowPosition = lib.mkOption {
        type = types.nullOr (types.enum [ "UpperLeft" "UpperRight" "LowerLeft" "LowerRight" ]);
        default = null;
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
        default = null;
        description = "Configures the opacity of the desktop info. Defaults to 0%.";
      };

      DesktopInfoBackgroundFrosted = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enables a frosted glass look on the desktop info when set to true.";
      };

      DesktopInfoFontSize = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Configures the font size for the desktop info. Defaults to 14.";
      };

      CustomCardPath = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Configures a path to a JSON file containing custom widgets to show on the Home view.";
      };

      DebugLogging = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Configures whether debug logging is enabled. Defaults to false.";
      };

      EnableElevation = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When set to true allows the user to elevate to admin during a set time frame. Defaults to false. From 3.0 this is only honored when it comes from a configuration profile.";
      };

      RequireResonForElevation = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Requires the user to enter a reason for the elevation. Defaults to false. From 3.0 this is only honored when it comes from a configuration profile.";
      };

      ReasonMinLength = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Set a minimum amount of characters the user must enter as the reason. Defaults to 10. From 3.0 this is only honored when it comes from a configuration profile.";
      };

      MaxElevationTime = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The amount of time (in minutes) the user is elevated. Defaults to 5. From 3.0 this is only honored when it comes from a configuration profile.";
      };

      ElevationWebhookUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "When configured, sends the entered elevation reason to a webhook instead of saving to disk. From 3.0 this is only honored when it comes from a configuration profile.";
      };

      ShowElevateTrayCard = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Configure wether to show the elevate button in the tray menu or not. Defaults to false.";
      };

      ElevationSeverity = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Configure the elevation severity. Defaults to 6 (Informational). From 3.0 this is only honored when it comes from a configuration profile.";
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
        default = null;
        description = "Requires the user to authenticate before a privileged action runs. From 3.0 this defaults to true unless an administrator sets it, and is honored only from a configuration profile.";
      };

      EnforceAdminAllowlist = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true, the helper reconciles the admin group at startup and every five minutes: any account holding administrator rights that is neither listed in PermanentAdmins nor inside a live elevation window is demoted. Set PermanentAdmins before enabling this, or those accounts are demoted within five minutes. Defaults to false. Must be delivered in a device-scoped configuration profile; it is ignored anywhere else.";
      };

      PermanentAdmins = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Accounts that may hold administrator rights permanently when EnforceAdminAllowlist is enabled. List every such account: management accounts, break-glass accounts, permanently administrative staff, and anything granted rights by another system such as Platform SSO's AdministratorGroups. An explicitly empty array is honored and means no account is a permanent administrator; a missing list is refused with an error rather than acted on. root is always permitted. Must be delivered in a device-scoped configuration profile; it is ignored anywhere else.";
      };

      ElevationAllowedAdmins = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Accounts the elevation watchdog ignores, for management accounts an MDM may legitimately add while somebody is elevated. Defaults to an empty list. Must be delivered in a device-scoped configuration profile; it is ignored anywhere else.";
      };

      EnableUserInstalls = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true, a standard user can install a .pkg or .dmg listed in AllowedInstallers without holding administrator rights. Both the app and the helper read this: the app decides whether to stage a file at all, the helper decides whether to install it. Defaults to false. Read only from a configuration profile, device-scoped or scoped to the user being served.";
      };

      ShowInstallerServiceMenuItem = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Whether Finder's context menu offers \"Install with Support Companion\". Follows EnableUserInstalls unless set explicitly; set it to false to keep user installs but route everyone through the in-app catalog. Applied on every launch.";
      };

      RequireAuthenticationForInstalls = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Whether the user authenticates before a user install proceeds. They authenticate as themselves, not as an administrator. Turning this off means an unlocked unattended Mac is enough to install an allowlisted item. Defaults to true.";
      };

      UserInstallFallback = lib.mkOption {
        type = types.nullOr (types.enum [ "installer" "elevate" "none" ]);
        default = null;
        description = "What to offer when an installer is not on the allowlist. \"installer\" opens it in Apple's Installer, \"elevate\" offers the normal time-limited elevation instead, \"none\" offers nothing. Defaults to \"installer\".";
      };

      SkipHelperInstall = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true, the package does not install or load its own copy of the privileged helper, and removes any it finds. Set this only where the helper is deployed declaratively with com.apple.configuration.services.background-tasks, otherwise two daemons claim the same Mach service. Defaults to false. Must be delivered in a device-scoped configuration profile; it is ignored anywhere else.";
      };

      FleetUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Overrides the Fleet server URL otherwise discovered from fleetd or orbit. Read only from a configuration profile, because the device's token is sent to whatever server this names.";
      };

      FleetRecommendedApps = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Fleet software keys pinned to the top of the self-service catalog, whether or not they are already installed.";
      };

      FleetRecommendedTitle = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Renames the recommended section of the Fleet catalog.";
      };

      FleetIconsFromGitHub = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Whether to fetch application icons from Fleet's public catalog on GitHub. Defaults to true.";
      };

      FleetAppOpenMessages = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Replaces the built-in wording shown when an install is waiting for the user to quit the application first.";
      };

      FleetButtonLabels = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            Title = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Software title, or an action name nested under one.";
            };
          };
        });
        default = null;
        description = "Custom button text in the Fleet catalog, keyed by software title and optionally nested by action.";
      };

      FleetNotifyUpdates = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Notify when Fleet reports available application updates. Defaults to true.";
      };

      FleetNotifyInstallResults = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Notify when a Fleet install, update or uninstall finishes. Defaults to true.";
      };

      FleetNotifyPolicies = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Notify when Fleet policies are failing on the Mac. Defaults to true.";
      };

      FleetNotifySignIn = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Remind the user to sign in to Fleet Desktop SSO while signed out, at most once a day. Defaults to false, unlike the other Fleet notifications.";
      };

      CompanyPortalUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Overrides the Company Portal URL, for sovereign cloud endpoints such as GCC High.";
      };

      SoftwareUpdateNotificationCommand = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Command run when the software update notification's button is clicked. Defaults to opening the Software Update pane.";
      };

      AppUpdateNotificationCommand = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Command run when the application update notification's button is clicked. Set at every launch to open the management application for the detected mode; a value forced by profile still wins.";
      };

      FileDebugLogging = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Write debug logging to disk as well as to the unified log. Defaults to false.";
      };

      AllowedInstallers = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            Name = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Display name for this entry. Required.";
            };
            SHA256 = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "64 hex characters. When present the entry is strict: it pins one exact build and stops matching as soon as the vendor ships an update.";
            };
            TeamID = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The signing team. Required whenever SHA256 is absent.";
            };
            LeafCertificateSHA256 = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Pins the signing certificate itself. Stricter than TeamID, and needs updating when the vendor renews.";
            };
            PackageIdentifier = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "Package identifiers this entry allows, for a .pkg. A distribution package needs every component listed. A single string is also accepted.";
            };
            BundleIdentifier = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "Bundle identifiers this entry allows, for the application inside a .dmg. A single string is also accepted.";
            };
            AllowAnyIdentifier = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Accept anything the named team signs. This is a vendor allowlist rather than an application allowlist. Defaults to false.";
            };
            MinimumVersion = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Refuse builds older than this, so a signed but vulnerable version cannot be installed instead.";
            };
            RequireNotarized = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Require the installer to be notarized. Defaults to true.";
            };
            AllowScripts = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Whether the package may carry install scripts. A scriptless package landing in /Applications is a file copy; one with a postinstall is arbitrary root code on every future build the vendor signs. Defaults to false.";
            };
            AllowedPayloadPrefixes = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "Absolute path prefixes this installer may write to. Unrestricted when unset, though some destinations always need naming explicitly.";
            };
            AllowUnrestrictedPayload = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Lets this installer write anywhere, including the destinations that otherwise always need naming. Its own key, so the most dangerous setting has to be meant. Defaults to false.";
            };
          };
        }));
        default = null;
        description = "Installers a standard user may install without administrator rights when EnableUserInstalls is true. The helper re-reads this and re-derives the installer's facts before it acts, so the confirmation sheet the user sees is presentation only. Entries that cannot decide anything are dropped and logged. Read only from a configuration profile, device-scoped or scoped to the user being served.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-github-macadmins-SupportCompanion" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Support Companion (com.github.macadmins.SupportCompanion) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}