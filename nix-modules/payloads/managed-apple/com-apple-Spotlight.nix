# Auto-generated from ProfileManifests: com.apple.Spotlight.plist
# Domain: com.apple.Spotlight
# Title: Spotlight
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Spotlight";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.Spotlight";
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
        default = [ "orderedItems" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      orderedItems = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            name = lib.mkOption {
              type = types.nullOr (types.enum [ "APPLICATIONS" "BOOKMARKS" "MENU_EXPRESSION" "CONTACT" "MENU_CONVERSION" "MENU_DEFINITION" "SOURCE" "DOCUMENTS" "EVENT_TODO" "DIRECTORIES" "FONTS" "IMAGES" "MESSAGES" "MOVIES" "MUSIC" "MENU_OTHER" "PDF" "PRESENTATIONS" "MENU_SPOTLIGHT_SUGGESTIONS" "SPREADSHEETS" "SYSTEM_PREFS" ]);
              default = null;
              description = "Spotlight Search Item Category";
            };
            enabled = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Set this preference to 'false' to disable the applicable Spotlight search option.";
            };
          };
        }));
        default = null;
        description = "Add each Spotlight search item in the order you want them to be displayed in Spotlight. As these items are all contained in a single array, to manage any single item each individual Spotlight search category needs to be added below.  You may need to logout after installing the profile to verify the results.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-Spotlight" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Spotlight (com.apple.Spotlight) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}