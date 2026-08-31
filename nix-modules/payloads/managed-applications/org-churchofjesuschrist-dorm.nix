# Auto-generated from ProfileManifests: org.churchofjesuschrist.dorm.plist
# Domain: org.churchofjesuschrist.dorm
# Title: DDM OS Reminder
# Platforms: macOS
# Unique: no
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "DDM OS Reminder";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "org.churchofjesuschrist.dorm";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
        description = "Whether macOS allows only one instance of this payload per profile.";
      };

      _displayName = lib.mkOption {
        internal = true;
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "PayloadDisplayName for this instance. Defaults to the domain.";
      };

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "system" ];
        description = "Profile scopes this payload may be installed into (pfm_targets).";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "PFC_SegmentedControl_0" "ScriptLog" "DaysBeforeDeadlineDisplayReminder" "DaysBeforeDeadlineBlurscreen" "DaysBeforeDeadlineHidingButton2" "DaysOfExcessiveUptimeWarning" "QuietPeriodMinutes" "OutsideDisplayWindowPeriodicReminderDays" "PastDeadlineRestartBehavior" "DaysPastDeadlineRestartWorkflow" "PastDeadlineRestartMinimumUptimeMinutes" "PastDeadlineForceTimerSeconds" "PastDeadlineForceRedisplayDelaySeconds" "MinimumDiskFreePercentage" "DisableButton2InsteadOfHide" "MeetingDelay" "DailyReminderTimes" "MinutesBeforeDeadlineReminderSchedule" "AggressiveModePastDeadlineHours" "AggressiveModeFrequencyMinutes" "AcceptableAssertionApplicationNames" "OrganizationOverlayIconURL" "OrganizationOverlayIconURLdark" "SwapOverlayAndLogo" "DateFormatDeadlineHumanReadable" "DateFormatDeadlineHumanReadableLocalized_fr" "DateFormatDeadlineHumanReadableLocalized_fr_CA" "DateFormatDeadlineHumanReadableLocalized_en_GB" "DateFormatDeadlineHumanReadableLocalized_ja" "SupportTeamName" "SupportTeamPhone" "HideSupportTeamPhone" "SupportTeamEmail" "HideSupportTeamEmail" "SupportTeamWebsite" "HideSupportTeamWebsite" "SupportKB" "HideSupportKB" "InfoButtonAction" "SupportKBURL" "SupportAssistanceMessage" "HideSupportAssistanceMessage" "SupportAssistanceMessageLocalized_en" "SupportAssistanceMessageLocalized_de" "SupportAssistanceMessageLocalized_fr" "SupportAssistanceMessageLocalized_es" "SupportAssistanceMessageLocalized_pt" "SupportAssistanceMessageLocalized_ja" "SupportAssistanceMessageLocalized_nl" "SupportAssistanceMessageLocalized_it" "LanguageOverride" "Title" "TitleLocalized_en" "TitleLocalized_de" "TitleLocalized_fr" "TitleLocalized_es" "TitleLocalized_pt" "TitleLocalized_ja" "TitleLocalized_nl" "TitleLocalized_it" "Button1Text" "Button1TextLocalized_en" "Button1TextLocalized_de" "Button1TextLocalized_fr" "Button1TextLocalized_es" "Button1TextLocalized_pt" "Button1TextLocalized_ja" "Button1TextLocalized_nl" "Button1TextLocalized_it" "Button2Text" "Button2TextLocalized_en" "Button2TextLocalized_de" "Button2TextLocalized_fr" "Button2TextLocalized_es" "Button2TextLocalized_pt" "Button2TextLocalized_ja" "Button2TextLocalized_nl" "Button2TextLocalized_it" "InfoButtonText" "InfoButtonTextLocalized_en" "InfoButtonTextLocalized_de" "InfoButtonTextLocalized_fr" "InfoButtonTextLocalized_es" "InfoButtonTextLocalized_pt" "InfoButtonTextLocalized_ja" "InfoButtonTextLocalized_nl" "InfoButtonTextLocalized_it" "ExcessiveUptimeWarningMessage" "ExcessiveUptimeWarningMessageLocalized_en" "ExcessiveUptimeWarningMessageLocalized_de" "ExcessiveUptimeWarningMessageLocalized_fr" "ExcessiveUptimeWarningMessageLocalized_es" "ExcessiveUptimeWarningMessageLocalized_pt" "ExcessiveUptimeWarningMessageLocalized_ja" "ExcessiveUptimeWarningMessageLocalized_nl" "ExcessiveUptimeWarningMessageLocalized_it" "DiskSpaceWarningMessage" "DiskSpaceWarningMessageLocalized_en" "DiskSpaceWarningMessageLocalized_de" "DiskSpaceWarningMessageLocalized_fr" "DiskSpaceWarningMessageLocalized_es" "DiskSpaceWarningMessageLocalized_pt" "DiskSpaceWarningMessageLocalized_ja" "DiskSpaceWarningMessageLocalized_nl" "DiskSpaceWarningMessageLocalized_it" "StagedUpdateMessage" "StagedUpdateMessageLocalized_en" "StagedUpdateMessageLocalized_de" "StagedUpdateMessageLocalized_fr" "StagedUpdateMessageLocalized_es" "StagedUpdateMessageLocalized_pt" "StagedUpdateMessageLocalized_ja" "StagedUpdateMessageLocalized_nl" "StagedUpdateMessageLocalized_it" "PartiallyStagedUpdateMessage" "PartiallyStagedUpdateMessageLocalized_en" "PartiallyStagedUpdateMessageLocalized_de" "PartiallyStagedUpdateMessageLocalized_fr" "PartiallyStagedUpdateMessageLocalized_es" "PartiallyStagedUpdateMessageLocalized_pt" "PartiallyStagedUpdateMessageLocalized_ja" "PartiallyStagedUpdateMessageLocalized_nl" "PartiallyStagedUpdateMessageLocalized_it" "PendingDownloadMessage" "PendingDownloadMessageLocalized_en" "PendingDownloadMessageLocalized_de" "PendingDownloadMessageLocalized_fr" "PendingDownloadMessageLocalized_es" "PendingDownloadMessageLocalized_pt" "PendingDownloadMessageLocalized_ja" "PendingDownloadMessageLocalized_nl" "PendingDownloadMessageLocalized_it" "HideStagedUpdateInfo" "RelativeDeadlineToday" "RelativeDeadlineTodayLocalized_en" "RelativeDeadlineTodayLocalized_de" "RelativeDeadlineTodayLocalized_fr" "RelativeDeadlineTodayLocalized_es" "RelativeDeadlineTodayLocalized_pt" "RelativeDeadlineTodayLocalized_ja" "RelativeDeadlineTodayLocalized_nl" "RelativeDeadlineTodayLocalized_it" "RelativeDeadlineTomorrow" "RelativeDeadlineTomorrowLocalized_en" "RelativeDeadlineTomorrowLocalized_de" "RelativeDeadlineTomorrowLocalized_fr" "RelativeDeadlineTomorrowLocalized_es" "RelativeDeadlineTomorrowLocalized_pt" "RelativeDeadlineTomorrowLocalized_ja" "RelativeDeadlineTomorrowLocalized_nl" "RelativeDeadlineTomorrowLocalized_it" "UpdateWord" "UpdateWordLocalized_en" "UpdateWordLocalized_de" "UpdateWordLocalized_fr" "UpdateWordLocalized_es" "UpdateWordLocalized_pt" "UpdateWordLocalized_ja" "UpdateWordLocalized_nl" "UpdateWordLocalized_it" "UpgradeWord" "UpgradeWordLocalized_en" "UpgradeWordLocalized_de" "UpgradeWordLocalized_fr" "UpgradeWordLocalized_es" "UpgradeWordLocalized_pt" "UpgradeWordLocalized_ja" "UpgradeWordLocalized_nl" "UpgradeWordLocalized_it" "SoftwareUpdateButtonTextUpdate" "SoftwareUpdateButtonTextUpdateLocalized_en" "SoftwareUpdateButtonTextUpdateLocalized_de" "SoftwareUpdateButtonTextUpdateLocalized_fr" "SoftwareUpdateButtonTextUpdateLocalized_es" "SoftwareUpdateButtonTextUpdateLocalized_pt" "SoftwareUpdateButtonTextUpdateLocalized_ja" "SoftwareUpdateButtonTextUpdateLocalized_nl" "SoftwareUpdateButtonTextUpdateLocalized_it" "SoftwareUpdateButtonTextUpgrade" "SoftwareUpdateButtonTextUpgradeLocalized_en" "SoftwareUpdateButtonTextUpgradeLocalized_de" "SoftwareUpdateButtonTextUpgradeLocalized_fr" "SoftwareUpdateButtonTextUpgradeLocalized_es" "SoftwareUpdateButtonTextUpgradeLocalized_pt" "SoftwareUpdateButtonTextUpgradeLocalized_ja" "SoftwareUpdateButtonTextUpgradeLocalized_nl" "SoftwareUpdateButtonTextUpgradeLocalized_it" "RestartNowButtonText" "RestartNowButtonTextLocalized_en" "RestartNowButtonTextLocalized_de" "RestartNowButtonTextLocalized_fr" "RestartNowButtonTextLocalized_es" "RestartNowButtonTextLocalized_pt" "RestartNowButtonTextLocalized_ja" "RestartNowButtonTextLocalized_nl" "RestartNowButtonTextLocalized_it" "InfoboxLabelCurrent" "InfoboxLabelCurrentLocalized_en" "InfoboxLabelCurrentLocalized_de" "InfoboxLabelCurrentLocalized_fr" "InfoboxLabelCurrentLocalized_es" "InfoboxLabelCurrentLocalized_pt" "InfoboxLabelCurrentLocalized_ja" "InfoboxLabelCurrentLocalized_nl" "InfoboxLabelCurrentLocalized_it" "InfoboxLabelRequired" "InfoboxLabelRequiredLocalized_en" "InfoboxLabelRequiredLocalized_de" "InfoboxLabelRequiredLocalized_fr" "InfoboxLabelRequiredLocalized_es" "InfoboxLabelRequiredLocalized_pt" "InfoboxLabelRequiredLocalized_ja" "InfoboxLabelRequiredLocalized_nl" "InfoboxLabelRequiredLocalized_it" "InfoboxLabelDeadline" "InfoboxLabelDeadlineLocalized_en" "InfoboxLabelDeadlineLocalized_de" "InfoboxLabelDeadlineLocalized_fr" "InfoboxLabelDeadlineLocalized_es" "InfoboxLabelDeadlineLocalized_pt" "InfoboxLabelDeadlineLocalized_ja" "InfoboxLabelDeadlineLocalized_nl" "InfoboxLabelDeadlineLocalized_it" "InfoboxLabelDaysRemaining" "InfoboxLabelDaysRemainingLocalized_en" "InfoboxLabelDaysRemainingLocalized_de" "InfoboxLabelDaysRemainingLocalized_fr" "InfoboxLabelDaysRemainingLocalized_es" "InfoboxLabelDaysRemainingLocalized_pt" "InfoboxLabelDaysRemainingLocalized_ja" "InfoboxLabelDaysRemainingLocalized_nl" "InfoboxLabelDaysRemainingLocalized_it" "InfoboxLabelLastRestart" "InfoboxLabelLastRestartLocalized_en" "InfoboxLabelLastRestartLocalized_de" "InfoboxLabelLastRestartLocalized_fr" "InfoboxLabelLastRestartLocalized_es" "InfoboxLabelLastRestartLocalized_pt" "InfoboxLabelLastRestartLocalized_ja" "InfoboxLabelLastRestartLocalized_nl" "InfoboxLabelLastRestartLocalized_it" "InfoboxLabelFreeDiskSpace" "InfoboxLabelFreeDiskSpaceLocalized_en" "InfoboxLabelFreeDiskSpaceLocalized_de" "InfoboxLabelFreeDiskSpaceLocalized_fr" "InfoboxLabelFreeDiskSpaceLocalized_es" "InfoboxLabelFreeDiskSpaceLocalized_pt" "InfoboxLabelFreeDiskSpaceLocalized_ja" "InfoboxLabelFreeDiskSpaceLocalized_nl" "InfoboxLabelFreeDiskSpaceLocalized_it" "DeadlineEnforcementMessageAbsolute" "DeadlineEnforcementMessageAbsoluteLocalized_en" "DeadlineEnforcementMessageAbsoluteLocalized_de" "DeadlineEnforcementMessageAbsoluteLocalized_fr" "DeadlineEnforcementMessageAbsoluteLocalized_es" "DeadlineEnforcementMessageAbsoluteLocalized_pt" "DeadlineEnforcementMessageAbsoluteLocalized_ja" "DeadlineEnforcementMessageAbsoluteLocalized_nl" "DeadlineEnforcementMessageAbsoluteLocalized_it" "DeadlineEnforcementMessageRelative" "DeadlineEnforcementMessageRelativeLocalized_en" "DeadlineEnforcementMessageRelativeLocalized_de" "DeadlineEnforcementMessageRelativeLocalized_fr" "DeadlineEnforcementMessageRelativeLocalized_es" "DeadlineEnforcementMessageRelativeLocalized_pt" "DeadlineEnforcementMessageRelativeLocalized_ja" "DeadlineEnforcementMessageRelativeLocalized_nl" "DeadlineEnforcementMessageRelativeLocalized_it" "PreDeadlineThresholdTitle" "PreDeadlineThresholdTitleLocalized_en" "PreDeadlineThresholdTitleLocalized_de" "PreDeadlineThresholdTitleLocalized_fr" "PreDeadlineThresholdTitleLocalized_es" "PreDeadlineThresholdTitleLocalized_pt" "PreDeadlineThresholdTitleLocalized_ja" "PreDeadlineThresholdTitleLocalized_nl" "PreDeadlineThresholdTitleLocalized_it" "PreDeadlineThresholdMessage" "PreDeadlineThresholdMessageLocalized_en" "PreDeadlineThresholdMessageLocalized_de" "PreDeadlineThresholdMessageLocalized_fr" "PreDeadlineThresholdMessageLocalized_es" "PreDeadlineThresholdMessageLocalized_pt" "PreDeadlineThresholdMessageLocalized_ja" "PreDeadlineThresholdMessageLocalized_nl" "PreDeadlineThresholdMessageLocalized_it" "PastDeadlinePromptTitle" "PastDeadlinePromptTitleLocalized_en" "PastDeadlinePromptTitleLocalized_de" "PastDeadlinePromptTitleLocalized_fr" "PastDeadlinePromptTitleLocalized_es" "PastDeadlinePromptTitleLocalized_pt" "PastDeadlinePromptTitleLocalized_ja" "PastDeadlinePromptTitleLocalized_nl" "PastDeadlinePromptTitleLocalized_it" "PastDeadlinePromptMessage" "PastDeadlinePromptMessageLocalized_en" "PastDeadlinePromptMessageLocalized_de" "PastDeadlinePromptMessageLocalized_fr" "PastDeadlinePromptMessageLocalized_es" "PastDeadlinePromptMessageLocalized_pt" "PastDeadlinePromptMessageLocalized_ja" "PastDeadlinePromptMessageLocalized_nl" "PastDeadlinePromptMessageLocalized_it" "PastDeadlineForceTitle" "PastDeadlineForceTitleLocalized_en" "PastDeadlineForceTitleLocalized_de" "PastDeadlineForceTitleLocalized_fr" "PastDeadlineForceTitleLocalized_es" "PastDeadlineForceTitleLocalized_pt" "PastDeadlineForceTitleLocalized_ja" "PastDeadlineForceTitleLocalized_nl" "PastDeadlineForceTitleLocalized_it" "PastDeadlineForceMessage" "PastDeadlineForceMessageLocalized_en" "PastDeadlineForceMessageLocalized_de" "PastDeadlineForceMessageLocalized_fr" "PastDeadlineForceMessageLocalized_es" "PastDeadlineForceMessageLocalized_pt" "PastDeadlineForceMessageLocalized_ja" "PastDeadlineForceMessageLocalized_nl" "PastDeadlineForceMessageLocalized_it" "AggressiveModeTitle" "AggressiveModeTitleLocalized_en" "AggressiveModeTitleLocalized_de" "AggressiveModeTitleLocalized_fr" "AggressiveModeTitleLocalized_es" "AggressiveModeTitleLocalized_pt" "AggressiveModeTitleLocalized_ja" "AggressiveModeTitleLocalized_nl" "AggressiveModeTitleLocalized_it" "AggressiveModeMessage" "AggressiveModeMessageLocalized_en" "AggressiveModeMessageLocalized_de" "AggressiveModeMessageLocalized_fr" "AggressiveModeMessageLocalized_es" "AggressiveModeMessageLocalized_pt" "AggressiveModeMessageLocalized_ja" "AggressiveModeMessageLocalized_nl" "AggressiveModeMessageLocalized_it" "Message" "MessageLocalized_en" "MessageLocalized_de" "MessageLocalized_fr" "MessageLocalized_es" "MessageLocalized_pt" "MessageLocalized_ja" "MessageLocalized_nl" "MessageLocalized_it" "InfoBox" "HelpMessage" "HelpMessageLocalized_en" "HelpMessageLocalized_de" "HelpMessageLocalized_fr" "HelpMessageLocalized_es" "HelpMessageLocalized_pt" "HelpMessageLocalized_ja" "HelpMessageLocalized_nl" "HelpMessageLocalized_it" "HelpImage" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      PFC_SegmentedControl_0 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      ScriptLog = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Path to the log file for the DDM reminder script.";
      };

      DaysBeforeDeadlineDisplayReminder = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Number of days before the deadline when reminders start being displayed.";
      };

      DaysBeforeDeadlineBlurscreen = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Number of days before the deadline when blur-screen enforcement starts.";
      };

      DaysBeforeDeadlineHidingButton2 = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Number of days before the deadline when the secondary button is hidden.";
      };

      DaysOfExcessiveUptimeWarning = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Number of days of excessive uptime before warning the user.";
      };

      QuietPeriodMinutes = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Number of minutes after a user interaction during which baseline reminders are suppressed.";
      };

      OutsideDisplayWindowPeriodicReminderDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Interval in days for periodic reminders before the regular display window begins.";
      };

      PastDeadlineRestartBehavior = lib.mkOption {
        type = types.nullOr (types.enum [ "Off" "Prompt" "Force" ]);
        default = null;
        description = "Controls restart workflow behavior after deadline. Valid values: Off | Prompt | Force.";
      };

      DaysPastDeadlineRestartWorkflow = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Number of days past deadline before activating restart workflow behavior.";
      };

      PastDeadlineRestartMinimumUptimeMinutes = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Minimum uptime in minutes required before the past-deadline restart workflow is eligible to run.";
      };

      PastDeadlineForceTimerSeconds = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Countdown duration in seconds shown by the past-deadline Force restart workflow.";
      };

      PastDeadlineForceRedisplayDelaySeconds = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Delay in seconds before redisplaying the past-deadline Force restart dialog.";
      };

      MinimumDiskFreePercentage = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Percent of free disk space required before warning the user.";
      };

      DisableButton2InsteadOfHide = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Whether to disable the secondary button instead of hiding it when deferral is no longer allowed.";
      };

      MeetingDelay = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Delay in minutes before enforcing reminders around meetings.";
      };

      DailyReminderTimes = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Comma-separated local reminder times in 24-hour HH:MM format used by the heartbeat scheduler.";
      };

      MinutesBeforeDeadlineReminderSchedule = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Comma-separated minute thresholds before the effective enforcement deadline when final reminders are displayed.";
      };

      AggressiveModePastDeadlineHours = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Hours past the effective deadline before aggressive reminder mode starts.";
      };

      AggressiveModeFrequencyMinutes = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Minutes between reminders while aggressive past-deadline mode is active.";
      };

      AcceptableAssertionApplicationNames = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Space-delimited list of application name substrings used to allowlist display sleep assertions; matching assertions defer reminders up to the Meeting Delay.";
      };

      OrganizationOverlayIconURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "URL to the organization overlay icon image.";
      };

      OrganizationOverlayIconURLdark = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "URL to the organization overlay icon image used when the interface is in Dark Mode. Falls back to OrganizationOverlayIconURL when unset.";
      };

      SwapOverlayAndLogo = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Whether to swap the overlay icon and primary logo positions.";
      };

      DateFormatDeadlineHumanReadable = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "strftime format string used to render the deadline date for users.";
      };

      DateFormatDeadlineHumanReadableLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized French override for deadline date format (human readable).";
      };

      DateFormatDeadlineHumanReadableLocalized_fr_CA = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized French — Canada override for deadline date format (human readable).";
      };

      DateFormatDeadlineHumanReadableLocalized_en_GB = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized English — United Kingdom override for deadline date format (human readable).";
      };

      DateFormatDeadlineHumanReadableLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Japanese override for deadline date format (human readable).";
      };

      SupportTeamName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Display name of the support team.";
      };

      SupportTeamPhone = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Phone number for support.";
      };

      HideSupportTeamPhone = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When enabled, hide the support phone row and blank the corresponding placeholder.";
      };

      SupportTeamEmail = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Email address for support.";
      };

      HideSupportTeamEmail = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When enabled, hide the support email row and blank the corresponding placeholder.";
      };

      SupportTeamWebsite = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Website URL for support.";
      };

      HideSupportTeamWebsite = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When enabled, hide the support website row and blank the corresponding placeholder.";
      };

      SupportKB = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Knowledge base article identifier.";
      };

      HideSupportKB = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When enabled, hide the support knowledge base row and blank the corresponding placeholders.";
      };

      InfoButtonAction = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "URL opened when the info button is clicked.";
      };

      SupportKBURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Markdown-formatted link to the support knowledge base article.";
      };

      SupportAssistanceMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Optional support sentence appended to message body.";
      };

      HideSupportAssistanceMessage = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When enabled, suppress the support assistance sentence in the main dialog body.";
      };

      SupportAssistanceMessageLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized support assistance message for English.";
      };

      SupportAssistanceMessageLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized support assistance message for German.";
      };

      SupportAssistanceMessageLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized support assistance message for French.";
      };

      SupportAssistanceMessageLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized support assistance message for Spanish.";
      };

      SupportAssistanceMessageLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized support assistance message for Portuguese.";
      };

      SupportAssistanceMessageLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized support assistance message for Japanese.";
      };

      SupportAssistanceMessageLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized support assistance message for Dutch.";
      };

      SupportAssistanceMessageLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized support assistance message for Italian.";
      };

      LanguageOverride = lib.mkOption {
        type = types.nullOr (types.enum [ "auto" "en" "de" "fr" "es" "it" "nl" "pt" "ja" ]);
        default = null;
        description = "Language code to force for dialog content. Use auto to detect the logged-in user language.";
      };

      Title = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Title text displayed at the top of the DDM dialog.";
      };

      TitleLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title text displayed at the top of the ddm dialog. for English.";
      };

      TitleLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title text displayed at the top of the ddm dialog. for German.";
      };

      TitleLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title text displayed at the top of the ddm dialog. for French.";
      };

      TitleLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title text displayed at the top of the ddm dialog. for Spanish.";
      };

      TitleLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title text displayed at the top of the ddm dialog. for Portuguese.";
      };

      TitleLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title text displayed at the top of the ddm dialog. for Japanese.";
      };

      TitleLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title text displayed at the top of the ddm dialog. for Dutch.";
      };

      TitleLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title text displayed at the top of the ddm dialog. for Italian.";
      };

      Button1Text = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Label for the primary action button.";
      };

      Button1TextLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the primary action button. for English.";
      };

      Button1TextLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the primary action button. for German.";
      };

      Button1TextLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the primary action button. for French.";
      };

      Button1TextLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the primary action button. for Spanish.";
      };

      Button1TextLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the primary action button. for Portuguese.";
      };

      Button1TextLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the primary action button. for Japanese.";
      };

      Button1TextLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the primary action button. for Dutch.";
      };

      Button1TextLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the primary action button. for Italian.";
      };

      Button2Text = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Label for the secondary (remind later) button.";
      };

      Button2TextLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the secondary (remind later) button. for English.";
      };

      Button2TextLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the secondary (remind later) button. for German.";
      };

      Button2TextLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the secondary (remind later) button. for French.";
      };

      Button2TextLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the secondary (remind later) button. for Spanish.";
      };

      Button2TextLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the secondary (remind later) button. for Portuguese.";
      };

      Button2TextLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the secondary (remind later) button. for Japanese.";
      };

      Button2TextLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the secondary (remind later) button. for Dutch.";
      };

      Button2TextLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the secondary (remind later) button. for Italian.";
      };

      InfoButtonText = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Label for the info button.";
      };

      InfoButtonTextLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the info button. for English.";
      };

      InfoButtonTextLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the info button. for German.";
      };

      InfoButtonTextLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the info button. for French.";
      };

      InfoButtonTextLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the info button. for Spanish.";
      };

      InfoButtonTextLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the info button. for Portuguese.";
      };

      InfoButtonTextLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the info button. for Japanese.";
      };

      InfoButtonTextLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the info button. for Dutch.";
      };

      InfoButtonTextLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label for the info button. for Italian.";
      };

      ExcessiveUptimeWarningMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Markdown-formatted text displayed in the dialog.";
      };

      ExcessiveUptimeWarningMessageLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when system uptime exceeds the configured threshold. for English.";
      };

      ExcessiveUptimeWarningMessageLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when system uptime exceeds the configured threshold. for German.";
      };

      ExcessiveUptimeWarningMessageLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when system uptime exceeds the configured threshold. for French.";
      };

      ExcessiveUptimeWarningMessageLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when system uptime exceeds the configured threshold. for Spanish.";
      };

      ExcessiveUptimeWarningMessageLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when system uptime exceeds the configured threshold. for Portuguese.";
      };

      ExcessiveUptimeWarningMessageLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when system uptime exceeds the configured threshold. for Japanese.";
      };

      ExcessiveUptimeWarningMessageLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when system uptime exceeds the configured threshold. for Dutch.";
      };

      ExcessiveUptimeWarningMessageLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when system uptime exceeds the configured threshold. for Italian.";
      };

      DiskSpaceWarningMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Markdown-formatted text displayed in the dialog.";
      };

      DiskSpaceWarningMessageLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when free disk space falls below the configured threshold. for English.";
      };

      DiskSpaceWarningMessageLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when free disk space falls below the configured threshold. for German.";
      };

      DiskSpaceWarningMessageLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when free disk space falls below the configured threshold. for French.";
      };

      DiskSpaceWarningMessageLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when free disk space falls below the configured threshold. for Spanish.";
      };

      DiskSpaceWarningMessageLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when free disk space falls below the configured threshold. for Portuguese.";
      };

      DiskSpaceWarningMessageLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when free disk space falls below the configured threshold. for Japanese.";
      };

      DiskSpaceWarningMessageLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when free disk space falls below the configured threshold. for Dutch.";
      };

      DiskSpaceWarningMessageLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted warning shown when free disk space falls below the configured threshold. for Italian.";
      };

      StagedUpdateMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Markdown-formatted message displayed when the update is fully staged (downloaded and ready).";
      };

      StagedUpdateMessageLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is fully staged. for English.";
      };

      StagedUpdateMessageLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is fully staged. for German.";
      };

      StagedUpdateMessageLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is fully staged. for French.";
      };

      StagedUpdateMessageLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is fully staged. for Spanish.";
      };

      StagedUpdateMessageLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is fully staged. for Portuguese.";
      };

      StagedUpdateMessageLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is fully staged. for Japanese.";
      };

      StagedUpdateMessageLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is fully staged. for Dutch.";
      };

      StagedUpdateMessageLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is fully staged. for Italian.";
      };

      PartiallyStagedUpdateMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Markdown-formatted message displayed when the update is partially staged (preparing).";
      };

      PartiallyStagedUpdateMessageLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is partially staged. for English.";
      };

      PartiallyStagedUpdateMessageLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is partially staged. for German.";
      };

      PartiallyStagedUpdateMessageLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is partially staged. for French.";
      };

      PartiallyStagedUpdateMessageLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is partially staged. for Spanish.";
      };

      PartiallyStagedUpdateMessageLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is partially staged. for Portuguese.";
      };

      PartiallyStagedUpdateMessageLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is partially staged. for Japanese.";
      };

      PartiallyStagedUpdateMessageLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is partially staged. for Dutch.";
      };

      PartiallyStagedUpdateMessageLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update is partially staged. for Italian.";
      };

      PendingDownloadMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Markdown-formatted message displayed when the update download is pending.";
      };

      PendingDownloadMessageLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update download is pending. for English.";
      };

      PendingDownloadMessageLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update download is pending. for German.";
      };

      PendingDownloadMessageLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update download is pending. for French.";
      };

      PendingDownloadMessageLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update download is pending. for Spanish.";
      };

      PendingDownloadMessageLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update download is pending. for Portuguese.";
      };

      PendingDownloadMessageLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update download is pending. for Japanese.";
      };

      PendingDownloadMessageLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update download is pending. for Dutch.";
      };

      PendingDownloadMessageLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message displayed when the update download is pending. for Italian.";
      };

      HideStagedUpdateInfo = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Whether to hide staged update information (e.g., staged/partial/pending messages) in the UI.";
      };

      RelativeDeadlineToday = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Relative deadline phrase used when enforcement occurs on the current day.";
      };

      RelativeDeadlineTodayLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the current day. for English.";
      };

      RelativeDeadlineTodayLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the current day. for German.";
      };

      RelativeDeadlineTodayLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the current day. for French.";
      };

      RelativeDeadlineTodayLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the current day. for Spanish.";
      };

      RelativeDeadlineTodayLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the current day. for Portuguese.";
      };

      RelativeDeadlineTodayLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the current day. for Japanese.";
      };

      RelativeDeadlineTodayLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the current day. for Dutch.";
      };

      RelativeDeadlineTodayLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the current day. for Italian.";
      };

      RelativeDeadlineTomorrow = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Relative deadline phrase used when enforcement occurs on the following day.";
      };

      RelativeDeadlineTomorrowLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the following day. for English.";
      };

      RelativeDeadlineTomorrowLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the following day. for German.";
      };

      RelativeDeadlineTomorrowLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the following day. for French.";
      };

      RelativeDeadlineTomorrowLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the following day. for Spanish.";
      };

      RelativeDeadlineTomorrowLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the following day. for Portuguese.";
      };

      RelativeDeadlineTomorrowLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the following day. for Japanese.";
      };

      RelativeDeadlineTomorrowLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the following day. for Dutch.";
      };

      RelativeDeadlineTomorrowLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized relative deadline phrase used when enforcement occurs on the following day. for Italian.";
      };

      UpdateWord = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized word used when the enforced action is an update.";
      };

      UpdateWordLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an update. for English.";
      };

      UpdateWordLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an update. for German.";
      };

      UpdateWordLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an update. for French.";
      };

      UpdateWordLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an update. for Spanish.";
      };

      UpdateWordLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an update. for Portuguese.";
      };

      UpdateWordLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an update. for Japanese.";
      };

      UpdateWordLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an update. for Dutch.";
      };

      UpdateWordLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an update. for Italian.";
      };

      UpgradeWord = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized word used when the enforced action is an upgrade.";
      };

      UpgradeWordLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an upgrade. for English.";
      };

      UpgradeWordLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an upgrade. for German.";
      };

      UpgradeWordLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an upgrade. for French.";
      };

      UpgradeWordLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an upgrade. for Spanish.";
      };

      UpgradeWordLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an upgrade. for Portuguese.";
      };

      UpgradeWordLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an upgrade. for Japanese.";
      };

      UpgradeWordLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an upgrade. for Dutch.";
      };

      UpgradeWordLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized localized word used when the enforced action is an upgrade. for Italian.";
      };

      SoftwareUpdateButtonTextUpdate = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Text users are told to click in Software Update for point-release updates.";
      };

      SoftwareUpdateButtonTextUpdateLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for point-release updates. for English.";
      };

      SoftwareUpdateButtonTextUpdateLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for point-release updates. for German.";
      };

      SoftwareUpdateButtonTextUpdateLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for point-release updates. for French.";
      };

      SoftwareUpdateButtonTextUpdateLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for point-release updates. for Spanish.";
      };

      SoftwareUpdateButtonTextUpdateLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for point-release updates. for Portuguese.";
      };

      SoftwareUpdateButtonTextUpdateLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for point-release updates. for Japanese.";
      };

      SoftwareUpdateButtonTextUpdateLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for point-release updates. for Dutch.";
      };

      SoftwareUpdateButtonTextUpdateLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for point-release updates. for Italian.";
      };

      SoftwareUpdateButtonTextUpgrade = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Text users are told to click in Software Update for major upgrades.";
      };

      SoftwareUpdateButtonTextUpgradeLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for major upgrades. for English.";
      };

      SoftwareUpdateButtonTextUpgradeLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for major upgrades. for German.";
      };

      SoftwareUpdateButtonTextUpgradeLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for major upgrades. for French.";
      };

      SoftwareUpdateButtonTextUpgradeLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for major upgrades. for Spanish.";
      };

      SoftwareUpdateButtonTextUpgradeLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for major upgrades. for Portuguese.";
      };

      SoftwareUpdateButtonTextUpgradeLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for major upgrades. for Japanese.";
      };

      SoftwareUpdateButtonTextUpgradeLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for major upgrades. for Dutch.";
      };

      SoftwareUpdateButtonTextUpgradeLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized text users are told to click in software update for major upgrades. for Italian.";
      };

      RestartNowButtonText = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Button label used in past-deadline restart dialogs.";
      };

      RestartNowButtonTextLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized button label used in past-deadline restart dialogs. for English.";
      };

      RestartNowButtonTextLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized button label used in past-deadline restart dialogs. for German.";
      };

      RestartNowButtonTextLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized button label used in past-deadline restart dialogs. for French.";
      };

      RestartNowButtonTextLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized button label used in past-deadline restart dialogs. for Spanish.";
      };

      RestartNowButtonTextLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized button label used in past-deadline restart dialogs. for Portuguese.";
      };

      RestartNowButtonTextLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized button label used in past-deadline restart dialogs. for Japanese.";
      };

      RestartNowButtonTextLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized button label used in past-deadline restart dialogs. for Dutch.";
      };

      RestartNowButtonTextLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized button label used in past-deadline restart dialogs. for Italian.";
      };

      InfoboxLabelCurrent = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Label shown for the current macOS version in the info box.";
      };

      InfoboxLabelCurrentLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the current macos version in the info box. for English.";
      };

      InfoboxLabelCurrentLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the current macos version in the info box. for German.";
      };

      InfoboxLabelCurrentLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the current macos version in the info box. for French.";
      };

      InfoboxLabelCurrentLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the current macos version in the info box. for Spanish.";
      };

      InfoboxLabelCurrentLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the current macos version in the info box. for Portuguese.";
      };

      InfoboxLabelCurrentLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the current macos version in the info box. for Japanese.";
      };

      InfoboxLabelCurrentLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the current macos version in the info box. for Dutch.";
      };

      InfoboxLabelCurrentLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the current macos version in the info box. for Italian.";
      };

      InfoboxLabelRequired = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Label shown for the required macOS version in the info box.";
      };

      InfoboxLabelRequiredLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the required macos version in the info box. for English.";
      };

      InfoboxLabelRequiredLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the required macos version in the info box. for German.";
      };

      InfoboxLabelRequiredLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the required macos version in the info box. for French.";
      };

      InfoboxLabelRequiredLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the required macos version in the info box. for Spanish.";
      };

      InfoboxLabelRequiredLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the required macos version in the info box. for Portuguese.";
      };

      InfoboxLabelRequiredLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the required macos version in the info box. for Japanese.";
      };

      InfoboxLabelRequiredLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the required macos version in the info box. for Dutch.";
      };

      InfoboxLabelRequiredLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the required macos version in the info box. for Italian.";
      };

      InfoboxLabelDeadline = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Label shown for the enforcement deadline in the info box.";
      };

      InfoboxLabelDeadlineLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the enforcement deadline in the info box. for English.";
      };

      InfoboxLabelDeadlineLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the enforcement deadline in the info box. for German.";
      };

      InfoboxLabelDeadlineLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the enforcement deadline in the info box. for French.";
      };

      InfoboxLabelDeadlineLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the enforcement deadline in the info box. for Spanish.";
      };

      InfoboxLabelDeadlineLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the enforcement deadline in the info box. for Portuguese.";
      };

      InfoboxLabelDeadlineLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the enforcement deadline in the info box. for Japanese.";
      };

      InfoboxLabelDeadlineLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the enforcement deadline in the info box. for Dutch.";
      };

      InfoboxLabelDeadlineLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the enforcement deadline in the info box. for Italian.";
      };

      InfoboxLabelDaysRemaining = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Label shown for remaining days in the info box.";
      };

      InfoboxLabelDaysRemainingLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for remaining days in the info box. for English.";
      };

      InfoboxLabelDaysRemainingLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for remaining days in the info box. for German.";
      };

      InfoboxLabelDaysRemainingLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for remaining days in the info box. for French.";
      };

      InfoboxLabelDaysRemainingLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for remaining days in the info box. for Spanish.";
      };

      InfoboxLabelDaysRemainingLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for remaining days in the info box. for Portuguese.";
      };

      InfoboxLabelDaysRemainingLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for remaining days in the info box. for Japanese.";
      };

      InfoboxLabelDaysRemainingLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for remaining days in the info box. for Dutch.";
      };

      InfoboxLabelDaysRemainingLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for remaining days in the info box. for Italian.";
      };

      InfoboxLabelLastRestart = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Label shown for the last restart value in the info box.";
      };

      InfoboxLabelLastRestartLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the last restart value in the info box. for English.";
      };

      InfoboxLabelLastRestartLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the last restart value in the info box. for German.";
      };

      InfoboxLabelLastRestartLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the last restart value in the info box. for French.";
      };

      InfoboxLabelLastRestartLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the last restart value in the info box. for Spanish.";
      };

      InfoboxLabelLastRestartLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the last restart value in the info box. for Portuguese.";
      };

      InfoboxLabelLastRestartLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the last restart value in the info box. for Japanese.";
      };

      InfoboxLabelLastRestartLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the last restart value in the info box. for Dutch.";
      };

      InfoboxLabelLastRestartLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for the last restart value in the info box. for Italian.";
      };

      InfoboxLabelFreeDiskSpace = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Label shown for free disk space in the info box.";
      };

      InfoboxLabelFreeDiskSpaceLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for free disk space in the info box. for English.";
      };

      InfoboxLabelFreeDiskSpaceLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for free disk space in the info box. for German.";
      };

      InfoboxLabelFreeDiskSpaceLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for free disk space in the info box. for French.";
      };

      InfoboxLabelFreeDiskSpaceLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for free disk space in the info box. for Spanish.";
      };

      InfoboxLabelFreeDiskSpaceLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for free disk space in the info box. for Portuguese.";
      };

      InfoboxLabelFreeDiskSpaceLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for free disk space in the info box. for Japanese.";
      };

      InfoboxLabelFreeDiskSpaceLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for free disk space in the info box. for Dutch.";
      };

      InfoboxLabelFreeDiskSpaceLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized label shown for free disk space in the info box. for Italian.";
      };

      DeadlineEnforcementMessageAbsolute = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Sentence appended to the main message when the deadline renders as a full date.";
      };

      DeadlineEnforcementMessageAbsoluteLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as a full date. for English.";
      };

      DeadlineEnforcementMessageAbsoluteLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as a full date. for German.";
      };

      DeadlineEnforcementMessageAbsoluteLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as a full date. for French.";
      };

      DeadlineEnforcementMessageAbsoluteLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as a full date. for Spanish.";
      };

      DeadlineEnforcementMessageAbsoluteLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as a full date. for Portuguese.";
      };

      DeadlineEnforcementMessageAbsoluteLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as a full date. for Japanese.";
      };

      DeadlineEnforcementMessageAbsoluteLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as a full date. for Dutch.";
      };

      DeadlineEnforcementMessageAbsoluteLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as a full date. for Italian.";
      };

      DeadlineEnforcementMessageRelative = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Sentence appended to the main message when the deadline renders as Today or Tomorrow.";
      };

      DeadlineEnforcementMessageRelativeLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as today or tomorrow. for English.";
      };

      DeadlineEnforcementMessageRelativeLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as today or tomorrow. for German.";
      };

      DeadlineEnforcementMessageRelativeLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as today or tomorrow. for French.";
      };

      DeadlineEnforcementMessageRelativeLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as today or tomorrow. for Spanish.";
      };

      DeadlineEnforcementMessageRelativeLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as today or tomorrow. for Portuguese.";
      };

      DeadlineEnforcementMessageRelativeLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as today or tomorrow. for Japanese.";
      };

      DeadlineEnforcementMessageRelativeLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as today or tomorrow. for Dutch.";
      };

      DeadlineEnforcementMessageRelativeLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized sentence appended to the main message when the deadline renders as today or tomorrow. for Italian.";
      };

      PreDeadlineThresholdTitle = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Title displayed for a configured final-minute pre-deadline reminder.";
      };

      PreDeadlineThresholdTitleLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized English override for pre-deadline threshold title.";
      };

      PreDeadlineThresholdTitleLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized German override for pre-deadline threshold title.";
      };

      PreDeadlineThresholdTitleLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized French override for pre-deadline threshold title.";
      };

      PreDeadlineThresholdTitleLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Spanish override for pre-deadline threshold title.";
      };

      PreDeadlineThresholdTitleLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Portuguese override for pre-deadline threshold title.";
      };

      PreDeadlineThresholdTitleLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Japanese override for pre-deadline threshold title.";
      };

      PreDeadlineThresholdTitleLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Dutch override for pre-deadline threshold title.";
      };

      PreDeadlineThresholdTitleLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Italian override for pre-deadline threshold title.";
      };

      PreDeadlineThresholdMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Markdown-formatted message displayed for a configured final-minute pre-deadline reminder.";
      };

      PreDeadlineThresholdMessageLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized English override for pre-deadline threshold message.";
      };

      PreDeadlineThresholdMessageLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized German override for pre-deadline threshold message.";
      };

      PreDeadlineThresholdMessageLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized French override for pre-deadline threshold message.";
      };

      PreDeadlineThresholdMessageLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Spanish override for pre-deadline threshold message.";
      };

      PreDeadlineThresholdMessageLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Portuguese override for pre-deadline threshold message.";
      };

      PreDeadlineThresholdMessageLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Japanese override for pre-deadline threshold message.";
      };

      PreDeadlineThresholdMessageLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Dutch override for pre-deadline threshold message.";
      };

      PreDeadlineThresholdMessageLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Italian override for pre-deadline threshold message.";
      };

      PastDeadlinePromptTitle = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Title shown when past-deadline restart behavior is Prompt.";
      };

      PastDeadlinePromptTitleLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is prompt. for English.";
      };

      PastDeadlinePromptTitleLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is prompt. for German.";
      };

      PastDeadlinePromptTitleLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is prompt. for French.";
      };

      PastDeadlinePromptTitleLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is prompt. for Spanish.";
      };

      PastDeadlinePromptTitleLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is prompt. for Portuguese.";
      };

      PastDeadlinePromptTitleLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is prompt. for Japanese.";
      };

      PastDeadlinePromptTitleLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is prompt. for Dutch.";
      };

      PastDeadlinePromptTitleLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is prompt. for Italian.";
      };

      PastDeadlinePromptMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Message shown when past-deadline restart behavior is Prompt.";
      };

      PastDeadlinePromptMessageLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is prompt. for English.";
      };

      PastDeadlinePromptMessageLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is prompt. for German.";
      };

      PastDeadlinePromptMessageLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is prompt. for French.";
      };

      PastDeadlinePromptMessageLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is prompt. for Spanish.";
      };

      PastDeadlinePromptMessageLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is prompt. for Portuguese.";
      };

      PastDeadlinePromptMessageLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is prompt. for Japanese.";
      };

      PastDeadlinePromptMessageLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is prompt. for Dutch.";
      };

      PastDeadlinePromptMessageLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is prompt. for Italian.";
      };

      PastDeadlineForceTitle = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Title shown when past-deadline restart behavior is Force.";
      };

      PastDeadlineForceTitleLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is force. for English.";
      };

      PastDeadlineForceTitleLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is force. for German.";
      };

      PastDeadlineForceTitleLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is force. for French.";
      };

      PastDeadlineForceTitleLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is force. for Spanish.";
      };

      PastDeadlineForceTitleLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is force. for Portuguese.";
      };

      PastDeadlineForceTitleLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is force. for Japanese.";
      };

      PastDeadlineForceTitleLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is force. for Dutch.";
      };

      PastDeadlineForceTitleLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized title shown when past-deadline restart behavior is force. for Italian.";
      };

      PastDeadlineForceMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Message shown when past-deadline restart behavior is Force.";
      };

      PastDeadlineForceMessageLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is force. for English.";
      };

      PastDeadlineForceMessageLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is force. for German.";
      };

      PastDeadlineForceMessageLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is force. for French.";
      };

      PastDeadlineForceMessageLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is force. for Spanish.";
      };

      PastDeadlineForceMessageLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is force. for Portuguese.";
      };

      PastDeadlineForceMessageLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is force. for Japanese.";
      };

      PastDeadlineForceMessageLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is force. for Dutch.";
      };

      PastDeadlineForceMessageLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized message shown when past-deadline restart behavior is force. for Italian.";
      };

      AggressiveModeTitle = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Title displayed while aggressive past-deadline reminder mode is active.";
      };

      AggressiveModeTitleLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized English override for aggressive mode title.";
      };

      AggressiveModeTitleLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized German override for aggressive mode title.";
      };

      AggressiveModeTitleLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized French override for aggressive mode title.";
      };

      AggressiveModeTitleLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Spanish override for aggressive mode title.";
      };

      AggressiveModeTitleLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Portuguese override for aggressive mode title.";
      };

      AggressiveModeTitleLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Japanese override for aggressive mode title.";
      };

      AggressiveModeTitleLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Dutch override for aggressive mode title.";
      };

      AggressiveModeTitleLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Italian override for aggressive mode title.";
      };

      AggressiveModeMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Markdown-formatted message displayed while aggressive past-deadline reminder mode is active.";
      };

      AggressiveModeMessageLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized English override for aggressive mode message.";
      };

      AggressiveModeMessageLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized German override for aggressive mode message.";
      };

      AggressiveModeMessageLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized French override for aggressive mode message.";
      };

      AggressiveModeMessageLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Spanish override for aggressive mode message.";
      };

      AggressiveModeMessageLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Portuguese override for aggressive mode message.";
      };

      AggressiveModeMessageLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Japanese override for aggressive mode message.";
      };

      AggressiveModeMessageLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Dutch override for aggressive mode message.";
      };

      AggressiveModeMessageLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized Italian override for aggressive mode message.";
      };

      Message = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Markdown-formatted message body displayed in the dialog.";
      };

      MessageLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message body displayed in the dialog. for English.";
      };

      MessageLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message body displayed in the dialog. for German.";
      };

      MessageLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message body displayed in the dialog. for French.";
      };

      MessageLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message body displayed in the dialog. for Spanish.";
      };

      MessageLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message body displayed in the dialog. for Portuguese.";
      };

      MessageLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message body displayed in the dialog. for Japanese.";
      };

      MessageLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message body displayed in the dialog. for Dutch.";
      };

      MessageLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized markdown-formatted message body displayed in the dialog. for Italian.";
      };

      InfoBox = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Markdown-formatted info box content showing current and required versions and deadline.";
      };

      HelpMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Markdown-formatted help text including support, user, and computer information.";
      };

      HelpMessageLocalized_en = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized help message for English.";
      };

      HelpMessageLocalized_de = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized help message for German.";
      };

      HelpMessageLocalized_fr = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized help message for French.";
      };

      HelpMessageLocalized_es = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized help message for Spanish.";
      };

      HelpMessageLocalized_pt = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized help message for Portuguese.";
      };

      HelpMessageLocalized_ja = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized help message for Japanese.";
      };

      HelpMessageLocalized_nl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized help message for Dutch.";
      };

      HelpMessageLocalized_it = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Localized help message for Italian.";
      };

      HelpImage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Help image configuration, such as QR code pointing to the info button action.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-org-churchofjesuschrist-dorm" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "DDM OS Reminder (org.churchofjesuschrist.dorm) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}