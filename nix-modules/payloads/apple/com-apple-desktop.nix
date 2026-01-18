# Auto-generated from ProfileManifests: com.apple.desktop.plist
# Domain: com.apple.desktop
# Title: Desktop Picture
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-desktop" = {
    enable = lib.mkEnableOption "Desktop Picture";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.desktop";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    locked = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', locks the desktop picture. Replaced with allowWallpaperModification in macOS 10.13.";
    };

    override_picture_path = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The path to the desktop picture. If set, this picture is always locked.";
    };

  };
}