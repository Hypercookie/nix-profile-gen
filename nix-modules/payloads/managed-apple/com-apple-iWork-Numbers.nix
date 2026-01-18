# Auto-generated from ProfileManifests: com.apple.iWork.Numbers.plist
# Domain: com.apple.iWork.Numbers
# Title: Numbers
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-iWork-Numbers" = {
    enable = lib.mkEnableOption "Numbers";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.iWork.Numbers";
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