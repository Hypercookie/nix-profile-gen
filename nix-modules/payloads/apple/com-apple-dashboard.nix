# Auto-generated from ProfileManifests: com.apple.dashboard.plist
# Domain: com.apple.dashboard
# Title: Parental Controls: Dashboard Widget Restrictions
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Parental Controls: Dashboard Widget Restrictions";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.dashboard";
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
        default = [ "whiteListEnabled" "WhiteList" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-dashboard" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Parental Controls: Dashboard Widget Restrictions (com.apple.dashboard) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}