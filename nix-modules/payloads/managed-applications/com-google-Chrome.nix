# Auto-generated from ProfileManifests: com.google.Chrome.plist
# Domain: com.google.Chrome
# Title: Google Chrome
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-google-Chrome" = {
    enable = lib.mkEnableOption "Google Chrome";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.google.Chrome";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    CloudReportingEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables Google Chrome cloud reporting. When this policy is left unset or set to False, there is no data collected or uploaded. When this policy is set to True, the data is collected and uploaded to Google Admin console.";
    };

    CloudExtensionRequestEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables Google Chrome extension installation requests. When the policy CloudReportingEnabled is left unset or set to disabled, this policy will be ignored, extension installation requests are not created or uploaded. When this policy is left unset or set to disabled, extension installation requests are not created or uploaded. When this policy is set to enabled, extension installation requests are created and uploaded to Google Admin console.";
    };

    ReportSafeBrowsingData = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Report Safe Browsing information.";
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

    DefaultImagesSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to display images. Displaying images can be either allowed for all websites or denied for all websites.";
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

    DefaultInsecureContentSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 2 3 ]);
      default = null;
      description = "Control use of insecure content exceptions. Allows you to set whether users can add exceptions to allow mixed content for specific sites. If this policy is left not set, users will be allowed to add exceptions to allow blockable mixed content and disable autoupgrades for optionally blockable mixed content.";
    };

    InsecureContentAllowedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are allowed to display blockable (i.e. active) mixed content (i.e. HTTP content on HTTPS sites) and for which optionally blockable mixed content upgrades will be disabled.";
    };

    InsecureContentBlockedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are not allowed to display blockable (i.e. active) mixed content (i.e. HTTP content on HTTPS sites), and for which optionally blockable (i.e. passive) mixed content will be upgraded.";
    };

    DefaultJavaScriptSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to run JavaScript. Running JavaScript can be either allowed for all websites or denied for all websites.";
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
      description = "Allows you to revert all cookies to legacy SameSite behavior.";
    };

    LegacySameSiteCookieBehaviorEnabledForDomainList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Cookies set for domains matching these patterns will revert to legacy SameSite behavior. For cookies on domains not covered by the patterns specified here, or for all cookies if this policy is not set, the global default value will be used either from the LegacySameSiteCookieBehaviorEnabled policy, if it is set, or the user's personal configuration otherwise.";
    };

    DefaultPluginsSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 3 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to automatically run the Flash plugin. Automatically running the Flash plugin can be either allowed for all websites or denied for all websites.";
    };

    PluginsAllowedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are allowed to run the Flash plugin.";
    };

    DefaultThirdPartyStoragePartitioningSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Third-party storage partitioning is on by default for some users as of M113, but can be disabled via Chrome flag. If this policy is set to AllowPartitioning or unset, third-party storage partitioning may be enabled. If this policy is set to BlockPartitioning, third-party storage partitioning cannot be enabled.";
    };

    ThirdPartyStoragePartitioningBlockedForOrigins = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify top-level (the url in the tab's address bar) origins which block third-party storage partitioning (partitioning of cross-origin iframe storage). If this policy is left not set or a top-level origin doesn't match then the value from DefaultThirdPartyStoragePartitioningSetting will be used.";
    };

    DefaultNotificationsSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 3 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to display desktop notifications. Displaying desktop notifications can be allowed by default, denied by default or the user can be asked every time a website wants to show desktop notifications.";
    };

    NotificationsAllowedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are allowed to display notifications.";
    };

    NotificationsBlockedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are not allowed to display notifications.";
    };

    PluginsBlockedForUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to set a list of url patterns that specify sites which are not allowed to run the Flash plugin.";
    };

    DefaultPopupsSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to show pop-ups. Showing popups can be either allowed for all websites or denied for all websites.";
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

    DefaultMediaStreamSetting = lib.mkOption {
      type = types.nullOr (types.enum [ 2 3 ]);
      default = null;
      description = "Allows you to set whether websites are allowed to get access to media capture devices. Access to media capture devices can be allowed by default, or the user can be asked every time a website wants to get access to media capture devices. - Documentation doesn't indicate when this was deprecated, but AudioCaptureAllowed was added in M25, so making an assumption.";
    };

    RegisteredProtocolHandlers = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          default = lib.mkOption {
            type = types.nullOr (types.bool);
            default = true;
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
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          urls = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "URLs";
          };
          devices = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                product_id = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                };
                vendor_id = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                };
              };
            }));
            default = null;
            description = "Devices";
          };
        };
      }));
      default = null;
      description = "Allows you to set a list of urls that specify which sites will automatically be granted permission to access a USB device with the given vendor and product IDs.";
    };

    AutoplayAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows you to control if videos can play automatically (without user consent) with audio content in Google Chrome.";
    };

    AutoplayWhitelist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Controls the whitelist of URL patterns that autoplay will always be enabled on.";
    };

    AutoplayAllowlist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Controls the allow list of URL patterns that autoplay will always be enabled on.";
    };

    DefaultSearchProviderAlternateURLs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Specifies a list of alternate URLs that can be used to extract search terms from the search engine. The URLs should contain the string '{searchTerms}', which will be used to extract the search terms.";
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

    DefaultSearchProviderIconURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies the favorite icon URL of the default search provider.";
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

    DefaultSearchProviderNewTabURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies the URL that a search engine uses to provide a new tab page.";
    };

    DefaultSearchProviderSearchURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies the URL of the search engine used when doing a default search. The URL should contain the string '{searchTerms}', which will be replaced at query time by the terms the user is searching for.";
    };

    DefaultSearchProviderSearchURLPostParams = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies the parameters used when searching a URL with POST. It consists of comma-separated name/value pairs. If a value is a template parameter, like {searchTerms} in above example, it will be replaced with real search terms data.";
    };

    DefaultSearchProviderSuggestURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies the URL of the search engine used to provide search suggestions. The URL should contain the string '{searchTerms}', which will be replaced at query time by the text the user has entered so far.";
    };

    DefaultSearchProviderSuggestURLPostParams = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies the parameters used when doing suggestion search with POST. It consists of comma-separated name/value pairs. If a value is a template parameter, like {searchTerms} in above example, it will be replaced with real search terms data.";
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

    ExtensionInstallBlacklist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to specify which extensions the users can NOT install. Extensions already installed will be disabled if denied, without a way for the user to enable them. Once an extension is disabled due to the blacklist being removed, it will automatically get re-enabled. Enter * to deny all extensions.";
    };

    ExtensionInstallBlocklist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to specify which extensions the users can NOT install. Extensions already installed will be disabled if denied, without a way for the user to enable them. Once an extension is disabled due to the blocklist being removed, it will automatically get re-enabled. Enter * to deny all extensions.";
    };

    ExtensionInstallWhitelist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to specify which extensions are not subject to the blacklist.";
    };

    ExtensionInstallAllowlist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to specify which extensions are not subject to the blocklist.";
    };

    ExtensionManifestV2Availability = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 ]);
      default = null;
      description = "Control if Manifest v2 extensions can be used by browser.";
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
                  description = "This setting whitelists the allowed types of extension/apps that can be installed in Google Chrome.";
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

    BlockExternalExtensions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Blocks external extensions from being installed.";
    };

    ExtensionAllowInsecureUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Allow insecure algorithms in integrity checks on extension updates and installs.";
    };

    EnableMediaRouter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If this policy is set to true or is not set, Google Cast will be enabled, and users will be able to launch it from the app menu, page context menus, media controls on Cast-enabled websites, and (if shown) the Cast toolbar icon.";
    };

    ShowCastIconInToolbar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If this policy is set to true, the Cast toolbar icon will always be shown on the toolbar or the overflow menu, and users will not be able to remove it.";
    };

    AllowCrossOriginAuthPrompt = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Controls whether third-party sub-content on a page is allowed to pop-up an HTTP Basic Auth dialog box.";
    };

    AuthNegotiateDelegateByKdcPolicy = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Use KDC policy to delegate credentials. Controls whether approval by KDC policy is respected to decide whether to delegate Kerberos tickets.";
    };

    AuthNegotiateDelegateWhitelist = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Servers that Google Chrome may delegate to.";
    };

    AuthNegotiateDelegateAllowlist = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Servers that Google Chrome may delegate to.";
    };

    AuthSchemes = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies which HTTP authentication schemes are supported by Google Chrome. Possible values are 'basic', 'digest', 'ntlm' and 'negotiate'. Separate multiple values with commas.";
    };

    AuthServerWhitelist = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies which servers should be whitelisted for integrated authentication. Integrated authentication is only enabled when Google Chrome receives an authentication challenge from a proxy or from a server which is in this permitted list.";
    };

    BasicAuthOverHttpEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Setting the policy to Enabled or leaving it unset will allow Basic authentication challenges received over non-secure HTTP. Setting the policy to Disabled forbids non-secure HTTP requests from using the Basic authentication scheme; only secure HTTPS is allowed.";
    };

    AuthServerAllowlist = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies which servers should be allowed for integrated authentication. Integrated authentication is only enabled when Google Chrome receives an authentication challenge from a proxy or from a server which is in this permitted list.";
    };

    DisableAuthNegotiateCnameLookup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Specifies whether the generated Kerberos SPN is based on the canonical DNS name or the original name entered.";
    };

    EnableAuthNegotiatePort = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Specifies whether the generated Kerberos SPN should include a non-standard port.";
    };

    NtlmV2Enabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Controls whether NTLMv2 is enabled.";
    };

    BrowserSwitcherEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "This policy controls whether to enable Legacy Browser Support. When this policy is set to true, Chrome will attempt to launch some URLs in an alternate browser.";
    };

    AlternativeBrowserParameters = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "This policy controls command-line parameters to launch to the alternative browser.";
    };

    AlternativeBrowserPath = lib.mkOption {
      type = types.nullOr (types.enum [ "${safari}" "${firefox}" "${opera}" "${ie}" ]);
      default = null;
      description = "This policy controls which command to use to open URLs in an alternative browser.";
    };

    BrowserSwitcherDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "This policy controls how long to wait before launching an alternative browser, in milliseconds. When this policy is set to a number, Chrome shows a message for that many milliseconds, and then opens the alternative browser.";
    };

    BrowserSwitcherKeepLastChromeTab = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "This policy controls whether to close Chrome completely when the last tab would switch to another browser.";
    };

    BrowserSwitcherUrlList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "This policy controls the list of websites to open in an alternative browser.";
    };

    BrowserSwitcherUrlGreylist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "This policy controls the list of websites that will never cause a browser switch.";
    };

    BrowserSwitcherExternalGreylistUrl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "This policy is a URL, that points to an XML file in the same format as Internet Explorer's SiteList policy. This loads rules from an XML file, without sharing those rules with Internet Explorer.";
    };

    BrowserSwitcherExternalSitelistUrl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "This policy is a URL, that points to an XML file in the same format as Internet Explorer's SiteList policy. This loads rules from an XML file, without sharing those rules with Internet Explorer.";
    };

    AbusiveExperienceInterventionEnforce = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allows you to set whether sites with abusive experiences should be prevented from opening new windows or tabs.";
    };

    AccessibilityImageLabelsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Get Image Descriptions from Google. Enables visually-impaired screen reader users to get descriptions of unlabeled images on the web.";
    };

    AdsSettingForIntrusiveAdsSites = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Allows you to set whether ads should be blocked on sites with intrusive ads.";
    };

    LocalNetworkAccessRestrictionsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
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

    PrivacySandboxAdMeasurementEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "A policy to control whether the Privacy Sandbox Ad measurement setting can be disabled for your users.";
    };

    PrivacySandboxAdTopicsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "A policy to control whether the Privacy Sandbox Ad measurement setting can be disabled for your users.";
    };

    PrivacySandboxPromptEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "A policy to control whether your users see the Privacy Sandbox prompt.";
    };

    PrivacySandboxSiteEnabledAdsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "A policy to control whether the Privacy Sandbox Site-suggested ads setting can be disabled for your users.";
    };

    AdvancedProtectionAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enable additional protections for users enrolled in the Advanced Protection program.";
    };

    AdvancedProtectionDeepScanningEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "This policy controls whether users enrolled in the Advanced Protection program are allowed to send their downloads to Google for malware scanning. If set to True or not set, enrolled users will be be prompted to send their files to Google for deep scanning. If the user selects 'Scan', their download will be sent to Google. If set to False, users will not be prompted and their downloads will not be sent to Google.";
    };

    AllowDeletingBrowserHistory = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enables deleting browser history and download history in Google Chrome and prevents users from changing this setting.";
    };

    AllowDinosaurEasterEgg = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow users to play dinosaur easter egg game when device is offline.";
    };

    AllowFileSelectionDialogs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allows access to local files on the machine by allowing Google Chrome to display file selection dialogs.";
    };

    AllowOutdatedPlugins = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you enable this setting, outdated plugins are used as normal plugins.";
    };

    AllowPopupsDuringPageUnload = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "This policy allows an admin to specify that a page may show popups during its unloading.";
    };

    AllowSyncXHRInPageDismissal = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "This policy allows an admin to specify that a page may send synchronous XHR requests during page dismissal.";
    };

    AllowedDomainsForApps = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enables Google Chrome's restricted log in feature in G Suite and prevents users from changing this setting.";
    };

    AlternateErrorPagesEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables the use of alternate error pages that are built into Google Chrome (such as 'page not found') and prevents users from changing this setting.";
    };

    AlwaysOpenPdfExternally = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables the internal PDF viewer in Google Chrome. Instead it treats it as download and allows the user to open PDF files with the default application.";
    };

    AmbientAuthenticationInPrivateModesEnabled = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 ]);
      default = null;
      description = "Configuring this policy will allow/disallow ambient authenticaiton for Incognito and Guest profiles in Google Chrome.";
    };

    AppCacheForceEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows the AppCache feature to be re-enabled even if it is off by default.";
    };

    AudioCaptureAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If enabled or not configured (default), the user will be prompted for audio capture access except for URLs configured in the AudioCaptureAllowedUrls list which will be granted access without prompting.";
    };

    AudioSandboxEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow the audio sandbox to run. If this policy is enabled, the audio process will run sandboxed. If this policy is disabled, the audio process will run unsandboxed and the WebRTC audio-processing module will run in the renderer process. This leaves users open to security risks related to running the audio subsystem unsandboxed.";
    };

    AudioCaptureAllowedUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Patterns in this list will be matched against the security\norigin of the requesting URL.  If a match is found, access to audio\ncapture devices will be granted without prompt.";
    };

    AutoFillEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enable AutoFill. This policy is deprecated in M70, please use AutofillAddressEnabled and AutofillCreditCardEnabled instead.";
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

    AutoOpenAllowedForURLs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "URLs where AutoOpenFileTypes can apply. List of URLs specifying which urls AutoOpenFileTypes will apply to. This policy has no impact on automatically open values set by users.";
    };

    AutoOpenFileTypes = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of file types that should be automatically opened on download.";
    };

    AutofillAddressEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enables Google Chrome's AutoFill feature and allows users to auto complete address information in web forms using previously stored information.";
    };

    AutofillCreditCardEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enables Google Chrome's AutoFill feature and allows users to auto complete credit card information in web forms using previously stored information.";
    };

    BookmarkBarEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you enable this setting, Google Chrome will show a bookmark bar.";
    };

    BrowserAddPersonEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If this policy is set to true or not configured, Google Chrome will allow Add Person from the user manager.";
    };

    BrowserGuestModeEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If this policy is set to true or not configured, Google Chrome will enable guest logins. Guest logins are Google Chrome profiles where all windows are in incognito mode.";
    };

    BrowserGuestModeEnforced = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If this policy is set to enabled, Google Chrome will enforce guest sessions and prevents profile logins. Guest logins are Google Chrome profiles where all windows are in incognito mode.";
    };

    BrowserNetworkTimeQueriesEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Setting this policy to false stops Google Chrome from occasionally sending queries to a Google server to retrieve an accurate timestamp. These queries will be enabled if this policy is set to True or is not set.";
    };

    BrowserSignin = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "This policy controls the sign-in behavior of the browser. It allows you to specify if the user can sign in to Google Chrome with their account and use account related services like Chrome sync.";
    };

    BuiltInDnsClientEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls whether the built-in DNS client is used in Google Chrome.";
    };

    BuiltinCertificateVerifierEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines whether the built-in certificate verifier will be used to verify server certificates. When this setting is enabled, Google Chrome will perform verification of server certificates using the built-in certificate verifier. When this setting is disabled, Google Chrome will perform verification of server certificates using the legacy certificate verifier provided by the platform. When this setting is not set, the built-in or the legacy certificate verifier may be used.";
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
      description = "Disables enforcing Certificate Transparency requirements to the listed URLs. A URL pattern is formatted according to https://www.chromium.org/administrators/url-blacklist-filter-format.";
    };

    ChromeVariations = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = 0;
      description = "Determine the availability of variations.";
    };

    ClickToCallEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enable the Click to Call Feature.";
    };

    CloudManagementEnrollmentToken = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If this policy is set, Google Chrome will try to register itself and apply associated cloud policy for all profiles.";
    };

    CloudManagementEnrollmentMandatory = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If this policy is set to True, cloud management enrollment is mandatory and blocks Chrome launch process if failed.";
    };

    CloudPolicyOverridesPlatformPolicy = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If the policy is set to true, cloud policy takes precedence if it conflicts with platform policy. If the policy is set to false or not configured, platform policy takes precedence if it conflicts with cloud policy.";
    };

    CommandLineFlagSecurityWarningsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If disabled, prevents security warnings from appearing when Chrome is launched with some potentially dangerous command-line flags.";
    };

    ComponentUpdatesEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enables component updates for all components in Google Chrome when not set or set to True.";
    };

    CorsLegacyModeEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Use the legacy CORS implementation rather than new CORS.";
    };

    CorsMitigationList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Enable CORS check mitigations in the new CORS implementation, allowing Extensions to keep compatible behavior, and allowing Google Chrome to send specified headers without CORS checks.";
    };

    DNSInterceptionChecksEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "This policy configures a local switch that can be used to disable DNS interception checks. The checks attempt to discover whether the browser is behind a proxy that redirects unknown host names.";
    };

    DefaultBrowserSettingEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Configures the default browser checks in Google Chrome and prevents users from changing them.";
    };

    DefaultDownloadDirectory = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the default directory that Google Chrome will use for downloading files. This policy is not mandatory, so the user will be able to change the directory.\n\nSee https://www.chromium.org/administrators/policy-list-3/user-data-directory-variables for a list of variables that can be used.";
    };

    DefaultSearchProviderContextMenuAccessAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allow default search provider context menu search access.";
    };

    DeveloperToolsAvailability = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Allows you to control where Developer Tools can be used.";
    };

    Disable3DAPIs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enabling this setting prevents web pages from accessing the graphics processing unit (GPU). Specifically, web pages can not access the WebGL API and plugins can not use the Pepper 3D API.";
    };

    DisableSafeBrowsingProceedAnyway = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "The Safe Browsing service shows a warning page when users navigate to sites that are flagged as potentially malicious. Enabling this setting prevents users from proceeding anyway from the warning page to the malicious site.";
    };

    DisableScreenshots = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If enabled, screenshots cannot be taken using keyboard shortcuts or extension APIs.";
    };

    DisabledPlugins = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "This policy is deprecated. Please use the DefaultPluginsSetting to control the avalability of the Flash plugin and AlwaysOpenPdfExternally to control whether the integrated PDF viewer should be used for opening PDF files.\n\nSpecifies a list of plugins that are disabled in Google Chrome and prevents users from changing this setting.";
    };

    DisabledPluginsExceptions = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "This policy is deprecated. Please use the DefaultPluginsSetting to control the avalability of the Flash plugin and AlwaysOpenPdfExternally to control whether the integrated PDF viewer should be used for opening PDF files.\n\nSpecifies a list of plugins that user can enable or disable in Google Chrome.";
    };

    DisabledSchemes = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "This policy is deprecated, please use URLBlocklist instead.\n\nDisables the listed protocol schemes in Google Chrome.";
    };

    DiskCacheDir = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the directory that Google Chrome will use for storing cached files on the disk. See https://www.chromium.org/administrators/policy-list-3/user-data-directory-variables for a list of variables that can be used. To avoid data loss or other unexpected errors this policy should not be set to a volume's root directory or to a directory used for other purposes, because Google Chrome manages its contents";
    };

    DiskCacheSize = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Configures the cache size that Google Chrome will use for storing cached files on the disk. The value specified in this policy is not a hard boundary but rather a suggestion to the caching system, any value below a few megabytes is too small and will be rounded up to a sane minimum. If the value of this policy is 0, the default cache size will be used but the user will not be able to change it.";
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

    DownloadDirectory = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the directory that Google Chrome will use for downloading files. If you set this policy, Google Chrome will use the provided directory regardless whether the user has specified one or enabled the flag to be prompted for download location every time. If this policy is left not set the default download directory will be used and the user will be able to change it.\n\nSee https://www.chromium.org/administrators/policy-list-3/user-data-directory-variables for a list of variables that can be used.";
    };

    DownloadRestrictions = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 4 ]);
      default = null;
      description = "Configures the type of downloads that Google Chrome will completely block, without letting users override the security decision.";
    };

    EditBookmarksEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If you enable this setting, bookmarks can be added, removed or modified. This is the default also when this policy is not set.";
    };

    EnableDeprecatedWebPlatformFeatures = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "ExampleDeprecatedFeature_EffectiveUntil20080902 - Enable ExampleDeprecatedFeature API through 2008/09/02\nSpecify a list of deprecated web platform features to re-enable temporarily.";
    };

    EnableExperimentalPolicies = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows Google Chrome to load experimental policies.";
    };

    EnableOnlineRevocationChecks = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "In light of the fact that soft-fail, online revocation checks provide no effective security benefit, they are disabled by default in Google Chrome version 19 and later. By setting this policy to true, the previous behavior is restored and online OCSP/CRL checks will be performed.";
    };

    EnabledPlugins = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "This policy is deprecated. Please use the DefaultPluginsSetting to control the avalability of the Flash plugin and AlwaysOpenPdfExternally to control whether the integrated PDF viewer should be used for opening PDF files.\n\nSpecifies a list of plugins that are enabled in Google Chrome and prevents users from changing this setting.";
    };

    EnterpriseHardwarePlatformAPIEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "When this policy is set to enabled, extensions installed by enterprise policy are allowed to use the Enterprise Hardware Platform API.";
    };

    EnterpriseRealTimeUrlCheckMode = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 ]);
      default = null;
      description = "This policy controls checking URLs in real time to identify unsafe URLs. If this policy is left not set or set to ‘Disabled', the consumer Safe Browsing checks will be applied. If this policy is set to ‘Enabled', URLs will be sent to be scanned in real time under enterprise ToS. It will result in Chrome sending URLs to Google Cloud or third parties of your choosing to check them in real time. The consumer version of Safe Browsing real time lookup will be switched off.";
    };

    ExternalProtocolDialogShowAlwaysOpenCheckbox = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Show an \"Always open\" checkbox in external protocol dialog.";
    };

    ForceBrowserSignin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If this policy is set to true, user has to sign in to Google Chrome with their profile before using the browser. And the default value of BrowserGuestModeEnabled will be set to false. Note that existing unsigned profiles will be locked and inaccessible after enabling this policy. For more information, see help center article. This policy is deprecated, consider using BrowserSignin instead.";
    };

    ForceEphemeralProfiles = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If set to enabled this policy forces the profile to be switched to ephemeral mode. If this policy is specified as an OS policy (e.g. GPO on Windows) it will apply to every profile on the system; if the policy is set as a Cloud policy it will apply only to a profile signed in with a managed account.";
    };

    ForceGoogleSafeSearch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Forces queries in Google Web Search to be done with SafeSearch set to active and prevents users from changing this setting.";
    };

    ForceSafeSearch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "This policy is deprecated, please use ForceGoogleSafeSearch and ForceYouTubeRestrict instead. This policy is ignored if either the ForceGoogleSafeSearch, the ForceYouTubeRestrict or the (deprecated) ForceYouTubeSafetyMode policies are set.";
    };

    ForceLegacyDefaultReferrerPolicy = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "This enterprise policy is for short-term adaptation and will be removed in M82.";
    };

    GloballyScopeHTTPAuthCacheEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "This policy configures a single global per profile cache with HTTP server authentication credentials.";
    };

    HSTSPolicyBypassList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of names that will bypass the HSTS policy check. Hostnames specified in this list will be exempt from the HSTS policy check that could potentially upgrade requests from http to https.";
    };

    ForceYouTubeRestrict = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Enforces a minimum Restricted Mode on YouTube and prevents users from picking a less restricted mode.";
    };

    ForceYouTubeSafetyMode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "This policy is deprecated. Consider using ForceYouTubeRestrict, which overrides this policy and allows more fine-grained tuning.\n\nForces YouTube Moderate Restricted Mode and prevents users from changing this setting.";
    };

    HardwareAccelerationModeEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If this policy is set to true or left unset, hardware acceleration will be enabled unless a certain GPU feature is blacklisted.";
    };

    HideWebStoreIcon = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Hide the Chrome Web Store app and footer link from the New Tab Page and Google Chrome OS app launcher.";
    };

    Http09OnNonDefaultPortsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "This policy enables HTTP/0.9 on ports other than 80 for HTTP and 443 for HTTPS.";
    };

    ImportAutofillFormData = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy forces the autofill form data to be imported from the previous default browser if enabled. If enabled, this policy also affects the import dialog.";
    };

    ImportBookmarks = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
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

    IncognitoEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "This policy is deprecated. Please, use IncognitoModeAvailability instead. Enables Incognito mode in Google Chrome.\n\nIf this setting is enabled or not configured, users can open web pages in incognito mode.";
    };

    IncognitoModeAvailability = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Specifies whether the user may open pages in Incognito mode in Google Chrome.";
    };

    IntensiveWakeUpThrottlingEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When enabled, the IntensiveWakeUpThrottling feature causes JavaScript timers in background tabs to be aggressively throttled and coalesced, running no more than once per minute after a page has been backgrounded for 5 minutes or more.";
    };

    IsolateOrigins = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If the policy is enabled, each of the named origins in a comma-separated list will run in its own process. This will also isolate origins named by subdomains; e.g. specifying https://example.com/ will also cause https://foo.example.com/ to be isolated as part of the https://example.com/ site. If the policy is disabled, no explicit Site Isolation will happen and field trials of IsolateOrigins and SitePerProcess will be disabled. Users will still be able to enable IsolateOrigins manually. If the policy is not configured, the user will be able to change this setting. On Google Chrome OS, it is recommended to also set the DeviceLoginScreenIsolateOrigins device policy to the same value. If the values specified by the two policies don't match, a delay may be incurred when entering a user session while the value specified by user policy is being applied.";
    };

    JavascriptEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "This policy is deprecated, please use DefaultJavaScriptSetting instead.\n\nCan be used to disabled JavaScript in Google Chrome.";
    };

    LocalDiscoveryEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy controls access to controllable features in the local discovery UI (chrome://devices) which shows discoverable devices near the user as well as cloud devices registered to them. On all operating systems except for Google Chrome OS, the local discovery UI also allows users to add classic printers connected to their computers to Google Cloud Print.";
    };

    LookalikeWarningAllowlistDomains = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "This policy prevents the display of lookalike URL warnings on the sites listed. These warnings are typically shown on sites that Google Chrome believes might be trying to spoof another site the user is familiar with. If the policy is enabled and set to one or more domains, no lookalike warnings pages will be shown when the user visits pages on that domain. If the policy is disabled, not set, or set to an empty list, warnings may appear on any site the user visits.";
    };

    MachineLevelUserCloudPolicyEnrollmentToken = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The enrollment token of cloud policy on desktop. This policy is deprecated in M72. Please use CloudManagementEnrollmentToken instead.";
    };

    ManagedBookmarks = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Name of the bookmark.";
          };
          url = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "URL for the bookmark.";
          };
        };
      }));
      default = null;
      description = "Configures a list of managed bookmarks.";
    };

    MaxConnectionsPerProxy = lib.mkOption {
      type = types.nullOr (types.int);
      default = 32;
      description = "Specifies the maximal number of simultaneous connections to the proxy server.";
    };

    MaxInvalidationFetchDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = 5000;
      description = "Specifies the maximum delay in milliseconds between receiving a policy invalidation and fetching the new policy from the device management service.";
    };

    MediaRecommendationsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "By default the browser will show media recommendations that are personalized to the user. Setting this policy to Disabled will result in these recommendations being hidden from the user. Setting this policy to Enabled or leaving it unset will result in the media recommendations being shown to the user.";
    };

    MediaRouterCastAllowAllIPs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If this policy is set to true, Google Cast will connect to Cast devices on all IP addresses, not just RFC1918/RFC4913 private addresses.";
    };

    MetricsReportingEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables anonymous reporting of usage and crash-related data about Google Chrome to Google and prevents users from changing this setting.";
    };

    NTPCardsVisible = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy controls the visibility of cards on the New Tab Page. Cards surface entry points to launch common user journeys based on the user's browsing behavior.\n\nIf the policy is set to Enabled, the New Tab Page will show cards if content is available.\n\nIf the policy is set to Disabled, the New Tab Page won't show cards.";
    };

    NTPCustomBackgroundEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allow users to customize the background on the New Tab page";
    };

    NetworkPredictionOptions = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "(Deprecated in 50, removed in 52. After 52, if value 1 is set, it will be treated as 0 - predict network actions on any network connection.)\nEnables network prediction in Google Chrome and prevents users from changing this setting.";
    };

    OverrideSecurityRestrictionsOnInsecureOrigin = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The policy specifies a list of origins (URLs) or hostname patterns (such as \"*.example.com\") to be treated as secure contexts. The intent is to allow organizations to set up a staging server for internal web development, so that their developers can test out features requiring secure contexts without having to deploy TLS on the staging server.\n\nSetting a list of URLs in this policy has the same effect as setting the command-line flag '--unsafely-treat-insecure-origin-as-secure' to a comma-separated list of the same URLs. If the policy is set, it will override the command-line flag.\n\nFor more information on secure contexts, see https://www.w3.org/TR/secure-contexts/";
    };

    PaymentMethodQueryEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allows you to set whether websites are allowed to check if the user has payment methods saved.";
    };

    PolicyAtomicGroupsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enables the concept of policy atomic groups.";
    };

    PolicyDictionaryMultipleSourceMergeList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows the selected policies to be merged when they come from different sources, with the same scopes and level. Entered strings must match a Chrome policy / key name that uses a dictionary for its data type.";
    };

    PolicyListMultipleSourceMergeList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows the selected policies to be merged when they come from different sources, with the same scopes and level. Entered strings must match a Chrome policy / key name that use an array (list) of strings for its data type.";
    };

    PolicyRefreshRate = lib.mkOption {
      type = types.nullOr (types.int);
      default = 10800000;
      description = "Refresh rate for user policy. Specifies the period in milliseconds at which the device management service is queried for user policy information. Setting this policy overrides the default value of 3 hours. Valid values for this policy are in the range from 1800000 (30 minutes) to 86400000 (1 day).";
    };

    ProfilePickerOnStartupAvailability = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Specifies whether the profile picker is enabled, disabled or forced at the browser startup. By default the profile picker is not shown if the browser starts in guest or incognito mode, a profile directory and/or urls are specified by command line, an app is explicitly requested to open, the browser was launched by a native notification, there is only one profile available or the policy ForceBrowserSignin is set to true.";
    };

    PromotionalTabsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allows you to control the presentation of full-tab promotional and/or educational content in Google Chrome.";
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
            description = "Specifies the proxy server Google Chrome uses and prevents users from changing proxy settings.";
          };
          ProxyServer = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Specifies the URL of the proxy server";
          };
          ProxyBypassList = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Defines a comma-separated list of hosts for which Google Chrome bypasses any proxy.";
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
      default = true;
      description = "If this policy is set to true or not set usage of QUIC protocol in Google Chrome is allowed.\nIf this policy is set to false usage of QUIC protocol is disallowed.";
    };

    RelaunchNotification = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Notify users that Google Chrome must be relaunched to apply a pending update.";
    };

    RelaunchNotificationPeriod = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Allows you to set the time period, in milliseconds, over which users are notified that Google Chrome must be relaunched or that a Google Chrome OS device must be restarted to apply a pending update.";
    };

    RestrictSigninToPattern = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Contains a regular expression which is used to determine which users can sign in to Google Chrome.";
    };

    RunAllFlashInAllowMode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If you enable this setting, all Flash content embedded on websites that have been set to allow Flash in content settings -- either by the user or by enterprise policy -- will be run, including content from other origins or small content.";
    };

    SSLErrorOverrideAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Chrome shows a warning page when users navigate to sites that have SSL errors. By default or when this policy is set to true, users are allowed to click through these warning pages.\nSetting this policy to false disallows users to click through any warning page.";
    };

    SSLVersionMin = lib.mkOption {
      type = types.nullOr (types.enum [ "tls1" "tls1.1" "tls1.2" ]);
      default = null;
      description = "If this policy is not configured then Google Chrome uses a default minimum version which is TLS 1.0.";
    };

    SafeSitesFilterBehavior = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 ]);
      default = null;
      description = "This policy controls the application of the SafeSites URL filter.\nThis filter uses the Google Safe Search API to classify URLs as pornographic or not.";
    };

    SavingBrowserHistoryDisabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables saving browser history in Google Chrome and prevents users from changing this setting.";
    };

    ScreenCaptureAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If enabled or not configured (default), a Web page can use screen-share APIs (e.g., getDisplayMedia() or the Desktop Capture extension API) to prompt the user to select a tab, window or desktop to capture.";
    };

    ScrollToTextFragmentEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "This feature allows for hyperlinks and address bar URL navigations to target specific text within a web page, which will be scrolled to once the loading of the web page is complete.";
    };

    SearchSuggestEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables search suggestions in Google Chrome's omnibox and prevents users from changing this setting.";
    };

    SecurityKeyPermitAttestation = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Specifies URLs and domains for which no prompt will be shown when attestation certificates from Security Keys are requested. Additionally, a signal will be sent to the Security Key indicating that individual attestation may be used. Without this, users will be prompted in Chrome 65+ when sites request attestation of Security Keys.";
    };

    SharedClipboardEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enables the Shared Clipboard feature which allows users to send text between Chrome Desktops and an Android device when Sync is enabled and the user is Signed-in.";
    };

    ShowAppsShortcutInBookmarkBar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables or disables the apps shortcut in the bookmark bar.";
    };

    ShowFullUrlsInAddressBar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This feature enables display of the full URL in the address bar. If this policy is set to True, then the full URL will be shown in the address bar, including schemes and subdomains. If this policy is set to False, then the default URL display will apply.";
    };

    SignedHTTPExchangeEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enable support for Signed HTTP Exchange (SXG).";
    };

    SigninAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy is deprecated, consider using BrowserSignin instead.\n\nAllows the user to sign in to Google Chrome.";
    };

    SigninInterceptionEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This settings enables or disables signin interception. When this policy not set or is set to True, the signin interception dialog triggers when a Google account is added on the web, and the user may benefit from moving this account to another (new or existing) profile. When this is set to False, the signin interception dialog does not trigger.";
    };

    SitePerProcess = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "You might want to look at the IsolateOrigins policy setting to get the best of both worlds, isolation and limited impact for users, by using IsolateOrigins with a list of the sites you want to isolate. This setting, SitePerProcess, isolates all sites. If the policy is enabled, each site will run in its own process. If the policy is disabled, no explicit Site Isolation will happen and field trials of IsolateOrigins and SitePerProcess will be disabled. Users will still be able to enable SitePerProcess manually. If the policy is not configured, the user will be able to change this setting. On Google Chrome OS, it is recommended to also set the DeviceLoginScreenSitePerProcess device policy to the same value. If the values specified by the two policies don't match, a delay may be incurred when entering a user session while the value specified by user policy is being applied.";
    };

    SpellCheckServiceEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Google Chrome can use a Google web service to help resolve spelling errors. If this setting is enabled, then this service is always used. If this setting is disabled, then this service is never used.";
    };

    SpellcheckEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If this policy is not set or enabled, the user is allowed to use spellcheck.";
    };

    StricterMixedContentTreatmentEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "This policy controls the treatment for mixed content (HTTP content in HTTPS sites) in the browser. If the policy is set to true or unset, audio and video mixed content will be autoupgraded to HTTPS (i.e. the URL will be rewritten as HTTPS, without a fallback if the resource is not available over HTTPS) and a 'Not Secure' warning will be shown in the URL bar for image mixed content. If the policy is set to false, autoupgrades will be disabled for audio and video, and no warning will be shown for images. This policy does not affect other types of mixed content other than audio, video, and images. This policy will no longer take effect starting in Google Chrome 84.";
    };

    SuppressUnsupportedOSWarning = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Suppresses the warning that appears when Google Chrome is running on a computer or operating system that is no longer supported.";
    };

    SyncDisabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables data synchronization in Google Chrome using Google-hosted synchronization services and prevents users from changing this setting.";
    };

    SyncTypesListDisabled = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "apps" "autofill" "bookmarks" "extensions" "passwords" "preferences" "tabs" "themes" "typedUrls" "wifiConfiguration" ]));
      default = null;
      description = "If this policy is set, all specified data types will be excluded from synchronization both for Google Sync as well as for roaming profile synchronization.";
    };

    TLS13HardeningForLocalAnchorsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enable a TLS 1.3 security feature for local trust anchors. This policy controls a security feature in TLS 1.3 which protects connections against downgrade attacks. It is backwards-compatible and will not affect connections to compliant TLS 1.2 servers or proxies. However, older versions of some TLS-intercepting proxies have an implementation flaw which causes them to be incompatible.";
    };

    TargetBlankImpliesNoOpener = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Setting the policy to Disabled allows popups targeting _blank to access (via JavaScript) the page that requested to open the popup. Setting the policy to Enabled or leaving it unset causes the window.opener property to be set to null unless the anchor specifies rel=\"opener\".";
    };

    TaskManagerEndProcessEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If set to false, the 'End process' button is disabled in the Task Manager.";
    };

    TotalMemoryLimitMb = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Configures the amount of memory that a single Google Chrome instance can use before tabs start being discarded (I.E. the memory used by the tab will be freed and the tab will have to be reloaded when switched to) to save memory. The minimum allowed value is 1024.";
    };

    TranslateEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables the integrated Google Translate service on Google Chrome.";
    };

    URLBlacklist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "This policy prevents the user from loading web pages from blacklisted URLs. The denylist provides a list of URL patterns that specify which URLs will be denied. A URL pattern is formatted according to https://www.chromium.org/administrators/url-blacklist-filter-format.";
    };

    URLBlocklist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "This policy prevents the user from loading web pages from blocked URLs. The blocklist provides a list of URL patterns that specify which URLs will be denied. A URL pattern is formatted according to https://www.chromium.org/administrators/url-blacklist-filter-format.";
    };

    URLWhitelist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows access to the listed URLs, as exceptions to the URL denylist. A URL pattern is formatted according to https://www.chromium.org/administrators/url-blacklist-filter-format.";
    };

    URLAllowlist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows access to the listed URLs, as exceptions to the URL block list. A URL pattern is formatted according to https://www.chromium.org/administrators/url-blacklist-filter-format.";
    };

    UnsafelyTreatInsecureOriginAsSecure = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Deprecated in M69. Use OverrideSecurityRestrictionsOnInsecureOrigin instead.\n\nThe policy specifies a list of origins (URLs) or hostname patterns (such as \"*.example.com\") for which security restrictions on insecure origins will not apply.";
    };

    UrlKeyedAnonymizedDataCollectionEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable URL-keyed anonymized data collection in Google Chrome and prevents users from changing this setting.";
    };

    UserAgentClientHintsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When enabled the User-Agent Client Hints feature sends granular request headers providing information about the user browser and environment.";
    };

    UserFeedbackAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allow user feedback. If the policy is set to false, users can not send feedback to Google.";
    };

    UserDataDir = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the directory that Google Chrome will use for storing user data. See https://www.chromium.org/administrators/policy-list-3/user-data-directory-variables for a list of variables that can be used.";
    };

    UserDataSnapshotRetentionLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = 3;
      description = "Limits the number of user data snapshots retained for use in case of emergency rollback. If this policy is not set, the default value of 3 is used. If the policy is set to 0, no snapshots will be taken.";
    };

    VideoCaptureAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If enabled or not configured (default), the user will be prompted for\nvideo capture access except for URLs configured in the\nVideoCaptureAllowedUrls list which will be granted access without prompting.";
    };

    VideoCaptureAllowedUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Patterns in this list will be matched against the security\norigin of the requesting URL.  If a match is found, access to audio\ncapture devices will be granted without prompt.";
    };

    WPADQuickCheckEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allows to turn off WPAD (Web Proxy Auto-Discovery) optimization in Google Chrome.";
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
      default = false;
      description = "The Web Components v0 APIs (Shadow DOM v0, Custom Elements v0, and HTML Imports) were deprecated in 2018, and have been disabled by default starting in M80. This policy allows these features to be selectively re-enabled until M84.";
    };

    WebDriverOverridesIncompatiblePolicies = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "This policy allows users of the WebDriver feature to override policies which can interfere with its operation.";
    };

    WebRtcAllowLegacyTLSProtocols = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "f enabled, WebRTC peer connections can downgrade to obsolete versions of the TLS/DTLS (DTLS 1.0, TLS 1.0 and TLS 1.1) protocols. When this policy is disabled or not set, these TLS/DTLS versions are disabled.";
    };

    WebRtcEventLogCollectionAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If the policy is set to true, Google Chrome is allowed to collect WebRTC event logs from Google services (e.g. Google Meet), and upload those logs to Google.";
    };

    WebRtcLocalIpsAllowedUrls = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Patterns in this list will be matched against the security origin of the requesting URL. If a match is found or chrome://flags/#enable-webrtc-hide-local-ips-with-mdns is Disabled, the local IP addresses are shown in WebRTC ICE candidates. Otherwise, local IP addresses are concealed with mDNS hostnames.";
    };

    WebRtcUdpPortRange = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If the policy is set, the UDP port range used by WebRTC is restricted to the specified port interval (endpoints included).";
    };

    NativeMessagingBlacklist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to specify which native messaging hosts that should not be loaded. A blacklist value of '*' means all native messaging hosts are denied unless they are explicitly listed in the allowlist.";
    };

    NativeMessagingBlocklist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to specify which native messaging hosts that should not be loaded. A block list value of '*' means all native messaging hosts are denied unless they are explicitly listed in the allow list.";
    };

    NativeMessagingUserLevelHosts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables user-level installation of Native Messaging hosts.";
    };

    NativeMessagingWhitelist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to specify which native messaging hosts are not subject to the blacklist. A blacklist value of * means all native messaging hosts are denied and only native messaging hosts listed in the whitelist will be loaded.";
    };

    NativeMessagingAllowlist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allows you to specify which native messaging hosts are not subject to the block list. A block list value of * means all native messaging hosts are denied and only native messaging hosts listed in the allow list will be loaded.";
    };

    PasswordLeakDetectionEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This policy can be used to force enable or force disable credential leak checking in Google Chrome.";
    };

    PasswordManagerEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If this setting is enabled, users can have Google Chrome memorize passwords and provide them automatically the next time they log in to a site.";
    };

    CloudPrintProxyEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enables Google Chrome to act as a proxy between Google Cloud Print and legacy printers connected to the machine.";
    };

    CloudPrintSubmitEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enables Google Chrome to submit documents to Google Cloud Print for printing.  NOTE: This only affects Google Cloud Print support in Google Chrome.  It does not prevent users from submitting print jobs on web sites.";
    };

    DefaultPrinterSelection = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Overrides Google Chrome default printer selection rules.";
    };

    DisablePrintPreview = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Show the system print dialog instead of print preview.";
    };

    PrintHeaderFooter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Force 'headers and footers' to be on or off in the printing dialog.";
    };

    PrinterTypeDenyList = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "privet" "extension" "pdf" "local" "cloud" ]));
      default = null;
      description = "The printers of types placed on the deny list will be disabled from being discovered or having their capabilities fetched.";
    };

    PrintingAllowedBackgroundGraphicsModes = lib.mkOption {
      type = types.nullOr (types.enum [ "any" "enabled" "disabled" ]);
      default = null;
      description = "Restricts background graphics printing mode. Unset policy is treated as no restriction.";
    };

    PrintingBackgroundGraphicsDefault = lib.mkOption {
      type = types.nullOr (types.enum [ "enabled" "disabled" ]);
      default = null;
      description = "Overrides default background graphics printing mode.";
    };

    PrintingEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enables printing in Google Chrome and prevents users from changing this setting.";
    };

    PrintPreviewUseSystemDefaultPrinter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Causes Google Chrome to use the system default printer as the default choice in Print Preview instead of the most recently used printer.";
    };

    PrinterPaperSizeDefault = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          custom_size = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                width = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Width of the page";
                };
                height = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Height of the page";
                };
              };
            });
            default = null;
            description = "Custom Size";
          };
          name = lib.mkOption {
            type = types.nullOr (types.enum [ "custom" "asme_f_28x40in" "iso_2a0_1189x1682mm" "iso_a0_841x1189mm" "iso_a1_594x841mm" "iso_a2_420x594mm" "iso_a3_297x420mm" "iso_a4-extra_235.5x322.3mm" "iso_a4-tab_225x297mm" "iso_a4_210x297mm" "iso_a5-extra_174x235mm" "iso_a5_148x210mm" "iso_a6_105x148mm" "iso_a7_74x105mm" "iso_a8_52x74mm" "iso_a9_37x52mm" "iso_a10_26x37mm" "iso_b0_1000x1414mm" "iso_b1_707x1000mm" "iso_b2_500x707mm" "iso_b3_353x500mm" "iso_b4_250x353mm" "iso_b5-extra_201x276mm" "iso_b5_176x250mm" "iso_b6_125x176mm" "iso_b6c4_125x324mm" "iso_b7_88x125mm" "iso_b8_62x88mm" "iso_b9_44x62mm" "iso_b10_31x44mm" "iso_c0_917x1297mm" "iso_c1_648x917mm" "iso_c2_458x648mm" "iso_c3_324x458mm" "iso_c4_229x324mm" "iso_c5_162x229mm" "iso_c6_114x162mm" "iso_c6c5_114x229mm" "iso_c7_81x114mm" "iso_c7c6_81x162mm" "iso_c8_57x81mm" "iso_c9_40x57mm" "iso_c10_28x40mm" "iso_dl_110x220mm" "jis_exec_216x330mm" "jpn_chou2_111.1x146mm" "jpn_chou3_120x235mm" "jpn_chou4_90x205mm" "jpn_hagaki_100x148mm" "jpn_kahu_240x322.1mm" "jpn_kaku2_240x332mm" "jpn_oufuku_148x200mm" "jpn_you4_105x235mm" "na_10x11_10x11in" "na_10x13_10x13in" "na_10x14_10x14in" "na_10x15_10x15in" "na_11x12_11x12in" "na_11x15_11x15in" "na_12x19_12x19in" "na_5x7_5x7in" "na_6x9_6x9in" "na_7x9_7x9in" "na_9x11_9x11in" "na_a2_4.375x5.75in" "na_arch-a_9x12in" "na_arch-b_12x18in" "na_arch-c_18x24in" "na_arch-d_24x36in" "na_arch-e_36x48in" "na_b-plus_12x19.17in" "na_c5_6.5x9.5in" "na_c_17x22in" "na_d_22x34in" "na_e_34x44in" "na_edp_11x14in" "na_eur-edp_12x14in" "na_f_44x68in" "na_fanfold-eur_8.5x12in" "na_fanfold-us_11x14.875in" "na_foolscap_8.5x13in" "na_govt-legal_8x13in" "na_govt-letter_8x10in" "na_index-3x5_3x5in" "na_index-4x6-ext_6x8in" "na_index-4x6_4x6in" "na_index-5x8_5x8in" "na_invoice_5.5x8.5in" "na_ledger_11x17in" "na_legal-extra_9.5x15in" "na_legal_8.5x14in" "na_letter-extra_9.5x12in" "na_letter-plus_8.5x12.69in" "na_letter_8.5x11in" "na_number-10_4.125x9.5in" "na_number-11_4.5x10.375in" "na_number-12_4.75x11in" "na_number-14_5x11.5in" "na_personal_3.625x6.5in" "na_super-a_8.94x14in" "na_super-b_13x19in" "na_wide-format_30x42in" "om_dai-pa-kai_275x395mm" "om_folio-sp_215x315mm" "om_invite_220x220mm" "om_italian_110x230mm" "om_juuro-ku-kai_198x275mm" "om_large-photo_200x300" "om_pa-kai_267x389mm" "om_postfix_114x229mm" "om_small-photo_100x150mm" "prc_10_324x458mm" "prc_16k_146x215mm" "prc_1_102x165mm" "prc_2_102x176mm" "prc_32k_97x151mm" "prc_3_125x176mm" "prc_4_110x208mm" "prc_5_110x220mm" "prc_6_120x320mm" "prc_7_160x230mm" "prc_8_120x309mm" "roc_16k_7.75x10.75in" "roc_8k_10.75x15.5in" "jis_b0_1030x1456mm" "jis_b1_728x1030mm" "jis_b2_515x728mm" "jis_b3_364x515mm" "jis_b4_257x364mm" "jis_b5_182x257mm" "jis_b6_128x182mm" "jis_b7_91x128mm" "jis_b8_64x91mm" "jis_b9_45x64mm" "jis_b10_32x45mm" ]);
            default = null;
            description = "Name";
          };
        };
      });
      default = null;
      description = "Overrides default printing page size. If 'custom' is provided, custom size width and height keys must also be included.";
    };

    ProxyBypassList = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Google Chrome will bypass any proxy for the list of hosts given here.";
    };

    ProxyMode = lib.mkOption {
      type = types.nullOr (types.enum [ "direct" "auto_detect" "pac_script" "fixed_servers" "system" ]);
      default = null;
      description = "Allows you to specify the proxy server used by Google Chrome and prevents users from changing proxy settings.";
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

    ProxyServerMode = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 ]);
      default = null;
      description = "This policy is deprecated, use ProxyMode instead.\n\nAllows you to specify the proxy server used by Google Chrome and prevents users from changing proxy settings.";
    };

    RemoteAccessHostAllowClientPairing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If this setting is enabled or not configured, then users can opt to pair clients and hosts at connection time, eliminating the need to enter a PIN every time.";
    };

    RemoteAccessHostAllowFileTransfer = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls the ability of a user connected to a remote access host to transfer files between the client and the host. This does not apply to remote assistance connections, which do not support file transfer.";
    };

    RemoteAccessHostAllowGnubbyAuth = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If this setting is enabled, then gnubby authentication requests will be proxied across a remote host connection.";
    };

    RemoteAccessHostAllowRelayedConnection = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enables usage of relay servers when remote clients are trying to establish a connection to this machine.";
    };

    RemoteAccessHostClientDomain = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configure the required domain name for remote access clients. This policy is deprecated. Please use RemoteAccessHostClientDomainList instead.";
    };

    RemoteAccessHostClientDomainList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configures the required client domain names that will be imposed on remote access clients and prevents users from changing it.";
    };

    RemoteAccessHostDomain = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configure the required domain name for remote access hosts. This policy is deprecated. Please use RemoteAccessHostDomainList instead.";
    };

    RemoteAccessHostDomainList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configures the required host domain names that will be imposed on remote access hosts and prevents users from changing it.";
    };

    RemoteAccessHostFirewallTraversal = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enables usage of STUN servers when remote clients are trying to establish a connection to this machine.";
    };

    RemoteAccessHostMatchUsername = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If this setting is enabled, then the remote access host compares the name of the local user (that the host is associated with) and the name of the Google account registered as the host owner (i.e. \"johndoe\" if the host is owned by \"johndoe@example.com\" Google account).  The remote access host will not start if the name of the host owner is different from the name of the local user that the host is associated with.  RemoteAccessHostMatchUsername policy should be used together with RemoteAccessHostDomain to also enforce that the Google account of the host owner is associated with a specific domain (i.e. \"example.com\").";
    };

    RemoteAccessHostRequireCurtain = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enables curtaining of remote access hosts while a connection is in progress.";
    };

    RemoteAccessHostTalkGadgetPrefix = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the TalkGadget prefix that will be used by remote access hosts and prevents users from changing it.";
    };

    RemoteAccessHostTokenUrl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If this policy is set, the remote access host will require authenticating clients to obtain an authentication token from this URL in order to connect. Must be used in conjunction with RemoteAccessHostTokenValidationUrl.";
    };

    RemoteAccessHostTokenValidationCertificateIssuer = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If this policy is set, the host will use a client certificate with the given issuer CN to authenticate to RemoteAccessHostTokenValidationUrl. Set it to \"*\" to use any available client certificate.";
    };

    RemoteAccessHostTokenValidationUrl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If this policy is set, the remote access host will use this URL to validate authentication tokens from remote access clients, in order to accept connections. Must be used in conjunction with RemoteAccessHostTokenUrl.";
    };

    RemoteAccessHostUdpPortRange = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Restricts the UDP port range used by the remote access host in this machine.";
    };

    PasswordProtectionChangePasswordURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configure the change password URL (HTTP and HTTPS schemes only). Password protection service will send users to this URL to change their password after seeing a warning in the browser.\nIn order for Google Chrome to correctly capture the new password fingerprint on this change password page, please make sure your change password page follows the guidelines on https://www.chromium.org/developers/design-documents/create-amazing-password-forms.";
    };

    PasswordProtectionLoginURLs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configure the list of enterprise login URLs (HTTP and HTTPS schemes only). Fingerprint of password will be captured on these URLs and used for password reuse detection.\nIn order for Google Chrome to correctly capture password fingerprints, please make sure your login pages follow the guidelines on https://www.chromium.org/developers/design-documents/create-amazing-password-forms.";
    };

    PasswordProtectionWarningTrigger = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Allows you to control the triggering of passwore protection warning. Password protection alerts users when they reuse their protected password on potentially suspicious sites.";
    };

    SafeBrowsingEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables Google Chrome's Safe Browsing feature and prevents users from changing this setting.";
    };

    SafeBrowsingExtendedReportingEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables Google Chrome's Safe Browsing Extended Reporting and prevents users from changing this setting.";
    };

    SafeBrowsingProtectionLevel = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = 1;
      description = "Allows you to control whether Google Chrome's Safe Browsing feature is enabled and the mode it operates in. Safe Browsing 'enhanced' mode provides better security, but requires sharing more browsing information with Google.";
    };

    SafeBrowsingWhitelistDomains = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configure the list of domains which Safe Browsing will trust. This means:\nSafe Browsing will not check for dangerous resources (e.g. phishing, malware, or unwanted software) if their URLs match these domains.\nSafe Browsing's download protection service will not check downloads hosted on these domains.\nSafe Browsing's password protection service will not check for password reuse if the page URL matches these domains.";
    };

    SafeBrowsingAllowlistDomains = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Configure the list of domains which Safe Browsing will trust. This means:\nSafe Browsing will not check for dangerous resources (e.g. phishing, malware, or unwanted software) if their URLs match these domains.\nSafe Browsing's download protection service will not check downloads hosted on these domains.\nSafe Browsing's password protection service will not check for password reuse if the page URL matches these domains.";
    };

    SafeBrowsingExtendedReportingOptInAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "This setting is deprecated, use SafeBrowsingExtendedReportingEnabled instead. Enabling or disabling SafeBrowsingExtendedReportingEnabled is equivalent to setting SafeBrowsingExtendedReportingOptInAllowed to False.";
    };

    HomepageIsNewTabPage = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Configures the type of the default home page in Google Chrome and prevents users from changing home page preferences. The home page can either be set to a URL you specify or set to the New Tab Page.";
    };

    HomepageLocation = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the default home page URL in Google Chrome and prevents users from changing it.";
    };

    NewTabPageLocation = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configures the default New Tab page URL and prevents users from changing it.";
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
      description = "Shows the Home button on Google Chrome's toolbar.";
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

    DeveloperToolsDisabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables the Developer Tools and the JavaScript console. This policy is deprecated in M68, please use DeveloperToolsAvailability instead.";
    };

  };
}