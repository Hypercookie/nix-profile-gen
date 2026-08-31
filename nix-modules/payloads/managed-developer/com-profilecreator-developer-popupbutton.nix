# Auto-generated from ProfileManifests: com.profilecreator.developer.popupbutton.plist
# Domain: com.profilecreator.developer.PopUpButton
# Title: Developer: PopUpButton
# Platforms: iOS, macOS, tvOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Developer: PopUpButton";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.profilecreator.developer.PopUpButton";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "PopUpButton01" "PopUpButton02" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-popupbutton" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Developer: PopUpButton (com.profilecreator.developer.PopUpButton) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}