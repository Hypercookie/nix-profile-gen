# Auto-generated from ProfileManifests: com.gilburns.patcher.plist
# Domain: com.gilburns.patcher
# Title: Third Party Patcher
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Third Party Patcher";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.gilburns.patcher";
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
        default = [ "PFC_SegmentedControl_0" "DeferralCountdownSeconds" "DeferralAutomaticAction" "DeferralTimerDefault" "DeferralTimerMenu" "DeferralTimerFocus" "MonthlyPatchingCadenceEnabled" "PatchingWeekday" "PatchingWeekOfMonth" "PatchingStartTime" "PatchingEndTime" "DialogOnTop" "UnattendedExit" "UnattendedExitSeconds" "BlockingProcessAction" "BlockingProcessCountdownSeconds" "DialogIcon" "UseOverlayIcon" "OverlayIcon" "DialogScreenPosition" "DialogScreenProgressPosition" "DownloadBandwidthLimit" "StageDownloadFailThreshold" "ApplyFailThreshold" "IgnoreUnknownVersionLabels" "UnknownVersionCheckIntervalDays" "VersionMismatchThrottleDays" "InitialScanDelayEnabled" "InitialScanDelayMaxSeconds" "ScanIntervalDays" "ScanOnLabelUpdate" "LightScanIntervalHours" "CheckIntervalHours" "StageIntervalHours" "ApplyIntervalHours" "IgnoredLabels" "IgnoreManagedApps" "IgnoreNonProductionLabels" "NonProductionLabelSuffixes" "PreferPkgLabels" "RequiredLabels" "OptionalLabels" "SwiftDialogEnabled" "AppTitle" "BrandColorFont" "BrandColorBackground" "LogVerbose" "LogRetentionDays" "IgnoreAppsInHomeFolder" "ConvertAppsInHomeFolder" "IgnoreAppsOnExternalVolumes" "InstallomatorGitHubAccount" "InstallomatorGitHubRepo" "InstallomatorGitHubBranch" "InstallomatorLabelsDisable" "InstallomatorUpdateDisable" "InstallomatorGitHubMetadataAccount" "InstallomatorGitHubMetadataRepo" "InstallomatorGitHubMetadataBranch" "MetadataSyncEnabled" "MetadataSyncIntervalDays" "SupportTeamName" "SupportTeamEmail" "SupportTeamPhone" "SupportTeamWebsite" "ShowMenuBarApp" "MenuBarIcon" "ShowHelpButton" "ShowActivitySection" "MenuDeferralCountDisplay" "ShowQuitButton" "ShowMenuDownloadAction" "ShowMenuCheckAction" "ShowMenuScanAction" "ShowScanCheckProgressDialog" "CompanyName" "CustomAppIconPath" "AddToDockOnSelfServiceInstall" "WebhookFeature" "WebhookURLTeams" "WebhookURLSlack" "WebhookAttributes" "WebhookSchedule" "WebhookScheduleWeekday" "WebhookScheduleMonthDay" "WebhookScheduleHour" "WebhookStageFailureThreshold" "WebhookSelfServiceFeature" "QuietApplyEnabled" "DeadlineDaysFocus" "DeadlineDaysHard" "FocusCheckEnabled" "FocusIgnoredProcesses" "AggressivePatchDayDeferral" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      PFC_SegmentedControl_0 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      DeferralCountdownSeconds = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Seconds of countdown in the deferral prompt before the automatic action fires.";
      };

      DeferralAutomaticAction = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Action when the deferral countdown expires with no user input: \"defer\" (postpone to next cycle) or \"kill\" (force-quit blocking app and apply).";
      };

      DeferralTimerDefault = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Default deferral duration in minutes applied when the user accepts without choosing a custom time (4 hours).";
      };

      DeferralTimerMenu = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Comma-separated list of deferral durations in minutes shown in the pop-up menu.\n";
      };

      DeferralTimerFocus = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The number of minutes to defer the update restart dialog automatically if a process has prevented display sleep (for example, during an active meeting) or the user has Focus or Do Not Disturb enabled";
      };

      MonthlyPatchingCadenceEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      PatchingWeekday = lib.mkOption {
        type = types.nullOr (types.enum [ 1 2 3 4 5 6 7 ]);
        default = null;
        description = "Day of the week for the patch window: 1=Sunday, 2=Monday, 3=Tuesday … 7=Saturday.";
      };

      PatchingWeekOfMonth = lib.mkOption {
        type = types.nullOr (types.enum [ 1 2 3 4 ]);
        default = null;
        description = "Which occurrence of `PatchingWeekday` in the month: 1=first, 2=second, etc.";
      };

      PatchingStartTime = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Earliest time to begin applying on patch day (24-hour `HH:MM`). Empty = no lower bound.";
      };

      PatchingEndTime = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Latest time to begin applying on patch day (24-hour `HH:MM`). Apply will not start a new run after this time.";
      };

      DialogOnTop = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, the swiftDialog window floats above all other windows.";
      };

      UnattendedExit = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, the apply completion dialog closes automatically after `UnattendedExitSeconds` if the user does not interact.";
      };

      UnattendedExitSeconds = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Seconds before the apply completion dialog auto-closes when `UnattendedExit` is `true`.";
      };

      BlockingProcessAction = lib.mkOption {
        type = types.nullOr (types.enum [ "ignore" "kill" "notify" "prompt" "defer" ]);
        default = null;
        description = "Action when a blocking process is running during apply: `\"ignore\"` (skip the check entirely), `\"kill\"` (force-quit silently), `\"notify\"` (brief notification; skip label if still running), `\"prompt\"` (timed dialog; user can quit or skip), `\"defer\"` (skip silently; retry next cycle).";
      };

      BlockingProcessCountdownSeconds = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Seconds of countdown in the blocking process prompt before the automatic action fires.";
      };

      DialogIcon = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Path to a custom icon for the apply dialog. Empty = use the system computer icon. Supports absolute paths, `SF=<symbol>` notation, or an SF Symbol name directly.";
      };

      UseOverlayIcon = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, a small overlay icon is composited onto the dialog icon. Automatically disabled when swiftDialog is not installed.";
      };

      OverlayIcon = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Path to the overlay icon image. Empty = auto-detect from known MDM agents (Jamf, Intune, etc.).";
      };

      DialogScreenPosition = lib.mkOption {
        type = types.nullOr (types.enum [ "topleft" "left" "bottomleft" "top" "center" "bottom" "topright" "right" "bottomright" ]);
        default = null;
        description = "Position of the main apply dialog: `topleft`, `left`, `bottomleft`, `top`, `center`, `bottom`, `topright`, `right`, or `bottomright`.";
      };

      DialogScreenProgressPosition = lib.mkOption {
        type = types.nullOr (types.enum [ "topleft" "left" "bottomleft" "top" "center" "bottom" "topright" "right" "bottomright" ]);
        default = null;
        description = "Position of the progress/status window during apply. Same position values as `DialogScreenPosition`.";
      };

      DownloadBandwidthLimit = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "curl `--limit-rate` format bandwidth cap for staged downloads (e.g. `\"500K\"` for 500 KB/s, `\"2M\"` for 2 MB/s). Empty string = unlimited.";
      };

      StageDownloadFailThreshold = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Consecutive download or verification failures before a label is marked broken and skipped by the stage phase.";
      };

      ApplyFailThreshold = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Consecutive install failures before a staged update is abandoned and that version is blocked from re-staging. Staging resumes automatically when a newer version becomes available.";
      };

      IgnoreUnknownVersionLabels = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, labels that return no `appNewVersion` value are skipped entirely during staging.";
      };

      UnknownVersionCheckIntervalDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "For labels with unknown versions, re-check this many days after the last attempt (instead of the normal `CheckIntervalHours` cadence).";
      };

      VersionMismatchThrottleDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "When a label reports a version that does not match the file actually downloaded, suppress re-staging for this many days. Cleared automatically when the label reports a different `appNewVersion`.";
      };

      InitialScanDelayEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, a one-time random delay is applied before the first scan after initial deployment. Spreads fleet-wide first-scan load across the `InitialScanDelayMaxSeconds` window.";
      };

      InitialScanDelayMaxSeconds = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Maximum jitter for the initial deployment delay in seconds (default: 24 hours). The actual delay is chosen randomly in `[0, max]` on first launch and persisted.";
      };

      ScanIntervalDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Days between full application scans. A full scan re-evaluates all Installomator labels to discover installed apps.";
      };

      ScanOnLabelUpdate = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, a scan is triggered immediately if the Installomator or Managed Labels have been updated since the last scan, regardless of `ScanIntervalDays`.";
      };

      LightScanIntervalHours = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Hours between light scan runs. A light scan checks uninstalled labels for apps that may have been installed by other means, without re-running label scripts or hitting the network for non-installed labels.";
      };

      CheckIntervalHours = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Hours between check runs. A check reads installed versions for already-discovered apps to detect whether an update is needed.";
      };

      StageIntervalHours = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Hours between stage runs. The stage phase downloads pending updates.";
      };

      ApplyIntervalHours = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Minimum hours between apply runs in deadline-based patching mode. Prevents apply from running every 10-minute cycle once updates are pending. Not used in monthly patching mode — the patch-day window controls timing.";
      };

      IgnoredLabels = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "A space-separated list of Installomator labels to ignore for the TPP workflow. Supports wildcards, for example \"microsoft*\". A single \"*\" ignores every Installomator label except those listed in Required Labels and Optional Labels.";
      };

      IgnoreManagedApps = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, automatically detects apps whose updates are already controlled by MDM policies and excludes their labels from patching. Currently detects Microsoft 365/Office (via MAU), Microsoft Edge, Google Chrome, and Google Drive. ";
      };

      IgnoreNonProductionLabels = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, automatically ignores non-production label variants — labels whose name ends with one of `NonProductionLabelSuffixes` — but only when a production label of the same base name also exists. E.g. with the default suffixes, `microsoftedgebeta` and `microsoftedgedev` are ignored because `microsoftedge` also exists as a label; a label like `figma` is untouched, and a hypothetical `somethingbeta` is left alone if `something` is not also a known label.";
      };

      NonProductionLabelSuffixes = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Space-separated list of suffixes that mark a label as a non-production variant of a base label. Only used when `IgnoreNonProductionLabels` is `true`. Does not support wildcards.";
      };

      PreferPkgLabels = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When a label and its `pkg`-suffixed counterpart both exist (e.g. `bbedit` and `bbeditpkg`), only one should ever be active — they deliver the same app via different installer mechanisms. When `true`, the pkg-suffixed label is preferred and the non-pkg label is ignored. When `false`, the non-pkg label is preferred and the pkg-suffixed label is ignored instead.";
      };

      RequiredLabels = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "a space-separated list of Installomator labels that are required, regardless if the app is installed or or the latest version. Supports wildcards.";
      };

      OptionalLabels = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Space-separated list of label names made available for user-initiated self-service installation via the Available Software catalog. Does not support wildcards. Labels are presented in the order listed here, allowing you to feature priority apps at the top. Example: `\"microsoftword zoom slack\"`.";
      };

      SwiftDialogEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Show swiftDialog prompts during the apply phase. If `false` (or swiftDialog is not installed), blocking process handling falls back to the configured `BlockingProcessAction`.";
      };

      AppTitle = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Allows you to customize the name of Third Party Patcher to something else";
      };

      BrandColorFont = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Font color used in dialogs and apps. These values set the accent colors used in swiftDialog prompts. Each accepts a standard Apple color name (`black`, `blue`, `gray`, `green`, `orange`, `pink`, `purple`, `red`, `white`, `yellow`) or a hex value (e.g. `#00A4C7`).";
      };

      BrandColorBackground = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Background color used in dialogs and apps. These values set the accent colors used in swiftDialog prompts. Each accepts a standard Apple color name (`black`, `blue`, `gray`, `green`, `orange`, `pink`, `purple`, `red`, `white`, `yellow`) or a hex value (e.g. `#00A4C7`).";
      };

      LogVerbose = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable verbose debug logging. When `true`, per-label key dumps and other low-signal output are included in `/Library/Logs/Patcher/`.";
      };

      LogRetentionDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Number of days to retain log files in `/Library/Logs/Patcher/`. Files older than this are deleted during the `cleanLogs` run. Set to `0` to disable automatic log cleanup.";
      };

      IgnoreAppsInHomeFolder = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Ignore apps found in '/Users/'. If an update is found in '/Users/' and variable is set to false, the app will be updated into the application's default path";
      };

      ConvertAppsInHomeFolder = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "This will convert any apps found in the users home folder to the /Applications folder";
      };

      IgnoreAppsOnExternalVolumes = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, apps found only on external volumes (`/Volumes/*`) are excluded from discovery and never updated. Useful in environments where external drives are transient and should not be managed.";
      };

      InstallomatorGitHubAccount = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "GitHub account hosting the Installomator label repository.";
      };

      InstallomatorGitHubRepo = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "GitHub repository name for Installomator labels.";
      };

      InstallomatorGitHubBranch = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The name of the branch you want to use in your custom repo, typically main.";
      };

      InstallomatorLabelsDisable = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, disables all Installomator label management: no initial download, no update checks, and Installomator labels are never used. Only Managed-Labels are used.";
      };

      InstallomatorUpdateDisable = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, skips routine label update checks while still using labels already on disk. Has no effect on the initial download when no labels are present. Ignored when `InstallomatorLabelsDisable` is `true`.";
      };

      InstallomatorGitHubMetadataAccount = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "GitHub account hosting the Installomator Metadata repository.";
      };

      InstallomatorGitHubMetadataRepo = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "GitHub repository name for Installomator Metadata.";
      };

      InstallomatorGitHubMetadataBranch = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Branch to pull metadata from.";
      };

      MetadataSyncEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, the scheduler periodically checks the metadata repository for updates and syncs icons and metadata to a local cache.";
      };

      MetadataSyncIntervalDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Days between metadata repository sync checks.";
      };

      SupportTeamName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Display name for your IT team in the Help Message";
      };

      SupportTeamEmail = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Support email address. Shown as a clickable `mailto:` link in the Help Message";
      };

      SupportTeamPhone = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Support phone number in the Help Message. Set to `\"None\"` to hide the field.";
      };

      SupportTeamWebsite = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Support portal URL in the Help Message. Set to `\"None\"` to hide the field.";
      };

      ShowMenuBarApp = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, the scheduler installs and loads the PatcherMenu LaunchAgent for the current console user. When `false`, the LaunchAgent is unloaded and the plist removed. Managed automatically at each scheduler run.";
      };

      MenuBarIcon = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Icon displayed in the menu bar status item. Accepts an SF Symbol name (e.g. `\"gear\"`) or an absolute path to a template-mode PNG. A template PNG adapts automatically to light/dark menu bar appearance. Empty = built-in default.";
      };

      ShowHelpButton = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, a Help (?) button is shown in the menu bar popover header. Tapping it displays the support contact information.";
      };

      ShowActivitySection = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, the Last Activity section (scan / check / stage / apply dates) is shown in the menu bar popover.";
      };

      MenuDeferralCountDisplay = lib.mkOption {
        type = types.nullOr (types.enum [ "combined" "split" "userOnly" ]);
        default = null;
        description = "Controls how the deferral count line is shown in the popover. `combined` — one total covering every deferral, including auto-deferrals (timer time-outs and blocking-process skips). `split` — two figures: deferrals the user actively chose, and auto-deferrals combined. `userOnly` — only the count of deferrals the user actively chose.";
      };

      ShowQuitButton = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, a Quit button is shown in the menu bar popover footer.";
      };

      ShowMenuDownloadAction = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, the \"Download New Updates\" option appears in the Run Now menu.";
      };

      ShowMenuCheckAction = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, the \"Check for Updates\" option appears in the Run Now menu.";
      };

      ShowMenuScanAction = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, the \"Full Discovery Scan\" option appears in the Run Now menu.";
      };

      ShowScanCheckProgressDialog = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, scan and check operations triggered from PatcherMenu display a swiftDialog progress window.";
      };

      CompanyName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Organization name shown in the Available Software sidebar header above the app title.";
      };

      CustomAppIconPath = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Absolute path to a PNG or ICNS file used as the Available Software app icon, overriding the built-in icon in the Dock, Finder, and app switcher. Empty = use the default built-in icon.";
      };

      AddToDockOnSelfServiceInstall = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, apps successfully installed via self-service are automatically added to the current user's Dock if not already present.";
      };

      WebhookFeature = lib.mkOption {
        type = types.nullOr (types.enum [ "FALSE" "FAILURES" "ALL" ]);
        default = null;
        description = "Controls when scheduled webhook reports are sent: `\"FALSE\"` (never), `\"FAILURES\"` (failures only), `\"ALL\"` (successes and failures).";
      };

      WebhookURLTeams = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Microsoft Teams incoming webhook URL.";
      };

      WebhookURLSlack = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Slack incoming webhook URL.";
      };

      WebhookAttributes = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Comma-separated list of device attributes included in webhook payloads, in display order. MDM info is always appended if detected. Supported values: `deviceName`, `hostname`, `serial`, `osVersion`, `osBuild`, `osName`, `model`, `hardwareModel`, `user`, `patcherVersion`, `installomatorVersion`.";
      };

      WebhookSchedule = lib.mkOption {
        type = types.nullOr (types.enum [ "immediate" "daily" "weekly" "monthly" "patchDay" ]);
        default = null;
        description = "When to send accumulated webhook reports: `\"immediate\"`, `\"daily\"`, `\"weekly\"`, `\"monthly\"`, or `\"patchDay\"`.";
      };

      WebhookScheduleWeekday = lib.mkOption {
        type = types.nullOr (types.enum [ 0 1 2 3 4 5 6 ]);
        default = null;
        description = "For `weekly` schedule: day of week to send (0=Sunday … 6=Saturday).";
      };

      WebhookScheduleMonthDay = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "For `monthly` schedule: day of month to send (1–31).";
      };

      WebhookScheduleHour = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "For `daily`, `weekly`, and `monthly` schedules: hour of day (0–23) at which to send.";
      };

      WebhookStageFailureThreshold = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Minimum consecutive stage failures for a label before it is included in webhook notifications.";
      };

      WebhookSelfServiceFeature = lib.mkOption {
        type = types.nullOr (types.enum [ "FALSE" "FAILURES" "ALL" ]);
        default = null;
        description = "Controls whether an immediate webhook is sent after a user-initiated self-service install, regardless of `WebhookSchedule`. Options: `\"FALSE\"` (never), `\"FAILURES\"` (failed installs only), `\"ALL\"` (success and failure).";
      };

      QuietApplyEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, the scheduler runs a silent apply pass before the interactive apply phase. Apps whose blocking process is not running are installed without prompting. Items skipped in the silent pass are shown in the interactive dialog as usual.";
      };

      DeadlineDaysFocus = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Days a pending update must be present before Focus/DND auto-deferral is disabled and the user must be prompted regardless of Focus state. `0` means Focus is always respected.";
      };

      DeadlineDaysHard = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Days a pending update must be present before no further deferrals are offered and the update is applied at the next opportunity. `0` disables hard deadlines.";
      };

      FocusCheckEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `false`, Focus/DND and display assertions (e.g. active screen sharing) are never checked. The prompt is shown regardless of the user's Focus state.";
      };

      FocusIgnoredProcesses = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Space-separated list of process names to ignore when checking for display-sleep assertions (`pmset -g assertions`). If the process holding the assertion resolves to a name that matches an entry here (case-insensitive), the assertion is not treated as a blocker and patching may proceed.";
      };

      AggressivePatchDayDeferral = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When `true`, deferral options are progressively capped as the patching window closes. Options shrink from 2 hours early in the day to 5 minutes near window end, then deferral is removed entirely once the window closes. When `false`, the full `DeferralTimerMenu` list is always shown. Applies to both monthly and deadline mode on the final patch day.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-gilburns-patcher" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Third Party Patcher (com.gilburns.patcher) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}