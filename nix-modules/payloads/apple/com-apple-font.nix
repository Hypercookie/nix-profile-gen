# Auto-generated from ProfileManifests: com.apple.font.plist
# Domain: com.apple.font
# Title: Font
# Platforms: iOS, macOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Font";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.font";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
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
        default = [ "Name" "Font" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Name = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The user-visible name for the font. This field is replaced by the actual name of the font after installation. Each payload must contain exactly one font file in trueType (.ttf) or OpenType (.otf) format. Collection formats (.ttc or .otc) are not supported.\nFonts are identified by their embedded PostScript names. Two fonts with the same PostScript name are considered to be the same font even if their contents differ. Installing two different fonts with the same PostScript name isn't supported, and the resulting behavior is undefined.";
      };

      Font = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The contents of the font file.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-font" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Font (com.apple.font) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}