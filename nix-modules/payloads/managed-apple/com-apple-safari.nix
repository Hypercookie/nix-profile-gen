# Auto-generated from ProfileManifests: com.apple.safari.plist
# Domain: com.apple.Safari
# Title: Safari
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-safari" = {
    enable = lib.mkEnableOption "Safari";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.Safari";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    DidShowWhatsNewInSafari = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If enabled, hides any What's New with Safari prompts.";
    };

    HomePage = lib.mkOption {
      type = types.nullOr (types.str);
      default = "http://www.apple.com/startpage/";
      description = "Homepage URL.";
    };

    NewWindowBehavior = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 ]);
      default = 0;
      description = "Policy for new window contents.";
    };

    NewTabBehavior = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 ]);
      default = 0;
      description = "Policy for new tab contents.";
    };

    TabCreationPolicy = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = 0;
      description = "Policy for when to create a tab instead of a window.";
    };

    CommandClickMakesTabs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Open command-clicked links in a new tab rather than a new window.";
    };

    OpenNewTabsInFront = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Select a tab when it is created.";
    };

    HistoryAgeInDaysLimit = lib.mkOption {
      type = types.nullOr (types.enum [ 1 7 14 31 365 365000 ]);
      default = 31;
      description = "Policy for when to automatically remove items from History.";
    };

    DownloadsPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = "~/Downloads/";
      description = "File system path (can start with ~) where downloaded files will be saved.";
    };

    DownloadsClearingPolicy = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = 0;
      description = "Policy for when to remove items from the Downloads window.";
    };

    AutoOpenSafeDownloads = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Automatically open downloaded files that are of certain well-known safe types.";
    };

    ShowOverlayStatusBar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Controls whether mousing over a link displays the full URL that the link will follow";
    };

    ShowFullURLInSmartSearchField = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Full URL Path is Shown in Search Bar";
    };

    WarnAboutFraudulentWebsites = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Alert the user that the site they are visiting is known to be malicious";
    };

    WebKitPreferences_privateClickMeasurementEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Manage advertising settings";
    };

    WebKitPreferences_storageBlockingPolicy = lib.mkOption {
      type = types.nullOr (types.enum [ 1 ]);
      default = null;
      description = "Manage cross-site tracking and resistance from data brokers";
    };

    WebKitStorageBlockingPolicy = lib.mkOption {
      type = types.nullOr (types.enum [ 1 ]);
      default = null;
      description = "Manage cross-site tracking and resistance from data brokers";
    };

    ConfirmClosingMultiplePages = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Display a confirmation alert when multiple pages are closed at once.";
    };

    DefaultBrowserPromptingState2 = lib.mkOption {
      type = types.nullOr (types.enum [ 1 ]);
      default = null;
      description = "When Safari is quit for the first time, if it detects it is not configured as the default browser it will present a prompt to the user to choose whether to keep the current default browser or change it to Safari. Enable this preference to suppress this prompt.";
    };

    DefaultBrowserPromptingState3 = lib.mkOption {
      type = types.nullOr (types.enum [ 2 ]);
      default = null;
      description = "Suppresses the \"Make Safari your Default Browser?\" banner when Safari is launched and is not already set as the default browser.";
    };

    BookmarksMenuIncludesBookmarksToolbar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Include the Bookmarks Bar bookmarks in the bookmarks menu.";
    };

    BookmarksMenuIncludesAddressBook = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Include the Contacts bookmarks in the bookmarks menu.";
    };

    BookmarksMenuIncludesRendezvous = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Include the Bonjour bookmarks in the bookmarks menu.";
    };

    BookmarksCollectionsIncludeAddressBook = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Include the Contacts bookmarks in the Collections column of the bookmarks view.";
    };

    BookmarksCollectionsIncludeRendezvous = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Include the Bonjour bookmarks in the Collections column of the bookmarks view.";
    };

    AutoFillFromAddressBook = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Autofill web forms using info from Contacts.";
    };

    AutoFillPasswords = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Autofill user names and passwords in web forms.";
    };

    AutoFillCreditCardData = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Autofill credit cards in web forms.";
    };

    AutoFillMiscellaneousForms = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Autofill web forms using previously-typed text.";
    };

    com_apple_Safari_ContentPageGroupIdentifier_WebKit2PluginsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
    };

    com_apple_Safari_ContentPageGroupIdentifier_WebKit2JavaEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
    };

    com_apple_Safari_ContentPageGroupIdentifier_WebKit2JavaScriptEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
    };

    com_apple_Safari_ContentPageGroupIdentifier_WebKit2JavaScriptCanOpenWindowsAutomatically = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
    };

    AskBeforeSubmittingInsecureForms = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Display a confirmation alert when an insecure form is submitted from a secure site";
    };

    com_apple_Safari_ContentPageGroupIdentifier_WebKit2PrivateBrowsingEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent Safari from keeping track of most user activities.";
    };

    BlockStoragePolicy = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 ]);
      default = 2;
      description = "Policy for blocking cookies and other website data.";
    };

    SendDoNotTrackHTTPHeader = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Send \"Do Not Track\" HTTP Header";
    };

    com_apple_Safari_ContentPageGroupIdentifier_WebKit2LoadsImagesAutomatically = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Load and display images when a webpage is loaded.";
    };

    com_apple_Safari_ContentPageGroupIdentifier_WebKit2TabsToLinks = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Highlight links and form controls as you press the Tab key.";
    };

    IncludeDevelopMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Include the Develop menu in the menu bar.";
    };

    com_apple_Safari_ContentPageGroupIdentifier_WebKit2DefaultTextEncodingName = lib.mkOption {
      type = types.nullOr (types.str);
      default = "ISO-8859-1";
      description = "The name of the text encoding to use for webpages that don't specify a text encoding. See http://www.iana.org/assignments/character-sets";
    };

    com_apple_Safari_ContentPageGroupIdentifier_WebKit2MinimumFontSize = lib.mkOption {
      type = types.nullOr (types.int);
      default = 9;
      description = "Minimum font size used for any webpage text.";
    };

    com_apple_Safari_ContentPageGroupIdentifier_WebKit2StandardFontFamily = lib.mkOption {
      type = types.nullOr (types.str);
      default = "Times";
      description = "The font family used when a webpage does not specify a font.";
    };

    com_apple_Safari_ContentPageGroupIdentifier_WebKit2DefaultFontSize = lib.mkOption {
      type = types.nullOr (types.int);
      default = 16;
      description = "The font size used when a webpage does not specify a font size.";
    };

    com_apple_Safari_ContentPageGroupIdentifier_WebKit2FixedFontFamily = lib.mkOption {
      type = types.nullOr (types.str);
      default = "Courier";
      description = "The font family used when a webpage specifies a fixed-width font.";
    };

    ExtensionsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allow extensions from the App Store to be enabled/disabled. This will only apply after Safari's first launch unless the \"Disable Extensions Immediately\" key is also set";
    };

    DidDisableIndividualExtensionsAfterRemovingOnOffSwitchIfNecessary = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Necessary for extensions to be disabled from first launch";
    };

    CanPromptForPushNotifications = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allow websites to request permission to send notifications";
    };

    com_apple_Safari_ContentPageGroupIdentifier_WebKit2DefaultFixedFontSize = lib.mkOption {
      type = types.nullOr (types.int);
      default = 13;
      description = "The font size used when a webpage specifies a fixed-width font.";
    };

    DefaultDatabaseQuota = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1048576 5242880 10485760 52428800 104857600 524288000 ]);
      default = 5242880;
      description = "Default space reserved for database storage.";
    };

    com_apple_Safari_ContentPageGroupIdentifier_WebKit2ShouldPrintBackgrounds = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Print background images and colors.";
    };

    PrintHeadersAndFooters = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Print the URL, date, page title, and page number in headers and footers.";
    };

  };
}