# Auto-generated from ProfileManifests: edu.ncsu.confboard.plist
# Domain: edu.ncsu.confboard
# Title: ConfBoard
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-edu-ncsu-confboard" = {
    enable = lib.mkEnableOption "ConfBoard";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "edu.ncsu.confboard";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    baseURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = "https://storage.googleapis.com/confboard";
      description = "The base URL to the folder containing the images.txt file or JSON information. Do NOT include trailing backslash.";
    };

    shouldUseJSON = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Base URL is a JSON file or feed not text list of URIs.";
    };

    shouldDisplayName = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Show name of device on screen";
    };

    groupLabel = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "String to be added after the baseURL.  Using images.txt this adds after the baseURL and before images.txt.  Using JSON this adds after the baseURL. Can be used to specify a folder on web server with different images.txt or as ? parameter string for JSON feed. ";
    };

    reloadContentTimer = lib.mkOption {
      type = types.nullOr (types.enum [ 30 60 120 240 480 720 1440 ]);
      default = 720;
      description = "Time between reloading the list of image links";
    };

    rotateImageTimer = lib.mkOption {
      type = types.nullOr (types.enum [ 10 30 60 120 300 ]);
      default = 10;
      description = "Time each image will stay on screen.";
    };

  };
}