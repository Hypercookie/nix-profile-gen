# Auto-generated from ProfileManifests: ManagedInstalls.plist
# Domain: ManagedInstalls
# Title: Munki
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-ManagedInstalls" = {
    enable = lib.mkEnableOption "Munki";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "ManagedInstalls";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    SoftwareRepoURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = "http://munki/repo";
      description = "Base URL for Munki repository.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    ClientIdentifier = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Identifier for Munki client. Usually is the same as a manifest name on the Munki server. If this is empty or undefined, Munki will attempt the following identifiers, in order: fully-qualified hostname, \"short\" hostname, serial number and finally, \"site_default\".";
    };

    ManagedInstallDir = lib.mkOption {
      type = types.nullOr (types.str);
      default = "/Library/Managed Installs";
      description = "Folder where Munki keeps its data on the client.";
    };

    LocalOnlyManifest = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Defines the name of your LocalOnlyManifest. Setting this activates the feature. Unsetting it means Munki will remove the file on the next run.";
    };

    SuppressAutoInstall = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Munki will not automatically install or remove items.";
    };

    SuppressLoginwindowInstall = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Munki will not install items while idle at the loginwindow except for those marked for unattended_install or unattended_uninstall.";
    };

    InstallAppleSoftwareUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Install updates from an Apple Software Update server, in addition to \"regular\" Munki updates.";
    };

    AppleSoftwareUpdatesOnly = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Only install updates from an Apple Software Update server. No Munki repository is needed or used.";
    };

    UnattendedAppleUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Updates that declare no \"must-close\" applications, or have one or more \"must-close\" applications, none of which is running, and do not require a logout or restart will be installed as part of a normal periodic background run without notifying the user.";
    };

    PerformAuthRestarts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Munki will attempt to perform a filevault auth restart.";
    };

    RecoveryKeyFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Absolute path to a plist file containing filevault credentials in key/value format. Used to perform auth restarts.";
    };

    EmulateProfileSupport = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "A bit of hack and not supported by Apple, it is disabled by default. To emulate profile installs, configuration profiles are read, and if they contain managed preferences, they are converted to MCX data that is added to a ComputerGroup in the local Open Directory store. Configuration profile payloads that are not managed preferences are ignored/skipped.";
    };

    SuppressUserNotification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Managed Software Center will never notify the user of available updates.";
    };

    SuppressStopButtonOnInstall = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Managed Software Center will hide the stop button while installing or removing software, preventing users from interrupting the install.";
    };

    InstallRequiresLogout = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Managed Software Center will require a logout for all installs or removals.";
    };

    ShowRemovalDetail = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Managed Software Center will display detail for scheduled removals.";
    };

    ShowOptionalInstallsForHigherOSVersions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Managed Software Center.app will show optional installs and updates that apply to macOS versions higher than the currently installed version.";
    };

    DaysBetweenNotifications = lib.mkOption {
      type = types.nullOr (types.int);
      default = 1;
      description = "Number of days between user notifications from Managed Software Center. Set to 0 to have Managed Software Center notify every time a background check runs if there are available updates.";
    };

    UseNotificationCenterDays = lib.mkOption {
      type = types.nullOr (types.int);
      default = 3;
      description = "Number of days Notification Center notifications should be used before switching to launching Managed Software Center.";
    };

    PackageVerificationMode = lib.mkOption {
      type = types.nullOr (types.enum [ "none" "hash" "hash_strict" ]);
      default = null;
      description = "Controls how Munki verifies the integrity of downloaded packages. (none = No integrity check is performed, hash = Integrity check is performed if package info contains checksum information, hash_strict = Integrity check is performed, and fails if package info does not contain checksum information.)";
    };

    FollowHTTPRedirects = lib.mkOption {
      type = types.nullOr (types.enum [ "none" "https" "all" ]);
      default = null;
      description = "Defines whether Munki will follow all, some or no redirects from the web server. (none = The default behaviour. No redirects are followed. https = Only redirects to URLs using HTTPS are followed. all = Redirects to both HTTP and HTTPS URLs are followed.)";
    };

    AdditionalHttpHeaders = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "This key provides the ability to specify custom HTTP headers to be sent with all curl() HTTP requests.";
    };

    IgnoreSystemProxies = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "HTTP and/or HTTPS proxies set system-wide will be ignored, connections will be made directly.";
    };

    PackageURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Base URL for Munki pkgs. Useful if your packages are served from a different server than your catalogs or manifests.";
    };

    CatalogURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Base URL for Munki catalogs. Useful if your catalogs are served from a different server than your packages or manifests.";
    };

    ManifestURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Base URL for Munki manifests. Useful if your manifests are served from a different server than your catalogs or manifests.";
    };

    IconURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Base URL for product icons. Useful if your icons are served from a different server or different directory than the default.";
    };

    ClientResourceURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Base URL for custom client resources for Managed Software Center. Useful if your resources are served from a different server or different directory than the default.";
    };

    ClientResourcesFilename = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specific filename to use when requesting custom client resources.";
    };

    HelpURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "URL to open/display when the user selects \"Managed Software Center Help\" from Managed Software Center's Help menu.";
    };

    LicenseInfoURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "URL for Munki to query a webserver to determine if there are available seats for licensed software (or any software you wish to make available via optional_installs, yet control the number of deployed copies).";
    };

    SoftwareUpdateServerURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Catalog URL for Apple Software Updates. If undefined or empty, Munki will use the same catalog that the OS uses when you run Apple's Software Update application or call /usr/sbin/softwareupdate.";
    };

    UseClientCertificate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Use an SSL client certificate when communicating with the Munki server. Requires an https:// URL for the Munki repo.";
    };

    UseClientCertificateCNAsClientIdentifier = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Use the CN of the client certificate as the Client Identifier. Used in combination with the UseClientCertificate key.";
    };

    ClientCertificatePath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Absolute path to a client certificate. There are 3 defaults for this key. Concatenated cert/key PEM file accepted.";
    };

    ClientKeyPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Absolute path to a client private key.";
    };

    SoftwareRepoCAPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to the directory that stores your CA certificate(s).";
    };

    SoftwareRepoCACertificate = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Absolute path to your CA Certificate.";
    };

    LogFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = "/Library/Managed Installs/Logs/ManagedSoftwareUpdate.log";
      description = "Primary log is written to this file. Other logs are written into the same directory as this file.";
    };

    LogToSyslog = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Log to syslog in addition to ManagedSoftwareUpdate.log.";
    };

    LoggingLevel = lib.mkOption {
      type = types.nullOr (types.int);
      default = 1;
      description = "Higher values cause more detail to be written to the primary log.";
    };

    MSULogEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Log user actions in the GUI.";
    };

    MSUDebugLogEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Debug logging for Managed Software Center.";
    };

    PFC_SegmentedControl_Plugins = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    AccessKey = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Munki has a feature which enables Mac administrators to use middleware to change munki's HTTP request. S3-Auth uses this feature to create the HTTP headers necessary to authenticate to S3.\n\nAccessKey for S3 bucket.";
    };

    Region = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Munki has a feature which enables Mac administrators to use middleware to change munki's HTTP request. S3-Auth uses this feature to create the HTTP headers necessary to authenticate to S3.\n\nRegion for S3 bucket.";
    };

    SecretKey = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Munki has a feature which enables Mac administrators to use middleware to change munki's HTTP request. S3-Auth uses this feature to create the HTTP headers necessary to authenticate to S3.\n\nSecretKey for S3 bucket.";
    };

    S3Endpoint = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Munki has a feature which enables Mac administrators to use middleware to change munki's HTTP request. S3-Auth uses this feature to create the HTTP headers necessary to authenticate to S3.\n\nS3 Endpoint for bucket.";
    };

    IgnoreMiddleware = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If true, Munki will ignore installed middleware. Useful for when moving away from middleware.";
    };

    AggressiveUpdateNotificationDays = lib.mkOption {
      type = types.nullOr (types.int);
      default = 14;
      description = "This preference controls how many days after one or more pending updates are ignored that aggressive user notification begins. Setting this to 0 never triggers this aggressive behavior.";
    };

  };
}