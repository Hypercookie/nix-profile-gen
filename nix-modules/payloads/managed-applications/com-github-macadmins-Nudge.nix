# Auto-generated from ProfileManifests: com.github.macadmins.Nudge.plist
# Domain: com.github.macadmins.Nudge
# Title: Nudge
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-github-macadmins-Nudge" = {
    enable = lib.mkEnableOption "Nudge";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.github.macadmins.Nudge";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    optionalFeatures = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          attemptToFetchMajorUpgrade = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When a major upgrade is required, Nudge will attempt to download it through the softwareupdate binary.";
          };
          acceptableApplicationBundleIDs = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "The application Bundle ID which Nudge allows without taking focus. (You can specify one or more Bundle ID.)";
          };
          acceptableAssertionUsage = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When enabled, Nudge will not activate or re-activate when assertions are currently set.";
          };
          acceptableAssertionApplicationNames = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "The application names using assertions which Nudge allows without taking focus. (You can specify one or more applications. To find the names please run /usr/bin/pmset -g assertions in terminal while the application is open and running)";
          };
          acceptableCameraUsage = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When enabled, Nudge will not activate or re-activate when the camera is on.";
          };
          acceptableScreenSharingUsage = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When enabled, Nudge will not activate or re-activate when screen sharing is active.";
          };
          aggressiveUserExperience = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When disabled, Nudge will not hide all non-acceptableApplicationBundleIDs after the requiredInstallationDate or allowedDeferrals.";
          };
          aggressiveUserFullScreenExperience = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When disabled, Nudge will not create a blurred background when the user is past the deferral window.";
          };
          asynchronousSoftwareUpdate = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When disabled, Nudge will wait for Software Update to finish downloading (if any) updates before showing the UI.";
          };
          attemptToBlockApplicationLaunches = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When enabled, Nudge will attempt to block application launches after the required installation date. This key must be used in conjunction with blockedApplicationBundleIDs";
          };
          blockedApplicationBundleIDs = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "The application Bundle ID which Nudge disallows from launching after the required installation date. (You can specify one or more Bundle ID.)";
          };
          disableNudgeForStandardInstalls = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When utilizing a SOFA feed and disableNudgeForStandardInstalls is true, Nudge will only enforce updates with published CVEs. Defaults to false.";
          };
          disableSoftwareUpdateWorkflow = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When disableSoftwareUpdateWorkflow is true, Nudge will not attempt to run the softwareupdate process. Defaults to false.";
          };
          enforceMinorUpdates = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When enabled, Nudge will enforce minor updates. This should likely never be disabled.";
          };
          terminateApplicationsOnLaunch = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When enabled, Nudge will terminate the applications listed in blockedApplicationBundleIDs upon initial launch.";
          };
          acceptableUpdatePreparingUsage = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When enabled, Nudge will not activate or re-activate when an update is being downloaded, prepared or staged.";
          };
          attemptToCheckForSupportedDevice = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When disabled, Nudge will no longer compare the current device against the SOFA feed for the required update. If the device cannot install this update, Nudge will not present the Unsupported UI";
          };
          customSOFAFeedURL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A url path to use a custom SOFA feed.";
          };
          honorFocusModes = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When enabled, Nudge will not activate or re-activate when a user is in DoNotDisturb/Focus status. This feature is expiremental and may not work in all user settings.";
          };
          honorCycleTimersOnExit = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When enabled, Nudge will honor the current cycle timers when user's press the `Quit` button.";
          };
          refreshSOFAFeedTime = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The maximum age the cached SOFA feed file can be on disk. When this file age expires, Nudge will re-assess the SOFA feed for updates. Please be mindful of changing this value as there is an associated cost for maintaining the SOFA service.";
          };
          utilizeSOFAFeed = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When enabled, Nudge will utilize the SOFA feed url for update data.";
          };
        };
      });
      default = null;
      description = "All optional features to enhance and customize the Nudge experience for your employer's needs.";
    };

    osVersionRequirements = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          aboutUpdateURL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A single URL, enabling the More Info button URL path. While this accepts a string, it must be a valid URL (http://, https://, file://). Note: If this value is passed with aboutUpdateURLs, the aboutUpdateURLs key will be ignored.";
          };
          aboutUpdateURLs = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                _language = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The targeted language locale for the user interface. Note: For a list of locales, please run the following command in Terminal: /usr/bin/locale -a";
                };
                aboutUpdateURL = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The URL for the More Info button. While this accepts a string, it must be a valid URL (http://, https://, file://).";
                };
              };
            }));
            default = null;
            description = "The aboutUpdateURL - per country localization.";
          };
          majorUpgradeAppPath = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The app path for a major upgrade.";
          };
          requiredInstallationDate = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The required installation date for Nudge to enforce the required operating system version. You must follow a standard date string as YYYY-MM-DDTHH:MM:SSZ - Example: 2021-09-15T00:00:00Z. Required for Nudge versions 1.1.16 and below.";
          };
          requiredMinimumOSVersion = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The required minimum operating system version. Note: When passing versions such as `11.2.0`, it will be normalized to `11.2`. It is recommended to remove the trailing zero from the version number.";
          };
          targetedOSVersions = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "The versions of macOS that require a security update. You can specify single version or multiple versions.";
          };
          targetedOSVersionsRule = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The OS string rule for targeting Nudge events. You can target with \"default\", the full OS version (example: \"11.5.1\"). or the major OS version (example: \"11\").";
          };
          actionButtonPath = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A path to a URI for opening alternative actions, like Jamf self service items.";
          };
          activelyExploitedCVEsMajorUpgradeSLA = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "When a major upgrade is under active exploit, this is the amount of days a user has to install the update.";
          };
          activelyExploitedCVEsMinorUpdateSLA = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "When a minor update is under active exploit, this is the amount of days a user has to install the update.";
          };
          nonActivelyExploitedCVEsMajorUpgradeSLA = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "When a major upgrade is not under active exploit but contains CVEs, this is the amount of days a user has to install the update.";
          };
          nonActivelyExploitedCVEsMinorUpdateSLA = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "When a minor update is not under active exploit but contains CVEs, this is the amount of days a user has to install the update.";
          };
          standardMajorUpgradeSLA = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "When a major upgrade has no known CVEs, this is the amount of days a user has to install the update.";
          };
          standardMinorUpdateSLA = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "When a minor update has no known CVEs, this is the amount of days a user has to install the update.";
          };
          unsupportedURL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A single URL, enabling the More Info button URL path when using the unsupported UI. While this accepts a string, it must be a valid URL (http://, https://, file://). Note: If this value is passed with aboutUpdateURLs, the aboutUpdateURLs key will be ignored.";
          };
          unsupportedURLs = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                _language = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The targeted language locale for the user interface. Note: For a list of locales, please run the following command in Terminal: /usr/bin/locale -a";
                };
                unsupportedURL = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A single URL, enabling the More Info button URL path when using the unsupported UI. While this accepts a string, it must be a valid URL (http://, https://, file://). Note: If this value is passed with aboutUpdateURLs, the aboutUpdateURLs key will be ignored.";
                };
              };
            }));
            default = null;
            description = "The unsupportedURL - per country localization.";
          };
          minorVersionRecalculationThreshold = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The amount of minor versions a device can be behind before the requiredInstallationDate is recalculated against a previous update.";
          };
        };
      }));
      default = null;
      description = "The required components necessary to enforce an Operating System version through Nudge. Specify one array to enforce a single Operating System version across all machines or specify multiple arrays for specific enforcements.";
    };

    userExperience = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          noTimers = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "This will disable all functionality related to the `userExperience` preference domain.";
          };
          allowedDeferrals = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The number of times a user can defer Nudge (change it from the currently active window) before the \"aggressive user experience\" is enabled.";
          };
          allowGracePeriods = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Allows a device to modify the requiredInstallationDate logic and launch behavior. Useful for new device provisioning.";
          };
          allowUserQuitDeferrals = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Allows the user to specify when they will next be prompted by Nudge. (Set to `False` to maintain v1.0.0 behavior.) When using this feature, Nudge will no longer adhere to your LaunchAgent logic as the user is specifying their own execution time for the next Nudge event.(See: `~/Library/Preferences/com.github.macadmins.Nudge.plist`.)";
          };
          gracePeriodInstallDelay = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The amount of time in hours Nudge will extend the requiredInstallationDate for newly provisioned devices.";
          };
          gracePeriodLaunchDelay = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The amount of time in hours Nudge will bypass launching for newly provided devices.";
          };
          gracePeriodPath = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The path of the file Nudge will read and assess for allowGracePeriods.";
          };
          imminentRefreshCycle = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The amount of time in seconds Nudge will use as a timer to refresh the user interface if it is not the currently active window. This key is directly tied to its partner key `imminentWindowTime` to know when to trigger this timer.";
          };
          allowedDeferralsUntilForcedSecondaryQuitButton = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The number of times a user can defer Nudge (change it from the currently active window) before both quit buttons need to be actioned.";
          };
          approachingRefreshCycle = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The amount of time in seconds Nudge will use as a timer to refresh the user interface if it is not the currently active window. This key is directly tied to its partner key `approachingWindowTime` to know when to trigger this timer.";
          };
          approachingWindowTime = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The amount of time in hours Nudge will use to determine that the `requiredInstallationDate` is \"approaching\".";
          };
          elapsedRefreshCycle = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The amount of time in seconds Nudge will use as a timer to refresh the user interface if it is not the currently active window. This key is triggered once the `requiredInstallationDate` has expired.";
          };
          imminentRefeshCycle = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "Imminent Refresh Cycle";
          };
          imminentWindowTime = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The amount of time in hours Nudge will use to determine that the `requiredInstallationDate` is \"imminent\".";
          };
          initialRefreshCycle = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The amount of time in seconds Nudge will use as a timer to refresh the user interface if it is not the currently active window. This key is triggered for all Nudge launches until the `approachingWindowTime` has been passed.";
          };
          maxRandomDelayInSeconds = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The maximum amount of delay Nudge will utilize before launching the UI. This is useful if you do not want your users to all receive the Nudge prompt at the exact time of the LaunchAgent. Note: This functionality only applies when also enabling `randomDelay`.";
          };
          nudgeRefreshCycle = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The amount of time in seconds Nudge will use as its core timer to refresh all the core code paths. Note: While you can lower this setting, it could make Nudge too aggressive. Be mindful of decreasing this value.";
          };
          randomDelay = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Enables an initial delay Nudge before launching the UI. This is useful if you do not want your users to all receive the Nudge prompt at the exact time of the LaunchAgent.";
          };
          allowLaterDeferralButton = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Allows the user to press the `Later` button through the custom deferrals UI";
          };
          allowMovableWindow = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Allows the user to move the Nudge window.";
          };
          calendarDeferralUnit = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Utilize the approachingWindowTime or imminentWindowTime for calendar deferrals.";
          };
          launchAgentIdentifier = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The identifier of the Nudge LaunchAgent. Only set this if you use a custom identifier";
          };
          loadLaunchAgent = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Loads the Nudge LaunchAgent using macOS Ventura's SMAppService API (macOS 13+ required).";
          };
          nudgeMajorUpgradeEventLaunchDelay = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "When a new major upgrade is posted to the SOFA feed, this can artificially delay the SOFA nudge events by x amount of days.";
          };
          nudgeMinorUpdateEventLaunchDelay = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "When a new minor update is posted to the SOFA feed, this can artificially delay the SOFA nudge events by x amount of days.";
          };
        };
      });
      default = null;
      description = "All features related to how Nudge refreshes and defines the user experience";
    };

    userInterface = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          simpleMode = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Enables Nudge to launch in the simplified user experience.";
          };
          forceScreenShotIcon = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Force the built-in ScreenShot icon to render in the UI if a ScreenShot path is not passed.";
          };
          showDeferralCount = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Enables or disables the deferral count of the current Nudge event.";
          };
          singleQuitButton = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Only display one quit button regardless of proximity to the due date.";
          };
          iconDarkPath = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A path to a local jpg, png, icns that contains the icon for dark mode. This will replace the Apple logo on the left side of Nudge.";
          };
          iconLightPath = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A path to a local jpg, png, icns that contains the icon for light mode. This will replace the Apple logo on the left side of Nudge.";
          };
          screenShotDarkPath = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A path to a local jpg, png, icns that contains the screen shot for dark mode. This will replace the Big Sur logo on the lower right side of Nudge.";
          };
          screenShotLightPath = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A path to a local jpg, png, icns that contains the screen shot for light mode. This will replace the Big Sur logo on the lower right side of Nudge.";
          };
          actionButtonPath = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A path to a URI for opening alternative actions, like Jamf self service items.";
          };
          fallbackLanguage = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The language to revert to if no localizations are available for the device's current language.";
          };
          forceFallbackLanguage = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Force the custom localizations to the value of `fallbackLanguage`.";
          };
          updateElements = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                _language = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The targeted language locale for the user interface. Note: For a list of locales, please run the following command in Terminal: /usr/bin/locale -a";
                };
                customDeferralButtonText = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the customDeferralButtonText, also known as the \"Custom\" button.";
                };
                customDeferralDropdownText = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "customDeferralDropdownText, also known as the \"Defer\" button.";
                };
                oneDayDeferralButtonText = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the oneDayDeferralButtonText, also known as the \"One Day\" button.";
                };
                oneHourDeferralButtonText = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the oneHourDeferralButtonText, also known as the \"One Hour\" button.";
                };
                informationButtonText = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the informationButton, also known as the \"More Info\" button.";
                };
                mainContentHeader = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the mainContentHeader. This is the \"Your device will restart during this update\" text.";
                };
                mainContentSubHeader = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the mainContentSubHeader. This is the \"Updates can take around 30 minutes to complete\" text.";
                };
                mainContentText = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the `mainContentText`. This is the \"A fully up-to-date device is required to ensure that IT can your accurately protect your device.\" text. (See the Wiki for information on adding line breaks.)";
                };
                mainContentNote = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the mainContentNote. This is the \"Important Notes\" text.";
                };
                mainHeader = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the `mainHeader`. This is the \"Your device requires a security update\" text.";
                };
                actionButtonText = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the actionButton, also known as the \"Update Device\" button.";
                };
                primaryQuitButtonText = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the `primaryQuitButton`, also known as the \"Later\" button.";
                };
                secondaryQuitButtonText = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the `secondaryQuitButton`, also known as the \"I understand\" button.";
                };
                subHeader = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the `subHeader`. This is the \"A friendly reminder from your local IT team\" text.";
                };
                actionButtonTextUnsupported = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the primaryQuitButton, also known as the \"Update Device\" button when using the Unsupported UI.";
                };
                applicationTerminatedTitleText = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the terminated application notification title.";
                };
                applicationTerminatedBodyText = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the terminated application notification body.";
                };
                mainContentHeaderUnsupported = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the mainContentHeader. This is the \"Your device is no longer capable of receiving critical security updates\" text when using the Unsupported UI.";
                };
                mainContentNoteUnsupported = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the mainContentNote. This is the \"Important Notes\" text when using the Unsupported UI.";
                };
                mainContentSubHeaderUnsupported = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the mainContentSubHeader. This is the \"Please work with your local IT team to obtain a replacement device\" text when using the Unsupported UI.";
                };
                mainContentTextUnsupported = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the `mainContentText`. This is the \"A fully up-to-date device is required to ensure that IT can your accurately protect your device.\" text when using the Unsupported UI. See the Wiki for information on adding line breaks.";
                };
                mainHeaderUnsupported = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the `mainHeader`. This is the \"Your device requires a security update\" text when using the Unsupported UI.";
                };
                screenShotAltText = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the accessible hover over on screen shots.";
                };
                subHeaderUnsupported = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Modifies the `subHeader`. This is the \"A friendly reminder from your local IT team\" text when using the Unsupported UI.";
                };
              };
            }));
            default = null;
            description = "The individual buttons and text elements that can be customized for your employer's needs. This includes per country localization.";
          };
          applicationTerminatedNotificationImagePath = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A local image path for the notification event when Nudge terminates and application.";
          };
          requiredInstallationDisplayFormat = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "When utilizing showRequiredDate, set a custom display format. Be aware that the format you desire may not look good on the UI.";
          };
          showActivelyExploitedCVEs = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When disabled, Nudge will not show the Actively Exploited CVEs in the left sidebar.";
          };
          showDaysRemainingToUpdate = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When disabled, Nudge will not show the `Days Remaining To Update:` item on the left side of the UI.";
          };
          showRequiredDate = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "When enabled, Nudge will also show the requiredInstallationDate as string formatted date.";
          };
        };
      });
      default = null;
      description = "All features related to how Nudge defines the user interface.";
    };

    json_url = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "When configuring Nudge using a JSON-formatted preferences file located outside of the default location, set this key to the custom location using either a remote (https://) or a local (file://) URL, and leave other keys in this payload unset. Leave this key unset when configuring Nudge using the other keys in this payload.";
    };

  };
}