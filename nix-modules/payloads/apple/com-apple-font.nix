# Auto-generated from ProfileManifests: com.apple.font.plist
# Domain: com.apple.font
# Title: Font
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-font" = {
    enable = lib.mkEnableOption "Font";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.font";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Name = lib.mkOption {
      type = types.nullOr (types.str);
      default = "";
      description = "The user-visible name for the font. This field is replaced by the actual name of the font after installation. Each payload must contain exactly one font file in trueType (.ttf) or OpenType (.otf) format. Collection formats (.ttc or .otc) are not supported.\n\nFonts are identified by their embedded PostScript names. Two fonts with the same PostScript name are considered to be the same font even if their contents differ. Installing two different fonts with the same PostScript name isn't supported, and the resulting behavior is undefined.";
    };

    Font = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The contents of the font file.";
    };

  };
}