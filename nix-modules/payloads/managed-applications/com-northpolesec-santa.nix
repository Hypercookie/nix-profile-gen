# Auto-generated from ProfileManifests: com.northpolesec.santa.plist
# Domain: com.northpolesec.santa
# Title: Santa (North Pole Security)
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Santa (North Pole Security)";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.northpolesec.santa";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
        description = "Whether macOS allows only one instance of this payload per profile.";
      };

      _displayName = lib.mkOption {
        internal = true;
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "PayloadDisplayName for this instance. Defaults to the domain.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "PFC_SegmentedControl_0" "ClientMode" "FailClosed" "FileChangesRegex" "FileChangesPrefixFilters" "Telemetry" "AllowedPathRegex" "BlockedPathRegex" "EnableBadSignatureProtection" "EnablePageZeroProtection" "EnableTransitiveRules" "StaticRules" "EnableSilentMode" "EnableSilentTTYMode" "EnableMenuItem" "AboutText" "MoreInfoURL" "EventDetailURL" "EventDetailText" "FileAccessEventDetailURL" "FileAccessEventDetailText" "UnknownBlockMessage" "DismissText" "BannedBlockMessage" "ModeNotificationMonitor" "ModeNotificationLockdown" "ModeNotificationStandalone" "BannedUSBBlockMessage" "RemountUSBBlockMessage" "FileAccessBlockMessage" "EnableNotificationSilences" "BrandingCompanyName" "BrandingCompanyLogo" "BrandingCompanyLogoDark" "FunFontsOnSpecificDays" "SyncBaseURL" "SyncEnableProtoTransfer" "SyncProxyConfiguration" "SyncEnableCleanSyncEventUpload" "ClientAuthCertificateFile" "ClientAuthCertificatePassword" "ClientAuthCertificateCN" "ClientAuthCertificateIssuerCN" "ServerAuthRootsData" "ServerAuthRootsFile" "MachineOwner" "MachineOwnerGroups" "MachineID" "MachineOwnerPlist" "MachineOwnerKey" "MachineOwnerGroupsKey" "MachineIDPlist" "MachineIDKey" "EnableAllEventUpload" "DisableUnknownEventUpload" "SyncClientContentEncoding" "SyncExtraHeaders" "EventLogType" "EventLogPath" "SpoolDirectory" "SpoolDirectoryFileSizeThresholdKB" "SpoolDirectorySizeThresholdMB" "SpoolDirectoryEventMaxFlushTimeSec" "EnableMachineIDDecoration" "EntitlementsPrefixFilter" "EntitlementsTeamIDFilter" "TelemetryFilterExpressions" "MetricFormat" "MetricURL" "MetricExportInterval" "MetricExportTimeout" "MetricExtraLabels" "EnableStandalonePasswordFallback" "IgnoreOtherEndpointSecurityClients" "EnableStatsCollection" "StatsOrganizationID" "AntiSuspendSigningIDs" "AllowedSantaCommands" "AllowDelegatedSignals" "FileAccessPolicyPlist" "FileAccessPolicy" "FileAccessPolicyUpdateIntervalSec" "OverrideFileAccessAction" "FileAccessGlobalLogsPerSec" "FileAccessGlobalWindowSizeSec" "RemovableMediaAction" "RemovableMediaRemountFlags" "EncryptedRemovableMediaAction" "EncryptedRemovableMediaRemountFlags" "OnStartUSBOptions" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      PFC_SegmentedControl_0 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      ClientMode = lib.mkOption {
        type = types.nullOr (types.enum [ 1 2 3 ]);
        default = null;
        description = "The client mode that Santa should operate in.";
      };

      FailClosed = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Deny execution in LOCKDOWN mode if there is an error reading or processing an executable file.";
      };

      FileChangesRegex = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Path regexes (ICU format) to monitor for file changes.";
      };

      FileChangesPrefixFilters = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Path prefixes to exclude from file change logging.";
      };

      Telemetry = lib.mkOption {
        type = types.nullOr (types.listOf (types.enum [ "Everything" "Execution" "Fork" "Exit" "Close" "Rename" "Unlink" "Link" "ExchangeData" "Disk" "Bundle" "Allowlist" "FileAccess" "CodesigningInvalidated" "LoginWindowSession" "LoginLogout" "ScreenSharing" "OpenSSH" "Authentication" "Clone" "Copyfile" "GatekeeperOverride" "LaunchItem" "TCCModification" "XProtect" "ProcSuspendResume" "None" ]));
        default = null;
        description = "Types of telemetry events that should be logged.";
      };

      AllowedPathRegex = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Path regexes (ICU format) of binaries to allow. Lower precedent than binary, certificate, and Team ID scopes.";
      };

      BlockedPathRegex = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Path regexes (ICU format) of binaries to block. Lower precedent than binary, certificate, and Team ID scopes.";
      };

      EnableBadSignatureProtection = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Block binaries with a bad signing chain, unless explicitly allowed.";
      };

      EnablePageZeroProtection = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Block 32-bit binaries missing the __PAGEZERO segment, unless explicitly allowed.";
      };

      EnableTransitiveRules = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Allow transitive rules created by compiler-type rules.";
      };

      StaticRules = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            identifier = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The identifier for this rule. The required format depends on rule_type:\n• BINARY / CERTIFICATE — SHA-256 hash (64 hex characters)\n• TEAMID — 10-character alphanumeric Team ID (e.g. ZMCG7MLDV9)\n• SIGNINGID — TeamID:SigningID (e.g. EQHXZ8M8AV:com.google.Chrome), or platform:SigningID for Apple platform binaries (e.g. platform:com.apple.curl)\n• CDHASH — Code Directory Hash (40 hex characters)";
            };
            rule_type = lib.mkOption {
              type = types.nullOr (types.enum [ "BINARY" "CERTIFICATE" "TEAMID" "SIGNINGID" "CDHASH" ]);
              default = null;
              description = "The type of rule. Also determines the required format of the identifier and the rule's evaluation precedence: CDHash → Binary → SigningID → Certificate → TeamID.";
            };
            policy = lib.mkOption {
              type = types.nullOr (types.enum [ "ALLOWLIST" "ALLOWLIST_COMPILER" "BLOCKLIST" "SILENT_BLOCKLIST" "CEL" ]);
              default = null;
              description = "The action to take when this rule matches an execution. ALLOWLIST_COMPILER rules create transitive allow rules for files written by the matched process; if EnableTransitiveRules is false they are treated as ALLOWLIST. CEL rules evaluate the expression in cel_expr to make their decision.";
            };
            cel_expr = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "A CEL (Common Expression Language) expression to evaluate when this rule matches. Required when policy is CEL. The expression receives an ExecutionContext and must return either a ReturnValue or a bool (true = ALLOWLIST, false = BLOCKLIST).";
            };
            custom_msg = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Custom message to display in the block notification when this rule blocks an execution. Overrides the global BannedBlockMessage for this specific rule. Only applies to BLOCKLIST and SILENT_BLOCKLIST policies.";
            };
            custom_url = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "A custom URL for the block notification button, overriding the global EventDetailURL for this specific rule. Supports the same substitution placeholders as EventDetailURL (e.g. %file_identifier%, %machine_id%, %username%). Only applies to BLOCKLIST policies.";
            };
            comment = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "A freeform comment or note about this rule for documentation purposes. Ignored by Santa at runtime.";
            };
          };
        }));
        default = null;
        description = "A static set of rules that always apply to the host, taking precedence over any rules configured by a sync server. The intended use-case is a small hardcoded set of rules that every host needs, such as management tools — not as a general-purpose rule database.\n\nSetting this key (even to an empty array) also prevents local rule management via the santactl rule command.";
      };

      EnableSilentMode = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disable all GUI notifications.";
      };

      EnableSilentTTYMode = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disable all TTY (terminal) notifications.";
      };

      EnableMenuItem = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Show the Santa menu bar item.";
      };

      AboutText = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Custom text to display at launch.";
      };

      MoreInfoURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Optional \"More Info...\" link.";
      };

      EventDetailURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The URL to open when the user gets a block notification. If unset, the button will not be displayed. Can include the following variables for substitution:\n%file_identifier% - SHA-256 of the file that was blocked\n%bundle_or_file_identifier% - SHA-256 of the file that was blocked or the bundle containing it, if available\n%file_sha% - Deprecated, acts like bundle_or_file_identifier\n%machine_id% - ID of the machine\n%username% - The executing user\n%serial% - System's serial number\n%uuid% - System's UUID\n%hostname% - System's full hostname";
      };

      EventDetailText = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The text of the button for Event Detail URL.";
      };

      FileAccessEventDetailURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The URL to open when the user gets a file access block notification. If unset, the button will not be displayed. Can include the following variables for substitution:\n%rule_version% - Version of the rule that was violated\n%rule_name% - Name of the rule that was violated\n%accessed_path% - The path accessed by the binary\n%file_identifier% - SHA-256 of the binary that performed the access\n%username% - The executing user\n%team_id% - The Team ID that signed the binary, if any\n%signing_id% - The Signing ID of the binary, if any\n%cdhash% - The binary's CDHash, if any\n%machine_id% - ID of the machine\n%hostname% - System's full hostname\n%uuid% - System's UUID\n%serial% - System's serial number";
      };

      FileAccessEventDetailText = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The text of the button for File Access Event Detail URL.";
      };

      UnknownBlockMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Custom message when an unknown binary is blocked.";
      };

      DismissText = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The text to display on the button that dismisses the binary block dialog.";
      };

      BannedBlockMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Custom message when a binary is blocked by a rule.";
      };

      ModeNotificationMonitor = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Custom message when entering MONITOR mode.";
      };

      ModeNotificationLockdown = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Custom message when entering LOCKDOWN mode.";
      };

      ModeNotificationStandalone = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Custom message when entering STANDALONE mode. (undocumented)";
      };

      BannedUSBBlockMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Custom message when a Removable Media (e.g. USB device) is prevented from being mounted.";
      };

      RemountUSBBlockMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Custom message when a Removable Media (e.g. USB device) is allowed to be mounted with a subset of the requested flags as defined by RemountUSBMode.";
      };

      FileAccessBlockMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Custom message when a file access is blocked by a rule.";
      };

      EnableNotificationSilences = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Allow users to silence notifications.";
      };

      BrandingCompanyName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Company name displayed in Santa UI. For GUI windows, this setting is ignored if BrandingCompanyLogo is set.";
      };

      BrandingCompanyLogo = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "A URL referencing a logo image to display on Santa UIs. The image will be scaled down appropriately to fit within image bounds (currently 84x28 pixels). If set, this overrides BrandingCompanyName. Supported URL schemes: file:// and data:. HTTP/HTTPS URLs are not supported.";
      };

      BrandingCompanyLogoDark = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "A URL referencing a logo image to display on Santa UIs. When the UI is displayed in dark mode and this is set, it overrides both BrandingCompanyLogo and BrandingCompanyName. Supported URL schemes: file:// and data:. HTTP/HTTPS URLs are not supported.";
      };

      FunFontsOnSpecificDays = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable themed fonts and images on April 1, May 4 and October 31.";
      };

      SyncBaseURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      SyncEnableProtoTransfer = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable binary proto transfer for sync instead of JSON.";
      };

      SyncProxyConfiguration = lib.mkOption {
        type = types.nullOr (types.attrsOf types.anything);
        default = null;
        description = "Proxy configuration applied to all network requests made during syncing. This dictionary is passed directly to NSURLSessionConfiguration.connectionProxyDictionary. Keys are the kCFNetworkProxies* CFNetwork constants (e.g. HTTPEnable, HTTPProxy, HTTPPort, SOCKSEnable, ProxyAutoConfigURLString).";
      };

      SyncEnableCleanSyncEventUpload = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Upload events to the sync server even if a clean sync is requested.";
      };

      ClientAuthCertificateFile = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Location of a PKCS#12 certificate to be used for sync authentication.";
      };

      ClientAuthCertificatePassword = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      ClientAuthCertificateCN = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The Common Name of a certificate in the System keychain to be used for sync authentication.";
      };

      ClientAuthCertificateIssuerCN = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The Issuer Name of a certificate in the System keychain to be used for sync authentication.";
      };

      ServerAuthRootsData = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "X.509 certificate (.pem) for inclusion on device. A valid PEM containing one or more certificates to be used for certificate pinning.";
      };

      ServerAuthRootsFile = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Path to an on-disk X.509 certificate (.pem). A valid PEM containing one or more certificates to be used for certificate pinning.";
      };

      MachineOwner = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MachineOwnerGroups = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Groups the machine owner is a member of.";
      };

      MachineID = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MachineOwnerPlist = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The path to a plist that contains the MachineOwnerKey / value pair.";
      };

      MachineOwnerKey = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The key to use on Machine Owner Plist.";
      };

      MachineOwnerGroupsKey = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The key to use on MachineOwnerPlist to access defined groups.";
      };

      MachineIDPlist = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The path to a plist that contains the MachineIDKey / value pair.";
      };

      MachineIDKey = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The key to use on Machine ID Plist.";
      };

      EnableAllEventUpload = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Upload all execution events to the sync server, including those explicitly allowed.";
      };

      DisableUnknownEventUpload = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Do not upload events for executions of unknown binaries allowed in monitor mode.";
      };

      SyncClientContentEncoding = lib.mkOption {
        type = types.nullOr (types.enum [ "deflate" "gzip" "none" ]);
        default = null;
        description = "Content encoding used for sync requests.";
      };

      SyncExtraHeaders = lib.mkOption {
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
        description = "Dictionary of additional headers to include in all requests made to the sync server. System-managed headers such as Content-Length, Host, and WWW-Authenticate will be ignored.";
      };

      EventLogType = lib.mkOption {
        type = types.nullOr (types.enum [ "syslog" "file" "protobuf" "json" "null" ]);
        default = null;
        description = "Defines how event logs are stored. Allowed values: syslog, file, protobuf, json, null. Note: the protobuf and JSON formats are in BETA and subject to change.";
      };

      EventLogPath = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Path to the event log file (used for file/json logging).";
      };

      SpoolDirectory = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Base directory for protobuf maildir-like logs.";
      };

      SpoolDirectoryFileSizeThresholdKB = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Per-file size limit (KB) for protobuf spool files.";
      };

      SpoolDirectorySizeThresholdMB = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Total size limit (MB) for protobuf spool directory.";
      };

      SpoolDirectoryEventMaxFlushTimeSec = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Maximum time (seconds) events are buffered before flushing to disk.";
      };

      EnableMachineIDDecoration = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Appends the MachineID to the end of each log line if enabled.";
      };

      EntitlementsPrefixFilter = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Filters entitlements from execution telemetry by prefix. Entitlements are only logged when EventLogType is set to protobuf or json.";
      };

      EntitlementsTeamIDFilter = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Filters entitlements from execution telemetry by Team ID. Entitlements are only logged when EventLogType is set to protobuf or json.";
      };

      TelemetryFilterExpressions = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "CEL expressions for filtering or redacting telemetry before upload. Only useful for Workshop customers.";
      };

      MetricFormat = lib.mkOption {
        type = types.nullOr (types.enum [ "rawjson" "monarchjson" ]);
        default = null;
        description = "Format to export metrics as, supported formats are \"rawjson\" for a single JSON blob and \"monarchjson\" for a format consumable by Google's Monarch tooling.";
      };

      MetricURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "URL describing where monitoring metrics should be exported.";
      };

      MetricExportInterval = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Time (seconds) between exporting metrics.";
      };

      MetricExportTimeout = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Timeout (seconds) for exporting metrics.";
      };

      MetricExtraLabels = lib.mkOption {
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
        description = "A map of key value pairs to add to all metric root labels. If a previously set key (e.g. host_name) is set to \"\" then the key is removed from the metric root labels. Alternatively if a value is set for an existing key then the new value will override the old.";
      };

      EnableStandalonePasswordFallback = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable password authorization fallback for Standalone mode.";
      };

      IgnoreOtherEndpointSecurityClients = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Ignore events generated by other EndpointSecurity clients.";
      };

      EnableStatsCollection = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Send basic stats to North Pole Security";
      };

      StatsOrganizationID = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "North Pole Security customer ID for stats collection.";
      };

      AntiSuspendSigningIDs = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "A list of Signing IDs to protect from `pid_suspend` calls.";
      };

      AllowedSantaCommands = lib.mkOption {
        type = types.nullOr (types.listOf (types.enum [ "kill" "ping" "eventupload" ]));
        default = null;
        description = "Array of allowed Santa commands. If unset, all commands are allowed; if set to an empty array, no commands are allowed.";
      };

      AllowDelegatedSignals = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Allow signals delegated by launchd on behalf of Apple platform binaries targeting santad.";
      };

      FileAccessPolicyPlist = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Path to a file access configuration plist.";
      };

      FileAccessPolicy = lib.mkOption {
        type = types.nullOr (types.attrsOf types.anything);
        default = null;
        description = "A complete file access policy embedded directly in the Santa configuration. When set, FileAccessPolicyPlist is ignored.";
      };

      FileAccessPolicyUpdateIntervalSec = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "How often (in seconds) to re-read the file access policy config.";
      };

      OverrideFileAccessAction = lib.mkOption {
        type = types.nullOr (types.enum [ "AUDIT_ONLY" "DISABLE" "none" ]);
        default = null;
        description = "Global override for the enforcement of all file access policy rules.";
      };

      FileAccessGlobalLogsPerSec = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Average number of file access logs per second. Set to 0 to disable rate limiting.";
      };

      FileAccessGlobalWindowSizeSec = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Window size over which the log rate limit is applied. Set to 0 to disable rate limiting.";
      };

      RemovableMediaAction = lib.mkOption {
        type = types.nullOr (types.enum [ "Allow" "Block" "Remount" ]);
        default = null;
        description = "Action applied to all removable media devices.";
      };

      RemovableMediaRemountFlags = lib.mkOption {
        type = types.nullOr (types.listOf (types.enum [ "rdonly" "noexec" "nosuid" "nobrowse" "noowners" "nodev" "async" "-j" ]));
        default = null;
        description = "Mount flags applied when removable media is remounted.";
      };

      EncryptedRemovableMediaAction = lib.mkOption {
        type = types.nullOr (types.enum [ "Allow" "Block" "Remount" ]);
        default = null;
        description = "Action applied to encrypted removable media devices.";
      };

      EncryptedRemovableMediaRemountFlags = lib.mkOption {
        type = types.nullOr (types.listOf (types.enum [ "rdonly" "noexec" "nosuid" "nobrowse" "noowners" "nodev" "async" "-j" ]));
        default = null;
        description = "Mount flags applied when encrypted removable media is remounted.";
      };

      OnStartUSBOptions = lib.mkOption {
        type = types.nullOr (types.enum [ "Unmount" "ForceUnmount" "Remount" "ForceRemount" ]);
        default = null;
        description = "Action applied to existing removable media when Santa starts.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-northpolesec-santa" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Santa (North Pole Security) (com.northpolesec.santa) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}