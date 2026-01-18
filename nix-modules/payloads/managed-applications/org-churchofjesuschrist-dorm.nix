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
      default = "/var/log/org.churchofjesuschrist.log";
      description = "Path to the log file for the DDM reminder script.";
    };

    DaysBeforeDeadlineDisplayReminder = lib.mkOption {
      type = types.nullOr (types.int);
      default = 14;
      description = "Number of days before the deadline when reminders start being displayed.";
    };

    DaysBeforeDeadlineBlurscreen = lib.mkOption {
      type = types.nullOr (types.int);
      default = 3;
      description = "Number of days before the deadline when blur-screen enforcement starts.";
    };

    DaysBeforeDeadlineHidingButton2 = lib.mkOption {
      type = types.nullOr (types.int);
      default = 1;
      description = "Number of days before the deadline when the secondary button is hidden.";
    };

    DaysOfExcessiveUptimeWarning = lib.mkOption {
      type = types.nullOr (types.int);
      default = 1;
      description = "Number of days of excessive uptime before warning the user.";
    };

    MinimumDiskFreePercentage = lib.mkOption {
      type = types.nullOr (types.int);
      default = 1;
      description = "Percent of free disk space required before warning the user.";
    };

    MeetingDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = 75;
      description = "Delay in minutes before enforcing reminders around meetings.";
    };

    OrganizationOverlayIconURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = "https://usw2.ics.services.jamfcloud.com/icon/hash_4804203ac36cbd7c83607487f4719bd4707f2e283500f54428153af17da082e2";
      description = "URL to the organization overlay icon image.";
    };

    SwapOverlayAndLogo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Whether to swap the overlay icon and primary logo positions.";
    };

    DateFormatDeadlineHumanReadable = lib.mkOption {
      type = types.nullOr (types.str);
      default = "+%a, %d-%b-%Y, %-l:%M %p";
      description = "strftime format string used to render the deadline date for users.";
    };

    SupportTeamName = lib.mkOption {
      type = types.nullOr (types.str);
      default = "IT Support";
      description = "Display name of the support team.";
    };

    SupportTeamPhone = lib.mkOption {
      type = types.nullOr (types.str);
      default = "+1 (801) 555-1212";
      description = "Phone number for support.";
    };

    SupportTeamEmail = lib.mkOption {
      type = types.nullOr (types.str);
      default = "rescue@domain.org";
      description = "Email address for support.";
    };

    SupportTeamWebsite = lib.mkOption {
      type = types.nullOr (types.str);
      default = "https://support.domain.org";
      description = "Website URL for support.";
    };

    SupportKB = lib.mkOption {
      type = types.nullOr (types.str);
      default = "KB8675309";
      description = "Knowledge base article identifier.";
    };

    InfoButtonAction = lib.mkOption {
      type = types.nullOr (types.str);
      default = "https://support.apple.com/108382";
      description = "URL opened when the info button is clicked.";
    };

    SupportKBURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = "[108382](https://support.apple.com/108382)";
      description = "Markdown-formatted link to the support knowledge base article.";
    };

    Title = lib.mkOption {
      type = types.nullOr (types.str);
      default = "macOS {titleMessageUpdateOrUpgrade} Required";
      description = "Title text displayed at the top of the DDM dialog.";
    };

    Button1Text = lib.mkOption {
      type = types.nullOr (types.str);
      default = "Open Software Update";
      description = "Label for the primary action button.";
    };

    Button2Text = lib.mkOption {
      type = types.nullOr (types.str);
      default = "Remind Me Later";
      description = "Label for the secondary (remind later) button.";
    };

    InfoButtonText = lib.mkOption {
      type = types.nullOr (types.str);
      default = "KB8675309";
      description = "Label for the info button.";
    };

    ExcessiveUptimeWarningMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = "<br><br>**Note:** Your Mac has been powered-on for **\${uptimeHumanReadable}**. For more reliable results, please manually restart your Mac before proceeding.";
      description = "Markdown-formatted text displayed in the dialog.";
    };

    DiskSpaceWarningMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = "<br><br>Sample **Note:** Your Mac has only **{diskSpaceHumanReadable}**, which may prevent this macOS {titleMessageUpdateOrUpgrade:l}.";
      description = "Markdown-formatted text displayed in the dialog.";
    };

    StagedUpdateMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = "<br><br>Sample **Good news!** The macOS update has already been downloaded. When ready, click **{button1text}** to install.";
      description = "Markdown-formatted message displayed when the update is fully staged (downloaded and ready).";
    };

    PartiallyStagedUpdateMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = "<br><br>Sample Your Mac is currently preparing the required macOS update.";
      description = "Markdown-formatted message displayed when the update is partially staged (preparing).";
    };

    PendingDownloadMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = "<br><br>Sample Your Mac will begin downloading the update shortly.";
      description = "Markdown-formatted message displayed when the update download is pending.";
    };

    HideStagedUpdateInfo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Whether to hide staged update information (e.g., staged/partial/pending messages) in the UI.";
    };

    Message = lib.mkOption {
      type = types.nullOr (types.str);
      default = "**A required macOS \${titleMessageUpdateOrUpgrade:l} is now available**<br><br>Happy $( date +'%A' ), \${loggedInUserFirstname}!<br><br>Please \${titleMessageUpdateOrUpgrade:l} to macOS **\${ddmVersionString}** to ensure your Mac remains secure and compliant with organizational policies.<br><br>To perform the \${titleMessageUpdateOrUpgrade:l} now, click **\${button1text}**, review the on-screen instructions, then click **\${softwareUpdateButtonText}**.<br><br>If you are unable to perform this \${titleMessageUpdateOrUpgrade:l} now, click **\${button2text}** to be reminded again later.<br><br>However, your device **will automatically restart and \${titleMessageUpdateOrUpgrade:l}** on **\${ddmEnforcedInstallDateHumanReadable}** if you have not \${titleMessageUpdateOrUpgrade:l}d before the deadline.\${excessiveUptimeWarningMessage}<br><br>For assistance, please contact **\${supportTeamName}** by clicking the (?) button in the bottom, right-hand corner.";
      description = "Markdown-formatted message body displayed in the dialog.";
    };

    InfoBox = lib.mkOption {
      type = types.nullOr (types.str);
      default = "**Current:** {installedmacOSVersion}<br><br>**Required:** {ddmVersionString}<br><br>**Deadline:** {ddmVersionStringDeadlineHumanReadable}<br><br>**Day(s) Remaining:** {ddmVersionStringDaysRemaining}";
      description = "Markdown-formatted info box content showing current and required versions and deadline.";
    };

    HelpMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = "For assistance, please contact: **{supportTeamName}**<br>- **Telephone:** {supportTeamPhone}<br>- **Email:** {supportTeamEmail}<br>- **Website:** {supportTeamWebsite}<br>- **Knowledge Base Article:** {supportKBURL}<br><br>**User Information:**<br>- **Full Name:** {userfullname}<br>- **User Name:** {username}<br><br>**Computer Information:**<br>- **Computer Name:** {computername}<br>- **Serial Number:** {serialnumber}<br>- **macOS:** {osversion}<br><br>**Script Information:**<br>- **Dialog:** {dialogVersion}<br>- **Script:** {scriptVersion}<br>";
      description = "Markdown-formatted help text including support, user, and computer information.";
    };

    HelpImage = lib.mkOption {
      type = types.nullOr (types.str);
      default = "qr={infobuttonaction}";
      description = "Help image configuration, such as QR code pointing to the info button action.";
    };

  };
}