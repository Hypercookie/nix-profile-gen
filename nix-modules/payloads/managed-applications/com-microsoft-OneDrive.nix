# Auto-generated from ProfileManifests: com.microsoft.OneDrive.plist
# Domain: com.microsoft.OneDrive
# Title: Microsoft OneDrive
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-OneDrive" = {
    enable = lib.mkEnableOption "Microsoft OneDrive";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.microsoft.OneDrive";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    DisablePersonalSync = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Prevents users from adding or syncing personal accounts.";
    };

    DisableTutorial = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable tutorial screens during first setup.";
    };

    DefaultFolderLocation = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          TenantID = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The TenantID value is a string that determines the tenants to whom the default folder location setting is applicable.";
          };
          DefaultFolderPath = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Path";
          };
        };
      }));
      default = null;
      description = "OneDrive folder default location. Specifies the default location of the OneDrive folder for each organization.";
    };

    AutomaticUploadBandwidthPercentage = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Percentage of local upload bandwidth that the sync client can use.";
    };

    UploadBandwidthLimited = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Upload throughput in KB/sec that the sync client can use.";
    };

    DownloadBandwidthLimited = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Sets the maximum download throughput rate in kilobytes (KB)/sec for computers running the OneDrive sync client.";
    };

    HideDockIcon = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the OneDrive dock icon even when the application is running.";
    };

    OpenAtLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Automatically start OneDrive when the user logs in.";
    };

    SharePointOnPremFrontDoorUrl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The URL of the on-premises SharePoint Server.";
    };

    SharePointOnPremPrioritizationPolicy = lib.mkOption {
      type = types.nullOr (types.int);
      default = 0;
      description = "Determines whether or not the sync app should set up sync for SharePoint Server on-premises or SharePoint in Microsoft 365 first during the first-run scenario when the account is the same for both SharePoint Server and SharePoint in Microsoft 365 in a hybrid scenario.";
    };

    SharePointOnPremTenantName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The name that will be used when creating a folder to sync the on-premises SharePoint Server files.";
    };

    SharePointOnPremPrioritzationPolicy = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 ]);
      default = null;
      description = "Determines whether or not the client should set up sync for SharePoint Server or SharePoint Online first during the first-run scenario.";
    };

    DefaultToBusinessFRE = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Default to OneDrive Business";
    };

    EnableAddAccounts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow users to add accounts to OneDrive";
    };

    FilesOnDemandEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When set to true, new users who set up the sync app will download online-only files by default. When set to false, Files On-Demand will be disabled and users won't be able to turn it on.";
    };

    IsHydrationToastAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When set to false, toasts will not appear when applications trigger the download of file contents.";
    };

    HydrationDisallowedApps = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "String in JSON format. AppID can be either the BSD process name or the bundle display name. \nMaxBuildVersion denotes the maximum build version of the application that will be blocked. \nMaxBundleVersion denotes the maximum bundle version of the application that will be blocked.";
    };

    EnableODIgnore = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "This setting lets you enter keywords to prevent the OneDrive sync app from uploading certain files to OneDrive or SharePoint. You can enter complete names, such as \"setup.exe\" or use the asterisk (*) as a wildcard character to represent a series of characters, such as *.pst. Keywords aren't case-sensitive.";
    };

    EnableSyncAdminReports = lib.mkOption {
      type = types.nullOr (types.int);
      default = 0;
      description = "This setting lets the OneDrive sync app report device and health data that's to be included in sync admin reports. You must enable this setting on the devices you want to get reports from.";
    };

    EnableAllOcsiClients = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This setting lets multiple users use the Microsoft 365 Apps for enterprise, Office 2019, or Office 2016 desktop apps to simultaneously edit an Office file stored in OneDrive. It also lets users share files from the Office desktop apps.";
    };

    DisableAutoConfig = lib.mkOption {
      type = types.nullOr (types.int);
      default = 0;
      description = "Determines whether or not the sync app can automatically sign in.\n\nIf you enable this setting, the sync app is prevented from automatically signing with an existing Microsoft Entra credential that is made available to Microsoft applications.";
    };

    DisableHydrationToast = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This setting prevents toasts from appearing when applications cause file contents to be downloaded.";
    };

    BlockExternalSync = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This setting prevents the sync app from syncing libraries and folders shared from other organizations. Set the setting's value to True, to prevent the users from syncing OneDrive, SharePoint libraries, and folders with organizations other than the user's own organization.";
    };

    AllowTenantList = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          __key__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Tenant ID";
          };
          __value__ = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Check to Allow";
          };
        };
      });
      default = null;
      description = "This setting prevents the users from uploading files to other organizations by specifying a list of allowed tenant IDs. If you enable this setting, the user gets an error if they attempt to add an account from an organization that isn't in the allowed tenants list.";
    };

    BlockTenantList = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          __key__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "TenantID";
          };
          __value__ = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Check to Block";
          };
        };
      });
      default = null;
      description = "This setting prevents the users from uploading files to organizations that are included in the blocked tenant IDs list. If you enable this setting, the users get an error if they attempt to add an account from an organization that is blocked. If a user has already added an account for a blocked organization, the files stop syncing.";
    };

    KFMOptInWithWizard = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    KFMSilentOptIn = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    KFMSilentOptInDesktop = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable to silently opt-in the user's Desktop folder.";
    };

    KFMSilentOptInDocuments = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable to silently opt-in the user's Documents folder.";
    };

    KFMSilentOptInWithNotification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, displays a notification to users after their folders have been redirected.";
    };

    KFMBlockOptIn = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "If enabled, will prevent KFM opt-in.";
    };

    KFMBlockOptOut = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, prevents users from redirecting their known folders to the Mac.";
    };

  };
}