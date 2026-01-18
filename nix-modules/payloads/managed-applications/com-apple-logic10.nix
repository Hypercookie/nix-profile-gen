# Auto-generated from ProfileManifests: com.apple.logic10.plist
# Domain: com.apple.logic10
# Title: Logic Pro X
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-apple-logic10" = {
    enable = lib.mkEnableOption "Logic Pro X";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.logic10";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    DontShowAdditionalContentDowload = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Suppresses the popup to download additonal sound content on launch. Yes, in fact, 'Download' is spelled 'Dowload' in the preference key.";
    };

    FeatureAvailable_ExpertAudio = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables destructive audio editing, and advanced configuration options for audio editing experts.";
    };

    FeatureAvailable_ExpertCS = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows experts to create new, and edit any functional detail of existing control surface systems.";
    };

    FeatureAvailable_ExpertEditing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables advanced editing functionality, including: aliases, track reassignment, historic tuning scales, and the Tempo Interpreter.";
    };

    FeatureAvailable_ExpertMIDI = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows signal flow control and real-time processing of MIDI input and output streams in the Environment.";
    };

    FeatureAvailable_ExpertScore = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables the full feature set of the Score window for notation experts.";
    };

    FeatureAvailable_Surround = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables all features for surround audio productions, and requires a surround speaker setup for monitoring.";
    };

    userLevel = lib.mkOption {
      type = types.nullOr (types.enum [ 0 10 ]);
      default = null;
      description = "Configures whether Show Advanced Tools is enabled.";
    };

    startupAction = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 4 5 6 ]);
      default = null;
      description = "Configures Logic's startup behaviour.";
    };

    RecentWhatsNewPanelVersion = lib.mkOption {
      type = types.nullOr (types.int);
      default = 99;
      description = "So long as the integer value of this preference is set equal or higher to the value produced in the user-level plist after launching the app and acknowledging the \"What's New\" prompt, this will prevent the \"What's New\" prompt from appearing.";
    };

    QuickHelpMode = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 ]);
      default = 1;
      description = "Set to 0 to disable Quick Help Mode overlays.";
    };

  };
}