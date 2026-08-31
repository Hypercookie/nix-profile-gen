# Auto-generated from ProfileManifests: com.profilecreator.developer.tableview.plist
# Domain: com.profilecreator.developer.tableview
# Title: Developer: TableView
# Platforms: iOS, macOS, tvOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Developer: TableView";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.profilecreator.developer.tableview";
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
        default = [ "TableView01" "TableView02" "TableView03" "TableView04" "TableView05" "TableView06" "TableView07" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-tableview" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Developer: TableView (com.profilecreator.developer.tableview) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}