# Auto-generated from ProfileManifests: com.apple.webcontent-filter.plist
# Domain: com.apple.webcontent-filter
# Title: Web Content Filter
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-webcontent-filter" = {
    enable = lib.mkEnableOption "Web Content Filter";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.webcontent-filter";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    FilterType = lib.mkOption {
      type = types.nullOr (types.enum [ "BuiltIn" "Plugin" ]);
      default = "BuiltIn";
      description = "The type of filter, built-in or plug-in. In macOS, the system only supports the plug-in value.";
    };

    FilterGrade = lib.mkOption {
      type = types.nullOr (types.enum [ "firewall" "inspector" ]);
      default = "firewall";
      description = "The system uses this value to derive the relative order of content filters. Filters with a grade of 'firewall' see network traffic before filters with a grade of 'inspector'. However, the system doesn't define the order of filters within a grade.";
    };

    AutoFilterEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables automatic filtering. Use when 'FilterType' is 'BuiltIn'.";
    };

    PermittedURLs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array or URLs that are accessible whether or not the automatic filter allows access. Use when 'FilterType' is 'BuiltIn'. Requires that 'AutoFilterEnabled' is 'true'.";
    };

    FilterBrowsers = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables filtering WebKit traffic. Use when 'FilterType' is 'Plugin'.\n\nNote:\nAt least one of 'FilterBrowsers' or 'FilterSockets' needs to be 'true'.";
    };

    AllowListBookmarks = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          URL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The URL of the bookmark in the allow list.";
          };
          Title = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The title of the bookmark.";
          };
        };
      }));
      default = null;
      description = "An array of dictionaries that define the pages that the user can bookmark or visit. Use when 'FilterType' is 'BuiltIn'.";
    };

    WhitelistedBookmarks = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          URL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The URL of the bookmark in the allow list.";
          };
          Title = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The title of the bookmark.";
          };
        };
      }));
      default = null;
      description = "Use 'AllowListBookmarks' instead.";
    };

    DenyListURLs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of URLs that are inaccessible. Use when 'FilterType' is 'BuiltIn'. Limit the number of these URLs to no more than 500.";
    };

    BlacklistedURLs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Use 'DenyListURLs' instead.";
    };

    UserDefinedName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The display name for this filtering configuration. Required when 'FilterType' is 'Plugin'.";
    };

    PluginBundleID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The bundle ID of the plug-in that provides filtering service. Required when 'FilterType' is 'Plugin'. Otherwise, it ignores this value. Consult your filtering solution vendor to determine what to specify for this value. Required when 'FilterType' is 'Plugin'.";
    };

    ServerAddress = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The server address, which may be the IP address, hostname, or URL. Use when 'FilterType' is 'Plugin'.";
    };

    UserName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user name for the service. Use when 'FilterType' is 'Plugin'.";
    };

    Password = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The password for the service. Use when 'FilterType' is 'Plugin'.";
    };

    Organization = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The organization string to pass to the third-party plug-in. Use when 'FilterType' is 'Plugin'.";
    };

    FilterSockets = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', enables the filtering of socket traffic. Use when 'FilterType' is 'Plugin'.\n\nNote:\nAt least one of 'FilterBrowsers' or 'FilterSockets' needs to be 'true'.";
    };

    FilterDataProviderBundleIdentifier = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The bundle identifier string of the filter data provider system extension. This string identifies the filter data provider when the filter starts running. Required if 'FilterSockets' is 'true'.";
    };

    FilterDataProviderDesignatedRequirement = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The designated requirement string that the system embeds in the code signature of the filter data provider system extension. This string identifies the filter data provider when the filter starts running. Required if 'FilterSockets' is 'true'.";
    };

    FilterPackets = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true' and 'FilterType' is 'Plugin', the system enables filtering network packets. Use when 'FilterType' is 'Plugin'.\n\nNote:\nAt least one of 'FilterPackets' or 'FilterSockets' needs to be 'true'.";
    };

    FilterPacketProviderBundleIdentifier = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The bundle identifier string of the filter packet provider system extension. This string identifies the filter packet provider when the filter starts running. Required if 'FilterPackets' is 'true'.";
    };

    FilterPacketProviderDesignatedRequirement = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The designated requirement string that the system embeds in the code signature of the filter packet provider system extension. This string identifies the filter packet provider when the filter starts running. Required if 'FilterPackets' is 'true'.";
    };

    VendorConfig = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          __key__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Vendor Custom Key Name";
          };
          __value__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The custom key/value pairs for the filtering service.";
          };
        };
      });
      default = null;
      description = "The custom dictionary that the filtering service plug-in needs. Use when 'FilterType' is 'Plugin'.";
    };

    ContentFilterUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A globally unique identifier for this content filter configuration. The content filter processes network traffic for managed apps with the same 'ContentFilterUUID' in their app attributes. Use when 'FilterType' is 'Plugin'.This key must be present for unsupervised devices and user enrollment.";
    };

    HideDenyListURLs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the device hides the 'DenyListURLs' item in the profiles that display in Settings > General > VPN & Device Management.";
    };

    FilterURLs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system filters URL requests. Use when 'FilterType' is 'Plugin'. Available in iOS 26 and macOS 26, and later.";
    };

    URLFilterParameters = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          URLFilterControlProviderDesignatedRequirement = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The designated requirement string in the code signature of the URL filter control provider app extension. The system uses this string to identify the URL filter control provider when the filter starts running. Required in macOS.";
          };
          URLFilterControlProviderBundleIdentifier = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The bundle identifier string of the URL filter control provider app extension. The system uses this string to identify the URL filter control provider when the filter starts running.";
          };
          PIRServerURL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The URL containing the domain name of the private information retrieval server.";
          };
          PIRPrivacyPassIssuerURL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The URL containing the domain name of Privacy Pass Issuer.";
          };
          PIRAuthenticationToken = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The per-user authentication token string, which is an HTTP bearer token for the person using your app. The system uses this token to attest that it is a valid user when requesting anonymous authentication tokens for PIR exchanges.";
          };
          URLFilterFailClosed = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "If 'true', the system blocks URLs if the filter is enabled, but it fails to make any filtering decision; for example, if there's a communication failure with the PIR server. If 'false', the system allows URLs if the filter is enabled, but it fails to make any filtering decision.";
          };
          URLPrefilterFetchFrequency = lib.mkOption {
            type = types.nullOr (types.int);
            default = 86400;
            description = "The time interval in seconds that the system uses to periodically run the 'NEURLFilterControlProvider' app extension. The default value is 86400 seconds (1 day). The minimum allowed value is 2700 seconds (45 minutes). The system allows 'NEURLFilterControlProvider' implementations to download prefilter Bloom filter data onto the device periodically at the specified interval. Implementations need to allow for a slight difference between the scheduled time and the actual runtime of the task, due to the scheduling mechanism on the system.";
          };
        };
      });
      default = null;
      description = "A dictionary containing URL filter parameters. Required when 'FilterURLs' is 'true'. Available in iOS 26 and macOS 26 and later.";
    };

    SafariHistoryRetentionEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'true', this payload enforces a policy which requires retention of browsing history. This causes Safari to disable clearing of browsing history, and prevents the use of private browsing mode because that mode doesn't keep browsing history.";
    };

  };
}