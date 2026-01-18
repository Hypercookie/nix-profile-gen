# Auto-generated from ProfileManifests: com.apple.garageband10.plist
# Domain: com.apple.garageband10
# Title: GarageBand
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-apple-garageband10" = {
    enable = lib.mkEnableOption "GarageBand";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.garageband10";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    welcomeScreenShown = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, suppresses the welcome screen.";
    };

    ShowMoreDownloadsDialogGB = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If disabled, suppresses the prompt to download additional optional GarageBand content.";
    };

    RecentWhatsNewPanelVersion = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "So long as the integer value of this preference is set equal or higher to the value produced in the user-level plist after launching the app and acknowledging the \"What's New\" prompt, this will prevent the \"What's New\" prompt from appearing.";
    };

  };
}