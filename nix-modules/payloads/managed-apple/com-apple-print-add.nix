# Auto-generated from ProfileManifests: com.apple.print.add.plist
# Domain: com.apple.print.add
# Title: Printing: Toolbar of Add Printer Window
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-print-add" = {
    enable = lib.mkEnableOption "Printing: Toolbar of Add Printer Window";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.print.add";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    NSToolbar_Configuration_com_apple_print_add_toolbar = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          TB_Item_Identifiers = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "com.apple.print.pbm.uber" "com.apple.print.pbm.ip" "com.apple.print.pbm.smb" "com.apple.print.pbm.advanced" "com.apple.print.add.search" "NSToolbarFlexibleSpaceItem" "NSToolbarSpaceItem" ]));
            default = [ "com.apple.print.pbm.uber" "com.apple.print.pbm.ip" "com.apple.print.pbm.smb" "NSToolbarFlexibleSpaceItem" "com.apple.print.add.search" ];
            description = "The items to include in the toolbar and their order. The only items that can be added more than once are the Flexible Space and Space. Warning: configuring this property with no actual buttons (Default, IP, Windows, or Advanced) may lead to the display of no UI, and this condition may persist after removal of profile.";
          };
          TB_Display_Mode = lib.mkOption {
            type = types.nullOr (types.enum [ 1 2 3 ]);
            default = 1;
            description = "The toolbar display mode.";
          };
          TB_Icon_Size_Mode = lib.mkOption {
            type = types.nullOr (types.enum [ 1 2 ]);
            default = 1;
            description = "The icon size style.";
          };
          TB_Is_Shown = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = 1;
            description = "Show or hide the toolbar.";
          };
        };
      });
      default = null;
      description = "Add Printer Dictionary";
    };

  };
}