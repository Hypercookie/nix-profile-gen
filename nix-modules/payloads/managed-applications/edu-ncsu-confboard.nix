# Auto-generated from ProfileManifests: edu.ncsu.confboard.plist
# Domain: edu.ncsu.confboard
# Title: ConfBoard
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "ConfBoard";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "edu.ncsu.confboard";
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
        default = [ "baseURL" "shouldUseJSON" "shouldDisplayName" "groupLabel" "reloadContentTimer" "rotateImageTimer" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      baseURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The base URL to the folder containing the images.txt file or JSON information. Do NOT include trailing backslash.";
      };

      shouldUseJSON = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Base URL is a JSON file or feed not text list of URIs.";
      };

      shouldDisplayName = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Show name of device on screen";
      };

      groupLabel = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "String to be added after the baseURL.  Using images.txt this adds after the baseURL and before images.txt.  Using JSON this adds after the baseURL. Can be used to specify a folder on web server with different images.txt or as ? parameter string for JSON feed. ";
      };

      reloadContentTimer = lib.mkOption {
        type = types.nullOr (types.enum [ 30 60 120 240 480 720 1440 ]);
        default = null;
        description = "Time between reloading the list of image links";
      };

      rotateImageTimer = lib.mkOption {
        type = types.nullOr (types.enum [ 10 30 60 120 300 ]);
        default = null;
        description = "Time each image will stay on screen.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-edu-ncsu-confboard" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "ConfBoard (edu.ncsu.confboard) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}