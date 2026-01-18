# Auto-generated from ProfileManifests: com.microsoft.Edge.plist
# Domain: com.microsoft.Edge
# Title: Microsoft Edge
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-Edge" = {
    enable = lib.mkEnableOption "Microsoft Edge";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.microsoft.Edge";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    DefaultCookiesSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 4 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to set local data. Setting local data can be either allowed for all websites or denied for all websites.";
    };

    BlockThirdPartyCookies = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enabling this setting prevents cookies from being set by web page elements that are not from the domain that is in the browser's address bar.";
    };

    CookiesAllowedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are allowed to set cookies.";
    };

    CookiesBlockedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are not allowed to set cookies.";
    };

    CookiesSessionOnlyForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Cookies set by pages matching these URL patterns will be limited to the current session, i.e. they will be deleted when the browser exits.";
    };

    DefaultImagesSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to display images. Displaying images can be either allowed for all websites or denied for all websites.";
    };

    DefaultInsecureContentSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 2 3 ]);
      default = null;
      description = "Control use of insecure content exceptions";
    };

    InsecureContentAllowedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of URLs to allow insecure content";
    };

    InsecureContentBlockedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of URLs to block insecure content";
    };

    DefaultJavaScriptSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to run JavaScript. Running JavaScript can be either allowed for all websites or denied for all websites.";
    };

    DefaultPluginsSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 3 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to automatically run the Flash plugin. Automatically running the Flash plugin can be either allowed for all websites or denied for all websites.";
    };

    DefaultPopupsSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to show pop-ups. Showing popups can be either allowed for all websites or denied for all websites.";
    };

    DefaultWebBluetoothGuardSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 2 3 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to get access to nearby Bluetooth devices. Access can be completely blocked, or the user can be asked every time a website wants to get access to nearby Bluetooth devices.";
    };

    DefaultWebUsbGuardSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 2 3 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to get access to connected USB devices. Access can be completely blocked, or the user can be asked every time a website wants to get access to connected USB devices.";
    };

    ImagesAllowedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are allowed to display images.";
    };

    ImagesBlockedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are not allowed to display images.";
    };

    JavaScriptAllowedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are allowed to run JavaScript.";
    };

    JavaScriptBlockedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are not allowed to run JavaScript.";
    };

    LegacySameSiteCookieBehaviorEnabled = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Enable default legacy SameSite cookie behavior setting";
    };

    LegacySameSiteCookieBehaviorEnabledForDomainList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Revert to legacy SameSite behavior for cookies on specified sites";
    };

    PluginsAllowedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are allowed to run the Flash plugin.";
    };

    PluginsBlockedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are not allowed to run the Flash plugin.";
    };

    DefaultThirdPartyStoragePartitioningSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Third-party storage partitioning is on by default for some users starting with Microsoft Edge version 115, but it can be disabled with edge://flags.\n\nIf this policy is configured to \"AllowPartitioning\" or not configured, third-party storage partitioning can be enabled.\n\nIf this policy is set to \"BlockPartitioning\", third-party storage partitioning can't be enabled.";
    };

    ThirdPartyStoragePartitioningBlockedForOrigins = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Lets you set a list of url patterns that specify top-level origins (the url in the tab's address bar) that block third-party (cross-origin iframe) storage partitioning.\n\nIf this policy isn't set or a top-level origin doesn't match, then the value from DefaultThirdPartyStoragePartitioningSetting will be used.";
    };

    PopupsAllowedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are allowed to open popups.";
    };

    PopupsBlockedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are not allowed to open popups.";
    };

    AutoSelectCertificateForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to specify a list of url patterns that specify sites for which Google Chrome should automatically select a client certificate, if the site requests a certificate.";
    };

    DefaultGeolocationSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 3 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to track the users' physical location. Tracking the users' physical location can be allowed by default, denied by default or the user can be asked every time a website requests the physical location.";
    };

    RegisteredProtocolHandlers = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          default = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          protocol = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
          url = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
        };
      }));
      default = null;
      description = "Allows you to register a list of protocol handlers. This can only be a recommended policy. The property |protocol| should be set to the scheme such as 'mailto' and the property |url| should be set to the URL pattern of the application that handles the scheme. The pattern can include a '%s', which if present will be replaced by the handled URL.";
    };

    WebUsbAllowDevicesForUrls = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          urls = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "URLs";
          };
          devices = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                product_id = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Product ID";
                };
                vendor_id = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Vendor ID";
                };
              };
            });
            default = null;
            description = "Devices";
          };
        };
      });
      default = null;
      description = "Allows you to set a list of urls that specify which sites will automatically be granted permission to access a USB device with the given vendor and product IDs.";
    };

    AutoplayAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows you to control if videos can play automatically (without user consent) with audio content in Google Chrome.";
    };

    BackgroundModeEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Continue running background apps after Microsoft Edge closes.";
    };

    BackgroundTemplateListUpdatesEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you enable this setting or the setting is unconfigured, the list of available templates will be downloaded in the background from a Microsoft service every 24 hours.";
    };

    BingAdsSuppression = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Block all ads on Bing search results.";
    };

    DefaultNotificationsSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 3 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to display desktop notifications. Displaying desktop notifications can be allowed by default, denied by default or the user can be asked every time a website wants to show desktop notifications.";
    };

    NotificationsAllowedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to create a list of url patterns to specify sites that are allowed to display notifications.";
    };

    NotificationsBlockedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to create a list of url patterns to specify sites that are not allowed to display notifications.";
    };

    DefaultSearchProviderEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables the use of a default search provider.";
    };

    DefaultSearchProviderEncodings = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Specifies the character encodings supported by the search provider. Encodings are code page names like UTF-8, GB2312, and ISO-8859-1. They are tried in the order provided.";
    };

    DefaultSearchProviderImageURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies the URL of the search engine used to provide image search. Search requests will be sent using the GET method. If the DefaultSearchProviderImageURLPostParams policy is set then image search requests will use the POST method instead.";
    };

    DefaultSearchProviderImageURLPostParams = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies the parameters used when doing image search with POST. It consists of comma-separated name/value pairs. If a value is a template parameter, like {imageThumbnail} in above example, it will be replaced with real image thumbnail data.";
    };

    DefaultSearchProviderKeyword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies the keyword, which is the shortcut used in the omnibox to trigger the search for this provider.";
    };

    DefaultSearchProviderName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies the name of the default search provider. If left empty or not set, the host name specified by the search URL will be used.";
    };

    DefaultSearchProviderSearchURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies the URL of the search engine used when doing a default search. The URL should contain the string '{searchTerms}', which will be replaced at query time by the terms the user is searching for.";
    };

    DefaultSearchProviderSuggestURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies the URL of the search engine used to provide search suggestions. The URL should contain the string '{searchTerms}', which will be replaced at query time by the text the user has entered so far.";
    };

    BlockExternalExtensions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls the installation of external extensions.";
    };

    ExtensionAllowedTypes = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "extension" "hosted_app" "legacy_packaged_app" "platform_app" "theme" "user_script" ]));
      default = null;
      description = "Controls which app/extension types are allowed to be installed and limits runtime access.";
    };

    ExtensionInstallSources = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to specify which URLs are allowed to install extensions, apps, and themes.";
    };

    ExtensionInstallBlocklist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to specify which extensions the users can NOT install. Extensions already installed will be disabled if denied, without a way for the user to enable them. Once an extension is disabled due to the denylist being removed, it will automatically get re-enabled.";
    };

    ExtensionInstallAllowlist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to specify which extensions are not subject to the denylist.";
    };

    ExtensionInstallForcelist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Specifies a list of apps and extensions that are installed silently, without user interaction, and which cannot be uninstalled nor disabled by the user. All permissions requested by the apps/extensions are granted implicitly, without user interaction, including any additional permissions requested by future versions of the app/extension. Furthermore, permissions are granted for the enterprise.deviceAttributes and enterprise.platformKeys extension APIs. (These two APIs are not available to apps/extensions that are not force-installed.)";
    };

    ExtensionSettings = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          __key__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
          __value__ = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                installation_mode = lib.mkOption {
                  type = types.nullOr (types.enum [ "allowed" "blocked" "force_installed" "normal_installed" ]);
                  default = null;
                  description = "Maps to a string indicating the installation mode for the extension.";
                };
                update_url = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Maps to a string indicating where Chrome can download a force_installed or normal_installed extension.";
                };
                blocked_permissions = lib.mkOption {
                  type = types.nullOr (types.listOf (types.enum [ "activeTab" "alarms" "background" "bookmarks" "browsingData" "certificateProvider" "clipboardRead" "clipboardWrite" "contentSettings" "contextMenus" "cookies" "debugger" "declarativeContent" "declarativeNetRequest" "declarativeWebRequest" "desktopCapture" "displaySource" "dns" "documentScan" "downloads" "enterprise.deviceAttributes" "enterprise.hardwarePlatform" "enterprise.platformKeys" "experimental" "fileBrowserHandler" "fileSystemProvider" "fontSettings" "gcm" "geolocation" "history" "identity" "idle" "idltest" "management" "nativeMessaging" "networking.config" "notifications" "pageCapture" "platformKeys" "power" "printerProvider" "privacy" "processes" "proxy" "sessions" "signedInDevices" "storage" "system.cpu" "system.display" "system.memory" "system.storage" "tabCapture" "tabs" "topSites" "tts" "ttsEngine" "unlimitedStorage" "vpnProvider" "wallpaper" "webNavigation" "webRequest" "webRequestBlocking" ]));
                  default = null;
                  description = "Maps to a list of strings indicating the blocked API permissions for the extension.";
                };
                minimum_version_required = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Maps to a version string.";
                };
                install_sources = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Each item in this list is an extension-style match pattern.";
                };
                allowed_types = lib.mkOption {
                  type = types.nullOr (types.listOf (types.enum [ "extension" "theme" "user_script" "hosted_app" "legacy_packaged_app" "platform_app" ]));
                  default = null;
                  description = "This setting sets the allowed types of extension/apps that can be installed in Google Chrome.";
                };
                blocked_install_message = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "This maps to a string specifying the error message to display to users if they're blocked from installing an extension.";
                };
                runtime_blocked_hosts = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Maps to a list of strings representing hosts whose webpages the extension will be blocked from modifying.";
                };
                runtime_allowed_hosts = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Maps to a list of strings representing hosts that an extension can interact with regardless of whether they are listed in \"runtime_blocked_hosts\".";
                };
              };
            });
            default = null;
          };
        };
      });
      default = null;
      description = "Configures extension management settings for Google Chrome. A default configuration can be set for the special ID \"*\"";
    };

    EnableMediaRouter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If this policy is set to true or is not set, Google Cast will be enabled, and users will be able to launch it from the app menu, page context menus, media controls on Cast-enabled websites, and (if shown) the Cast toolbar icon.";
    };

    ShowCastIconInToolbar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If this policy is set to true, the Cast toolbar icon will always be shown on the toolbar or the overflow menu, and users will not be able to remove it.";
    };

    AllowCrossOriginAuthPrompt = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls whether third-party sub-content on a page is allowed to pop-up an HTTP Basic Auth dialog box.";
    };

    AuthNegotiateDelegateAllowlist = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Servers that Microsoft Edge may delegate to.";
    };

    AuthSchemes = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies which HTTP authentication schemes are supported by Microsoft Edge. Possible values are 'basic', 'digest', 'ntlm' and 'negotiate'. Separate multiple values with commas.";
    };

    AuthServerAllowlist = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies which servers should be allowed for integrated authentication. Integrated authentication is only enabled when Microsoft Edge receives an authentication challenge from a proxy or from a server which is in this permitted list.";
    };

    DisableAuthNegotiateCnameLookup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Specifies whether the generated Kerberos SPN is based on the canonical DNS name or the original name entered.";
    };

    EnableAuthNegotiatePort = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Specifies whether the generated Kerberos SPN should include a non-standard port.";
    };

    NtlmV2Enabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you don't configure this policy, NTLMv2 is enabled by default.";
    };

    AdsSettingForIntrusiveAdsSites = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Allows you to set whether ads should be blocked on sites with intrusive ads.";
    };

    AllowDeletingBrowserHistory = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables deleting browser history and download history in Microsoft Edge and prevents users from changing this setting.";
    };

    AllowFileSelectionDialogs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows access to local files on the machine by allowing Microsoft Edge to display file selection dialogs.";
    };

    AllowPopupsDuringPageUnload = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy allows an admin to specify that a page may show popups during its unloading.";
    };

    AllowSurfGame = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables or disables the built-in surf game. Game accessible via edge://surf.";
    };

    AllowSyncXHRInPageDismissal = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy lets you specify that a page can send synchronous XHR requests during page dismissal.";
    };

    AllowTrackingForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configure the list of URL patterns that are excluded from tracking prevention.";
    };

    AlternateErrorPagesEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables the use of alternate error pages that are built into Microsoft Edge (such as 'page not found') and prevents users from changing this setting.";
    };

    AlwaysOpenPdfExternally = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables the internal PDF viewer in Microsoft Edge. Instead it treats it as download and allows the user to open PDF files with the default application.";
    };

    AppCacheForceEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows the AppCache feature to be re-enabled, even if it's turned off by default";
    };

    ApplicationLocaleValue = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Set application locale";
    };

    AudioCaptureAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled or not configured (default), the user will be prompted for audio capture access except for URLs configured in the AudioCaptureAllowedUrls list which will be granted access without prompting.";
    };

    AudioCaptureAllowedUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Patterns in this list will be matched against the security\norigin of the requesting URL.  If a match is found, access to audio\ncapture devices will be granted without prompt.";
    };

    AutoImportAtFirstRun = lib.mkOption {
      type = types.nullOr (types.enum [ 0 2 3 4 ]);
      default = null;
      description = "If you enable this policy, Microsoft Edge automatically imports all supported datatypes and settings from either the default browser or another specified browser. This also forces Microsoft Edge to skip the import section of the first-run experience.";
    };

    AutoOpenAllowedForURLs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "URLs where AutoOpenFileTypes can apply. If you set URLs in this policy, files will only automatically open by policy if the URL is part of this set and the file type is listed in AutoOpenFileTypes. If either condition is false, the download won't automatically open by policy.";
    };

    AutoOpenFileTypes = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of file types that should be automatically opened on download. Note: The leading separator should not be included when listing the file type, so list \"txt\" instead of \".txt\".";
    };

    AutofillAddressEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables Microsoft Edge's AutoFill feature and allows users to auto complete address information in web forms using previously stored information.";
    };

    AutofillCreditCardEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables Microsoft Edge's AutoFill feature and allows users to auto complete credit card information in web forms using previously stored information.";
    };

    FavoritesBarEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you enable this setting, Microsoft Edge will show a bookmark bar.";
    };

    BrowserAddProfileEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable profile creation from the Identity flyout menu or the Settings page";
    };

    BrowserGuestModeEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable the option to allow the use of guest profiles in Microsoft Edge. In a guest profile, the browser doesn't import browsing data from existing profiles, and it deletes browsing data when all guest profiles are closed.";
    };

    BrowserNetworkTimeQueriesEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If set to false, prevents Microsoft Edge from occasionally sending queries to a browser network time service to retrieve an accurate timestamp.";
    };

    BrowserSignin = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Specify whether a user can sign into Microsoft Edge with their account and use account-related services like sync and single sign on.";
    };

    BuiltinCertificateVerifierEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines whether the built-in certificate verifier will be used to verify server certificates.";
    };

    BuiltInDnsClientEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls whether to use the built-in DNS client.";
    };

    DnsOverHttpsMode = lib.mkOption {
      type = types.nullOr (types.enum [ "off" "automatic" "secure" ]);
      default = null;
      description = "Controls the mode of DNS-over-HTTPS";
    };

    DnsOverHttpsTemplates = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specify URI template of desired DNS-over-HTTPS resolver. To specify multiple DNS-over-HTTPS resolvers, separate the corresponding URI templates with spaces.";
    };

    CertificateTransparencyEnforcementDisabledForCas = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Disables enforcing Certificate Transparency requirements for a list of subjectPublicKeyInfo hashes.";
    };

    CertificateTransparencyEnforcementDisabledForLegacyCas = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Disables enforcing Certificate Transparency requirements for a list of Legacy Certificate Authorities.";
    };

    CertificateTransparencyEnforcementDisabledForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Disables enforcing Certificate Transparency requirements to the listed URLs. Form your URL pattern according to https://go.microsoft.com/fwlink/?linkid=2095322";
    };

    ClearBrowsingDataOnExit = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you enable this policy, all browsing data is deleted each time Microsoft Edge closes.";
    };

    ClearCachedImagesAndFilesOnExit = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Clear cached images and files when Microsoft Edge closes.";
    };

    CollectionsServicesAndExportsBlockList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Block user access to a specified list of services and export targets in Collections. This includes displaying additional data from Bing and exporting collections to Microsoft products or external partners.";
    };

    CommandLineFlagSecurityWarningsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If disabled, prevents security warnings from appearing when Edge is launched with some potentially dangerous command-line flags.";
    };

    ComponentUpdatesEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables component updates for all components in Microsoft Edge when not set or set to True.";
    };

    ConfigureDoNotTrack = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Specify whether to send Do Not Track requests to websites that ask for tracking info.";
    };

    ConfigureOnlineTextToSpeech = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you enable or don't configure this policy, web-based applications that use the SpeechSynthesis API can use Online Text to Speech voice fonts.";
    };

    CustomHelpLink = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specify a link for the Help menu or the F1 key.";
    };

    DNSInterceptionChecksEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy configures a local switch that can be used to disable DNS interception checks. These checks attempt to discover whether the browser is behind a proxy that redirects unknown host names.";
    };

    DefaultBrowserSettingEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Configures the default browser checks in Microsoft Edge and prevents users from changing them. If set to true, Edge will always checks on startup whether it is the default browser and automatically registers itself, if possible.";
    };

    DefaultSearchProviderContextMenuAccessAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow default search provider context menu search access";
    };

    DeveloperToolsAvailability = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Allows you to control where Developer Tools can be used.";
    };

    DiagnosticData = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Send required and optional diagnostic data about browser usage. 'RequiredData' sends required diagnostic data but turns off optional diagnostic data collection. Microsoft Edge will send required diagnostic data to keep Microsoft Edge secure, up to date and performing as expected. 'OptionalData' sends optional diagnostic data includes data about browser usage, websites that are visited, crash reports sent to Microsoft for product and service improvement.";
    };

    Disable3DAPIs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enabling this setting prevents web pages from accessing the graphics processing unit (GPU). Specifically, web pages can not access the WebGL API and plugins can not use the Pepper 3D API.";
    };

    DisableScreenshots = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, screenshots cannot be taken using keyboard shortcuts or extension APIs.";
    };

    DiskCacheDir = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the directory that Microsoft Edge will use for storing cached files on the disk. See https://www.chromium.org/administrators/policy-list-3/user-data-directory-variables for a list of variables that can be used. To avoid data loss or other unexpected errors this policy should not be set to a volume's root directory or to a directory used for other purposes, because Edge manages its contents";
    };

    DiskCacheSize = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Configures the cache size that Microsoft Edge will use for storing cached files on the disk. The value specified in this policy is not a hard boundary but rather a suggestion to the caching system, any value below a few megabytes is too small and will be rounded up to a sane minimum. If the value of this policy is 0, the default cache size will be used but the user will not be able to change it.";
    };

    DownloadDirectory = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the directory that Microsoft Edge will use for downloading files. If you set this policy, Edge will use the provided directory regardless whether the user has specified one or enabled the flag to be prompted for download location every time. If this policy is left not set the default download directory will be used and the user will be able to change it.\n\nSee https://go.microsoft.com/fwlink/?linkid=2095041 for a list of variables that can be used.";
    };

    DownloadRestrictions = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 ]);
      default = null;
      description = "Configures the type of downloads that Microsoft Edge will completely block, without letting users override the security decision.";
    };

    EdgeCollectionsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Lets you allow users to access the Collections feature, where they can collect, organize, share, and export content more efficiently and with Office integration.";
    };

    EditFavoritesEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you enable this setting, favorites can be added, removed or modified. This is the default also when this policy is not set.";
    };

    EnableDeprecatedWebPlatformFeatures = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "ExampleDeprecatedFeature_EffectiveUntil20080902 - Enable ExampleDeprecatedFeature API through 2008/09/02\nSpecify a list of deprecated web platform features to re-enable temporarily.";
    };

    EnableDomainActionsDownload = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you enable this policy, the list of Domain Actions will continue to be downloaded from the Experimentation and Configuration Service.";
    };

    EnableOnlineRevocationChecks = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "In light of the fact that soft-fail, online revocation checks provide no effective security benefit, they are disabled by default in Google Chrome version 19 and later. By setting this policy to true, the previous behavior is restored and online OCSP/CRL checks will be performed.";
    };

    EnableSha1ForLocalAnchors = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow certificates signed using SHA-1 when issued by local trust anchors (deprecated).";
    };

    EnterpriseHardwarePlatformAPIEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When this policy is set to enabled, extensions installed by enterprise policy are allowed to use the Enterprise Hardware Platform API.";
    };

    ExperimentationAndConfigurationServiceControl = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Control communication with the Experimentation and Configuration Service";
    };

    ExternalProtocolDialogShowAlwaysOpenCheckbox = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you set to True, when an external protocol confirmation prompt is shown, the user can select \"Always open\". The user won't get any future confirmation prompts for this protocol.";
    };

    ForceEphemeralProfiles = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If set to enabled this policy forces the profile to be switched to ephemeral mode. If this policy is specified as an OS policy (e.g. GPO on Windows) it will apply to every profile on the system; if the policy is set as a Cloud policy it will apply only to a profile signed in with a managed account.";
    };

    ForceBingSafeSearch = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Forces queries in Google Web Search to be done with SafeSearch set to active and prevents users from changing this setting.";
    };

    ForceCertificatePromptsOnMultipleMatches = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Configure whether Microsoft Edge should automatically select a certificate when there are multiple certificate matches for a site configured with \"AutoSelectCertificateForUrls\" (https://docs.microsoft.com/en-us/deployedge/microsoft-edge-policies#autoselectcertificateforurls).";
    };

    ForceGoogleSafeSearch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Forces queries in Google Web Search to be done with SafeSearch set to active and prevents users from changing this setting.";
    };

    ForceLegacyDefaultReferrerPolicy = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use a default referrer policy of no-referrer-when-downgrade.";
    };

    ForceYouTubeRestrict = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Enforces a minimum Restricted Mode on YouTube and prevents users from picking a less restricted mode.";
    };

    FullscreenAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow full screen mode";
    };

    GoToIntranetSiteForSingleWordEntryInAddressBar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you enable this policy, the top auto-suggest result in the address bar suggestion list will navigate to intranet sites if the text entered in the address bar is a single word without punctuation.";
    };

    HSTSPolicyBypassList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Hostnames specified in this list will be exempt from the HSTS policy check that could potentially upgrade requests from \"http://\" to \"https://\". Only single-label hostnames are allowed in this policy.";
    };

    HardwareAccelerationModeEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If this policy is set to true or left unset, hardware acceleration will be enabled unless a certain GPU feature is on the denylist.";
    };

    HideFirstRunExperience = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you enable this policy, the First-run experience and the splash screen will not be shown to users when they run Microsoft Edge for the first time.";
    };

    HubsSidebarEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show the Sidebar launcher bar.";
    };

    ImportAutofillFormData = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy forces the autofill form data to be imported from the previous default browser if enabled. If enabled, this policy also affects the import dialog.";
    };

    ImportBrowserSettings = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows users to import browser settings from another browser into Microsoft Edge.";
    };

    ImportCookies = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow importing of cookies.";
    };

    ImportExtensions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow importing of extensions.";
    };

    ImportFavorites = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy forces bookmarks to be imported from the current default browser if enabled. If enabled, this policy also affects the import dialog.";
    };

    ImportHistory = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy forces the browsing history to be imported from the current default browser if enabled. If enabled, this policy also affects the import dialog.";
    };

    ImportHomepage = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy forces the home page to be imported from the current default browser if enabled.";
    };

    ImportOpenTabs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows users to import open and pinned tabs from another browser into Microsoft Edge.";
    };

    ImportPaymentInfo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows users to import payment info from another browser into Microsoft Edge.";
    };

    ImportSavedPasswords = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy forces the saved passwords to be imported from the previous default browser if enabled. If enabled, this policy also affects the import dialog.";
    };

    ImportSearchEngine = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy forces search engines to be imported from the current default browser if enabled. If enabled, this policy also affects the import dialog.";
    };

    ImportShortcuts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow importing of shortcuts.";
    };

    InPrivateModeAvailability = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Specifies whether the user may open pages in Private mode in Microsoft Edge.";
    };

    IsolateOrigins = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specify origins to run in isolation, in their own process. This policy also isolates origins named by subdomains - for example, specifying https://contoso.com/ will cause https://foo.contoso.com/ to be isolated as part of the https://contoso.com/ site. If the policy is enabled, each of the named origins in a comma-separated list will run in its own process. If you disable this policy, then both the 'IsolateOrigins' and 'SitePerProcess' features are disabled. Users can still enable 'IsolateOrigins' policy manually, via command line flags. If you don't configure the policy, the user can change this setting.";
    };

    ManagedFavorites = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Name of the favorite.";
          };
          url = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "URL for the favorite.";
          };
        };
      }));
      default = null;
      description = "Configures a list of managed bookmarks.";
    };

    ManagedSearchEngines = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          is_default = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Default?";
          };
          name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
          keyword = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
          search_url = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
          suggest_url = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
          image_search_url = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
          encoding = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
        };
      }));
      default = null;
      description = "Manage Search Engines";
    };

    NewTabPageSearchBox = lib.mkOption {
      type = types.nullOr (types.enum [ "bing" "redirect" ]);
      default = null;
      description = "Configure the new tab page search box experience. You can configure the new tab page search box to use \"Search box (Recommended)\" or \"Address bar\" to search on new tabs.";
    };

    MaxConnectionsPerProxy = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Specifies the maximal number of simultaneous connections to the proxy server.";
    };

    MediaRouterCastAllowAllIPs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If this policy is set to true, Google Cast will connect to Cast devices on all IP addresses, not just RFC1918/RFC4913 private addresses.";
    };

    MetricsReportingEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables anonymous reporting of usage and crash-related data about Microsoft Edge to Microsoft and prevents users from changing this setting.";
    };

    MicrosoftEdgeInsiderPromotionEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows content promoting the Microsoft Edge Insider channels on the About Microsoft Edge settings page.";
    };

    OmniboxMSBProviderEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables the display of relevant MSB suggestions in omnibox when user types a search string in the addressbar";
    };

    PaymentMethodQueryEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows you to set whether websites can check if the user has payment methods saved.";
    };

    PersonalizationReportingEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy prevents Microsoft from collecting a user's Microsoft Edge browsing history to be used for personalizing advertising, search, news and other Microsoft services.";
    };

    ProactiveAuthEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Lets you configure whether to turn on Proactive Authentication.";
    };

    NetworkPredictionOptions = lib.mkOption {
      type = types.nullOr (types.enum [ 0 2 ]);
      default = null;
      description = "Enables network prediction and prevents users from changing this setting. This controls DNS prefetching, TCP and SSL preconnection, and prerendering of web pages.";
    };

    OverrideSecurityRestrictionsOnInsecureOrigin = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The policy specifies a list of origins (URLs) or hostname patterns (such as \"*.example.com\") to be treated as secure contexts. The intent is to allow organizations to set up a staging server for internal web development, so that their developers can test out features requiring secure contexts without having to deploy TLS on the staging server.\n\nSetting a list of URLs in this policy has the same effect as setting the command-line flag '--unsafely-treat-insecure-origin-as-secure' to a comma-separated list of the same URLs. If the policy is set, it will override the command-line flag.\n\nFor more information on secure contexts, see https://www.w3.org/TR/secure-contexts/";
    };

    PolicyRefreshRate = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Refresh rate for user policy. Specifies the period in milliseconds at which the device management service is queried for user policy information. Setting this policy overrides the default value of 3 hours. Valid values for this policy are in the range from 1800000 (30 minutes) to 86400000 (1 day).";
    };

    PromotionalTabsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows you to control the presentation of full-tab promotional and/or educational content in Microsoft Edge.";
    };

    PromptForDownloadLocation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If the policy is enabled, the user will be asked where to save each file before downloading.\nIf the policy is disabled, downloads will start immediately, and the user will not be asked where to save the file.\nIf the policy is not configured, the user will be able to change this setting.";
    };

    ProxySettings = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          ProxyMode = lib.mkOption {
            type = types.nullOr (types.enum [ "direct" "system" "auto_detect" "fixed_servers" "pac_script" ]);
            default = null;
            description = "Specifies the proxy server Microsoft Edge uses and prevents users from changing proxy settings. Microsoft Edge ignores all proxy-related options specified from the command line.";
          };
          ProxyServer = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Specifies the URL of the proxy server";
          };
          ProxyBypassList = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Defines a comma-separated list of hosts for which Microsoft Edge bypasses any proxy.";
          };
          ProxyPacUrl = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Specifies the URL for a proxy auto-config (PAC) file.";
          };
          ProxyPacMandatory = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Prevents the network stack from falling back to direct connections with invalid or unavailable PAC script.";
          };
        };
      });
      default = null;
      description = "Configures the proxy settings for Google Chrome. These proxy settings will be available for ARC-apps too.\n\nIf you enable this setting, Google Chrome and ARC-apps ignore all proxy-related options specified from the command line.";
    };

    QuicAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "QUIC is a transport layer network protocol that can improve performance of web applications that currently use TCP.";
    };

    RelaunchNotification = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Notify users that Microsoft Edge must be relaunched to apply a pending update.";
    };

    RelaunchNotificationPeriod = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Allows you to set the time period, in milliseconds, over which users are notified that Microsoft Edge must be relaunched to apply a pending update.";
    };

    ResolveNavigationErrorsUseWebService = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow Microsoft Edge to issue a dataless connection to a web service to probe networks for connectivity in cases like hotel and airport Wi-Fi.";
    };

    RestrictSigninToPattern = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Determines which accounts can be set as browser primary accounts in Microsoft Edge (the account that is chosen during the Sync opt-in flow)";
    };

    RunAllFlashInAllowMode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you enable this setting, all Flash content embedded on websites that have been set to allow Flash in content settings -- either by the user or by enterprise policy -- will be run, including content from other origins or small content.";
    };

    SSLErrorOverrideAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Edge shows a warning page when users navigate to sites that have SSL errors. By default or when this policy is set to true, users are allowed to click through these warning pages.\nSetting this policy to false disallows users to click through any warning page.";
    };

    SSLVersionMin = lib.mkOption {
      type = types.nullOr (types.enum [ "tls1" "tls1.1" "tls1.2" ]);
      default = null;
      description = "If this policy is not configured then Microsoft Edge uses a default minimum version which is TLS 1.0.";
    };

    SaveCookiesOnExit = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Save cookies when Microsoft Edge closes. When this policy is enabled, the specified set of cookies is exempt from deletion when the browser closes.";
    };

    SavingBrowserHistoryDisabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables saving browser history in Microsft Edge and prevents users from changing this setting.";
    };

    SearchSuggestEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables search suggestions in Microsoft Edge's omnibox and prevents users from changing this setting.";
    };

    SecurityKeyPermitAttestation = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Specifies URLs and domains for which no prompt will be shown when attestation certificates from Security Keys are requested. Additionally, a signal will be sent to the Security Key indicating that individual attestation may be used. Without this, users will be prompted in Chrome 65+ when sites request attestation of Security Keys.";
    };

    SendSiteInfoToImproveServices = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy enables sending info about websites visited in Microsoft Edge to Microsoft to improve services like search.";
    };

    ShowOfficeShortcutInFavoritesBar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Specifies whether to include a shortcut to Office.com in the favorites bar. For users signed into Microsoft Edge the shortcut takes users to their Microsoft Office apps and docs.";
    };

    SignedHTTPExchangeEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable support for Signed HTTP Exchange (SXG).";
    };

    SitePerProcess = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "You might want to look at the IsolateOrigins policy setting to get the best of both worlds, isolation and limited impact for users, by using IsolateOrigins with a list of the sites you want to isolate. This setting, SitePerProcess, isolates all sites. If the policy is enabled, each site will run in its own process. If the policy is disabled, no explicit Site Isolation will happen and field trials of IsolateOrigins and SitePerProcess will be disabled. Users will still be able to enable SitePerProcess manually. If the policy is not configured, the user will be able to change this setting. On Google Chrome OS, it is recommended to also set the DeviceLoginScreenSitePerProcess device policy to the same value. If the values specified by the two policies don't match, a delay may be incurred when entering a user session while the value specified by user policy is being applied.";
    };

    SpellcheckEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If this policy is not set or enabled, the user is allowed to use spellcheck.";
    };

    StricterMixedContentTreatmentEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable stricter treatment for mixed content.";
    };

    SuppressUnsupportedOSWarning = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Suppresses the warning that appears when Microsoft Edge is running on a computer or operating system that is no longer supported.";
    };

    SyncDisabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables data synchronization in Google Chrome using Google-hosted synchronization services and prevents users from changing this setting.";
    };

    SyncTypesListDisabled = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "addressesAndMore" "collections" "extensions" "favorites" "passwords" "settings" ]));
      default = null;
      description = "Configure the list of types that are excluded from synchronization.";
    };

    TLS13HardeningForLocalAnchorsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable a TLS 1.3 security feature for local trust anchors";
    };

    TLSCipherSuiteDenyList = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "0x1303" "0xcca9" "0xcca8" ]));
      default = null;
      description = "Specify the TLS cipher suites to disable. If you don't configure this policy, the browser will choose which TLS cipher suites to use. This policy does not affect QUIC-based connections.";
    };

    TabFreezingEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls whether Microsoft Edge can freeze tabs that are in the background for at least 5 minutes.";
    };

    TaskManagerEndProcessEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If set to false, the 'End process' button is disabled in the Task Manager.";
    };

    TotalMemoryLimitMb = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Configures the amount of memory that a single Microsoft Edge instance can use before tabs start getting discarded to save memory. The memory used by the tab will be freed and the tab will have to be reloaded when switched to.";
    };

    TrackingPrevention = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 ]);
      default = null;
      description = "Block tracking of users' web-browsing activity";
    };

    TyposquattingCheckerEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables the integrated Typosquatting Checker on Microsoft Edge.";
    };

    TranslateEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables the integrated Microsoft translation service on Microsoft Edge.";
    };

    URLBlocklist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Define a list of sites, based on URL patterns, that are blocked (your users can't load them). Format the URL pattern according to https://go.microsoft.com/fwlink/?linkid=2095322.";
    };

    UserAgentClientHintsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable the User-Agent Client Hints feature.";
    };

    URLAllowlist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allow access to the listed URLs, as exceptions to the URL denylist. Format the URL pattern according to https://go.microsoft.com/fwlink/?linkid=2095322.";
    };

    UserFeedbackAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow user feedback. If the policy is set to false, users can not send feedback to Microsoft.";
    };

    UserDataDir = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the directory that Microsoft Edge will use for storing user data. See https://go.microsoft.com/fwlink/?linkid=2095041 for a list of variables that can be used.";
    };

    VideoCaptureAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled or not configured (default), the user will be prompted for\nvideo capture access except for URLs configured in the VideoCaptureAllowedUrls list which will be granted access without prompting.";
    };

    VideoCaptureAllowedUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Patterns in this list will be matched against the security\norigin of the requesting URL.  If a match is found, access to audio\ncapture devices will be granted without prompt.";
    };

    WPADQuickCheckEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows you to turn off WPAD (Web Proxy Auto-Discovery) optimization in Microsoft Edge";
    };

    WebAppInstallForceList = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          url = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "URL";
          };
          create_desktop_shortcut = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Create Desktop Shortcut";
          };
          default_launch_container = lib.mkOption {
            type = types.nullOr (types.enum [ "window" "tab" ]);
            default = null;
            description = "Default Launch Container";
          };
          fallback_app_name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Fallback App Name";
          };
          custom_name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Custom Name";
          };
          custom_icon = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                hash = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Custom Icon Hash";
                };
                url = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Custom Icon URL";
                };
              };
            });
            default = null;
            description = "Custom Icon";
          };
          install_as_shortcut = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Install as Shortcut";
          };
        };
      }));
      default = null;
      description = "Specifies a list of websites that are installed silently, without user interaction, and which cannot be uninstalled nor disabled by the user.";
    };

    WebComponentsV0Enabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Re-enable Web Components v0 API until M84.";
    };

    WebDriverOverridesIncompatiblePolicies = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy allows users of the WebDriver feature to override policies which can interfere with its operation. This policy is deprecated. It is currently supported but will become obsolete in a future release.";
    };

    WebRtcLocalIpsAllowedUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Manage exposure of local IP addressess by WebRTC";
    };

    WebRtcLocalhostIpHandling = lib.mkOption {
      type = types.nullOr (types.enum [ "default" "default_public_and_private_interfaces" "default_public_interface_only" "disable_non_proxied_udp" ]);
      default = null;
      description = "Manage exposure of local IP addressess by WebRTC";
    };

    WebRtcUdpPortRange = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If the policy is set, the UDP port range used by WebRTC is restricted to the specified port interval (endpoints included).";
    };

    NativeMessagingBlocklist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to specify which native messaging hosts that should not be loaded. A denylist value of '*' means all native messaging hosts are on the denylist unless they are explicitly listed in the allowlist.";
    };

    NativeMessagingUserLevelHosts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables user-level installation of Native Messaging hosts.";
    };

    NativeMessagingAllowlist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to specify which native messaging hosts are not subject to the denylist. A denylist value of * means all native messaging hosts are on the denylist and only native messaging hosts listed in the allowlist will be loaded.";
    };

    PasswordManagerEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If this setting is enabled, users can have Microsoft Edge memorize passwords and provide them automatically the next time they log in to a site.";
    };

    PasswordMonitorAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow Microsoft Edge to monitor user passwords.";
    };

    DefaultPrinterSelection = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Overrides Microsoft Edge default printer selection rules.";
    };

    PrintHeaderFooter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Force 'headers and footers' to be on or off in the printing dialog.";
    };

    PrintingEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables printing in Microsoft Edge and prevents users from changing this setting.";
    };

    UseSystemPrintDialog = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you enable this policy, Microsoft Edge opens the system print dialog instead of the built-in print preview when a user prints a page.";
    };

    PrintPreviewUseSystemDefaultPrinter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Causes Microsoft Edge to use the system default printer as the default choice in Print Preview instead of the most recently used printer.";
    };

    ProxyBypassList = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Microsoft Edge will bypass any proxy for the list of hosts given here.";
    };

    ProxyMode = lib.mkOption {
      type = types.nullOr (types.enum [ "direct" "auto_detect" "pac_script" "fixed_servers" "system" ]);
      default = null;
      description = "Allows you to specify the proxy server used by Microsoft Edge and prevents users from changing proxy settings.";
    };

    ProxyPacUrl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "You can specify a URL to a proxy .pac file here.";
    };

    ProxyServer = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "You can specify the URL of the proxy server here.";
    };

    SmartScreenEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Configure Microsoft Defender SmartScreen";
    };

    PreventSmartScreenPromptOverride = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Lets you decide whether users can override the Microsoft Defender SmartScreen warnings about potentially malicious websites.";
    };

    PreventSmartScreenPromptOverrideForFiles = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Lets you determine whether users can override Microsoft Defender SmartScreen warnings about unverified downloads.";
    };

    SmartScreenAllowListDomains = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configure the list of domains for which Microsoft Defender SmartScreen won't trigger warnings.";
    };

    SmartScreenForTrustedDownloadsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Force Microsoft Defender SmartScreen checks on downloads from trusted sources";
    };

    SmartScreenPuaEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Configure Microsoft Defender SmartScreen to block potentially unwanted apps";
    };

    PasswordProtectionChangePasswordURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configure the change password URL (HTTP and HTTPS schemes only). Password protection service will send users to this URL to change their password after seeing a warning in the browser.";
    };

    PasswordProtectionLoginURLs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configure the list of enterprise login URLs (HTTP and HTTPS schemes only) where Microsoft Edge should capture the salted hashes of passwords and use it for password reuse detection.";
    };

    PasswordProtectionWarningTrigger = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Allows you to control the triggering of passwore protection warning. Password protection alerts users when they reuse their protected password on potentially suspicious sites.";
    };

    HomepageIsNewTabPage = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Configures the type of the default home page in Microsoft Edge and prevents users from changing home page preferences. The home page can either be set to a URL you specify or set to the New Tab Page.";
    };

    HomepageLocation = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the default home page URL in Microsoft Edge and prevents users from changing it.";
    };

    NewTabPageAllowedBackgroundTypes = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 ]);
      default = null;
      description = "Configures the background types allowed for the new tab page layout.";
    };

    NewTabPageCompanyLogo = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          default_logo = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                hash = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                };
                url = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                };
              };
            });
            default = null;
            description = "Default Logo";
          };
          light_logo = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                hash = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                };
                url = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                };
              };
            });
            default = null;
            description = "Light Logo";
          };
        };
      }));
      default = null;
      description = "Set new tab page company logo. The logo must be in PNG or SVG format, and its file size must not exceed 16 MB. For help with determining the SHA-256 hash, see https://docs.microsoft.com/powershell/module/microsoft.powershell.utility/get-filehash.";
    };

    NewTabPageContentEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow Microsoft News content on the new tab page in Microsoft Edge.";
    };

    NewTabPageHideDefaultTopSites = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the default top sites from the new tab page in Microsoft Edge.";
    };

    NewTabPageLocation = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the default New Tab page URL and prevents users from changing it.";
    };

    NewTabPageManagedQuickLinks = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          url = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "URL";
          };
          title = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Title";
          };
          pinned = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Pinned";
          };
        };
      }));
      default = null;
      description = "Set new tab page managed quick links";
    };

    NewTabPageSetFeedType = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 ]);
      default = null;
      description = "Configure the Microsoft Edge new tab page experience";
    };

    RestoreOnStartup = lib.mkOption {
      type = types.nullOr (types.enum [ 5 1 4 6 ]);
      default = null;
      description = "Allows you to specify the behavior on startup.";
    };

    RestoreOnStartupURLs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "If 'Open a list of URLs' is selected as the startup action, this allows you to specify the list of URLs that are opened. If left not set no URL will be opened on start up.";
    };

    ShowHomeButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows the Home button on Microsoft Edge's toolbar.";
    };

    WebUsbAskForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are allowed to ask the user to grant them access to a USB device.";
    };

    WebUsbBlockedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are prevented from asking the user to grant them access to a USB device.";
    };

    AutoLaunchProtocolsFromOrigins = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          allowed_origins = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "A list of allowed origin patterns for the specified protocol.";
          };
          protocol = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Protocol";
          };
        };
      }));
      default = null;
      description = "Define a list of protocols that can launch an external application from listed origins without prompting the user. If this policy is set, a protocol will only be permitted to launch an external application without prompting by policy if the protocol is listed, and the origin of the site trying to launch the protocol matches one of the origin patterns in that protocol's allowed_origins list.";
    };

    AutoLaunchProtocolsComponentEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Specifies whether the AutoLaunch Protocols component should be enabled.\nThis component allows Microsoft to provide a list similar to that of the AutoLaunchProtocolsFromOrigins policy, allowing certain external protocols to launch without prompt or blocking certain protocols (on specified origins). By default, this component is enabled.";
    };

    LocalNetworkAccessRestrictionsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "A policy to control whether users are prompted to allow sites to ask for Local Network Access.";
    };

    LocalNetworkAccessAllowedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "A policy to automatically grant specific sites Local Network Access.";
    };

    LocalNetworkAccessBlockedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "A policy to automatically deny specific sites Local Network Access.";
    };

  };
}