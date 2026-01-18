# Auto-generated from ProfileManifests: com.profilecreator.developer.popupbutton.plist
# Domain: com.profilecreator.developer.PopUpButton
# Title: Developer: PopUpButton
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-popupbutton" = {
    enable = lib.mkEnableOption "Developer: PopUpButton";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.profilecreator.developer.PopUpButton";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PopUpButton01 = lib.mkOption {
      type = types.nullOr (types.enum [ "Item 1" "Item 2" "Item 3" ]);
      default = null;
      description = "PopUpButton.";
    };

    PopUpButton02 = lib.mkOption {
      type = types.nullOr (types.enum [ "Item 1" "Item 2" "Item 3" ]);
      default = null;
      description = "Both TextField and PopUpButton.";
    };

  };
}