# Auto-generated from ProfileManifests: com.apple.garageband10.plist
# Domain: com.apple.garageband10
# Title: GarageBand
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "GarageBand";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.garageband10";
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
        default = [ "welcomeScreenShown" "ShowMoreDownloadsDialogGB" "RecentWhatsNewPanelVersion" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-apple-garageband10" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "GarageBand (com.apple.garageband10) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}