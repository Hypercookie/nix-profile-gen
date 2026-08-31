# Auto-generated from ProfileManifests: com.apple.desktop.plist
# Domain: com.apple.desktop
# Title: Desktop Picture
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Desktop Picture";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.desktop";
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
        default = [ "locked" "override_picture_path" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      locked = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', locks the desktop picture. Replaced with allowWallpaperModification in macOS 10.13.";
      };

      override_picture_path = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The path to the desktop picture. If set, this picture is always locked.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-desktop" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Desktop Picture (com.apple.desktop) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}