# Auto-generated from ProfileManifests: com.apple.font.plist
# Domain: com.apple.font
# Title: Font
# Platforms: iOS, macOS
# Unique: no
# Targets: system, user

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
        description = "Whether only one instance of this payload is allowed per profile.";
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

      _platforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "iOS" "macOS" ];
        description = "Supported Apple platforms (pfm_platforms).";
      };

      _keyPlatforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.attrs;
        default = [ ];
        description = "Keys restricted to a subset of the manifest's platforms (key-level pfm_platforms).";
      };

      _allowUnsupportedPlatform = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Emit this instance even if its manifest says the target platform does not support it or some of its keys. Produces a warning instead of an error.";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
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
        description = "The user-visible name for the font. The device replaces this field with the actual name of the font after installation. Each payload must contain exactly one font file in trueType (.ttf) or OpenType (.otf) format. The device doesn't support collection formats (.ttc or .otc).\nThe device identifies fonts by their embedded PostScript names. The device considers two fonts with the same PostScript name to be the same font, even if their contents differ. The device doesn't support installing two different fonts with the same PostScript name, and the resulting behavior is undefined.";
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
  options.payloads."apple-com-apple-font" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Font (com.apple.font) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}