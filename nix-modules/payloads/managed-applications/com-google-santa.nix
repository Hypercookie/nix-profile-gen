# Auto-generated from ProfileManifests: com.google.santa.plist
# Domain: com.google.santa
# Title: Santa (Google)
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-google-santa" = {
    enable = lib.mkEnableOption "Santa (Google)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.google.santa";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    ClientMode = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
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

    EnableSysxCache = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable secondary cache. Improves performance when multiple EndpointSecurity system extensions are installed.";
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

    UnknownBlockMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Custom message when an unknown binary is blocked.";
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

    SyncBaseURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
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

    MachineIDPlist = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The path to a plist that contains the MachineOwnerKey / value pair.";
    };

    MachineIDKey = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The key to use on Machine ID Plist.";
    };

    EventLogType = lib.mkOption {
      type = types.nullOr (types.enum [ "syslog" "filelog" "protobuf" "" ]);
      default = null;
      description = "syslog: Sent to ASL or ULS (if built with the 10.12 SDK or later); filelog: Sent to a file on disk. Use EventLogPath to specify a path.";
    };

    EventLogPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    MailDirectory = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The base directory used to save mail files.";
    };

    MailDirectoryFileSizeThresholdKB = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Per-file size limit (KB) for files stored in the event log mail directory.";
    };

    MailDirectorySizeThresholdMB = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Total file size limit (MB) for all files stored in the event log mail directory.";
    };

    MailDirectoryEventMaxFlushTimeSec = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Maximum time (seconds) events will stay buffered in memory before being flushed to disk.";
    };

    EnableMachineIDDecoration = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Appends the MachineID to the end of each log line if enabled.";
    };

    MetricFormat = lib.mkOption {
      type = types.nullOr (types.enum [ "rawjson" "monarchjson" "" ]);
      default = null;
      description = "The key to use on Machine ID Plist.";
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

  };
}