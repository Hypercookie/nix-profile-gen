# Auto-generated from ProfileManifests: fr.jeremyb.sumb.plist
# Domain: fr.jeremyb.sumb
# Title: SUMB (Software Update Menu Bar)
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "SUMB (Software Update Menu Bar)";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "fr.jeremyb.sumb";
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
        default = [ "PFC_SegmentedControl_0" "hideIconWhenUpToDate" "hideSettings" "ignoreAppleUpdateChannel" "showDockIcon" "notificationSound" "popoverTitle" "popoverUpdateButton" "popoverFooter" "popoverUpToDateMessage" "menubarDotBlinkingThresholdDays" "menubarPreparingMessage" "menubarPrefix" "menubarSuffix" "notificationsEnabled" "notificationThresholdDays" "notificationIntervalMinutes" "notificationTitle" "notificationBody" "popupEnabled" "popupThresholdDays" "popupTitle" "popupBody" "popupRescheduleButton" "popupUpdateButton" "popupSchedulerHelp" "popupCal1MondayHours" "popupCal2TuesdayHours" "popupCal3WednesdayHours" "popupCal4ThursdayHours" "popupCal5FridayHours" "popupCal6SaturdayHours" "popupCal7SundayHours" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      PFC_SegmentedControl_0 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      hideIconWhenUpToDate = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Hide SUMB Icon when MacOS is up to date";
      };

      hideSettings = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Hide the Settings menu. Holding Option while right-clicking the menu bar icon still reveals it, as does relaunching SUMB.app.";
      };

      ignoreAppleUpdateChannel = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Ignore Apple Update Channel";
      };

      showDockIcon = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Show the SUMB icon in the Dock when an update is available, with the countdown in a red badge.";
      };

      notificationSound = lib.mkOption {
        type = types.nullOr (types.enum [ "Basso.aiff" "Blow.aiff" "Bottle.aiff" "Frog.aiff" "Funk.aiff" "Glass.aiff" "Hero.aiff" "Morse.aiff" "Ping.aiff" "Pop.aiff" "Purr.aiff" "Sosumi.aiff" "Submarine.aiff" "Tink.aiff" ]);
        default = null;
        description = "Sound played with the notification and popup. Only files located in /System/Library/Sounds are supported.";
      };

      popoverTitle = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Title shown at the top of the popover.";
      };

      popoverUpdateButton = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Label of the button that takes the user to Software Update.";
      };

      popoverFooter = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Warning at the bottom of the popover. Supports Markdown links: [text](https://example.com)";
      };

      popoverUpToDateMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Message displayed in the popover when the Mac is up to date.";
      };

      menubarDotBlinkingThresholdDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Number of days before the update deadline at which the red dot on the menu bar icon starts blinking.";
      };

      menubarPreparingMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Text shown in the menu bar while the update is being prepared.";
      };

      menubarPrefix = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Text placed before the number of days remaining in the menu bar countdown. (e.g. D-).";
      };

      menubarSuffix = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Text placed after the number of days remaining (e.g. j in French, t in German).";
      };

      notificationsEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Allow SUMB to post reminder notifications about the scheduled macOS update.";
      };

      notificationThresholdDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Days remaining before the update deadline at which SUMB starts sending reminder notifications.";
      };

      notificationIntervalMinutes = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Time in minutes between two reminder notifications.";
      };

      notificationTitle = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Title displayed in the reminder notification. Supports $VERSION, $DATE and $COUNTDOWN variables.";
      };

      notificationBody = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Body text of the reminder notification. Supports $VERSION, $DATE and $COUNTDOWN variables.";
      };

      popupEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Show the popup reminder at the start of each allowed hour.";
      };

      popupThresholdDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Days remaining before the update deadline at which the Scheduler popup starts showing.";
      };

      popupTitle = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Title of the popup reminder.";
      };

      popupBody = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Message of the Scheduler popup. Supports $VERSION, $DATE and $COUNTDOWN variables.";
      };

      popupRescheduleButton = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Label of button that opens the Scheduler window.";
      };

      popupUpdateButton = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Label of the popup update button, opens Software Update.";
      };

      popupSchedulerHelp = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Instructions shown above the grid in the Scheduler window.";
      };

      popupCal1MondayHours = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Hours suggested on Monday, comma-separated from 0 to 23. 12,17 suggests 12h00 and 17h00.";
      };

      popupCal2TuesdayHours = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Hours suggested on Tuesday, comma-separated from 0 to 23. 12,17 suggests 12h00 and 17h00.";
      };

      popupCal3WednesdayHours = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Hours suggested on Wednesday, comma-separated from 0 to 23. 12,17 suggests 12h00 and 17h00.";
      };

      popupCal4ThursdayHours = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Hours suggested on Thursday, comma-separated from 0 to 23. 12,17 suggests 12h00 and 17h00.";
      };

      popupCal5FridayHours = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Hours suggested on Friday, comma-separated from 0 to 23. 12,17 suggests 12h00 and 17h00.";
      };

      popupCal6SaturdayHours = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Hours suggested on Saturday, comma-separated from 0 to 23. 12,17 suggests 12h00 and 17h00.";
      };

      popupCal7SundayHours = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Hours suggested on Sunday, comma-separated from 0 to 23. 12,17 suggests 12h00 and 17h00.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-fr-jeremyb-sumb" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "SUMB (Software Update Menu Bar) (fr.jeremyb.sumb) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}