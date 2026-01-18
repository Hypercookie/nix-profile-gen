# Auto-generated from ProfileManifests: net.glencode.Particulars.plist
# Domain: net.glencode.Particulars
# Title: Particulars
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-net-glencode-Particulars" = {
    enable = lib.mkEnableOption "Particulars";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "net.glencode.Particulars";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    labMode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Lab Mode eases the deployment of Particulars in a computer lab or other mass deployment. See the documentation for more information.";
    };

    showOnDesktop = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "The default mode of Particulars is to present system information on the desktop. This can be disabled, usually in favor of showing Particulars in the menu bar.";
    };

    showMenuBarExtra = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Adds an item to the macOS menu bar that allows quick access to system information. Secondary-clicking on the menu bar item shows a menu with settings, copying, and other functions.";
    };

    detailLevel = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Adjust detail level options. See documentation URL for instructions.";
    };

    preferredDisplay = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Sets the display (or monitor) on which Particulars will show desktop system information. If the display is later unavailable, Particulars will default back to the primary display. The value is an integer, taking 2 for the 2nd display, for example.";
    };

    desktopPosition = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 4 5 6 7 8 ]);
      default = 6;
      description = "Sets the relative position of desktop system information.";
    };

    desktopMargin = lib.mkOption {
      type = types.nullOr (types.int);
      default = 21;
      description = "When displaying system information on the desktop, Particulars uses all available screen size, inset by a default margin of 21pt. Margins can be adjusted.";
    };

    desktopTopMargin = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Overrides desktopMargin for the top desktop margin";
    };

    desktopBottomMargin = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Overrides desktopMargin for the bottom desktop margin";
    };

    desktopLeftMargin = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Overrides desktopMargin for the left desktop margin";
    };

    desktopRightMargin = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Overrides desktopMargin for the right desktop margin";
    };

    textTheme = lib.mkOption {
      type = types.nullOr (types.enum [ 1 0 2 255 ]);
      default = 1;
      description = "Sets the theme of desktop system information. Each theme has a corresponding number.";
    };

    lightDarkText = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = 1;
      description = "Particulars has 3 options for the shade of the desktop system information: automatic, light text, or dark text. The automatic setting scans the current desktop picture to determine what setting to use. If battery life or performance is a concern, use light or dark.";
    };

    textSize = lib.mkOption {
      type = types.nullOr (types.int);
      default = 18;
      description = "Sets the preferred text size for the desktop system information in points. The default is 18. Values between 12 and 24 are typical. (Value may be scaled down to fit.)";
    };

    dropShadow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Determines whether the desktop system information has a drop shadow behind it.";
    };

    labelCase = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = 1;
      description = "Sets the letter case of the labels. Each case option has a corresponding number.";
    };

    menuBarWidgetAppearance = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 4 ]);
      default = 0;
      description = "Sets the appearance of the menu bar widget.";
    };

    menuBarWidgetTextSize = lib.mkOption {
      type = types.nullOr (types.int);
      default = 12;
      description = "Sets the preferred text size in the menu bar widget in points. The default is 12. Values below 9 and above 24 are ignored. (Value may be scaled down to fit.)";
    };

    detachableMenuBarWidget = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allows the menu bar widget to be drug away from the menu bar and appear in a floating window.";
    };

    menuBarIcon = lib.mkOption {
      type = types.nullOr (types.str);
      default = "classic";
      description = "Specifies an alternative menu bar icon. Valid values are: classic, quatrefoil, quatrefoil.fill, and any valid SF Symbol.";
    };

    allNetworkInterfaces = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "When enabled in the detail level, Particulars displays information about the primary active network interface. This setting expands that to include information about all active network interfaces.";
    };

    dhcpLeaseRemaining = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "In the default network information, Particulars shows the DHCP server address and the length of the DHCP lease. This setting adds the remaining lease time.";
    };

    macAddressFormat = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 ]);
      default = 1;
      description = "By default, MAC (Media Access Control) addresses are formatted with colon separators and in lowercase. Use this setting to select another MAC address format.";
    };

    networkDetailLevel = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "By default, all network information is displayed except the Wi-Fi SSID. It is possible to construct a custom set of network information. Use this preference to create a custom network detail level. See documentation URL for instructions.";
    };

    networkNotifications = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "When enabled, Particulars will post system notifications when it detects a change in the primary IPv4 address or the public IP address. Notifications are also governed by settings in the Notifications pane of System Settings.";
    };

    subnetMaskCIDRNotation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "This setting displays subnet masks in the short CIDR (Classless Inter-domain Routing) notation. For example, 255.255.254.0 will show as /23.";
    };

    explicitNoNetworkConfiguration = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Displays an error message if no active network interfaces are found (assuming network is enabled in 'detailLevel').";
    };

    appStoreVersionCheck = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Particulars checks for new Particulars versions in the Mac App Store. This check can be disabled.";
    };

    coreCount = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Adds a count of CPU cores to the CPU particular. Changing this setting requires a restart of the application to take effect.";
    };

    dateFormat = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "This modifies the format of the date and time for the Boot Time particular. Follows a Unicode standard https://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns";
    };

    disableCrashManager = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Organizations can disable all reporting of crashes to the developer by setting this to true using Managed Preferences.";
    };

    diskFreeSpace = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = 0;
      description = "Free/available disk space can be displayed in multiple ways. See documentation URL for options.";
    };

    diskFreeSpaceNonBootVolumes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "By default, Particulars only shows disk space for the boot disk. Enable this setting to show disk space for other disks.";
    };

    firstRunDone = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "On first run, Particulars displays a welcome window that describes how it runs on the desktop and then hides all other apps and opens the settings window. To skip this first run experience, enable this setting. (Enabling labMode implies this setting.)";
    };

    headerText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Header text is displayed in a separate paragraph above all particulars. Any leading or trailing whitespace is removed when displayed.";
    };

    footerText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Footer text is displayed in a separate paragraph below all particulars. Any leading or trailing whitespace is removed when displayed.";
    };

    hideDockIcon = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enabling this setting removes Particulars from the macOS Dock. Changing this setting while Particulars is running will automatically restart Particulars and open the Settings window.";
    };

    ignoreHiding = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "When Particulars is running with the Dock icon shown, it will be hidden along with all other apps when you select Hide Others from another application's menu. This preference allows you to keep Particulars visible.";
    };

    operatingSystemVersionName = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "This setting adds the operating system version's marketing name (e.g., Big Sur, Catalina, etc) to the Operating System particular.";
    };

  };
}