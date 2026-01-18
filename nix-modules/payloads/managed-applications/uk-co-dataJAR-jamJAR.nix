# Auto-generated from ProfileManifests: uk.co.dataJAR.jamJAR.plist
# Domain: uk.co.dataJAR.jamJAR
# Title: jamJAR
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-uk-co-dataJAR-jamJAR" = {
    enable = lib.mkEnableOption "jamJAR";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "uk.co.dataJAR.jamJAR";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    log_file_dir = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "jamJAR log file storage location. Prior to jamJAR 2.0: The log rotates at midnight & appends the date to the old file. As of jamJAR 2.0+: The log rotates every 10MB, not archiving older versions.";
    };

    log_file_name = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "jamJAR log file name.";
    };

    notifier_msg_title = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    notifier_msg_installed = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Notification message content when software is installed. Requires 2 string placeholders (%s), the first being the munki item name and the second being the version.";
    };

    notifier_msg_nopending = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Notification message content when no software is pending.";
    };

    notifier_msg_pending = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Notification message content when software is pending.";
    };

    notifier_msg_uptodate = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Notification message content when software is up-to-date. Requires 1 string placeholder (%s), which defaults to the munki item name.";
    };

    notifier_msg_osupdatespending = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The notification text to display when macOS updates are pending. This leverages Manual Apple Updates in Munki 5";
    };

    notifier_path = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The path of the application sending jamJAR notifications. Only terminal-notifier & Jamf Pro's Management Action have been tested.";
    };

    notifier_sender_id = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The bundle ID of the application that sent the notification, if using only terminal-notifier or Notifier, this should be /Applications/Managed Software Center.app (or whatever the path to MSC is, if using MSC).";
    };

    datajar_notifier = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines if jamJAR should use the dataJAR notifier for notifications.";
    };

    datajar_notifier_logout_button = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Sets the title for the logout button shown in the Alert notifications.";
    };

    no_msg_category = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Category name which when defined will not post a notification.";
    };

    delete_secure_auth = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If set to True, deletes the AdditionalHttpHeaders key in /private/var/root/Library/Preferences/ManagedInstalls.plist";
    };

  };
}