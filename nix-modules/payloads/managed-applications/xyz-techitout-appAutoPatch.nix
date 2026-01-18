# Auto-generated from ProfileManifests: xyz.techitout.appAutoPatch.plist
# Domain: xyz.techitout.appAutoPatch
# Title: App Auto-Patch
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-xyz-techitout-appAutoPatch" = {
    enable = lib.mkEnableOption "App Auto-Patch";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "xyz.techitout.appAutoPatch";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    DaysUntilReset = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The number of days after the patching cadence start date (Zero Date) that the patching complete status will reset from TRUE to FALSE";
    };

    PatchWeekStartDay = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 3 4 5 6 7 ]);
      default = null;
      description = "The day of the week to force the patching cadence start date (Zero Date) to go back to in order to have the patch cadence start the same day of the week for all users";
    };

    DeadlineCountFocus = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The maximum number of automatic deferrals allowed if the system is in user-enabled Focus/Do Not Disturb or when a process has requested that the display not go to sleep";
    };

    DeadlineCountHard = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The maximum number of user selected deferrals allowed before App Auto-Patch will no longer allow deferrals and will automatically patch when the timer expires";
    };

    DeadlineDaysFocus = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The maximum number of days that automatic deferrals are allowed if the system is in user-enabled Focus/Do Not Disturb or when a process has requested that the display not go to sleep";
    };

    DeadlineDaysHard = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The maximum number of days deferrals allowed before App Auto-Patch will no longer allow deferrals and will automatically patch when the timer expires";
    };

    DeferralTimerDefault = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The number of minutes to defer until the next update workflow attempt if a user choses not install updates";
    };

    DeferralTimerError = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The number of minutes to defer if AAP detects an error in the workflow";
    };

    DeferralTimerFocus = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The number of minutes to defer the update restart dialog automatically if a process has prevented display sleep (for example, during an active meeting) or the user has Focus or Do Not Disturb enabled";
    };

    DeferralTimerMenu = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Display a deferral time pop-up menu in the non-deadline install dialog that allows the user to override the Deferral Timer Default timer";
    };

    DeferralTimerWorkflowRelaunch = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Amount of time in minutes until AAP is relaunched after a workflow. This timer results in AAP acting as a permanent agent that checks for app updates on a regular basis";
    };

    MonthlyPatchingCadenceEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    MonthlyPatchingCadenceOrdinalValue = lib.mkOption {
      type = types.nullOr (types.enum [ "first" "second" "third" "fourth" "fifth" "final" ]);
      default = null;
      description = "Week of the month you want AAP to be scheduled";
    };

    MonthlyPatchingCadenceWeekdayIndex = lib.mkOption {
      type = types.nullOr (types.enum [ "sunday" "monday" "tuesday" "wednesday" "thursday" "friday" "saturday" ]);
      default = null;
      description = "Day of the week you want AAP to be scheduled";
    };

    MonthlyPatchingCadenceStartTime = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local time you want AAP to be scheduled";
    };

    ZoomCallActiveCheck = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When enabled, AAP will automatically skip updating Zoom if a call is active";
    };

    DialogOnTop = lib.mkOption {
      type = types.nullOr (types.enum [ "TRUE" "FALSE" ]);
      default = null;
      description = "Forces the AAP dialogs to stay on top of all other windows";
    };

    DialogTimeoutDeferral = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Time given to the user to respond to deferral prompt if enabled";
    };

    DialogTimeoutDeferralAction = lib.mkOption {
      type = types.nullOr (types.enum [ "Defer" "Continue" ]);
      default = null;
      description = "What happens when the deferral timer expires";
    };

    UnattendedExit = lib.mkOption {
      type = types.nullOr (types.enum [ "TRUE" "FALSE" ]);
      default = null;
      description = "Deterines if the Dialog should automatically close after completion if there is no response from the end-user";
    };

    UnattendedExitSeconds = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The number of seconds the AAP dialog will automatically close if UnattendedExit is set to TRUE";
    };

    UseOverlayIcon = lib.mkOption {
      type = types.nullOr (types.enum [ "TRUE" "FALSE" ]);
      default = null;
      description = "Toggles swiftDialog to use an overlay icon";
    };

    DialogIcon = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Allows you to set a custom icon for the dialog vs. the default Laptop/Desktop symbol";
    };

    IgnoredLabels = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A space-separated list of Installomator labels to ignore for the AAP workflow. Supports wilddcards";
    };

    RequiredLabels = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "a space-separated list of Installomator labels that are required, regardless if the app is installed or or the latest version. Supports wildcards.";
    };

    OptionalLabels = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A space-separated list of optional Installomator labels. Labels in this category are only included if the app exists on the end-users device and will force install even if its the latest version. Does Not Support Wildcards";
    };

    AppTitle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Allows you to customize the name of App Auto-Patch to something else";
    };

    ConvertAppsInHomeFolder = lib.mkOption {
      type = types.nullOr (types.enum [ "TRUE" "FALSE" ]);
      default = null;
      description = "This will convert any apps found in the users home folder to the /Applications folder";
    };

    IgnoreAppsInHomeFolder = lib.mkOption {
      type = types.nullOr (types.enum [ "TRUE" "FALSE" ]);
      default = null;
      description = "Ignore apps found in '/Users/'. If an update is found in '/Users/' and variable is set to false, the app will be updated into the application's default path";
    };

    InstallomatorOptions = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A space-separated list of options to override default Installomator options (i.e., BLOCKING_PROCESS_ACTION=prompt_user NOTIFY=silent LOGO=appstore)";
    };

    InstallomatorUpdateDisable = lib.mkOption {
      type = types.nullOr (types.enum [ "TRUE" "FALSE" ]);
      default = null;
      description = "This will prevent Installomator from automatically updating. If Installomator does not exist in the working folder, it will still download from GitHub to prevent script failure";
    };

    InstallomatorVersion = lib.mkOption {
      type = types.nullOr (types.enum [ "Main" "Release" "Custom" ]);
      default = null;
      description = "Determines if the AAP script should use the Main, Release, or Custom version of Installomator. The version from the Main branch typically includes more recent updates from PR's to fix issues or add new labels. If using Custom, you must also set the InstallomatorVersionCustomRepoPath and InstallomatorVersionCustomBranchName keys";
    };

    InstallomatorVersionCustomRepoPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If InstallomatorVersion is set to Custom, enter the Github Site and Repository name in the following format: site_name/repo_name . For example, if the custom fork is located at https://github.com/TechTrekkie/Installomator, you would set this key to techtrekkie/installomator";
    };

    InstallomatorVersionCustomBranchName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The name of the branch you want to use in your custom repo, typically main.";
    };

    InteractiveMode = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "0 (Completely Silent) | 1 (Silent Discovery, Interactive Patching) | 2 (Full Interactive) (default)";
    };

    RemoveInstallomatorPath = lib.mkOption {
      type = types.nullOr (types.enum [ "TRUE" "FALSE" ]);
      default = null;
      description = "Remove Installomator after App Auto-Patch is completed";
    };

    SupportTeamName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "For the Support Team details that display in the Help Message";
    };

    SupportTeamEmail = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "For the Support Team details that display in the Help Message";
    };

    SupportTeamPhone = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "For the Support Team details that display in the Help Message";
    };

    SupportTeamWebsite = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "For the Support Team details that display in the Help Message";
    };

    WebhookFeature = lib.mkOption {
      type = types.nullOr (types.enum [ "FALSE" "ALL" "FAILURES" ]);
      default = null;
      description = "Determines if Webhooks are sent when patching is completed";
    };

    WebhookURLSlack = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Slack Webhook URL to use if WebhookFeature is set to TRUE";
    };

    WebhookURLTeams = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Teams Webhook URL to use if WebhookFeature is set to TRUE";
    };

    WorkflowDisableAppDiscovery = lib.mkOption {
      type = types.nullOr (types.enum [ "TRUE" "FALSE" ]);
      default = null;
      description = "Disables the discovery of applications that require patching. If a list of labels from a previous discovery exists, AAP will use that list for the workflow";
    };

    WorkflowDisableRelaunch = lib.mkOption {
      type = types.nullOr (types.enum [ "TRUE" "FALSE" ]);
      default = null;
      description = "Disable the automatic relaunch of AAP after the current workflow successfully completes";
    };

    WorkflowInstallNowPatchingStatusAction = lib.mkOption {
      type = types.nullOr (types.enum [ "NEVER" "ALWAYS" "SUCCESS" ]);
      default = null;
      description = "Determines if the Patching Completion Status is set to true when using the --workflow-install-now trigger";
    };

    SelfUpdateEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines if the Self Update feature is enabled. this will automatically update App Auto-Patch if a new version is posted on github";
    };

    SelfUpdateFrequency = lib.mkOption {
      type = types.nullOr (types.enum [ "daily" "weekly" "monthly" ]);
      default = null;
      description = "The frequency to check for updates to the App Auto-Patch script";
    };

    versionComparisonMethod = lib.mkOption {
      type = types.nullOr (types.enum [ "IS_AT_LEAST" "EQUAL_TO" ]);
      default = null;
      description = "Determines the version comparison method used when checking for updates";
    };

    VersionComparisonInstallomatorFallback = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When enabled, if version comparison fails, AAP will fall back to using Installomator for version checking";
    };

    userInterface = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          dialogElements = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                language = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The targeted language locale for the user interface. Note: For a list of locales, please run the following command in Terminal: /usr/bin/locale -a";
                };
                display_string_defer_today_button = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for the defer button in dialogs when the deferral time is sometime today.";
                };
                display_string_defer_tomorrow_button = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for the defer button in dialogs when the deferral time is tomorrow";
                };
                display_string_defer_future_button = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for the defer button in dialogs when the deferral time is in the future.";
                };
                display_string_minutes = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for deferral timer durations - Minutes";
                };
                display_string_hour = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for deferral timer durations - Hour";
                };
                display_string_hours = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for deferral timer durations - Hours";
                };
                display_string_and = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for deferral timer durations - and";
                };
                display_string_days = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for deferral timer durations - days";
                };
                display_string_times = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for deferral timer durations - times";
                };
                display_string_there_are = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for deferral timer durations - There are";
                };
                display_string_discovery_message = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for the message displayed during App Discovery";
                };
                display_string_discovery_action_message = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for the action message during App Discovery";
                };
                display_string_discovery_progress = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Langauge for the progress message during App Discovery";
                };
                display_string_deferral_button1 = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for Button1 of the Deferral Dialog";
                };
                display_string_deferral_button2 = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for Button1 of the Deferral Dialog";
                };
                display_string_deferral_infobox1 = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Langauge for part 1 of the infobox on the Deferral Dialog";
                };
                display_string_deferral_infobox2 = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Langauge for part 2 of the infobox on the Deferral Dialog";
                };
                display_string_deferral_infobox3 = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Langauge for part 3 of the infobox on the Deferral Dialog";
                };
                display_string_deferral_message_01 = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Langauge for part 1 of the message on the Deferral Dialog";
                };
                display_string_deferral_message_02 = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Language for part 2 of the message on the Deferral Dialog";
                };
                display_string_deferral_unlimited = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Langauge for unlimited deferrals";
                };
                display_string_deferral_selecttitle = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Langauge for deferral select title";
                };
                display_string_deferraldeadline_button1 = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Deferral Deadline Dialog button1";
                };
                display_string_deferraldeadline_button2 = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Deferral Deadline Dialog button2";
                };
                display_string_deferraldeadline_infobox = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Deferral Deadline Dialog infbox";
                };
                display_string_deferraldeadline_message_deadline = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Deferral Deadline Dialog Message";
                };
                display_string_patching_button1 = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Patching Dialog button1";
                };
                display_string_patching_checking = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Patching Dialog Checking";
                };
                display_string_patching_progress = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Patching Dialog Progress";
                };
                display_string_patching_infobox_computer_name = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Patching Dialog Infobox Computer Name";
                };
                display_string_patching_infobox_macos_version = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Patching Dialog Infobox macOS Version";
                };
                display_string_patching_infobox_updates = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Patching Dialog infobox updates";
                };
                display_string_patching_message = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Patching Dialog Message";
                };
                display_string_complete_progress = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Patching Complete Progress Message";
                };
                display_string_uptodate_button1 = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "All Apps Up To Date Button 1";
                };
                display_string_uptodate_message = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "All Apps Up To Date Message";
                };
                display_string_help_message_intro = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Help Message - Intro";
                };
                display_string_help_message_telephone = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Help Message - Telephone";
                };
                display_string_help_message_email = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Help Message - Email";
                };
                display_string_help_message_help_website = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Help Message - Help Website";
                };
                display_string_help_message_computer_info = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Help Message - Computer Info";
                };
                display_string_help_message_operating_system = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Help Message - Operating System";
                };
                display_string_help_message_serial = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Help Message - Serial Number";
                };
                display_string_help_message_dialog = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Help Message - Dialog";
                };
                display_string_help_message_started = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Help Message - Started";
                };
                display_string_help_message_script_version = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Help Message - Script Version";
                };
              };
            }));
            default = null;
            description = "The individual buttons and text elements that can be customized. This includes per country localization.";
          };
        };
      });
      default = null;
      description = "All features related to how App Auto Patch defines the user interface.";
    };

  };
}