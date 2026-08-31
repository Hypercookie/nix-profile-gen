# Auto-generated from ProfileManifests: com.alectrona.patch-notifier.plist
# Domain: com.alectrona.patch-notifier
# Title: Alectrona Patch Notifier
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Alectrona Patch Notifier";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.alectrona.patch-notifier";
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
        default = [ "system" "user" ];
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
        default = [ "PFC_SegmentedControl_0" "DialogDescription" "UpdateButtonLabel" "DeferButtonLabel" "UpdateButtonPrimary" "ContentImagePath" "DialogTimeout" "DialogHelpText" "DialogHelpToolTip" "DialogTitle" "DeferralLimit" "DeferralLimitExceptions" "FinalDialogDescription" "DialogDeferralText" "IgnoreDeferralText" "RecordTimeoutAsDeferral" "FinalDialogTimeout" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-alectrona-patch-notifier" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Alectrona Patch Notifier (com.alectrona.patch-notifier) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}