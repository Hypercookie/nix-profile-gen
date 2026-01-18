# Auto-generated from ProfileManifests: com.google.drivefs.settings.plist
# Domain: com.google.drivefs.settings
# Title: Google Drive for desktop
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-google-drivefs-settings" = {
    enable = lib.mkEnableOption "Google Drive for desktop";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.google.drivefs.settings";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    AllowedAccountsPattern = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Regular expression indicating accounts that are allowed to sign in on this machine.";
    };

    AutoStartOnLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Start Drive for desktop automatically on session login.";
    };

    BandwidthRxKBPS = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Maximum downstream kilobytes per second.";
    };

    BandwidthTxKBPS = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Maximum upstream kilobytes per second.";
    };

    ContentCachePath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Sets the path to the content cache location on a connected APFS or HFS+ file system.";
    };

    ContentCacheMaxKbytes = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Sets the limit on content cache size in kilobytes. The limit is capped at 20% of the available space on the hard drive regardless of the setting value.";
    };

    DefaultMountPoint = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Set the mounted drive path. You can include tilde (~) or environment variables in the path.";
    };

    DisableExternalMediaSync = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables backing up files and folders from external media, such as USB drives, cameras, and phones, to Google Drive or Google Photos.";
    };

    DisableLocalizedVirtualFolders = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables localized names for My Drive, Shared drives, and Computers. Names remain in en-US instead of being localized to the OS system language.";
    };

    DisableMeetOutlookPlugin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables the Microsoft Outlook Meet plugin that's bundled with Drive for desktop.";
    };

    DisableMirroredFolders = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables mirroring of arbitrary folders (such as \"Documents\") to Google Drive.";
    };

    DisableMirroredMyDrive = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables mirroring of the entire My Drive folder.";
    };

    DisableOnboardingDialog = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables the welcome window for new users.";
    };

    DisableOutlookPlugin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables the Microsoft Outlook Google Drive attachment plugin that's bundled with Drive for desktop.";
    };

    DisablePhotosSync = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables backing up photos and videos to Google Photos.";
    };

    DisableRealTimePresence = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables real-time presence in Microsoft Office (https://support.google.com/drive/answer/7329379#realtime)";
    };

    ForceBrowserAuth = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use browser authentication.";
    };

    MinFreeDiskSpaceKBytes = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Controls the amount of local space used by Drive for desktop's cache. Stops writing content to the disk when free disk space gets below this threshold, in kilobytes.";
    };

    OpenOfficeFilesInDocs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When using Copy to clipboard on MS Office files synced by Drive for desktop, create links that open in the respective Google Docs Editor instead of the read only Google Drive web preview.";
    };

    PromptToBackupDevices = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Prompt me to back up devices setting.";
    };

    DirectConnection = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This bypasses proxy configurations. ";
    };

    DisableCRLCheck = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This disables checking Certificate Revocation Lists (CRLs) provided by certificate authorities. If not explicitly set, this defaults to true if TrustedRootCertsFile is provided, otherwise false.";
    };

    DisableSSLValidation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This disables validating SSL traffic. Traffic will still be encrypted, but we will not validate that the SSL certificates of the upstream servers are all valid.";
    };

    TrustedRootCertsFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "This is the full path to an alternate file to use for validating host SSL certificates. It must be in Privacy Enhanced Mail (PEM) format. Set this if your users are on networks with decrypting proxies.";
    };

    AutomaticErrorReporting = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Automatically send diagnostic logs to Google when Drive for desktop encounters a problem.";
    };

  };
}