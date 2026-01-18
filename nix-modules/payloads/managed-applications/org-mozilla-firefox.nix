# Auto-generated from ProfileManifests: org.mozilla.firefox.plist
# Domain: org.mozilla.firefox
# Title: Firefox
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-org-mozilla-firefox" = {
    enable = lib.mkEnableOption "Firefox";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "org.mozilla.firefox";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    EnterprisePoliciesEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable policy support on macOS.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    General_SegmentedControl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    Privacy_SegmentedControl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    Security_SegmentedControl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    BackgroundAppUpdate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable or disable automatic application update in the background, when the application is not running. If set to true, application updates may be installed (without user approval) in the background, even when the application is not running. The operating system might still require approval.";
    };

    AppAutoUpdate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable or disable automatic application update.";
    };

    AppUpdateURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Change the URL for application update.";
    };

    Authentication = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          SPNEGO = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "If this preference is enabled, the specified websites are permitted to engage in SPNEGO authentication with the browser. Entries in the list are formatted as mydomain.com or https://myotherdomain.com.\n\nIf this preference is disabled or not configured, no websites are permitted to engage in SPNEGO authentication with the browser.\n\nFor more information, see https://developer.mozilla.org/en-US/docs/Mozilla/Integrated_authentication.";
          };
          Delegated = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "If this preference is enabled, the browser may delegate user authorization to the server for the specified websites. Entries in the list are formatted as mydomain.com or https://myotherdomain.com.\n\nIf this preference is disabled or not configured, the browser will not delegate user authorization to the server for any websites.\n\nFor more information, see https://developer.mozilla.org/en-US/docs/Mozilla/Integrated_authentication";
          };
          NTLM = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "If this preference is enabled, the specified websites are trusted to use NTLM authentification. Entries in the list are formatted as mydomain.com or https://myotherdomain.com.\n\nIf this policy is disabled or not configured, no websites are trusted to use NTLM authentification.\n\nFor more information, see https://developer.mozilla.org/en-US/docs/Mozilla/Integrated_authentication.";
          };
          AllowNonFQDN = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                NTLM = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                };
                SPNEGO = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                };
              };
            });
            default = null;
            description = "If this preference is enabled, you can always allow SPNEGO or NTLM on non FQDNs (fully qualified domain names). If this preference is disabled or not configured, NTLM and SPNEGO are not enabled on non FQDNs.";
          };
          AllowProxies = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                NTLM = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                };
                SPNEGO = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                };
              };
            });
            default = null;
            description = "If this preference is enabled, you can always allow SPNEGO or NTLM on non FQDNs (fully qualified domain names). If this preference is disabled or not configured, NTLM and SPNEGO are not enabled on non FQDNs.";
          };
          Locked = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Locked (Authentication)";
          };
          PrivateBrowsing = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Enables integrated authentication in prviate browsing";
          };
        };
      });
      default = null;
      description = "Configure sites that support integrated authentication.";
    };

    BlockAboutAddons = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Block access to the Add-ons Manager (about:addons).";
    };

    BlockAboutConfig = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Block access to about:config.";
    };

    BlockAboutProfiles = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Block access to About Profiles (about:profiles).";
    };

    BlockAboutSupport = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Block access to Troubleshooting Information (about:support).";
    };

    Bookmarks = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Title = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Bookmark Title";
          };
          URL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Full URL to be bookmarked (e.g. https://www.example.org/)";
          };
          Placement = lib.mkOption {
            type = types.nullOr (types.enum [ "toolbar" "menu" ]);
            default = null;
            description = "Place bookmark in either the Bookmark menu or Bookmark Toolbar.";
          };
          Favicon = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "URL to icon file to display on bookmark (e.g. https://www.example.org/favicon.ico)";
          };
          Folder = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Folder to place bookmark in. If a folder is specified, it is automatically created and bookmarks with the same folder name are grouped together. You cannot nest folders.";
          };
        };
      }));
      default = null;
      description = "Add bookmarks in either the bookmarks toolbar or menu.";
    };

    DefaultDownloadDirectory = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Set the default download directory.";
    };

    DisableAppUpdate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Turn off application updates.";
    };

    DisableBuiltinPDFViewer = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable the built in PDF viewer. PDF files are downloaded and sent externally.";
    };

    PDFjs = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Enabled = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If Enabled is set to false, the built-in PDF viewer is disabled.";
          };
          EnablePermissions = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If EnablePermissions is set to true, the built-in PDF viewer will honor document permissions like preventing the copying of text.";
          };
        };
      });
      default = null;
      description = "Disable or configure PDF.js, the built-in PDF viewer.";
    };

    DisableDeveloperTools = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Remove access to all developer tools.";
    };

    DisableFeedbackCommands = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable the menus for reporting sites (Submit Feedback, Report Deceptive Site).";
    };

    DisableFirefoxAccounts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable Firefox Accounts integration (Sync).";
    };

    DisableFirefoxScreenshots = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Remove access to Firefox Screenshots.";
    };

    DisableFirefoxStudies = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable Firefox studies (Shield).";
    };

    DisableForgetButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable the \"Forget\" button.";
    };

    DisableMasterPasswordCreation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Remove the master password functionality. If this preference is set to true, the master password functionality is removed.";
    };

    PrimaryPassword = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Require or prevent using a primary (formerly master) password. If this value is true, a primary password is required.";
    };

    DisablePocket = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Remove Pocket in the Firefox UI.";
    };

    DisablePrivateBrowsing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Remove access to private browsing.";
    };

    DisableProfileImport = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables the \"Import data from another browser\" option in the bookmarks window.";
    };

    DisableProfileRefresh = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable the Refresh Firefox button on about:support and support.mozilla.org, as well as the prompt that displays offering to refresh Firefox when you haven't used it in a while.";
    };

    DisableSafeMode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable safe mode within the browser.";
    };

    DisableSetDesktopBackground = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This preference removes the \"Set As Desktop Background...\" menu item when right clicking on an image.";
    };

    DisplayMenuBar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set the initial state of the menubar. A user can still hide it and it will stay hidden.";
    };

    DisableSystemAddonUpdate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Prevent system add-ons from being installed or update.";
    };

    DisplayBookmarksToolbar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set the initial state of the bookmarks toolbar. A user can still hide it and it will stay hidden.";
    };

    DontCheckDefaultBrowser = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Don't check if Firefox is the default browser at startup.";
    };

    DownloadDirectory = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Set and lock the download directory.";
    };

    Extensions = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Install = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "A list of URLs or native paths for extensions to be installed.";
          };
          Uninstall = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "A list of extension IDs that should be uninstalled if found.";
          };
          Locked = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "A list of extension IDs that the user cannot disable or uninstall.";
          };
        };
      });
      default = null;
      description = "Control the installation, uninstallation and locking of extensions. Locked extensions cannot be disabled or uninstalled. For Install, you specify a list of URLs or paths. For Uninstall and Locked, you specify extension IDs.";
    };

    ExtensionSettings = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          __key__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Extension ID";
          };
          __value__ = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                installation_mode = lib.mkOption {
                  type = types.nullOr (types.enum [ "allowed" "blocked" "force_installed" "normal_installed" ]);
                  default = null;
                  description = "Maps to a string indicating the installation mode for the extension.";
                };
                install_url = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Maps to a string indicating where Firefox can download a force_installed or normal_installed extension. If installing from the addons.mozilla.org, use the following URL (substituting SHORT_NAME from the URL on AMO), https://addons.mozilla.org/firefox/downloads/latest/SHORT_NAME/latest.xpi. If installing from the local file system, use a file:/// URL. Languages packs are available from https://releases.mozilla.org/pub/firefox/releases/VERSION/PLATFORM/xpi/LANGUAGE.xpi.";
                };
                install_sources = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Each item in this list is an extension-style match pattern.";
                };
                allowed_types = lib.mkOption {
                  type = types.nullOr (types.listOf (types.enum [ "extension" "theme" "dictionary" "langpack" ]));
                  default = null;
                  description = "This setting allowlists the allowed types of extension/apps that can be installed in Firefox.";
                };
                blocked_install_message = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "This maps to a string specifying the error message to display to users if they're blocked from installing an extension.";
                };
                restricted_domains = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "An array of domains on which content scripts can't be run.";
                };
                updates_disabled = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "Indicates whether or not to disable automatic updates for an individual extension.";
                };
              };
            });
            default = null;
          };
        };
      });
      default = null;
      description = "Manage all aspects of extensions. A default configuration can be set for the special ID \"*\", which will apply to all extensions that don't have a custom configuration set in this policy.";
    };

    ExtensionUpdate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Extension Update";
    };

    _3rdparty = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Extensions = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                __key__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Extension ID";
                };
                __value__ = lib.mkOption {
                  type = types.nullOr (types.attrsOf types.anything);
                  default = null;
                  description = "Extension Configuration";
                };
              };
            });
            default = null;
            description = "Configure third party extensions. Keys in this dictionary specify IDs of extensions to configure, and values are dictionaries containing each third party extension configuration.";
          };
        };
      });
      default = null;
      description = "Configure third party components.";
    };

    EncryptedMediaExtensions = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Enabled = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If Enabled is set to false, encrypted media extensions (like Widevine) are not downloaded by Firefox unless the user consents to installing them.";
          };
          Locked = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If Locked is set to true and Enabled is set to false, Firefox will not download encrypted media extensions (like Widevine) or ask the user to install them.";
          };
        };
      });
      default = null;
      description = "Enable or disable Encrypted Media Extensions and optionally lock it.";
    };

    HardwareAcceleration = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Control hardware acceleration.";
    };

    FirefoxHome = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Search = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Search";
          };
          TopSites = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "TopSites";
          };
          SponsoredTopSites = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Sponsored Top Sites";
          };
          Highlights = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Highlights";
          };
          Pocket = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Pocket";
          };
          SponsoredPocket = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Sponsored Pocket";
          };
          Snippets = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Snippets";
          };
          Locked = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Locked";
          };
        };
      });
      default = null;
      description = "Customize the Firefox Home page.";
    };

    GenerativeAI = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Enabled = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Controls whether generative AI features are enabled by default";
          };
          Chatbot = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Controls access to AI chatbots in the sidebar";
          };
          LinkPreviews = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Controls whether AI is used to generate link previews";
          };
          TabGroups = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Controls whether AI is used to suggest names and tabs for tab groups";
          };
          Locked = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Prevents the user from changing generative AI preferences";
          };
        };
      });
      default = null;
      description = "Configure generative AI features";
    };

    Homepage = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          URL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Optional. Set the default home page.";
          };
          Additional = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Optional. Set additional homepages.";
          };
          StartPage = lib.mkOption {
            type = types.nullOr (types.enum [ "none" "homepage" "homepage-locked" "previous-session" ]);
            default = null;
            description = "Optional. This preference sets what displays when Firefox starts. It can be the homepage, the previous session, or a blank page.";
          };
          Locked = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If true, prevents the user from changing homepage preferences.";
          };
        };
      });
      default = null;
      description = "Configure the default homepage and how Firefox starts.";
    };

    ShowHomeButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show the home button on the toolbar.";
    };

    LocalFileLinks = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Enable linking to local files by origin";
    };

    NewTabPage = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable or disable the New Tab page.";
    };

    NoDefaultBookmarks = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable the creation of default bookmarks.";
    };

    OverrideFirstRunPage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Override the first run page. If the value is blank, no first run page is displayed. Starting with Firefox 83, Firefox ESR 78.5, you can also specify multiple URLS separated by a vertical bar (|).";
    };

    OverridePostUpdatePage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Override the upgrade page. If the value is blank, no upgrade page is displayed.";
    };

    PictureInPicture = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Enabled = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          Locked = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
        };
      });
      default = null;
      description = "Enable or disable Picture-in-Picture.";
    };

    PromptForDownloadLocation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Ask where to save each file before downloading.";
    };

    RequestedLocales = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "ach" "af" "sq" "ar" "an" "hy-AM" "as" "ast" "az" "eu" "be" "bn-BD" "bn-IN" "bs" "br" "bg" "my" "ca" "zh-CN" "zh-TW" "hr" "cs" "da" "nl" "en-GB" "en-CA" "en-ZA" "en-US" "eo" "et" "fi" "fr" "fy-NL" "ff" "gd" "gl" "ka" "de" "el" "gn" "gu-IN" "he" "hi-IN" "hu" "is" "id" "ia" "ga-IE" "it" "ja" "kab" "kn" "cak" "kk" "km" "ko" "lv" "lij" "lt" "dsb" "mk" "mai" "ms" "ml" "mr" "ne-NP" "nb-NO" "nn-NO" "oc" "or" "fa" "pl" "pt-BR" "pt-PT" "pa-IN" "ro" "rm" "ru" "sr" "si" "sk" "sl" "son" "es-AR" "es-CL" "es-MX" "es-ES" "sv-SE" "ta" "te" "th" "tr" "uk" "hsb" "ur" "uz" "vi" "cy" "xh" ]));
      default = null;
      description = "Set the the list of requested locales for the application in order of preference. It will cause the corresponding language pack to become active.";
    };

    SanitizeOnShutdown = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Cache = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          Cookies = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          Downloads = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          FormData = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Form Data";
          };
          History = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          Sessions = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          SiteSettings = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Site Settings";
          };
          OfflineApps = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Offline Apps";
          };
          Locked = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
        };
      });
      default = null;
      description = "Clear data on shutdown. Choose from Cache, Cookies, Download History, Form & Search History, Browsing History, Active Logins, Site Preferences and Offline Website Data.";
    };

    SearchBar = lib.mkOption {
      type = types.nullOr (types.enum [ "separate" "unified" ]);
      default = null;
      description = "Set whether or not search bar is displayed.";
    };

    SearchEngines = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Default = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Set the default search engine. This policy is only available on the ESR.";
          };
          PreventInstalls = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Prevent installing search engines from webpages. This policy is only available on the ESR.";
          };
          Remove = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Hide built-in search engines. This policy is only available on the ESR.";
          };
          Add = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Name = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Name of the search engine";
                };
                URLTemplate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                };
                Method = lib.mkOption {
                  type = types.nullOr (types.enum [ "GET" "POST" ]);
                  default = null;
                };
                IconURL = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "URL for the icon to use";
                };
                Alias = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "keyword to use for the engine";
                };
                Description = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Description of the search engine.";
                };
                PostData = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "POST data as name value pairs separated by '&'";
                };
                SuggestURLTemplate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Search suggestions URL with {searchTerms} to substitute for the search term.";
                };
                Encoding = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The query charset for the engine.";
                };
              };
            }));
            default = null;
            description = "Add new search engines. This policy is only available on the ESR.";
          };
        };
      });
      default = null;
      description = "Set whether or not search bar is displayed.";
    };

    SearchSuggestEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable search suggestions.";
    };

    Handlers = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          mimeTypes = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                __key__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types";
                };
                __value__ = lib.mkOption {
                  type = types.nullOr (types.submodule {
                    options = {
                      action = lib.mkOption {
                        type = types.nullOr (types.enum [ "saveToDisk" "useHelperApp" "useSystemDefault" ]);
                        default = null;
                        description = "Can be either saveToDisk, useHelperApp, useSystemDefault.";
                      };
                      ask = lib.mkOption {
                        type = types.nullOr (types.bool);
                        default = null;
                        description = "If true, the user is asked if what they want to do with the file. If false, the action is taken without user intervention.";
                      };
                    };
                  });
                  default = null;
                };
              };
            });
            default = null;
            description = "Specify MIME types. More info here: https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types";
          };
          schemes = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                action = lib.mkOption {
                  type = types.nullOr (types.enum [ "saveToDisk" "useHelperApp" "useSystemDefault" ]);
                  default = null;
                  description = "Can be either saveToDisk, useHelperApp, useSystemDefault.";
                };
                ask = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If true, the user is asked if what they want to do with the file. If false, the action is taken without user intervention.";
                };
                handlers = lib.mkOption {
                  type = types.nullOr (types.listOf (types.submodule {
                    options = {
                      name = lib.mkOption {
                        type = types.nullOr (types.str);
                        default = null;
                        description = "The display name of the handler (might not be used).";
                      };
                      path = lib.mkOption {
                        type = types.nullOr (types.str);
                        default = null;
                        description = "The native path to the executable to be used.";
                      };
                      uriTemplate = lib.mkOption {
                        type = types.nullOr (types.str);
                        default = null;
                        description = "A url to a web based application handler. The URL must be https and contain a %s to be used for substitution.";
                      };
                    };
                  }));
                  default = null;
                  description = "An array of handlers with the first one being the default. If you don't want to have a default handler, use an empty object for the first handler. Choose between path or uriTemplate.";
                };
              };
            });
            default = null;
            description = "Schemes";
          };
          extensions = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                action = lib.mkOption {
                  type = types.nullOr (types.enum [ "saveToDisk" "useHelperApp" "useSystemDefault" ]);
                  default = null;
                  description = "Can be either saveToDisk, useHelperApp, useSystemDefault.";
                };
                ask = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If true, the user is asked if what they want to do with the file. If false, the action is taken without user intervention.";
                };
                handlers = lib.mkOption {
                  type = types.nullOr (types.listOf (types.submodule {
                    options = {
                      name = lib.mkOption {
                        type = types.nullOr (types.str);
                        default = null;
                        description = "The display name of the handler (might not be used).";
                      };
                      path = lib.mkOption {
                        type = types.nullOr (types.str);
                        default = null;
                        description = "The native path to the executable to be used.";
                      };
                      uriTemplate = lib.mkOption {
                        type = types.nullOr (types.str);
                        default = null;
                        description = "A url to a web based application handler. The URL must be https and contain a %s to be used for substitution.";
                      };
                    };
                  }));
                  default = null;
                  description = "An array of handlers with the first one being the default. If you don't want to have a default handler, use an empty object for the first handler. Choose between path or uriTemplate.";
                };
              };
            });
            default = null;
            description = "Extensions";
          };
        };
      });
      default = null;
      description = "Configure default application handlers. This policy is based on the internal format of handlers.json. You can configure handlers based on a mime type (mimeTypes), a file's extension (extensions), or a protocol (schemes).";
    };

    DisabledCiphers = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          TLS_DHE_RSA_WITH_AES_128_CBC_SHA = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          TLS_DHE_RSA_WITH_AES_256_CBC_SHA = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          TLS_RSA_WITH_AES_128_CBC_SHA = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          TLS_RSA_WITH_AES_256_CBC_SHA = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          TLS_RSA_WITH_AES_128_GCM_SHA256 = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          TLS_RSA_WITH_AES_256_GCM_SHA384 = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          TLS_RSA_WITH_3DES_EDE_CBC_SHA = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
        };
      });
      default = null;
      description = "Disable specific cryptographic ciphers. This policy was updated in Firefox 78 to allow enabling ciphers as well. Setting the value to true disables the cipher, setting the value to false enables the cipher. Previously setting the value to true or false disabled the cipher.";
    };

    DNSOverHTTPS = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Enabled = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Enable DNS over HTTPS.";
          };
          ProviderURL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "URL to an alternative DNS over HTTPS provider.";
          };
          Locked = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If this is true, DNS over HTTPS preferences cannot be changed.";
          };
          ExcludedDomains = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "List of excluded domains from DNS over HTTPS.";
          };
        };
      });
      default = null;
      description = "Configure DNS over HTTPS.";
    };

    Proxy = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Mode = lib.mkOption {
            type = types.nullOr (types.enum [ "none" "system" "manual" "autoDetect" "autoConfig" ]);
            default = null;
            description = "If this preference is enabled, you will be setting the proxy mode.";
          };
          Locked = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If this preference is enabled, Proxy preferences cannot be changed.";
          };
          AutoLogin = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If this preference is enabled, do not prompt for authentication if password is saved.";
          };
          UseProxyForDNS = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If this preference is enabled, you will use Proxy DNS when using SOCKS v5.";
          };
          HTTPProxy = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "HTTP Proxy URL.";
          };
          UseHTTPProxyForAllProtocols = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If this preference is enabled, use the HTTP proxy server for all protocols.";
          };
          SSLProxy = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "SSL Proxy URL.";
          };
          FTPProxy = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "FTP Proxy URL.";
          };
          SOCKSProxy = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "SOCKS Proxy URL.";
          };
          SOCKSVersion = lib.mkOption {
            type = types.nullOr (types.enum [ "4" "5" ]);
            default = null;
            description = "Select SOCKS Version.";
          };
          Passthrough = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Proxy bypass URLs.";
          };
          AutoConfigURL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Proxy bypass URLs.";
          };
        };
      });
      default = null;
      description = "Configure proxy settings. These settings correspond to the connection settings in Firefox preferences. To specify ports, append them to the hostnames with a colon (:).";
    };

    SSLVersionMin = lib.mkOption {
      type = types.nullOr (types.enum [ "tls1" "tls1.1" "tls1.2" "tls1.3" ]);
      default = null;
      description = "SSLVersionMin";
    };

    SSLVersionMax = lib.mkOption {
      type = types.nullOr (types.enum [ "tls1" "tls1.1" "tls1.2" "tls1.3" ]);
      default = null;
      description = "SSLVersionMax";
    };

    NetworkPrediction = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable or disable network prediction (DNS prefetching).";
    };

    Cookies = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Allow = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "A list of origins (not domains) where cookies are always allowed.";
          };
          AllowSession = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "A list of origins (not domains) where cookies are only allowed for the current session.";
          };
          Block = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "A list of origins (not domains) where cookies are always blocked.";
          };
          Behavior = lib.mkOption {
            type = types.nullOr (types.enum [ "accept" "reject-foreign" "reject" "limit-foreign" "reject-tracker" "reject-tracker-and-partition-foreign" ]);
            default = null;
            description = "This has been added replacing the existing options Default, AcceptThirdParty, and RejectTracker.";
          };
          BehaviorPrivateBrowsing = lib.mkOption {
            type = types.nullOr (types.enum [ "accept" "reject-foreign" "reject" "limit-foreign" "reject-tracker" "reject-tracker-and-partition-foreign" ]);
            default = null;
            description = "Behavior: Private Browsing";
          };
          Default = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "This sets the default value for \"Accept cookies from websites\".";
          };
          AcceptThirdParty = lib.mkOption {
            type = types.nullOr (types.enum [ "always" "never" "from-visited" ]);
            default = null;
            description = "This sets the default value for \"Accept third-party cookies\".";
          };
          ExpireAtSessionEnd = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "This determines when cookies expire.";
          };
          RejectTracker = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Only reject trackers.";
          };
          Locked = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If this is true, cookies preferences cannot be changed.";
          };
        };
      });
      default = null;
      description = "Configure cookie preferences.";
    };

    DisableFormHistory = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Turn off saving information on web forms and the search bar.";
    };

    DisablePasswordReveal = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Do not allow passwords to be shown in saved logins";
    };

    DisableTelemetry = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Prevent the upload of telemetry data.";
    };

    EnableTrackingProtection = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Value = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If Value is set to false, tracking protection is disabled and locked in both the regular browser and private browsing. If Value is set to true, tracking protection is enabled by default in both the regular browser and private browsing.";
          };
          Locked = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If this is true, Tracking Protection preferences cannot be changed.";
          };
          Cryptomining = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If Cryptomining is set to true, cryptomining scripts on websites are blocked.";
          };
          Fingerprinting = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If Fingerprinting is set to true, fingerprinting scripts on websites are blocked.";
          };
        };
      });
      default = null;
      description = "Configure tracking protection. If this policy is not configured, tracking protection is not enabled by default in the browser, but it is enabled by default in private browsing and the user can change it.";
    };

    FlashPlugin = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Allow = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "If this preference is enabled, sites on the allow list do not override Flash being completely disabled. Flash is activated by default for the domains indicated unless Flash is completely disabled. If a top level domain is specified (http://example.org), Flash is allowed for all subdomains as well.";
          };
          Block = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "If this preference is enabled, Flash is blocked for the domains indicated. If a top level domain is specified (http://example.org), Flash is blocked from all subdomains as well.";
          };
          Default = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If this is true, Flash preferences cannot be changed. If this is false, Flash is never activated on websites even if they are in the specified in the Allow list.";
          };
          Locked = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If this is true, Flash preferences cannot be changed.";
          };
        };
      });
      default = null;
      description = "Configure the default Flash plugin policy as well as origins for which Flash is allowed.";
    };

    InstallAddonsPermission = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Allow = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "If this preference is enabled, add-ons are always allowed for the domains indicated unless add-on install is disabled. If a top level domain is specified (http://example.org), add-ons are allowed for all subdomains as well.";
          };
          Default = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If this is set to false, add-ons cannot be installed by the user.";
          };
        };
      });
      default = null;
      description = "Configure the default extension install policy as well as origins for extension installs are allowed.";
    };

    OfferToSaveLogins = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Control whether or not Firefox offers to save passwords.";
    };

    OfferToSaveLoginsDefault = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Sets the default value of signon.rememberSignons without locking it.";
    };

    PasswordManagerEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Remove access to the password manager via preferences and blocks about:logins on Firefox 70.";
    };

    Permissions = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Camera = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Allow = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "If this preference is enabled, access to the camera is always allowed for the domains indicated. If this preference is disabled or not configured, the default camera preference is followed.";
                };
                Block = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "If this preference is enabled, access to the camera is blocked for the domains indicated. If this preference is disabled or not configured, access to the camera is not blocked by default.";
                };
                BlockNewRequests = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If this preference is enabled, sites that are not in the Allow preference will not be allowed to ask permission to access the camera. If this preference is disabled or not configured, any site that is not in the Block preference can ask permission to access the camera.";
                };
                Locked = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If this preference is enabled, camera preferences cannot be changed by the user. If this preference is disabled or not configured, the user can change their camera preferences.";
                };
              };
            });
            default = null;
            description = "This preference allows you to change the camera permissions.";
          };
          Microphone = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Allow = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "If this preference is enabled, access to the microphone is always allowed for the domains indicated. If this preference is disabled or not configured, the default microphone preference is followed.";
                };
                Block = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "If this preference is enabled, access to the microphone is blocked for the domains indicated. If this preference is disabled or not configured, access to the microphone is not blocked by default.";
                };
                BlockNewRequests = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If this preference is enabled, sites that are not in the Allow preference will not be allowed to ask permission to access the microphone. If this preference is disabled or not configured, any site that is not in the Block preference can ask permission to access the microphone.";
                };
                Locked = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If this preference is enabled, microphone preferences cannot be changed by the user. If this preference is disabled or not configured, the user can change their microphone preferences.";
                };
              };
            });
            default = null;
            description = "This preference allows you to change the microphone permissions.";
          };
          Location = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Allow = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "If this preference is enabled, access to location is always allowed for the domains indicated. If this preference is disabled or not configured, the default location preference is followed.";
                };
                Block = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "If this preference is enabled, access to location is blocked for the domains indicated. If this preference is disabled or not configured, access to location is not blocked by default.";
                };
                BlockNewRequests = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If this preference is enabled, sites that are not in the Allow preference will not be allowed to ask permission to access location. If this preference is disabled or not configured, any site that is not in the Block preference can ask permission to access the location.";
                };
                Locked = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If this preference is enabled, location preferences cannot be changed by the user. If this preference is disabled or not configured, the user can change their location preferences.";
                };
              };
            });
            default = null;
            description = "This preference allows you to change the location permissions.";
          };
          Notifications = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Allow = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "If this preference is enabled, notifications can always be sent for the domains indicated. If this preference is disabled or not configured, the default nofication preference is followed.";
                };
                Block = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "If this preference is enabled, notifications are always blocked for the domains indicated. If this preference is disabled or not configured, notifications are not blocked by default.";
                };
                BlockNewRequests = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If this preference is enabled, sites that are not in the Allow preference will not be allowed to ask permission to send notifications. If this preference is disabled or not configured, any site that is not in the Block preference can ask permission to send notifications.";
                };
                Locked = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If this preference is enabled, notification preferences cannot be changed by the user. If this preference is disabled or not configured, the user can change their notification preferences.";
                };
              };
            });
            default = null;
            description = "This preference allows you to change the notifications permissions.";
          };
          Autoplay = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Allow = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "If this preference is enabled, autoplay can always be enabled for the domains indicated. If this preference is disabled or not configured, the default autoplay preference is followed.";
                };
                Block = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "If this preference is enabled, autoplay are always blocked for the domains indicated. If this preference is disabled or not configured, autoplay is not blocked by default.";
                };
                Default = lib.mkOption {
                  type = types.nullOr (types.enum [ "allow-audio-video" "block-audio" "block-audio-video" ]);
                  default = null;
                  description = "Configures the default Autoplay behavior.";
                };
                Locked = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If this preference is enabled, autoplay preferences cannot be changed by the user. If this preference is disabled or not configured, the user can change their autoplay preferences.";
                };
              };
            });
            default = null;
            description = "This preference allows you to change the autoplay permissions.";
          };
          VirtualReality = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Allow = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "If this preference is enabled, access to virtual reality is always allowed for the domains indicated. If this preference is disabled or not configured, the default virtual reality preference is followed.";
                };
                Block = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "If this preference is enabled, access to virtual reality is blocked for the domains indicated. If this preference is disabled or not configured, access to the virtual reality is not blocked by default.";
                };
                BlockNewRequests = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If this preference is enabled, sites that are not in the Allow preference will not be allowed to ask permission to access virtual reality. If this preference is disabled or not configured, any site that is not in the Block preference can ask permission to access virtual reality.";
                };
                Locked = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If this preference is enabled, virtual reality preferences cannot be changed by the user. If this preference is disabled or not configured, the user can change their virtual reality preferences.";
                };
              };
            });
            default = null;
            description = "This preference allows you to change the virtual reality permissions.";
          };
        };
      });
      default = null;
      description = "Set permissions associated with camera, microphone, location, notifications, and autoplay.";
    };

    PopupBlocking = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Allow = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Specify the domains for which pop-up windows are always allowed. If a top level domain is specified (http://example.org), pop-up windows are allowed for all subdomains as well.";
          };
          Default = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If this is false, pop-up windows are allowed by default.";
          };
          Locked = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If this is true, pop-up blocking preferences cannot be changed.";
          };
        };
      });
      default = null;
      description = "Configure the default pop-up window policy as well as origins for which pop-up windows are allowed.";
    };

    Certificates = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          ImportEnterpriseRoots = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If this preference is enabled, Firefox will read certificates from the macOS keychain. If this preference is disabled or not configured, Firefox will not read certificates from the macOS keychain.";
          };
          Install = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "If this preference is enabled, Firefox will install the listed certificates. It will look in /Library/Application Support/Mozilla/Certificates and ~/Library/Application Support/Mozilla/Certificates.\n\nIf this preference is disabled or not configured, Firefox will not install additional certificates.\n\nStarting in Firefox 65, you can specify a fully qualified path (e.g. /Library/Company/cer1.der). If Firefox does not find something at your fully qualified path, it will search the default directories.";
          };
        };
      });
      default = null;
      description = "Trust certificates that have been added to the operating system certificate store by a user or administrator in the macOS Keychain.";
    };

    DisableSecurityBypass = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          InvalidCertificate = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Prevents adding an exception when an invalid certificate is shown. If this preference is enabled, the \"Add Exception\" button is not available when a certificate is invalid. This prevents the user from overriding the certificate error. If this preference is disabled or not configured, certificate errors can be overridden.";
          };
          SafeBrowsing = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Prevents selecting \"ignore the risk\" and visiting a harmful site anyway. If this preference is enabled, a user cannot bypass the warning and visit a harmful site. If this preference is disabled or not configured, a user can choose to visit a harmful site.";
          };
        };
      });
      default = null;
      description = "Prevent the user from bypassing security in certain cases.";
    };

    SecurityDevices = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          __key__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
          __value__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
        };
      });
      default = null;
      description = "Install PKCS #11 modules.";
    };

    UserMessaging = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          WhatsNew = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If enabled, remove the \"What's New\" icon and menuitem.";
          };
          ExtensionRecommendations = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If enabled, don't recommend extensions.";
          };
          FeatureRecommendations = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If enabled, don't recommend browser features.";
          };
          SkipOnboarding = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If enabled, don't show onboarding messages on the new tab page.";
          };
          UrlbarInterventions = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If enabled, don't offer Firefox specific suggestions in the URL bar.";
          };
        };
      });
      default = null;
      description = "Prevent installing search engines from webpages.";
    };

    LegacySameSiteCookieBehaviorEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable default legacy SameSite cookie behavior setting.";
    };

    LegacySameSiteCookieBehaviorEnabledForDomainList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Revert to legacy SameSite behavior for cookies on specified sites.";
    };

    WebsiteFilter = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Block = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "If this preference is enabled, you can specify match patterns that indicate sites to be blocked. The match patterns are documented at https://developer.mozilla.org/en-US/Add-ons/WebExtensions/Match_patterns. Only http/https addresses are supported at the moment. There is a 1000 entry limit. If this preference is disabled or not configured, no websites are blocked.";
          };
          Exceptions = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "If this preference is enabled, and the website filter is enabled, you can specify match patterns for sites you do not want to block. The match patterns are documented at https://developer.mozilla.org/en-US/Add-ons/WebExtensions/Match_patterns. Only http/https addresses are supported at the moment. There is a 1000 entry limit. If this preference is disabled or not configured, there are no exceptions to the website filter.";
          };
        };
      });
      default = null;
      description = "Block websites from being visited. The parameters take an array of Match Patterns, as documented in https://developer.mozilla.org/en-US/Add-ons/WebExtensions/Match_patterns. http/https addresses are supported as well as local file:// URLs. The arrays are limited to 1000 entries each.";
    };

    AllowedDomainsForApps = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Comma-separated list of domains allowed to access Google Workspace. This policy is based on the Chrome policy of the same name. If this policy is enabled, users can only access Google Workspace using accounts from the specified domains. If you want to allow Gmail, you can add 'consumer_accounts' to the list.";
    };

    AutoLaunchProtocolsFromOrigins = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          protocol = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The protocol to allow for specified URLs.";
          };
          allowed_origins = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "The protocol to allow for specified URLs.";
          };
        };
      }));
      default = null;
      description = "Comma-separated list of domains allowed to access Google Workspace. This policy is based on the Chrome policy of the same name. If this policy is enabled, users can only access Google Workspace using accounts from the specified domains. If you want to allow Gmail, you can add 'consumer_accounts' to the list.";
    };

    CaptivePortal = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable or disable the detection of captive portals.";
    };

    Preferences = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          "accessibility.force_disabled" = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "If set to 1, platform accessibility is disabled.";
          };
          "app.update.auto" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, Firefox doesn't automatically install update.";
          };
          "browser.bookmarks.autoExportHTML" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If true, bookmarks are exported on shutdown.";
          };
          "browser.bookmarks.file" = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = " If set, the name of the file where bookmarks are exported and imported.";
          };
          "browser.bookmarks.restore_default_bookmarks" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If true, bookmarks are restored to their defaults.";
          };
          "browser.cache.disk.enable" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, don't store cache on the hard drive.";
          };
          "browser.cache.disk.parent_directory" = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "If set, changes the location of the disk cache.";
          };
          "browser.fixup.dns_first_for_single_words" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If true, single words are sent to DNS, not directly to search.";
          };
          "browser.newtabpage.activity_stream.default.sites" = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "If set, a list of URLs to use as the default top sites on the new tab page.";
          };
          "browser.places.importBookmarksHTML" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If true, bookmarks are always imported on startup.";
          };
          "browser.safebrowsing.malware.enabled" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, malware protection is not enabled (Not recommended)";
          };
          "browser.safebrowsing.phishing.enabled" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, phishing protection is not enabled (Not recommended)";
          };
          "browser.search.update" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, updates for search engines are not checked.";
          };
          "browser.slowStartup.notificationDisabled" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = " If true, a notification isn't shown if startup is slow.";
          };
          "browser.tabs.warnOnClose" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, there is no warning when the browser is closed.";
          };
          "browser.taskbar.previews.enable" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If true, tab previews are shown in the Windows taskbar.";
          };
          "browser.urlbar.suggest.bookmark" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, bookmarks aren't suggested when typing in the URL bar.";
          };
          "browser.urlbar.suggest.history" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, history isn't suggested when typing in the URL bar.";
          };
          "browser.urlbar.suggest.openpage" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, open tabs aren't suggested when typing in the URL bar.";
          };
          "datareporting.policy.dataSubmissionPolicyBypassNotification" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If true, don't show the privacy policy tab on first run.";
          };
          "dom.allow_scripts_to_close_windows" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, web page can close windows.";
          };
          "dom.disable_window_flip" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, web pages can focus and activate windows.";
          };
          "dom.disable_window_move_resize" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If true, web pages can't move or resize windows.";
          };
          "dom.event.contextmenu.enabled" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, web pages can't override context menus.";
          };
          "dom.keyboardevent.keypress.hack.dispatch_non_printable_keys.addl" = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "See https://support.mozilla.org/en-US/kb/dom-events-changes-introduced-firefox-66";
          };
          "dom.keyboardevent.keypress.hack.use_legacy_keycode_and_charcode.addl" = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "See https://support.mozilla.org/en-US/kb/dom-events-changes-introduced-firefox-66";
          };
          "extensions.blocklist.enabled" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, the extensions blocklist is not used (Not recommended)";
          };
          "extensions.getAddons.showPane" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, the Recommendations tab is not displayed in the Add-ons Manager.";
          };
          "extensions.htmlaboutaddons.recommendations.enabled" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, recommendations are not shown on the Extensions tab in the Add-ons Manager.";
          };
          "geo.enabled" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, the geolocation API is disabled.";
          };
          "intl.accept_languages" = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "If set, preferred language for web pages.";
          };
          "media.eme.enabled" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, Encrypted Media Extensions are not enabled.";
          };
          "media.gmp_gmpopenh264.enabled" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, the OpenH264 plugin is not downloaded.";
          };
          "media.gmp_widevinecdm.enabled" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, the Widevine plugin is not downloaded.";
          };
          "media.peerconnection.enabled" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, WebRTC is disabled";
          };
          "media.peerconnection.ice.obfuscate_host_addresses.blocklist" = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "If set, a list of domains for which mDNS hostname obfuscation is disabled.";
          };
          "network.dns.disableIPv6" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If true, IPv6 DNS lokoups are disabled.";
          };
          "network.IDN_show_punycode" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If true, display the punycode version of internationalized domain names.";
          };
          "places.history.enabled" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, history is not enabled.";
          };
          "print.save_print_settings" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, print settings are not saved between jobs.";
          };
          "security.default_personal_cert" = lib.mkOption {
            type = types.nullOr (types.enum [ "Ask Every Time" "Select Automatically" ]);
            default = null;
            description = "If set to \"Select Automatically\", Firefox automatically chooses the default personal certificate. Other possible option is \"Ask Every Time\".";
          };
          "security.mixed_content.block_active_content" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, mixed active content (HTTP and HTTPS) is not blocked.";
          };
          "security.osclientcerts.autoload" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If true, client certificates are loaded from the operating system certificate store.";
          };
          "security.ssl.errorReporting.enabled" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, SSL errors cannot be sent to Mozilla.";
          };
          "security.tls.hello_downgrade_check" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, the TLS 1.3 downgrade check is disabled.";
          };
          "security.tls.enable_0rtt_data" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If false, TLS early data is turned off.";
          };
          "security.tls.version.enable_deprecated" = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If true, browser will accept TLS 1.0. and TLS 1.1.";
          };
          "widget.content.gtk_theme_override" = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "If set, overrides the GTK theme for widgets.";
          };
        };
      });
      default = null;
      description = "Set and lock certain preferences.";
    };

    SupportMenu = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Title = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Title";
          };
          URL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "URL";
          };
          AccessKey = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "AccessKey";
          };
        };
      });
      default = null;
      description = "Adds a menuitem to the help menu for specifying support information.";
    };

    MicrosoftEntraSSO = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If this policy is set to true, Firefox will use credentials stored in the Company Portal to sign in to Microsoft Entra accounts. Affects `network.http.microsoft-entra-sso.enabled`.";
    };

  };
}