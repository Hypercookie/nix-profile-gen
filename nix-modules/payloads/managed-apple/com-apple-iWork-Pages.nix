# Auto-generated from ProfileManifests: com.apple.iWork.Pages.plist
# Domain: com.apple.iWork.Pages
# Title: Pages
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-iWork-Pages" = {
    enable = lib.mkEnableOption "Pages";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.iWork.Pages";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    TMAFirstLaunchVersion = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Suppress Welcome Dialog";
    };

    TSURemoteDefaultsNextUpdate = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Suppress iWork Update Messages";
    };

  };
}