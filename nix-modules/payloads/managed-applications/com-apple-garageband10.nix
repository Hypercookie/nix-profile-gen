# Auto-generated from ProfileManifests: com.apple.garageband10.plist
# Domain: com.apple.garageband10
# Title: GarageBand
# Platforms: macOS
# Unique: yes
# Targets: system, user

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
        description = "Whether only one instance of this payload is allowed per profile.";
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

      _platforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "macOS" ];
        description = "Supported Apple platforms (pfm_platforms).";
      };

      _keyPlatforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.attrs;
        default = [ ];
        description = "Keys restricted to a subset of the manifest's platforms (key-level pfm_platforms).";
      };

      _allowUnsupportedPlatform = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Emit this instance even if its manifest says the target platform does not support it or some of its keys. Produces a warning instead of an error.";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
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
  options.payloads."managed-applications-com-apple-garageband10" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "GarageBand (com.apple.garageband10) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}