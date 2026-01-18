# Auto-generated from ProfileManifests: org.churchofjesuschrist.dorm.plist
# Domain: org.churchofjesuschrist.dorm
# Title: DDM OS Reminder
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-org-churchofjesuschrist-dorm" = {
    enable = lib.mkEnableOption "DDM OS Reminder";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "org.churchofjesuschrist.dorm";
      description = "The payload domain (PayloadType) for this manifest.";
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

    MinimumDiskFreePercentage = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Percent of free disk space required before warning the user.";
    };

    MeetingDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Delay in minutes before enforcing reminders around meetings.";
    };

    OrganizationOverlayIconURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "URL to the organization overlay icon image.";
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

    SupportTeamEmail = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Email address for support.";
    };

    SupportTeamWebsite = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Website URL for support.";
    };

    SupportKB = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Knowledge base article identifier.";
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

    Title = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Title text displayed at the top of the DDM dialog.";
    };

    Button1Text = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Label for the primary action button.";
    };

    Button2Text = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Label for the secondary (remind later) button.";
    };

    InfoButtonText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Label for the info button.";
    };

    ExcessiveUptimeWarningMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Markdown-formatted text displayed in the dialog.";
    };

    DiskSpaceWarningMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Markdown-formatted text displayed in the dialog.";
    };

    StagedUpdateMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Markdown-formatted message displayed when the update is fully staged (downloaded and ready).";
    };

    PartiallyStagedUpdateMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Markdown-formatted message displayed when the update is partially staged (preparing).";
    };

    PendingDownloadMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Markdown-formatted message displayed when the update download is pending.";
    };

    HideStagedUpdateInfo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Whether to hide staged update information (e.g., staged/partial/pending messages) in the UI.";
    };

    Message = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Markdown-formatted message body displayed in the dialog.";
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

    HelpImage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Help image configuration, such as QR code pointing to the info button action.";
    };

  };
}