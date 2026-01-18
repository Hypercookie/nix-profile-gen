# Auto-generated from ProfileManifests: com.macjutsu.super.plist
# Domain: com.macjutsu.super
# Title: S.U.P.E.R.M.A.N
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-macjutsu-super" = {
    enable = lib.mkEnableOption "S.U.P.E.R.M.A.N";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.macjutsu.super";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    AuthAskUserToSavePassword = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prompt the end user to save their password which can then be used to authenticate the local softwareupdate command";
    };

    AuthCredentialFailoverToUser = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If any managed automatic authentication method fails validation, then failover to local end user authentication";
    };

    AuthJamfComputerID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Use this when using super with Jamf Pro API account";
    };

    AuthJamfCustomURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Allows you to override the default Jamf Pro management URL for a custom Jamf Pro API URL";
    };

    AuthMDMFailoverToUser = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The MDM workflow can be unreliable due to its complexity, and super will automatically try again upon failure, however this settings allows super to try other options";
    };

    DeadlineCountFocus = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The maximum number of automatic deferrals allowed if the system is in user-enabled Focus/Do Not Disturb or when a process has requested that the display not go to sleep";
    };

    DeadlineCountHard = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The maximum number of user selected deferrals allowed before the computer automatically restarts for updates without asking the user for approval";
    };

    DeadlineCountSoft = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The maximum number of user selected deferrals allowed before showing a soft deadline dialog";
    };

    DeadlineDateFocus = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "This is the last date and time when automatic deferrals are allowed if the system is in user-enabled Focus/Do Not Disturb or when a process has requested that the display not go to sleep (for example, during an active meeting)";
    };

    DeadlineDateHard = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If this date has passed, the computer restarts and udpates without asking the user for approval";
    };

    DeadlineDateSoft = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If this date and time have passed, an interactive update restart dialog appears indicating that no more user deferrals are allowed";
    };

    DeadlineDaysFocus = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The maximum number of days that automatic deferrals are allowed if the system is in user-enabled Focus/Do Not Disturb or when a process has requested that the display not go to sleep (for example, during an active meeting).";
    };

    DeadlineDaysHard = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The maximum number of days allowed before the computer automatically restarts for updates without asking the user for approval";
    };

    DeadlineDaysSoft = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The maximum number of days allowed before the soft deadline dialog. The soft deadline is an interactive update restart dialog indicating that no more deferrals are allowed";
    };

    DialogTimeoutRestartOrDefer = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Sets an automatic timeout for the restart or defer dialog in seconds";
    };

    WorkflowJamfPolicyTriggers = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Make the super workflow run one or more Jamf Pro Policy Triggers that are comma separated with no spaces";
    };

    DisplayAccessoryUserAuthFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies a local path or web URL to a file with the content to be shown in dialogs only when showing the Apple silicon user authentication dialog";
    };

    DisplayAccessoryUpdateFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies a local path or web URL to a file with the content to be shown in dialogs only when performing macOS updates";
    };

    DisplayAccessoryUpgradeFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies a local path or web URL to a file with the content to be shown in dialogs only when performing macOS upgrades";
    };

    WorkflowZeroDateManual = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Instead of having super automatically select the beginning date and time of the super workflow (aka. day zero), this option sets a specific date and time as day zero";
    };

    DeferralTimerFocus = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The number of minutes to defer the update restart dialog automatically if a process has prevented display sleep (for example, during an active meeting) or the user has Focus or Do Not Disturb enabled";
    };

    DialogTimeoutDefault = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Sets the default timeout for any dialog that doesn't have a specific timeout setting";
    };

    DialogTimeoutInsufficientStorage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Timeout for computers with not enough free space";
    };

    DialogTimeoutPowerRequired = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Timeout for computers where power is required";
    };

    DialogTimeoutSoftDeadline = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Sets an automatic timeout for interactive update restart dialogs in seconds";
    };

    DialogTimeoutUserAuth = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "On Mac computers with Apple Silicon, the number of seconds to wait for the user to successfully authenticate when presented with the user authenticated dialog";
    };

    DialogTimeoutUserChoice = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Sets an automatic timeout for the user choice (restart/install or defer) dialog in seconds";
    };

    DialogTimeoutUserSchedule = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Sets an automatic timeout for the scheduled install user choice dialog in seconds";
    };

    DisplayAccessoryDefaultFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local path or http(s) URL to a file that is the default accessory";
    };

    DisplayAccessoryJamfPolicyTriggersFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local path or http(s) URL to a file that is the accessory to display when the InstallJamfPolicyTriggers payload option is also enabled and the workflow target is only Jamf Pro Policy Triggers";
    };

    DisplayAccessoryMacOSMajorUpgradeFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local path or http(s) URL to a file that is the accessory to display when performing macOS upgrades";
    };

    DisplayAccessoryMacOSMinorUpdateFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local path or http(s) URL to a file that is the accessory to display when performing macOS updates";
    };

    DisplayAccessoryNonSystemUpdatesFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local path or http(s) URL to a file that is the accessory to display when the InstallNonSystemUpdatesWithoutRestarting payload option is also enabled and the workflow target is only non-system updates";
    };

    DisplayAccessoryRestartWithoutUpdatesFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local path or http(s) URL to a file that is the accessory to display when the WorkflowRestartWithoutUpdates payload option is also enabled and the workflow target is only a forced restart without any updates";
    };

    DisplayAccessoryType = lib.mkOption {
      type = types.nullOr (types.enum [ "TEXTBOX" "HTMLBOX" "HTML" "IMAGE" "VIDEO" "VIDEOAUTO" ]);
      default = null;
      description = "Interactive dialogs (but not notifications) generated by IBM Notifier can be easily customized via several display accessory options";
    };

    DisplayHelpButtonString = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Plain text to display or http(s) URL link to follow for the Help Button";
    };

    DisplayHideProgressBar = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "This option hides the animated progress bar (as opposed showing it) for notifications and alerts";
    };

    DisplayIconDarkFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local path or http(s) URL to a file that is the picture to display in notifications or dialogs when in dark mode. Failover to DisplayIconFile payload if configured";
    };

    DisplayIconLightFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local path or http(s) URL to a file that is the picture to display in notifications or dialogs when in light mode. Failover to DisplayIconFile payload if configured";
    };

    DisplayIconFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local path or http(s) URL to a file that is the picture to display in notifications or dialogs";
    };

    DisplayIconSize = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Number of pixels for the DisplayIcon in IBM Notifier dialogs";
    };

    InstallJamfPolicyTriggers = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If a restart is required for system updates or forced via RestartWithoutUpdates, this list of Jamf Policy Triggers runs before any available updates install and the computer restarts";
    };

    InstallJamfPolicyTriggersWithoutRestarting = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Allows for installation of Jamf Pro Policies even if there are no available macOS updates/upgrades";
    };

    ScheduleZeroDateRelease = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Leverages the public MacAdmin's SOFA macOS machine readable JSON feed to discover release dates for use in workflows with deadline day options";
    };

    ScheduledInstallUserChoice = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Adds a Schedule button to the standard deferral dialog";
    };

    TestMode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Mode to validate parameters, credentials, notifications, dialogs, deferrals, and deadline logic";
    };

    WorkflowInstallNow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Kicks off the super workflow immediately, prompting user that an update has begun";
    };

    ScheduleWorkflowActive = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Allows you to define multiple weekday time frames that specify when the super workflow is allowed to be active (aka maintenance windows)";
    };

    TestBatteryLevel = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Minmum Battery Percentage";
    };

    TestModeTimeout = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The amount of time in seconds to leave test notifications and dialogs open before moving on in the workflow";
    };

    TestStorageUpdate = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Free space required for updates";
    };

    TestStorageUpgrade = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Free space required for upgrades";
    };

    ScheduleZeroDateManual = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Instead of having the days deadline counter, automatically select the day zero date";
    };

    ScheduleZeroDateSOFACustomURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Allows for a custom self-hosted MacAdmin's SOFA macOS machine readable JSON feed";
    };

    ScheduledInstallDate = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Allows you to specify a date and time that a scheduled installation takes place";
    };

    ScheduledInstallDays = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Allows you to specify the number of days after the zero date that a scheduled installation takes place";
    };

    ScheduledInstallReminder = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Allows you to specify a list of minutes separated by commas (no spaces) that define how often a scheduled installation reminder dialog appears prior to a scheduled installation";
    };

    DeferralTimerDefault = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The number of minutes to defer until the next update workflow attempt if a user choses not restart";
    };

    DeferralTimerError = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The number of minutes to defer if super detects an error in the workflow (for example, network or MDM connectivity issues)";
    };

    DeferralTimerMenu = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Display a deferral time pop-up menu in the non-deadline restart dialog that allows the user to override the Deferral Timer Default timer";
    };

    DeferralTimerWorkflowRelaunch = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The number of minutes to defer if no software updates are available or allowed. Enabling this option results in super acting as a permanent agent that checks for software updates on a regular basis";
    };

    DisplayHideBackground = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Hide the background while displaying super dialogs and notifications";
    };

    DisplayNotificationsCentered = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Display super notifications in the center of the screen";
    };

    DisplaySilently = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Do not play the system alert sound when opening super dialogs and notifications";
    };

    DisplayUnmovable = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Disable the users ability to move super dialogs and notifications";
    };

    DisplayWarningButtonString = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A plain text string or URL to open when the user clicks the warning button (exclamation mark icon) in all interactive dialogs (but not notifications)";
    };

    InstallMacOSMajorUpgrades = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "With this option enabled super leverages built-in commands and the mist command to find compatible macOS major upgrade versions. If a newer macOS major upgrade is available then the super workflow attempts to download and install the upgrade. The default super workflow always selects the newest compatible macOS major upgrade version";
    };

    WorkflowRestartWithoutUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Force a restart even if Apple software updates do not need it";
    };

    InstallMacOSMajorVersionTarget = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Limit the installation of macOS major upgrade versions to the major (whole number) version specified in this option. This option requires that you have also specified the InstallMacOSMajorUpgrades option";
    };

    InstallNonSystemUpdatesWithoutRestarting = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If there are no pending restart-required macOS updates or upgrades, make the super workflow install non-system Apple software updates as soon as they become available";
    };

    InstallRapidSecurityResponses = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allow the super workflow to install macOS Rapid Security Response (RSR) updates";
    };

    WorkflowDisableRelaunch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable the automatic relaunch of the super workflow when no macOS updates or upgrades are available or allowed";
    };

    WorkflowDisableUpdateCheck = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable the super workflow from checking for, downloading, or installing any Apple software updates or upgrades, even if they are available";
    };

    WorkflowOnlyDownload = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Download and prepare macOS updates or upgrades but do not start any installation workflow";
    };

    VerboseMode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Mode to generate additional log output";
    };

  };
}