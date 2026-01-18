# Auto-generated from ProfileManifests: com.profilecreator.developer.tableview.plist
# Domain: com.profilecreator.developer.tableview
# Title: Developer: TableView
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-tableview" = {
    enable = lib.mkEnableOption "Developer: TableView";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.profilecreator.developer.tableview";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    TableView01 = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "TableView representing an array of strings.";
    };

    TableView02 = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "TableView representing an array of strings with a title.";
    };

    TableView03 = lib.mkOption {
      type = types.nullOr (types.listOf (types.int));
      default = null;
      description = "TableView representing an array of integers with a title.";
    };

    TableView04 = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "Option1" "Option2" "Option3" ]));
      default = null;
      description = "TableView representing an array of strings as PopUp Buttons.";
    };

    TableView05 = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "Option1" "Option2" "Option3" ]));
      default = null;
      description = "TableView representing an array of strings as ComboBoxes.";
    };

    TableView06 = lib.mkOption {
      type = types.nullOr (types.listOf (types.bool));
      default = null;
      description = "TableView representing an array of booleans.";
    };

    TableView07 = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Title = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Title";
          };
          ArrayPopUp = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "Option1" "Option2" "Option3" ]));
            default = null;
          };
          ArrayString = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
          };
        };
      }));
      default = null;
      description = "TableView representing an array of dictionaries which in turn has an array.";
    };

  };
}