# Auto-generated from ProfileManifests: nl.root3.support.plist
# Domain: nl.root3.support
# Title: SupportApp by Root3
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-nl-root3-support" = {
    enable = lib.mkEnableOption "SupportApp by Root3";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "nl.root3.support";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    Title = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Text shown in the top left corner when the app opens";
    };

    Logo = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to the logo shown in the top right corner when the app opens. Scales to 48 points maximum height";
    };

    LogoDarkMode = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to the logo shown in the top right corner when the app opens for Dark Mode. Scales to 48 points maximum height";
    };

    NotificationIcon = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to the notification icon";
    };

    StatusBarIcon = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to the status bar icon shown in the menu bar. Recommended: PNG, 16x16 points";
    };

    StatusBarIconSFSymbol = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Custom status bar icon using an SF Symbol. Ignored when StatusBarIcon is also set";
    };

    StatusBarIconNotifierEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows a small notification badge in the Status Bar Icon when there is an Apple Software Update available or when the UptimeDaysLimit or PasswordExpiryLimit is reached";
    };

    CustomColor = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "HEX color in RGB format. Example: #8cc63f. Leave empty to use macOS Accent Color";
    };

    CustomColorDarkMode = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "HEX color in RGB format for Dark Mode. Example: #8cc63f. CustomColor is used when CustomColorDarkMode is not specified";
    };

    HideFirstRow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the first row of configurable items.";
    };

    HideSecondRow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the second row of configurable items.";
    };

    ErrorMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Shown when clicking an action results in an error";
    };

    ShowWelcomeScreen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "A welcome screen and feature explanation to show when the app is first opened";
    };

    FooterText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Shown at the bottom as footnote. Supports both text and Emoji. Markdown is supported for macOS Monterey and higher";
    };

    OpenAtLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disabled by default. Launch Support (non-PKG) automatically at login and keep it open (macOS 13 and higher). This setting is ignored if a legacy LaunchAgent is installed/active. Keep disabled if you don't want to open Support at login or use your own LaunchAgent";
    };

    InfoItemOne = lib.mkOption {
      type = types.nullOr (types.enum [ "ComputerName" "MacOSVersion" "Network" "Password" "Storage" "Uptime" "ExtensionA" "ExtensionB" "AppCatalog" ]);
      default = null;
      description = "Info item shown in the upper left corner";
    };

    InfoItemTwo = lib.mkOption {
      type = types.nullOr (types.enum [ "ComputerName" "MacOSVersion" "Network" "Password" "Storage" "Uptime" "ExtensionA" "ExtensionB" "AppCatalog" ]);
      default = null;
      description = "Info item shown in the upper right corner";
    };

    InfoItemThree = lib.mkOption {
      type = types.nullOr (types.enum [ "ComputerName" "MacOSVersion" "Network" "Password" "Storage" "Uptime" "ExtensionA" "ExtensionB" "AppCatalog" ]);
      default = null;
      description = "Info item shown in the second row left";
    };

    InfoItemFour = lib.mkOption {
      type = types.nullOr (types.enum [ "ComputerName" "MacOSVersion" "Network" "Password" "Storage" "Uptime" "ExtensionA" "ExtensionB" "AppCatalog" ]);
      default = null;
      description = "Info item shown in the second row right";
    };

    InfoItemFive = lib.mkOption {
      type = types.nullOr (types.enum [ "ComputerName" "MacOSVersion" "Network" "Password" "Storage" "Uptime" "ExtensionA" "ExtensionB" "AppCatalog" ]);
      default = null;
      description = "Info item shown in the third row left";
    };

    InfoItemSix = lib.mkOption {
      type = types.nullOr (types.enum [ "ComputerName" "MacOSVersion" "Network" "Password" "Storage" "Uptime" "ExtensionA" "ExtensionB" "AppCatalog" ]);
      default = null;
      description = "Info item shown in the third row right";
    };

    UptimeDaysLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Days of uptime after which a notification badge is shown";
    };

    PasswordExpiryLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Days until password expiry after which a notification badge is shown";
    };

    PasswordLabel = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Alternative text label shown in the Password info item";
    };

    StorageLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Percentage of storage after which a notification badge is shown";
    };

    FirstRowTitleLeft = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The text shown in the button label";
    };

    FirstRowSubtitleLeft = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Subtitle text will appear under title when the user hovers over the button. Ignored if left empty.";
    };

    FirstRowTypeLeft = lib.mkOption {
      type = types.nullOr (types.enum [ "App" "URL" "Command" "PrivilegedScript" "DistributedNotification" ]);
      default = null;
      description = "Type of link the item should open. Can be anything like screen sharing tools, company stores, file servers or core applications in your organization. App by default.";
    };

    FirstRowLinkLeft = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Bundle Identifier of the app, link, command or path to script";
    };

    FirstRowSymbolLeft = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The SF Symbol shown in the button";
    };

    FirstRowTitleMiddle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The text shown in the button label";
    };

    FirstRowSubtitleMiddle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Subtitle text will appear under title when the user hovers over the button. Ignored if left empty.";
    };

    FirstRowTypeMiddle = lib.mkOption {
      type = types.nullOr (types.enum [ "App" "URL" "Command" "PrivilegedScript" "DistributedNotification" ]);
      default = null;
      description = "Type of link the item should open. Can be anything like screen sharing tools, company stores, file servers or core applications in your organization. App by default.";
    };

    FirstRowLinkMiddle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Bundle Identifier of the app, link, command or path to script";
    };

    FirstRowSymbolMiddle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The SF Symbol shown in the button";
    };

    FirstRowTitleRight = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The text shown in the button label.";
    };

    FirstRowSubtitleRight = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Subtitle text will appear under title when the user hovers over the button. Ignored if left empty.";
    };

    FirstRowTypeRight = lib.mkOption {
      type = types.nullOr (types.enum [ "App" "URL" "Command" "PrivilegedScript" "DistributedNotification" ]);
      default = null;
      description = "Type of link the item should open. Can be anything like screen sharing tools, company stores, file servers or core applications in your organization. App by default.";
    };

    FirstRowLinkRight = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Bundle Identifier of the app, link, command or path to script";
    };

    FirstRowSymbolRight = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The SF Symbol shown in the button.";
    };

    SecondRowTitleLeft = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The text shown in the button label.";
    };

    SecondRowSubtitleLeft = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Subtitle text will replace the title when the user hovers over the button. Ignored if left empty.";
    };

    SecondRowTypeLeft = lib.mkOption {
      type = types.nullOr (types.enum [ "App" "URL" "Command" "PrivilegedScript" "DistributedNotification" ]);
      default = null;
      description = "Type of link the item should open. Can be anything like screen sharing tools, company stores, file servers or core applications in your organization. URL by default.";
    };

    SecondRowLinkLeft = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Bundle Identifier of the app, link, command or path to script.";
    };

    SecondRowSymbolLeft = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The SF Symbol shown in the button.";
    };

    SecondRowTitleMiddle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The text shown in the button label.";
    };

    SecondRowSubtitleMiddle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Subtitle text will replace the title when the user hovers over the button. Ignored if left empty.";
    };

    SecondRowTypeMiddle = lib.mkOption {
      type = types.nullOr (types.enum [ "App" "URL" "Command" "PrivilegedScript" "DistributedNotification" ]);
      default = null;
      description = "Type of link the item should open. Can be anything like screen sharing tools, company stores, file servers or core applications in your organization. URL by default.";
    };

    SecondRowLinkMiddle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Bundle Identifier of the app, link, command or path to script.";
    };

    SecondRowSymbolMiddle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The SF Symbol shown in the button.";
    };

    SecondRowTitleRight = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The text shown in the button label.";
    };

    SecondRowSubtitleRight = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Subtitle text will replace the title when the user hovers over the button. Ignored if left empty.";
    };

    SecondRowTypeRight = lib.mkOption {
      type = types.nullOr (types.enum [ "App" "URL" "Command" "PrivilegedScript" "DistributedNotification" ]);
      default = null;
      description = "Type of link the item should open. Can be anything like screen sharing tools, company stores, file servers or core applications in your organization. URL by default.";
    };

    SecondRowLinkRight = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Bundle Identifier of the app, link, command or path to script.";
    };

    SecondRowSymbolRight = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The SF Symbol shown in the button.";
    };

    ExtensionTitleA = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The text shown in the Extension.";
    };

    ExtensionSymbolA = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The SF Symbol shown in the Extension.";
    };

    ExtensionTypeA = lib.mkOption {
      type = types.nullOr (types.enum [ "App" "URL" "Command" "PrivilegedScript" "DistributedNotification" ]);
      default = null;
      description = "Type of link the Extension should open.";
    };

    ExtensionLinkA = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Bundle Identifier of the app, link, command or path to script.";
    };

    ExtensionTitleB = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The text shown in the Extension.";
    };

    ExtensionSymbolB = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The SF Symbol shown in the Extension.";
    };

    ExtensionTypeB = lib.mkOption {
      type = types.nullOr (types.enum [ "App" "URL" "Command" "PrivilegedScript" "DistributedNotification" ]);
      default = null;
      description = "Type of link the Extension should open";
    };

    ExtensionLinkB = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Bundle Identifier of the app, link, command or path to script.";
    };

    HideMajorUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Ignore macOS major updates. This will prevent the menu bar icon and the macOS version info item from showing an available major update.";
    };

    UpdateText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Optional text to shown in the macOS Managed Updates popover to tell users about the updates";
    };

    HideFirstRowInfoItems = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hide the first row with Info Items";
    };

    HideSecondRowInfoItems = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hide the second row with Info Items";
    };

    HideThirdRowInfoItems = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hide the third row with Info Items";
    };

    HideFirstRowButtons = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hide the first row with configurable items";
    };

    HideSecondRowButtons = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hide the second row with configurable items";
    };

    PasswordType = lib.mkOption {
      type = types.nullOr (types.enum [ "Apple" "JamfConnect" "KerberosSSO" "Nomad" ]);
      default = null;
      description = "Password expiry information source: Apple (local account or AD), Jamf Connect or Kerberos SSO Extension";
    };

    OnAppearAction = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to script script or command to be executed when the Support App is opened by clicking on the menu bar item.";
    };

    DisablePrivilegedHelperTool = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Option to enable or disable the Privileged Helper Tool. Re-enabling requires the reinstallation of the Support App.";
    };

  };
}