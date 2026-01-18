# Auto-generated from ProfileManifests: com.apple.AssetCache.managed.plist
# Domain: com.apple.AssetCache.managed
# Title: Content Caching
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-AssetCache-managed" = {
    enable = lib.mkEnableOption "Content Caching";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.AssetCache.managed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AutoActivation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system automatically activates the content cache when possible and prevents disabling it. If 'allowContentCaching' is 'false', 'AutoActivation' is also 'false'.\n\nRemoving a profile that set 'AutoActivation' to 'true' doesn't deactivate the Content Cache.";
    };

    CacheLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The maximum number of bytes of disk space to use for the content cache. Set to '0' for unlimited disk space.";
    };

    AllowPersonalCaching = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system caches the user's iCloud data. Changes to this value don't have an immediate effect. Clients may take some time, such as hours or days, to react to changes.\n\nNote:\nAt least one of the 'AllowPersonalCaching' or 'AllowSharedCaching' keys need to be 'true'.";
    };

    PersonalCacheLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Max Personal Cache Size";
    };

    AllowSharedCaching = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system caches non-iCloud content, such as apps and software updates. Changes to this value don't have an immediate effect. Clients may take some time, such as hours or days, to react to changes.\n\nNote:\nAt least one of the 'AllowPersonalCaching' or 'AllowSharedCaching' keys need to be 'true'.";
    };

    AutoEnableTetheredCaching = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system automatically enables Internet connection sharing when possible and prevent disabling Internet connection sharing. 'DenyTetheredCaching' overrides 'AutoEnableTetheredCaching'. Tethered caching requires Content Caching.\n\nAvailable in macOS 10.15.4 and later.";
    };

    Port = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The TCP port number on which the content cache accepts requests for uploads or downloads. Set to '0' to pick a random, available port.";
    };

    DataPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The path to the directory used to store cached content. Changing this setting manually doesn't automatically move cached content from the old location to the new one. To move content automatically, use the Sharing preference's Content Caching pane. The value must be (or end with) '/Library/Application Support/Apple/AssetCache/Data'.\n\nThe system creates a directory and its intermediates for the given data path if it doesn't already exist. The directory is owned by '_assetcache:_assetcache' and has mode 0750. Its immediate parent directory ('.../Library/Application Support/Apple/AssetCache') is owned by '_assetcache:_assetcache' and has mode '0755'.";
    };

    DenyTetheredCaching = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system disables tethered caching.";
    };

    LogClientIdentity = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the Content Cache logs the IP address and port number of the clients that request content.";
    };

    Parents = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of the local IP addresses of other content caches that this cache should download from or upload to, instead of downloading from or uploading to Apple directly. The system ignores invalid addresses and addresses of computers that aren't content caches. The system skips Parent caches that become unavailable. If all parent content caches become unavailable, the content cache downloads from or uploads to Apple directly, until a parent content cache becomes available again.";
    };

    ParentSelectionPolicy = lib.mkOption {
      type = types.nullOr (types.enum [ "first-available" "url-path-hash" "random" "round-robin" "sticky-available" ]);
      default = null;
      description = "The policy to implement when choosing among more than one configured parent content cache. With every policy, the system skips parent caches that are temporarily unavailable. Allowed values:\n\n- 'first-available': Always use the first available parent in the Parents list. Use this policy to designate permanent primary, secondary, and subsequent parents.\n- 'url-path-hash': Hash the path part of the requested URL so that the same parent is always used for the same URL. This is useful for maximizing the size of the combined caches of     the parents.\n- 'random': Choose a parent at random. Use this policy for load balancing.\n- 'round-robin': Rotate through the parents in order. Use this policy for load balancing.\n- 'sticky-available': Use the first available parent in the Parents list until it becomes unavailable, then advance to the next one. Use this policy for designating floating primary, secondary, and subsequent parents.";
    };

    PublicRanges = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          type = lib.mkOption {
            type = types.nullOr (types.enum [ "IPv4" "IPv6" ]);
            default = null;
            description = "The IP address type.";
          };
          first = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The first IP address in the range.";
          };
          last = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The last IP address in the range.";
          };
        };
      }));
      default = null;
      description = "An array of dictionaries describing a range of public IP addresses that the cloud servers should use for matching clients to content caches.";
    };

    AllowCacheDelete = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If true, the system purges content from the cache automatically when it needs disk space for other apps when free disk space runs low on the computer. Set to 'false' to maximize effectiveness of Content Caching. Available in macOS 10.15 and later.";
    };

    DisplayAlerts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', Content Caching displays exceptional conditions (alerts) as system notifications in the upper corner of the screen. Alerts were automatically displayed starting in macOS 10.13. In macOS 10.15 the alerts are off by default, but still available through this setting. Available in macOS 10.15 and later.";
    };

    KeepAwake = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system prevents the computer from sleeping as long as Content Caching is on (System Preferences > Sharing > Content Caching is on). Customers who want Content Caching to be as available as much as possible should turn this setting on. Available in macOS 10.15 and later.";
    };

    AgeForLowSpaceAlert = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Low Space Alert";
    };

    AllowImports = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow Imports";
    };

    AllowWirelessPortable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow Laptop Wireless Caching";
    };

    DatabaseUpdateInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Cache Database Update Interval";
    };

    DownloadMinRate = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Minimum Download Rate";
    };

    DownloadTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Download Timeout";
    };

    ImportMaxRate = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Max Import Rate";
    };

    ImportMinRate = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Min Import Rate";
    };

    ImportRateAttenuation = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "Import Rate Attenuation";
    };

    ImportTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Import Timeout";
    };

    Interface = lib.mkOption {
      type = types.nullOr (types.enum [ "Listen on all interfaces" "en0" "en1" "en2" ]);
      default = null;
    };

    ListenWithPeersAndParents = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the content cache provides content to the clients in the union of the 'ListenRanges', 'PeerListenRanges' and 'Parents'.";
    };

    MaxParentDepth = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Max Parent Depth";
    };

    MaxPeersToQuery = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Max Peers to Query";
    };

    MetricsInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Metrics Interval";
    };

    MetricsMaxAge = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Max Metrics Age";
    };

    OriginDownloadTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Origin Download Timeout";
    };

    OriginUploadTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Origin Upload Timeout";
    };

    ParentDownloadTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Parent Download Timeout";
    };

    ParentUploadTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Parent Upload Timeout";
    };

    ParentRetryInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Parent Retry Interval";
    };

    PruneAffinitiesAge = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Prune Affinities Cache Age";
    };

    PruneAffinitiesInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Prune Affinities Cache Interval";
    };

    PruneAssetsAge = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Prune Assets Age";
    };

    PruneAssetsInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Prune Assets Interval";
    };

    ReservedVolumeSpace = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Reserved Volume Size";
    };

    TerminationTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Termination Timeout";
    };

    Verbose = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    LocalSubnetsOnly = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the content cache offers content to clients only on the same immediate local network only. No content is offered to clients on other networks reachable by the content cache. If 'LocalSubnetsOnly' is 'true', the system ignores 'ListenRanges'.";
    };

    ListenRangesOnly = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the content cache provides content to the clients in the 'ListenRanges'.";
    };

    ListenRanges = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          type = lib.mkOption {
            type = types.nullOr (types.enum [ "IPv4" "IPv6" ]);
            default = null;
            description = "The IP address type.";
          };
          first = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The first IP address in the range.";
          };
          last = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The last IP address in the range.";
          };
        };
      }));
      default = null;
      description = "An array of dictionaries that describe a range of client IP addresses to serve.";
    };

    MaxConcurrentClients = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Max Concurrent Clients";
    };

    PeerLocalSubnetsOnly = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the content cache only peers with other content caches on the same immediate local network, rather than with content caches that use the same public IP address as the device. When 'PeerLocalSubnetsOnly' is 'true', it overrides the configuration of 'PeerFilterRanges' and 'PeerListenRanges'. If the network changes, the local network peering restrictions update appropriately. If 'false', the content cache defers to 'PeerFilterRanges' and 'PeerListenRanges' for configuring the peering restrictions.";
    };

    PeerFilterRanges = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          type = lib.mkOption {
            type = types.nullOr (types.enum [ "IPv4" "IPv6" ]);
            default = null;
            description = "The IP address type.";
          };
          first = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The first IP address in the range.";
          };
          last = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The last IP address in the range.";
          };
        };
      }));
      default = null;
      description = "An array of dictionaries describing a range of peer IP addresses that the content cache uses to filter its list of peers to query for content. The content cache only queries peers in 'PeerFilterRanges'. When 'PeerFilterRanges' is an empty array, the content cache doesn't query any peers.";
    };

    PeerListenRanges = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          type = lib.mkOption {
            type = types.nullOr (types.enum [ "IPv4" "IPv6" ]);
            default = null;
            description = "The IP address type.";
          };
          first = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The first IP address in the range.";
          };
          last = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The last IP address in the range.";
          };
        };
      }));
      default = null;
      description = "An array of dictionaries describing a range of peer IP addresses the content cache responds to. When 'PeerListenRanges' is an empty array, the content cache responds with an error to all cache queries.";
    };

    PeerDownloadTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Peer Download Timeout";
    };

    PeerNotifyTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Peer Notify Timeout";
    };

    PeerQueryTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Peer Query Timeout";
    };

    PeerRetryInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Peer Retry Interval";
    };

  };
}