# Auto-generated from ProfileManifests: com.apple.dashboard.plist
# Domain: com.apple.dashboard
# Title: Parental Controls: Dashboard Widget Restrictions
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-dashboard" = {
    enable = lib.mkEnableOption "Parental Controls: Dashboard Widget Restrictions";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.dashboard";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    whiteListEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', enables the widget allow list.";
    };

    WhiteList = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Type = lib.mkOption {
            type = types.nullOr (types.enum [ "bundleID" ]);
            default = null;
            description = "The type of allow list item. Set to 'bundleID' to use a widget's bundle ID as its main ID.";
          };
          ID = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The bundle ID of a widget.";
          };
        };
      }));
      default = null;
      description = "An array of widget item dictionaries that are allowed.";
    };

  };
}