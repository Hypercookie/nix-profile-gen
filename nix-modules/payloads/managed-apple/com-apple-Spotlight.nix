# Auto-generated from ProfileManifests: com.apple.Spotlight.plist
# Domain: com.apple.Spotlight
# Title: Spotlight
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-Spotlight" = {
    enable = lib.mkEnableOption "Spotlight";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.Spotlight";
      description = "The payload domain (PayloadType) for this manifest.";
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
}