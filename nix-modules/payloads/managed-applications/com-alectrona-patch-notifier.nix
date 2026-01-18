# Auto-generated from ProfileManifests: com.alectrona.patch-notifier.plist
# Domain: com.alectrona.patch-notifier
# Title: Alectrona Patch Notifier
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-alectrona-patch-notifier" = {
    enable = lib.mkEnableOption "Alectrona Patch Notifier";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.alectrona.patch-notifier";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    DialogDescription = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The main description that appears in the update dialog.	";
    };

    UpdateButtonLabel = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The label or displayed text in the update button.";
    };

    DeferButtonLabel = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The label or displayed text in the defer button.";
    };

    UpdateButtonPrimary = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "By default, the Update button is the primary button of the Update Dialog; meaning it responds to the Return key. Set this key to false if you wish to disable this behavior.";
    };

    ContentImagePath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a locally stored image to use as the content image of the update dialog (PNG/JPG/GIF/TIFF).";
    };

    DialogTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The duration, in seconds, that the update dialog will appear on screen before performing a timeout.";
    };

    DialogHelpText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enable the help button and populate the text displayed on screen when clicked.";
    };

    DialogHelpToolTip = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Customizes the tooltip of the help button (when enabled).";
    };

    DialogTitle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The title of the update dialog window.";
    };

    DeferralLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Sets a global Deferral Limit for all software.";
    };

    DeferralLimitExceptions = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Key = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Software ID of the software title to include in the deferral limit exceptions.";
          };
          Integer = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "Deferral limit for the specified Software ID.";
          };
        };
      }));
      default = null;
      description = "Sets exceptions to the global Deferral Limit, or irrespective of it.";
    };

    FinalDialogDescription = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The main description that appears in the final update dialog.";
    };

    DialogDeferralText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The text that appears below the main description in the update dialog.";
    };

    IgnoreDeferralText = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Does not include the deferral text in the update dialog’s description.";
    };

    RecordTimeoutAsDeferral = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When an update dialog timeout occurs, record a deferral rather than taking no action.";
    };

    FinalDialogTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The duration, in seconds, that the final update dialog will appear on screen before performing an update.";
    };

  };
}