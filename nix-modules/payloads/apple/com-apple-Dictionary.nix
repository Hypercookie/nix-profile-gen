# Auto-generated from ProfileManifests: com.apple.Dictionary.plist
# Domain: com.apple.Dictionary
# Title: Parental Controls: Dictionary
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Parental Controls: Dictionary";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.Dictionary";
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
        default = [ "parentalControl" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      parentalControl = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables parental controls dictionary restrictions.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-Dictionary" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Parental Controls: Dictionary (com.apple.Dictionary) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}