# Auto-generated from ProfileManifests: com.microsoft.autoupdate2.plist
# Domain: com.microsoft.autoupdate2
# Title: Microsoft AutoUpdate
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-autoupdate2" = {
    enable = lib.mkEnableOption "Microsoft AutoUpdate";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.microsoft.autoupdate2";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    AcknowledgedDataCollectionPolicy = lib.mkOption {
      type = types.nullOr (types.enum [ "RequiredDataOnly" "RequiredAndOptionalData" ]);
      default = null;
      description = "The first time Version 4.12 or later of Microsoft AutoUpdate is launched, users will see a Required Data Notice dialog which provides them with information about what data from MAU is sent to Microsoft. If you don't want your users to see this Required Data Notice dialog for Microsoft AutoUpdate, you can set the following preference. Regardless of which value you set, the dialog won't be shown to your users. If you let your users see this dialog, then when the user chooses OK, the value RequiredDataOnly is used and the dialog is not shown to the user again.";
    };

    ChannelName = lib.mkOption {
      type = types.nullOr (types.enum [ "Production" "Current" "External" "Preview" "InsiderFast" "Beta" "Custom" ]);
      default = null;
      description = "Set the update channel that is used to check for updates. Click the documentation link for more information about which channel to use.";
    };

    DisableInsiderCheckbox = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this option to disable the \"Join the Office Insider Program...\" checkbox.";
    };

    EnableCheckForUpdatesButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable this option to make the \"Check for Updates\" button in unavailable.";
    };

    ExtendedLogging = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enabled extended logging for Microsoft AutoUpdate operations.\nWrites logs to: /Library/Logs/Microsoft/autoupdate.log";
    };

    HowToCheck = lib.mkOption {
      type = types.nullOr (types.enum [ "Manual" "AutomaticCheck" "AutomaticDownload" ]);
      default = null;
      description = "Control how updates are checked for and handled.";
    };

    ManifestServer = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Force Microsoft AutoUpdate to pull collateral using a custom server. This is good when enterprise wants to have strict control on which version of Office applications get installed. Ensure that a trailing slash is used when specifying the value as this is mandatory. This requires \"ChannelName\" to be set to \"Custom\".";
    };

    SendAllTelemetryEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set to false to send minimal heartbeat data, no application usage, and no environment details. Replaced by \"AcknowledgedDataCollectionPolicy\" in MAU 4.12.";
    };

    StartDaemonOnAppLaunch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable this option to trigger the MAU Daemon when other Office applications are launched.";
    };

    IgnoreUIOpenAfterInstall = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable this option to prevent MAU UI from launching after install.";
    };

    UpdateCache = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Force Microsoft AutoUpdate to pull update binaries from a custom server. This is good when internet bandwidth is limited. Ensure that a trailing slash is used when specifying the value as this is mandatory.";
    };

    UpdateCheckInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Specifies the number of minutes between checking for updates. Default is set to check every 13 hours.";
    };

    UpdateCheckFrequency = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Change how often the Microsoft AutoUpdate daemon will look for updates. The default is 720 minutes (12 hrs). By reducing this value MAU will look for updates sooner.";
    };

    "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Force quit applications and update X number of days after MAU first detects the update on each computer.";
    };

    "UpdateDeadline.FinalCountDown" = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "How many minutes is the final countdown timer once the update deadline is reached.";
    };

    "UpdateDeadline.StartAutomaticUpdates" = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "How many days in advance of the deadline that Automatic Download and Install mode begins. Temporarily overrides \"HowToCheck\" with \"AutomaticDownload\" until all updates are applied.";
    };

    UpdaterOptimization = lib.mkOption {
      type = types.nullOr (types.enum [ "Size" "CPU" ]);
      default = null;
      description = "If you have a security agent like CrowdStrike installed and updates cause beachballs; Set UpdaterOptimization preference to \"CPU\" to prefer file-based delta updates (instead of binary deltas). The trade-off will be larger monthly updates.";
    };

    OptionalUpdatesDeferralsDays = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Global number of days after a release for which updates and offers to update will be postponed.";
    };

    OptionalUpdatesDeferrals = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          DeferralDays = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                __key__ = lib.mkOption {
                  type = types.nullOr (types.enum [ "XCEL2019" "IMCP01" "OLIC02" "MSau04" "WDAVCONSUMER" "WDAV00" "WDAVSHIM" "ONDR18" "ONMC2019" "OPIM2019" "PPT32019" "MSQA01" "MSRD10" "MSRH01" "MSFB16" "TEAMS10" "TEAMS21" "MSWD2019" ]);
                  default = null;
                  description = "Application Identifier";
                };
                __value__ = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Number of Days";
                };
              };
            });
            default = null;
            description = "Number of days after a release for which updates and offers to update will be postponed, per individual app. This setting takes precedence over the global setting.";
          };
          DeferralVersions = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                __key__ = lib.mkOption {
                  type = types.nullOr (types.enum [ "XCEL2019" "IMCP01" "OLIC02" "MSau04" "WDAVCONSUMER" "WDAV00" "WDAVSHIM" "ONDR18" "ONMC2019" "OPIM2019" "PPT32019" "MSQA01" "MSRD10" "MSRH01" "MSFB16" "TEAMS10" "TEAMS21" "MSWD2019" ]);
                  default = null;
                  description = "Application Identifier";
                };
                __value__ = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Version";
                };
              };
            });
            default = null;
            description = "Upper limits to the update version, per individual app. Discovered updates are offered/applied to and including the specified version.";
          };
        };
      });
      default = null;
      description = "Number of days after a release for which updates and offers to update will be postponed, per individual app. This setting takes precedence over the global setting.";
    };

    Applications = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          "_Library_Application_Support_Microsoft_MAU2.0_Microsoft_AutoUpdate.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "MSau03" "MSau04" ]);
                  default = null;
                  description = "Application ID";
                };
                LCID = lib.mkOption {
                  type = types.nullOr (types.enum [ 1033 ]);
                  default = null;
                  description = "Language Code ID";
                };
                "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Force quit this application and update X number of days after MAU first detects the update on each computer. Can be used in conjunction with the higher level option of the same setting for more restrictive per-application updating.";
                };
              };
            });
            default = null;
            description = "Register /Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app.";
          };
          "_Applications_Microsoft_Defender.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "WDAV00" ]);
                  default = null;
                  description = "Application ID";
                };
                LCID = lib.mkOption {
                  type = types.nullOr (types.enum [ 1033 ]);
                  default = null;
                  description = "Language Code ID";
                };
                "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Force quit this application and update X number of days after MAU first detects the update on each computer. Can be used in conjunction with the higher level option of the same setting for more restrictive per-application updating.";
                };
              };
            });
            default = null;
            description = "Register /Applications/Microsoft Defender.app.";
          };
          "_Applications_Microsoft_Edge.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "EDGE01" ]);
                  default = null;
                  description = "Application ID";
                };
                LCID = lib.mkOption {
                  type = types.nullOr (types.enum [ 1033 ]);
                  default = null;
                  description = "Language Code ID";
                };
                "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Force quit this application and update X number of days after MAU first detects the update on each computer. Can be used in conjunction with the higher level option of the same setting for more restrictive per-application updating.";
                };
              };
            });
            default = null;
            description = "Register /Applications/Microsoft Edge.app.";
          };
          "_Applications_Microsoft_Excel.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "XCEL15" "XCEL2019" ]);
                  default = null;
                  description = "Application ID";
                };
                LCID = lib.mkOption {
                  type = types.nullOr (types.enum [ 1033 ]);
                  default = null;
                  description = "Language Code ID";
                };
                "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Force quit this application and update X number of days after MAU first detects the update on each computer. Can be used in conjunction with the higher level option of the same setting for more restrictive per-application updating.";
                };
              };
            });
            default = null;
            description = "Register /Applications/Microsoft Excel.app.";
          };
          "_Applications_Microsoft_OneNote.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "ONMC15" "ONMC2019" ]);
                  default = null;
                  description = "Application ID";
                };
                LCID = lib.mkOption {
                  type = types.nullOr (types.enum [ 1033 ]);
                  default = null;
                  description = "Language Code ID";
                };
                "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Force quit this application and update X number of days after MAU first detects the update on each computer. Can be used in conjunction with the higher level option of the same setting for more restrictive per-application updating.";
                };
              };
            });
            default = null;
            description = "Register /Applications/Microsoft OneNote.app.";
          };
          "_Applications_Microsoft_Outlook.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "OPIM15" "OPIM2019" ]);
                  default = null;
                  description = "Application ID";
                };
                LCID = lib.mkOption {
                  type = types.nullOr (types.enum [ 1033 ]);
                  default = null;
                  description = "Language Code ID";
                };
                "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Force quit this application and update X number of days after MAU first detects the update on each computer. Can be used in conjunction with the higher level option of the same setting for more restrictive per-application updating.";
                };
              };
            });
            default = null;
            description = "Register /Applications/Microsoft Outlook.app.";
          };
          "_Applications_Microsoft_PowerPoint.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "PPT315" "PPT32019" ]);
                  default = null;
                  description = "Application ID";
                };
                LCID = lib.mkOption {
                  type = types.nullOr (types.enum [ 1033 ]);
                  default = null;
                  description = "Language Code ID";
                };
                "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Force quit this application and update X number of days after MAU first detects the update on each computer. Can be used in conjunction with the higher level option of the same setting for more restrictive per-application updating.";
                };
              };
            });
            default = null;
            description = "Register /Applications/Microsoft PowerPoint.app.";
          };
          "_Applications_Windows_App.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "MSRD10" ]);
                  default = null;
                  description = "Application ID";
                };
                LCID = lib.mkOption {
                  type = types.nullOr (types.enum [ 1033 ]);
                  default = null;
                  description = "Language Code ID";
                };
                "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Force quit this application and update X number of days after MAU first detects the update on each computer. Can be used in conjunction with the higher level option of the same setting for more restrictive per-application updating.";
                };
              };
            });
            default = null;
            description = "Register /Applications/Windows App.app.";
          };
          "_Applications_Microsoft_Remote_Desktop.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "MSRD10" ]);
                  default = null;
                  description = "Application ID";
                };
                LCID = lib.mkOption {
                  type = types.nullOr (types.enum [ 1033 ]);
                  default = null;
                  description = "Language Code ID";
                };
                "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Force quit this application and update X number of days after MAU first detects the update on each computer. Can be used in conjunction with the higher level option of the same setting for more restrictive per-application updating.";
                };
              };
            });
            default = null;
            description = "Register /Applications/Microsoft Remote Desktop.app.";
          };
          "_Applications_Microsoft_Teams.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "TEAMS10" "TEAMS21" ]);
                  default = null;
                  description = "Application ID";
                };
                LCID = lib.mkOption {
                  type = types.nullOr (types.enum [ 1033 ]);
                  default = null;
                  description = "Language Code ID";
                };
                "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Force quit this application and update X number of days after MAU first detects the update on each computer. Can be used in conjunction with the higher level option of the same setting for more restrictive per-application updating.";
                };
              };
            });
            default = null;
            description = "Register /Applications/Microsoft Teams.app.";
          };
          "_Applications_Microsoft_Word.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "MSWD15" "MSWD2019" ]);
                  default = null;
                  description = "Application ID";
                };
                LCID = lib.mkOption {
                  type = types.nullOr (types.enum [ 1033 ]);
                  default = null;
                  description = "Language Code ID";
                };
                "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Force quit this application and update X number of days after MAU first detects the update on each computer. Can be used in conjunction with the higher level option of the same setting for more restrictive per-application updating.";
                };
              };
            });
            default = null;
            description = "Register /Applications/Microsoft Word.app.";
          };
          "_Applications_Company_Portal.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "IMCP01" ]);
                  default = null;
                  description = "Application ID";
                };
                LCID = lib.mkOption {
                  type = types.nullOr (types.enum [ 1033 ]);
                  default = null;
                  description = "Language Code ID";
                };
                "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Force quit this application and update X number of days after MAU first detects the update on each computer. Can be used in conjunction with the higher level option of the same setting for more restrictive per-application updating.";
                };
              };
            });
            default = null;
            description = "Register /Applications/Company Portal.app.";
          };
          "_Applications_OneDrive.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "ONDR18" ]);
                  default = null;
                  description = "Application ID";
                };
                LCID = lib.mkOption {
                  type = types.nullOr (types.enum [ 1033 ]);
                  default = null;
                  description = "Language Code ID";
                };
                "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Force quit this application and update X number of days after MAU first detects the update on each computer. Can be used in conjunction with the higher level option of the same setting for more restrictive per-application updating.";
                };
              };
            });
            default = null;
            description = "Register /Applications/OneDrive.app.";
          };
          "_Applications_Skype_for_Business.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "MSFB16" ]);
                  default = null;
                  description = "Application ID";
                };
                LCID = lib.mkOption {
                  type = types.nullOr (types.enum [ 1033 ]);
                  default = null;
                  description = "Language Code ID";
                };
                "UpdateDeadline.DaysBeforeForcedQuit" = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Force quit this application and update X number of days after MAU first detects the update on each computer. Can be used in conjunction with the higher level option of the same setting for more restrictive per-application updating.";
                };
              };
            });
            default = null;
            description = "Register /Applications/Skype for Business.app.";
          };
        };
      });
      default = null;
      description = "Register applications that Microsoft AutoUpdate should update. If this is not managed MAU might have issues finding updates for applications that a user has never opened. Language Code IDs are legacy and always \"1033\".";
    };

    "UpdateDeadline.ApplicationsForcedUpdateSchedule" = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          "_Library_Application_Support_Microsoft_MAU2.0_Microsoft_AutoUpdate.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "MSau03" "MSau04" ]);
                  default = null;
                  description = "Application ID";
                };
                ForcedUpdateDate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The date and time to force the update.";
                };
                ForcedUpdateVersion = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The version of the update.";
                };
              };
            });
            default = null;
            description = "Schedule an update for Microsoft AutoUpdate.";
          };
          "_Applications_Microsoft_Defender_ATP.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "WDAV00" ]);
                  default = null;
                  description = "Application ID";
                };
                ForcedUpdateDate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The date and time to force the update.";
                };
                ForcedUpdateVersion = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The version of the update.";
                };
              };
            });
            default = null;
            description = "Schedule an update for Microsoft Defender ATP.";
          };
          "_Applications_Microsoft_Edge.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "EDGE01" ]);
                  default = null;
                  description = "Application ID";
                };
                ForcedUpdateDate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The date and time to force the update.";
                };
                ForcedUpdateVersion = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The version of the update.";
                };
              };
            });
            default = null;
            description = "Schedule an update for Microsoft Edge.";
          };
          "_Applications_Microsoft_Excel.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "XCEL15" "XCEL2019" ]);
                  default = null;
                  description = "Application ID";
                };
                ForcedUpdateDate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The date and time to force the update.";
                };
                ForcedUpdateVersion = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The version of the update.";
                };
              };
            });
            default = null;
            description = "Schedule an update for Microsoft Excel.";
          };
          "_Applications_Microsoft_OneNote.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "ONMC15" "ONMC2019" ]);
                  default = null;
                  description = "Application ID";
                };
                ForcedUpdateDate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The date and time to force the update.";
                };
                ForcedUpdateVersion = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The version of the update.";
                };
              };
            });
            default = null;
            description = "Schedule an update for Microsoft OneNote.";
          };
          "_Applications_Microsoft_Outlook.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "OPIM15" "OPIM2019" ]);
                  default = null;
                  description = "Application ID";
                };
                ForcedUpdateDate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The date and time to force the update.";
                };
                ForcedUpdateVersion = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The version of the update.";
                };
              };
            });
            default = null;
            description = "Schedule an update for Microsoft Outlook.";
          };
          "_Applications_Microsoft_PowerPoint.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "PPT315" "PPT32019" ]);
                  default = null;
                  description = "Application ID";
                };
                ForcedUpdateDate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The date and time to force the update.";
                };
                ForcedUpdateVersion = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The version of the update.";
                };
              };
            });
            default = null;
            description = "Schedule an update for Microsoft PowerPoint.";
          };
          "_Applications_Windows_App.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "MSRD10" ]);
                  default = null;
                  description = "Application ID";
                };
                ForcedUpdateDate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The date and time to force the update.";
                };
                ForcedUpdateVersion = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The version of the update.";
                };
              };
            });
            default = null;
            description = "Schedule an update for Windows App.";
          };
          "_Applications_Microsoft_Remote_Desktop.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "MSRD10" ]);
                  default = null;
                  description = "Application ID";
                };
                ForcedUpdateDate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The date and time to force the update.";
                };
                ForcedUpdateVersion = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The version of the update.";
                };
              };
            });
            default = null;
            description = "Schedule an update for Microsoft Remote Desktop.";
          };
          "_Applications_Microsoft_Teams.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "TEAMS10" ]);
                  default = null;
                  description = "Application ID";
                };
                ForcedUpdateDate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The date and time to force the update.";
                };
                ForcedUpdateVersion = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The version of the update.";
                };
              };
            });
            default = null;
            description = "Schedule an update for Microsoft Teams.";
          };
          "_Applications_Microsoft_Word.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "MSWD15" "MSWD2019" ]);
                  default = null;
                  description = "Application ID";
                };
                ForcedUpdateDate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The date and time to force the update.";
                };
                ForcedUpdateVersion = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The version of the update.";
                };
              };
            });
            default = null;
            description = "Schedule an update for Microsoft Word.";
          };
          "_Applications_Company_Portal.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "IMCP01" ]);
                  default = null;
                  description = "Application ID";
                };
                ForcedUpdateDate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The date and time to force the update.";
                };
                ForcedUpdateVersion = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The version of the update.";
                };
              };
            });
            default = null;
            description = "Schedule an update for Company Portal.";
          };
          "_Applications_OneDrive.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "ONDR18" ]);
                  default = null;
                  description = "Application ID";
                };
                ForcedUpdateDate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The date and time to force the update.";
                };
                ForcedUpdateVersion = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The version of the update.";
                };
              };
            });
            default = null;
            description = "Schedule an update for OneDrive.";
          };
          "_Applications_Skype_for_Business.app" = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                Application_ID = lib.mkOption {
                  type = types.nullOr (types.enum [ "MSFB16" ]);
                  default = null;
                  description = "Application ID";
                };
                ForcedUpdateDate = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The date and time to force the update.";
                };
                ForcedUpdateVersion = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The version of the update.";
                };
              };
            });
            default = null;
            description = "Schedule an update for Skype for Business.";
          };
        };
      });
      default = null;
      description = "Configure a deadline for a specific update version at a specific date and time for each application.";
    };

  };
}