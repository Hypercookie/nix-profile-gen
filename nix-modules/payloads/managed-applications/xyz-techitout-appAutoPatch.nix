# Auto-generated from ProfileManifests: xyz.techitout.appAutoPatch.plist
# Domain: xyz.techitout.appAutoPatch
# Title: App Auto-Patch
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "App Auto-Patch";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "xyz.techitout.appAutoPatch";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
        description = "Whether macOS allows only one instance of this payload per profile.";
      };

      _displayName = lib.mkOption {
        internal = true;
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "PayloadDisplayName for this instance. Defaults to the domain.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "PFC_SegmentedControl_0" "DaysUntilReset" "PatchWeekStartDay" "DeadlineCountFocus" "DeadlineCountHard" "DeadlineDaysFocus" "DeadlineDaysHard" "DeferralTimerDefault" "DeferralTimerError" "DeferralTimerFocus" "DeferralTimerMenu" "DeferralTimerWorkflowRelaunch" "MonthlyPatchingCadenceEnabled" "MonthlyPatchingCadenceOrdinalValue" "MonthlyPatchingCadenceWeekdayIndex" "MonthlyPatchingCadenceStartTime" "DiscoveryFrequency" "ZoomCallActiveCheck" "DialogOnTop" "ShowDockIcon" "DialogQuitHandlingDiscoveryStaging" "ShowNotificationsAll" "ShowNotificationsSilentUpdated" "ShowNotificationsAppsQueued" "ShowNotificationsSilentAndQueued" "DialogTimeoutDeferral" "DialogTimeoutDeferralAction" "DialogTimeoutConfirmInstall" "UnattendedExit" "UnattendedExitSeconds" "UseOverlayIcon" "DialogIcon" "BannerImage" "BannerTitle" "BannerHeight" "IgnoredLabels" "ExcludedBackgroundLabels" "RequiredLabels" "OptionalLabels" "AppTitle" "ConvertAppsInHomeFolder" "IgnoreAppsInHomeFolder" "SkipPreUpdateVerification" "InstallomatorOptions" "InstallomatorUpdateDisable" "GitHubAPIAuthEnabled" "GitHubAPIToken" "PrePatchScript" "PostPatchScript" "PrePatchScriptFailAction" "PostPatchScriptFailAction" "PatchScriptTimeoutSeconds" "StaleProcessTimeoutSeconds" "InstallomatorVersion" "InstallomatorVersionCustomRepoPath" "InstallomatorVersionCustomBranchName" "InteractiveMode" "RemoveInstallomatorPath" "SupportTeamName" "SupportTeamEmail" "SupportTeamPhone" "SupportTeamWebsite" "WebhookFeature" "WebhookURLSlack" "WebhookURLTeams" "WorkflowDisableAppDiscovery" "WorkflowBackgroundPatchClosedApps" "WorkflowStageUpdates" "IgnoreDNDApps" "WorkflowScheduledDiscovery" "WorkflowDisableRelaunch" "BusinessHours" "BusinessHoursRespectHardDeadline" "BusinessHoursSilentDuring" "BusinessHoursAllowDiscovery" "WorkflowInstallNowPatchingStatusAction" "SelfUpdateEnabled" "SelfUpdateFrequency" "VersionComparisonMethod" "VersionComparisonInstallomatorFallback" "userInterface" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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

      DiscoveryFrequency = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The number of hours since the last successful App Discovery before App Auto-Patch will run discovery again. If the workflow resets and re-runs (e.g. after a deferral) within this window, discovery is skipped and the previously discovered queue is reused. A value of 0 forces discovery to run on every workflow execution";
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

      ShowDockIcon = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true, workflow swiftDialog windows show the App Auto-Patch logo in the macOS Dock (requires swiftDialog 3.0+). Deferral dialogs badge the pending update count; the installation dialog counts the badge down as updates finish. Default true.";
      };

      DialogQuitHandlingDiscoveryStaging = lib.mkOption {
        type = types.nullOr (types.enum [ "PROMPT" "CONTINUE" "STOP" ]);
        default = null;
        description = "What happens if the user quits the discovery or staging window (Dock Quit / menu Quit / ⌘Q). PROMPT (default) asks whether to Keep Running in the background or Stop App Auto-Patch until the next scheduled run. CONTINUE keeps the workflow running with no prompt (previous implicit behavior). STOP ends the current run cleanly and preserves NextAutoLaunch. Stop is ignored when a hard deadline is already due or Install Now is running — the workflow continues instead.";
      };

      ShowNotificationsAll = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Master switch for banner-style swiftDialog notifications. When true (default), every notification type is shown and individual ShowNotifications* keys are ignored. When false, enable specific types with ShowNotificationsSilentUpdated, ShowNotificationsAppsQueued, and/or ShowNotificationsSilentAndQueued. Does not itself enable discovery during Business Hours.";
      };

      ShowNotificationsSilentUpdated = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When ShowNotificationsAll is false, enable the banner that reports successful silent closed-app updates (e.g. “updated {count} application(s) in the background”). Ignored when ShowNotificationsAll is true.";
      };

      ShowNotificationsAppsQueued = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When ShowNotificationsAll is false, enable the banner that reports pending updates with Install Now / Dismiss (including after BusinessHoursAllowDiscovery). Ignored when ShowNotificationsAll is true.";
      };

      ShowNotificationsSilentAndQueued = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When ShowNotificationsAll is false, enable the combined banner after Business Hours Silent During (“{count} updated… {remaining} remain queued”). Ignored when ShowNotificationsAll is true.";
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

      DialogTimeoutConfirmInstall = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The number of seconds given to the user to respond to the \"Are you sure?\" confirmation dialog shown after clicking Install Now on the deferral dialog. If the timer expires with no response, App Auto-Patch defaults to continuing with the install";
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

      BannerImage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Displays a swiftDialog banner image in place of the standard title text. Accepts a filepath, a URL, a solid colour (colour=#hex), or a gradient (gradient=colour,colour). When set, this replaces the standard --title text banner and hides the standard dialog icon area, matching swiftDialog's own banner behavior. Not applied to the App Discovery or \"All Apps Up To Date\" mini dialogs, which are too small to display a banner";
      };

      BannerTitle = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The text displayed within the banner image set by BannerImage. Falls back to AppTitle if left blank. Has no effect unless BannerImage is also configured";
      };

      BannerHeight = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Overrides the default height, in points, of the banner image set by BannerImage. Invalid (non-integer) values are ignored. Has no effect unless BannerImage is also configured";
      };

      IgnoredLabels = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "A space-separated list of Installomator labels to ignore for the AAP workflow. Supports wildcards, for example \"microsoft*\". A single \"*\" ignores every Installomator label except those listed in Required Labels and Optional Labels.";
      };

      ExcludedBackgroundLabels = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "A space-separated list of Installomator labels to discover and report, but not update during fully-silent runs (InteractiveMode 0 / --workflow-install-now-silent) or Background Patch Closed Apps. Interactive Install Now and hard-deadline installs still update them. Supports wildcards. Unlike Ignored Labels, these apps stay visible in discovery, logs, and inventory.";
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

      SkipPreUpdateVerification = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true, discovery skips the local Gatekeeper (spctl) / Team ID pre-update check for already-installed apps. Use this when spctl assessment intermittently fails for a valid app and would otherwise exclude it from discovery/updates. Installomator still validates the downloaded package after download. Default false.";
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

      GitHubAPIAuthEnabled = lib.mkOption {
        type = types.nullOr (types.enum [ "TRUE" "FALSE" ]);
        default = null;
        description = "When TRUE, App Auto-Patch authenticates GitHub REST API requests (api.github.com) with the personal access token in GitHubAPIToken, raising the rate limit from 60 to 5,000 requests per hour. Managed preferences only - the token is never written to the local preference file and is never logged. If this key is TRUE, GitHubAPIToken is required or startup validation fails.";
      };

      GitHubAPIToken = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "GitHub personal access token (classic or fine-grained) used when GitHubAPIAuthEnabled is TRUE. Sent as Authorization: Bearer on api.github.com requests for Installomator and swiftDialog lookups. Prefer a fine-grained token with Contents: Read on the repositories AAP queries. Managed preferences only - never stored in the local preference file or written to logs.";
      };

      PrePatchScript = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Absolute path to a root-owned executable script run once before Installomator installations in a patch run. Must live under /Library/Management/AppAutoPatch/Hooks/, must not be a symlink, and must not be group/world-writable. Managed preferences only - never accepted from CLI or the local preference file. Never evaluated as a shell string.";
      };

      PostPatchScript = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Absolute path to a root-owned executable script run once after Installomator installations complete in a patch run (for example jamf recon). Same security requirements as PrePatchScript. Managed preferences only.";
      };

      PrePatchScriptFailAction = lib.mkOption {
        type = types.nullOr (types.enum [ "ABORT" "CONTINUE" ]);
        default = null;
        description = "What to do if PrePatchScript is missing/invalid or exits non-zero. ABORT stops the install run; CONTINUE logs the failure and proceeds with patching.";
      };

      PostPatchScriptFailAction = lib.mkOption {
        type = types.nullOr (types.enum [ "ABORT" "CONTINUE" ]);
        default = null;
        description = "What to do if PostPatchScript is missing/invalid or exits non-zero. ABORT exits AAP with an error after installs; CONTINUE (default) logs the failure and proceeds with webhook/relaunch.";
      };

      PatchScriptTimeoutSeconds = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Maximum seconds allowed for a PrePatchScript or PostPatchScript run before AAP terminates it (treated as failure).";
      };

      StaleProcessTimeoutSeconds = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Seconds of missing heartbeat after which a leftover App Auto-Patch process is treated as hung and recovered (graceful TERM, then KILL if needed). The PID file is also validated so a recycled PID is not mistaken for a live AAP run. Default 3600 (1 hour). 0 disables timeout-based stale-process killing (dead/reused PID cleanup still runs). Any other value below 300 is raised to 300.";
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

      WorkflowBackgroundPatchClosedApps = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When InteractiveMode is 1 or 2, silently pre-patches apps that are not currently open immediately after discovery and before any deferral/deadline dialog is shown. Apps that are open (blocking process detected) remain in the queue and are presented to the user as normal";
      };

      WorkflowStageUpdates = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Pre-downloads (stages) installers for queued updates to a local staging folder immediately after discovery, before the deferral/deadline dialog is shown to the user. This makes the later install step nearly instantaneous for staged updates. Works alongside Background Patch Closed Apps without downloading the same update twice";
      };

      IgnoreDNDApps = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "A comma-separated list of app/process names to exclude from display-sleep assertion (Focus/Do Not Disturb) detection. Useful for background utilities that permanently hold display assertions (e.g. Logi Options+, Amphetamine) that should not block interactive patching. Process names must match exactly as pmset reports them, including spaces";
      };

      WorkflowScheduledDiscovery = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When WorkflowDisableRelaunch is also enabled, keep periodic headless discovery runs active using DiscoveryFrequency. These runs refresh the pending-app report, optionally stage updates, and can notify users, but never silently patch, show deferral or deadline dialogs, or install apps. Users initiate installation from the pending-apps dialog, Support App, notification action, or another explicit Install Now trigger";
      };

      WorkflowDisableRelaunch = lib.mkOption {
        type = types.nullOr (types.enum [ "TRUE" "FALSE" ]);
        default = null;
        description = "Disable the automatic relaunch of AAP after the current workflow successfully completes";
      };

      BusinessHours = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Weekday time windows when interactive App Auto-Patch must NOT run (blocked / do-not-disturb hours). Format: DAY:hh:mm-hh:mm, comma-separated, no spaces (MON-SUN, 24-hour). Multiple windows per day are allowed — for example MON:09:00-11:59,MON:13:00-17:00 blocks morning and afternoon but leaves lunch clear. Same-day ranges only — split overnight spans into two windows. Empty/unset = always allowed. During a window, AAP reschedules NextAutoLaunch to the next clear time and exits without interactive patching unless BusinessHoursSilentDuring or BusinessHoursAllowDiscovery is true. Local Mac timezone. Intentionally bypassed by --workflow-install-now / --workflow-install-now-silent / --preview-deferral-dialog. Overdue hard deadlines bypass BusinessHours by default unless BusinessHoursRespectHardDeadline is true.";
      };

      BusinessHoursRespectHardDeadline = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true, even an overdue hard deadline (days or count) waits until BusinessHours clear. When false (default), an overdue hard deadline bypasses BusinessHours so mandatory installs are not delayed by days.";
      };

      BusinessHoursSilentDuring = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true and during BusinessHours, AAP still runs discovery and silently patches closed apps only — no dialogs even if InteractiveMode is 1 or 2. Open or blocked apps remain queued and are deferred until BusinessHours clear. When false (default), during BusinessHours AAP only reschedules NextAutoLaunch and exits — unless BusinessHoursAllowDiscovery is true.";
      };

      BusinessHoursAllowDiscovery = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true and during BusinessHours without BusinessHoursSilentDuring, AAP runs discovery then defers until the window clears (no interactive dialogs or silent patching). Notification prefs independently control whether pending apps get a banner with Install Now. When false (default), AAP exits immediately during BusinessHours without discovery — matching historical behavior.";
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

      VersionComparisonMethod = lib.mkOption {
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
                  display_string_staging_message = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for the message shown on the progress dialog covering the update staging and background-patch-closed-apps phases (InteractiveMode 2 only)";
                  };
                  display_string_staging_progress = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for the progress text shown while an update is being staged (downloaded ahead of time). The app display name is appended (e.g. \"Staging Google Chrome …\").";
                  };
                  display_string_silent_patch_progress = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for the progress text shown while a closed app is being silently patched in the background. The app display name is appended (e.g. \"Installing Google Chrome …\").";
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
                  display_string_pendingapps_button_later = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for the Later / dismiss button on the pending-apps dialog (--pending-apps-dialog and queued-apps notification Install Now action)";
                  };
                  display_string_confirminstall_message = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for the message on the \"Install Now\" confirmation dialog shown after clicking Install Now on the Deferral Dialog";
                  };
                  display_string_confirminstall_button1 = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for Button1 (confirm) of the \"Install Now\" confirmation dialog";
                  };
                  display_string_confirminstall_button2 = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for Button2 (cancel, returns to Deferral Dialog) of the \"Install Now\" confirmation dialog";
                  };
                  display_string_confirminstall_countdown = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for the first part of the countdown text on the \"Install Now\" confirmation dialog, shown before the remaining number of seconds";
                  };
                  display_string_confirminstall_countdown_suffix = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for the suffix of the countdown text on the \"Install Now\" confirmation dialog, shown after the remaining number of seconds";
                  };
                  display_string_dialogdismissed_message = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for the message on the dialog shown when the patching progress window was closed (Dock Quit / menu Quit) while updates are still running";
                  };
                  display_string_dialogdismissed_button1 = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for Button1 (Show Progress) on the dialog shown when the patching progress window was closed while updates are still running";
                  };
                  display_string_dialogdismissed_button2 = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for Button2 (Continue in Background) on the dialog shown when the patching progress window was closed while updates are still running";
                  };
                  display_string_preparationdismissed_message = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for the message on the dialog shown when the discovery or staging window was closed (Dock Quit / menu Quit) while App Auto-Patch is still preparing. Default explains Keep Running vs Stop App Auto-Patch.";
                  };
                  display_string_preparationdismissed_button1 = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for Button1 (Keep Running) on the discovery/staging quit prompt";
                  };
                  display_string_preparationdismissed_button2 = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for Button2 (Stop App Auto-Patch) on the discovery/staging quit prompt";
                  };
                  display_string_notification_silent_updated = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Banner notification message when silent background patching updates apps. Use {count} for the number of apps updated.";
                  };
                  display_string_notification_apps_queued = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Banner notification message when apps require updates (e.g. during Business Hours). Use {count} for the number of apps queued. Includes Install Now / Dismiss actions.";
                  };
                  display_string_notification_silent_and_queued = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Banner notification message when silent patching updated some apps and others remain queued. Use {count} for updated and {remaining} for still-queued apps. Includes Install Now / Dismiss when remaining > 0.";
                  };
                  display_string_notification_button_install = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Label for the Install Now action on banner notifications that offer starting --workflow-install-now";
                  };
                  display_string_notification_button_dismiss = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Label for the Dismiss action on banner notifications";
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
                  display_string_version_current = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for the \"Current Version\" prefix shown under each app in the deferral/hard deadline dialog patch lists";
                  };
                  display_string_version_new = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Language for the \"New Version\" prefix shown under each app in the deferral/hard deadline dialog patch lists";
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
  };
in
{
  options.programs.macprofile.payloads."managed-applications-xyz-techitout-appAutoPatch" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "App Auto-Patch (xyz.techitout.appAutoPatch) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}