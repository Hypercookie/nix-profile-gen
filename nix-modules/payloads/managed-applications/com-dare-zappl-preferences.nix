# Auto-generated from ProfileManifests: com.dare.zappl.preferences.plist
# Domain: com.dare.zappl.preferences
# Title: Zappl
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-dare-zappl-preferences" = {
    enable = lib.mkEnableOption "Zappl";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.dare.zappl.preferences";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    GeneralOptions = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          activationToken = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Required. Enter your unique customer activation token. If you do not know this, please contact our Support team.";
          };
          publicKey = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Required. Enter your unique customer public key. If you do not know this, please contact our Support team.";
          };
          hourlyCheck = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Determines whether Zappl should check for updates and attempt to silently install them once every hour. Uncheck this option to prevent Zappl from checking for new updates once every hour (not recommended).";
          };
          updatePrompts = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Determines whether Zappl should prompt users to install pending cached updates on a recurring interval. Uncheck this option to disable all recurring update prompts (not recommended). To configure the behaviour of recurring update prompts, use the options under the Scheduled Updates section of this profile.";
          };
          autoUpdate = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Determines whether Zappl automatically updates itself when new major and point releases are available. Uncheck this option if you prefer to manually update Zappl.";
          };
          allowedAppInstalls = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "By default, all Apps within the Zappl App catalog are available for installs. If you prefer to specify a list of Apps allowed for installs, specify the App identifiers below. You can specify as many unique identifiers as you wish, using the App Catalog unique identifiers for each App. zappl.co/app-catalog.";
          };
          excludedAppInstalls = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "By default, all Apps within the Zappl App catalog are available for installs. If you wish to allow installs for all Apps in the catalog with the exception of some Apps, specify the Apps you wish to exclude below. You can specify as many unique identifiers as you wish, using the App Catalog unique identifiers for each App. zappl.co/app-catalog.";
          };
          allowedAppUpdates = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "By default, all Apps within the Zappl App catalog will be updated if installed. If you prefer to specify a list of Apps to allow updates for, specify the App identifiers below. You can specify as many unique identifiers as you wish, using the App Catalog unique identifiers for each App. zappl.co/app-catalog.";
          };
          excludedAppUpdates = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "By default, all Apps within the Zappl App catalog will be updated if installed. If you wish to allow updates for all Apps in the catalog with the exception of some Apps, specify the Apps you wish to exclude below. You can specify as many unique identifiers as you wish, using the App Catalog unique identifiers for each App. zappl.co/app-catalog.";
          };
        };
      });
      default = null;
      description = "General Options";
    };

    ScheduledUpdates = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          runFrequency = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                runType = lib.mkOption {
                  type = types.nullOr (types.enum [ "specifyFrequency" "specifyPatchDay" ]);
                  default = null;
                  description = "This defines when to prompt users to install any pending updates. You can either limit user prompts to a specified weekly patch day, or alternatively select a frequency to prompt the users, e.g. once every 2 weeks.";
                };
                frequencyOption = lib.mkOption {
                  type = types.nullOr (types.enum [ "oneDay" "oneWeek" "twoWeeks" "threeWeeks" "fourWeeks" ]);
                  default = null;
                  description = "A recurring update frequency time window which determines how often users are prompted to install pending updates, e.g. Once every week.";
                };
                frequencyElapsedMode = lib.mkOption {
                  type = types.nullOr (types.enum [ "singlePromptMode" "recurringPromptMode" ]);
                  default = null;
                  description = "Determines how frequently users should be prompted if they defer the update once the configured patch frequency time has elapsed. Deferring updates with Single Prompt Mode enabled causes update prompts to be postponed until the patch frequency has elapsed again. Recurring Prompt Mode ensures users are prompted to update on a regular recurring interval after deferring until they update, and the patch frequency will only be reactivated after the updates are installed.";
                };
                deferralWindow = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "When using recurring prompt mode, use this setting to define the amount of time in minutes a user can defer the update.";
                };
                patchDay = lib.mkOption {
                  type = types.nullOr (types.enum [ 2 3 4 5 6 7 1 ]);
                  default = null;
                  description = "The day of the week to prompt users to install cached updates.";
                };
                patchDayFrequency = lib.mkOption {
                  type = types.nullOr (types.enum [ "singlePromptMode" "recurringPromptMode" ]);
                  default = null;
                  description = "Determines how often users should be prompted to update on the configured patch day if they defer the update. Use the Single Prompt Mode to carry the deferral to the following weekly patch day, or alternatively, use Recurring Prompt Mode to continue to prompt users to update on a recurring interval on the configured patch day if they defer the update.";
                };
                patchDayDeferralWindow = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "When using recurring prompt mode, use this setting to define the amount of time in minutes a user can defer the update before being prompted again.";
                };
                missedUpdatePrompt = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "When enabled, Zappl will prompt the user to update whenever the device comes back online if it was offline on the defined patch day, or if the user deferred all update prompts when using Recurring Prompt Mode. Alternatively, leave this unchecked to wait until the next patch day to prompt the user if their device was offline on the previous patch day.";
                };
              };
            });
            default = null;
            description = "Run Frequency Options";
          };
          runLimitations = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                monday = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If selected, update prompts will be allowed on Mondays.";
                };
                mondayStartTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Mondays, use to define the time on a Monday Zappl is permitted to start prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                mondayEndTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Mondays, use to define the time on a Monday Zappl should stop prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                tuesday = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If selected, update prompts will be allowed on Tuesdays.";
                };
                tuesdayStartTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Tuesdays, use to define the time on a Tuesday Zappl is permitted to start prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                tuesdayEndTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Tuesdays, use to define the time on a Tuesday Zappl should stop prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                wednesday = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If selected, update prompts will be allowed on Wednesdays.";
                };
                wednesdayStartTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Wednesdays, use to define the time on a Wednesday Zappl is permitted to start prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                wednesdayEndTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Wednesdays, use to define the time on a Wednesday Zappl should stop prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                thursday = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If selected, update prompts will be allowed on Thursdays.";
                };
                thursdayStartTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Thursdays, use to define the time on a Thursday Zappl is permitted to start prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                thursdayEndTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Thursdays, use to define the time on a Thursday Zappl should stop prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                friday = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If selected, update prompts will be allowed on Fridays.";
                };
                fridayStartTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Fridays, use to define the time on a Friday Zappl is permitted to start prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                fridayEndTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Fridays, use to define the time on a Friday Zappl should stop prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                saturday = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If selected, update prompts will be allowed on Saturdays.";
                };
                saturdayStartTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Saturdays, use to define the time on a Saturday Zappl is permitted to start prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                saturdayEndTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Saturdays, use to define the time on a Saturday Zappl should stop prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                sunday = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If selected, update prompts will be allowed on Sundays.";
                };
                sundayStartTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Sundays, use to define the time on a Sunday Zappl is permitted to start prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                sundayEndTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Sundays, use to define the time on a Sunday Zappl should stop prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
              };
            });
            default = null;
            description = "Run Limitation Options";
          };
          deferralConfiguration = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                deferralOption = lib.mkOption {
                  type = types.nullOr (types.enum [ "disableDeferralLimit" "specifyDeferralLimit" "disableDeferrals" ]);
                  default = null;
                  description = "Use to define behaviour around update deferrals. To allow the user to continue deferring with no limit and force the update on-demand, select Disable Deferral Limit. To set a limit on the amount of allowed deferrals, select Specify Deferral Limit. Alternatively, you can disable deferrals completely by selecting Disable Deferrals, which will only allow a grace period for updates.";
                };
                specifyLimit = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Specify a custom deferral limit. The default deferral limit if not specified is 2.";
                };
              };
            });
            default = null;
            description = "Deferral Options";
          };
          gracePeriodMinutes = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The amount of time a user is given to save work before updates are installed automatically when there are no remaining deferrals. Default is 15 minutes.";
          };
          customIcon = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom icon to be displayed on the user prompts. If no path is provided, Zappl will utilise your Self Service icon.";
          };
          initialPromptOverlayIcon = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "An icon overlay on the initial update prompts. The overlay is displayed on the bottom right of the main icon. Possible values are paths to a valid .png, .jpg or .icns file, or use the 'selfService' variable for the Jamf Self Service icon.";
          };
          customInitialPromptSize = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                promptHeight = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Use to customise the height of the initial prompt displayed to users when they can either defer or update. Only use to define a custom height in points for the prompts shown to users, e.g. 330.";
                };
                promptWidth = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Use to customise the width of the initial prompt displayed to users when they can either defer or update. Only use to define a custom width in points for the prompts shown to users, e.g. 640.";
                };
              };
            });
            default = null;
            description = "Use to customise the size of the initial prompt displayed to users when they can either defer or update. Note: Only configure this setting if defining custom prompt messages. If you are using the default prompt messages, customising prompt size is not recommended as the default prompt size is pre-configured to correctly match the size of the default message displayed.";
          };
          customGracePromptSize = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                promptHeight = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Use to customise the height of the grace period timer prompt displayed to users when they have no remaining deferrals. Only use to define a custom height in points for the prompts shown to users, e.g. 330.";
                };
                promptWidth = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Use to customise the width of the grace period timer prompt displayed to users when they have no remaining deferrals. Only use to define a custom width in points for the prompts shown to users, e.g. 640.";
                };
              };
            });
            default = null;
            description = "Use to customise the size of the grace period timer prompt shown when users have no remaining deferrals. Note: Only configure this setting if defining custom prompt messages. If you are using the default prompt messages, customising prompt size is not recommended as the default prompt size is pre-configured to correctly match the size of the default message displayed.";
          };
          customSelfServicePromptSize = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                promptHeight = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Use to customise the height of the prompt displayed to users when they initiate a Self Service update. Only use to define a custom height in points for the prompts shown to users, e.g. 330.";
                };
                promptWidth = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Use to customise the width of the prompt displayed to users when they initiate a Self Service update. Only use to define a custom width in points for the prompts shown to users, e.g. 640.";
                };
              };
            });
            default = null;
            description = "Use to customise the size of the prompt displayed to users when they initiate a Self Service update. Note: Only configure this setting if defining custom prompt messages. If you are using the default prompt messages, customising prompt size is not recommended as the default prompt size is pre-configured to correctly match the size of the default message displayed.";
          };
          singleAppTitle = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom title to be displayed on the user prompts when there is 1 pending App update.";
          };
          multipleAppsTitle = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom title to be displayed on the user prompts when there is more than 1 pending App update.";
          };
          singleInitialQuitPromptMessage = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom message displayed on the initial \\\"App needs to quit\\\" prompt shown when there is 1 pending App update.";
          };
          multipleInitialQuitPromptMessage = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom message displayed on the initial \\\"Apps need to quit\\\" prompt shown when there are multiple pending App updates.";
          };
          singleSelfServiceQuitMessage = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom message displayed on the initial \\\"App needs to quit\\\" prompt shown when a user manually initiates an update check and there is 1 pending update.";
          };
          multipleSelfServiceQuitMessage = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom message displayed on the initial \\\"Apps need to quit\\\" prompt shown when a user manually initiates an update check and there are multiple pending App updates.";
          };
          singleAppGracePeriodQuitMessage = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom message displayed on the \\\"App needs to quit\\\" grace period prompt shown when there is 1 pending update. This prompt shows a grace period timer and is displayed when no deferrals are remaining or configured.";
          };
          multipleAppGracePeriodQuitMessage = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom message displayed on the \\\"Apps need to quit\\\" grace period prompt shown when there are multiple pending updates. This prompt shows a grace period timer and is displayed when no deferrals are remaining or configured.";
          };
          customDeferButton = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom Defer button label displayed on prompts where deferrals are allowed.";
          };
          customSkipButton = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom Skip button label displayed on the Self Service update prompts that allows users to back out of installing updates without affecting deferrals.";
          };
          customUpdateButton = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom Update button label displayed on the update prompts.";
          };
          appListType = lib.mkOption {
            type = types.nullOr (types.enum [ "vertical" "horizontal" ]);
            default = null;
            description = "Determines how to display the list of Apps on the update prompts. Apps can either be displayed in a vertical scrollable list beneath the prompt message, or displayed horizontally as part of the prompt message. When using the horizontal list option, the list of Apps is stored in the appList variable.";
          };
          refreshInterval = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The amount of time in seconds the user prompts refresh. The prompts require a refresh to pull focus if the user swipes away to ignore the prompt and ensures they either select defer or update. The default value is 20 seconds. The minimum allowed value is 10 seconds.";
          };
          acceptableAppBundleIDs = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Application Bundle IDs specified here will prevent Zappl from prompting users to update if the App(s) are identified as being active in the foreground (You can specify one or more Bundle IDs). To get Bundle IDs, enter the following in terminal (replacing Safari with the relevant App): defaults read /Applications/Safari.app/Contents/Info.plist CFBundleIdentifier.";
          };
          acceptableAppAssertions = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Application names specified here will prevent Zappl from prompting users to update if the App(s) are identified as using assertions (You can specify one or more Application names). To get the required Application name format, run \\\"/usr/bin/pmset -g assertions\\\" in terminal while the application is running and using assertions.";
          };
          acceptableDNDMode = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Setting as True will prevent Zappl from prompting users if Do Not Disturb mode is detected.";
          };
          acceptableCameraUsage = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Setting as True will prevent Zappl from prompting users if the camera is in use. Note: Apple Silicon Macs running macOS 12 (Monterey) do not accurately report camera usage, therefore this setting will be ignored. Upgrading to macOS 13 (Ventura) will resolve this issue for Apple Silicon Macs.";
          };
          acceptableScreenSharing = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Setting as True will prevent Zappl from prompting users if Screen Sharing is in use.";
          };
          updateProgressPosition = lib.mkOption {
            type = types.nullOr (types.enum [ "topright" "right" "bottomright" "topleft" "left" "bottomleft" "top" "center/centre" "bottom" ]);
            default = null;
            description = "The position on the screen of the prompt which displays the progress of an update. The default position is top right.";
          };
          updateProgressPrompt = lib.mkOption {
            type = types.nullOr (types.enum [ "noFocusPrompt" "focusPrompt" "noPrompt" ]);
            default = null;
            description = "Determines the behaviour of the prompt shown when updates are in progress. You can either select a prompt that does not take focus over other running Apps (default), a prompt that does take focus over all other running Apps, or disable the progress prompt completely. If you chose to show no prompt, you can still enable the \\\"Display Complete Message\\\" setting to inform users when the update has finished.";
          };
          updateProgressOverlayIcon = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "An icon overlay on the prompt shown during the App updates. The overlay is displayed on the bottom right of the main icon, which on this prompt is the App icon. Possible values are paths to a valid .png, .jpg or .icns file, or use the 'selfService' variable for the Jamf Self Service icon.";
          };
          autoRelaunchApps = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Determines whether Zappl automatically relaunches apps that were running prior to updating once the update completes.";
          };
          displayCompletePrompt = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Determines whether a prompt is displayed to the user to inform them that the updates are complete. The prompt will inherit the same window position as the Update Progress prompt. Default is true.";
          };
        };
      });
      default = null;
      description = "Scheduled Update Options";
    };

    ForcedUpdates = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          runLimitations = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                monday = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If selected, update prompts will be allowed on Mondays.";
                };
                mondayStartTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Mondays, use to define the time on a Monday Zappl is permitted to start prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                mondayEndTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Mondays, use to define the time on a Monday Zappl should stop prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                tuesday = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If selected, update prompts will be allowed on Tuesdays.";
                };
                tuesdayStartTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Tuesdays, use to define the time on a Tuesday Zappl is permitted to start prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                tuesdayEndTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Tuesdays, use to define the time on a Tuesday Zappl should stop prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                wednesday = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If selected, update prompts will be allowed on Wednesdays.";
                };
                wednesdayStartTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Wednesdays, use to define the time on a Wednesday Zappl is permitted to start prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                wednesdayEndTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Wednesdays, use to define the time on a Wednesday Zappl should stop prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                thursday = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If selected, update prompts will be allowed on Thursdays.";
                };
                thursdayStartTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Thursdays, use to define the time on a Thursday Zappl is permitted to start prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                thursdayEndTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Thursdays, use to define the time on a Thursday Zappl should stop prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                friday = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If selected, update prompts will be allowed on Fridays.";
                };
                fridayStartTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Fridays, use to define the time on a Friday Zappl is permitted to start prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                fridayEndTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Fridays, use to define the time on a Friday Zappl should stop prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                saturday = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If selected, update prompts will be allowed on Saturdays.";
                };
                saturdayStartTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Saturdays, use to define the time on a Saturday Zappl is permitted to start prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                saturdayEndTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Saturdays, use to define the time on a Saturday Zappl should stop prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                sunday = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If selected, update prompts will be allowed on Sundays.";
                };
                sundayStartTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Sundays, use to define the time on a Sunday Zappl is permitted to start prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
                sundayEndTime = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "If you allowed updates on Sundays, use to define the time on a Sunday Zappl should stop prompting users to install pending updates. This should be in 24 hour format, e.g., 09:00 for 9am, or 21:00 for 9pm.";
                };
              };
            });
            default = null;
            description = "Use this preference to limit which weekdays and times Zappl is allowed to prompt users to install forced updates. Check the boxes next to any days you wish to allow Zappl to prompt users, and uncheck any days you want update prompts to be skipped. If you allow Zappl to run on a particular day, you can then limit runs to a specific time window using the start and end time fields. Note: If you have specified a weekly patch day and that day is not checked below, the patch day setting will override this setting.";
          };
          customIcon = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom icon to be displayed on the user prompts. The default when not specified is the icon of the App being forced to update.";
          };
          initialPromptOverlayIcon = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "An icon overlay on the initial or grace period update prompts. The overlay is displayed on the bottom right of the main icon, which on this prompt is the App icon. Possible values are paths to a valid .png, .jpg or .icns file, or use the 'selfService' variable for the Jamf Self Service icon.";
          };
          customInitialPromptSize = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                promptHeight = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Use to customise the height of the initial prompt displayed to users when they can either defer or update. Only use to define a custom height in points for the prompts shown to users, e.g. 330.";
                };
                promptWidth = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Use to customise the width of the initial prompt displayed to users when they can either defer or update. Only use to define a custom width in points for the prompts shown to users, e.g. 640.";
                };
              };
            });
            default = null;
            description = "Use to customise the size of the initial prompt displayed to users when they can either defer or update. Note: Only configure this setting if defining custom prompt messages. If you are using the default prompt messages, customising prompt size is not recommended as the default prompt size is pre-configured to correctly match the size of the default message displayed.";
          };
          customGracePromptSize = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                promptHeight = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Use to customise the height of the grace period timer prompt displayed to users when they have no remaining deferrals. Only use to define a custom height in points for the prompts shown to users, e.g. 330.";
                };
                promptWidth = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "Use to customise the width of the grace period timer prompt displayed to users when they have no remaining deferrals. Only use to define a custom width in points for the prompts shown to users, e.g. 640.";
                };
              };
            });
            default = null;
            description = "Use to customise the size of the grace period timer prompt shown when users have no remaining deferrals. Note: Only configure this setting if defining custom prompt messages. If you are using the default prompt messages, customising prompt size is not recommended as the default prompt size is pre-configured to correctly match the size of the default message displayed.";
          };
          customTitle = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom title to be displayed on the initial force update prompts which are shown prior to the updates running, e.g the defer/update prompt (if configured) or the grace period prompt.";
          };
          initialQuitPromptMessage = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom message displayed on the initial \\\"App needs to quit\\\" forced update prompt.";
          };
          gracePeriodQuitPromptMessage = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom message displayed on the grace period \\\"App needs to quit\\\" prompt. This prompt shows a grace period timer and is displayed when no deferrals are remaining or configured.";
          };
          customDeferButton = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom Defer button displayed on prompts where deferrals are allowed.";
          };
          customUpdateButton = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A custom Update button label displayed on the update prompts.";
          };
          refreshInterval = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The amount of time in seconds the user prompts refresh when deferrals have been configured for forced updates. The prompts require a refresh to pull focus if the user swipes away to ignore the prompt and ensures they either select defer or update. The default value is 20 seconds. The minimum allowed value is 10 seconds.";
          };
          acceptableAppBundleIDs = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Application Bundle IDs specified here will prevent Zappl from prompting users to update if the App(s) are identified as being active in the foreground (You can specify one or more Bundle IDs). To get Bundle IDs, enter the following in terminal (replacing Safari with the relevant App): defaults read /Applications/Safari.app/Contents/Info.plist CFBundleIdentifier.";
          };
          acceptableAppAssertions = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Application names specified here will prevent Zappl from prompting users to update if the App(s) are identified as using assertions (You can specify one or more Application names). To get the required Application name format, run \\\"/usr/bin/pmset -g assertions\\\" in terminal while the application is running and using assertions.";
          };
          acceptableDNDMode = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Setting as True will prevent Zappl from prompting users if Do Not Disturb mode is detected.";
          };
          acceptableCameraUsage = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Setting as True will prevent Zappl from prompting users if the camera is in use. Note: Apple Silicon Macs running macOS 12 (Monterey) do not accurately report camera usage, therefore this setting will be ignored. Upgrading to macOS 13 (Ventura) will resolve this issue for Apple Silicon Macs.";
          };
          acceptableScreenSharing = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Setting as True will prevent Zappl from prompting users if Screen Sharing is in use.";
          };
          updateProgressPosition = lib.mkOption {
            type = types.nullOr (types.enum [ "topright" "right" "bottomright" "topleft" "left" "bottomleft" "top" "center/centre" "bottom" ]);
            default = null;
            description = "The position on the screen of the prompt which displays the progress of an update. The default position is top right.";
          };
          updateProgressPrompt = lib.mkOption {
            type = types.nullOr (types.enum [ "noFocusPrompt" "focusPrompt" "noPrompt" ]);
            default = null;
            description = "Determines the behaviour of the prompt shown when updates are in progress. You can either select a prompt that does not take focus over other running Apps (default), a prompt that does take focus over all other running Apps, or disable the progress prompt completely. If you chose to show no prompt, you can still enable the \\\"Display Complete Message\\\" setting to inform users when the update has finished.";
          };
          updateProgressOverlayIcon = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "An icon overlay on the prompt shown during the App updates. The overlay is displayed on the bottom right of the main icon, which on this prompt is the App icon. Possible values are paths to a valid .png, .jpg or .icns file, or use the 'selfService' variable for the Jamf Self Service icon.";
          };
          autoRelaunchApps = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Determines whether Zappl automatically relaunches apps that were running prior to updating once the update completes.";
          };
          displayCompletePrompt = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Determines whether a prompt is displayed to the user to inform them that the updates are complete. The prompt will inherit the same window position as the Update Progress prompt. Default is true.";
          };
        };
      });
      default = null;
      description = "Define days and time windows during which forced updates are allowed to run.";
    };

  };
}