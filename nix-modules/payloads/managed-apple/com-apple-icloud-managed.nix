# Auto-generated from ProfileManifests: com.apple.icloud.managed.plist
# Domain: com.apple.icloud.managed
# Title: iCloud Find My
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-icloud-managed" = {
    enable = lib.mkEnableOption "iCloud Find My";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.icloud.managed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    DisableFMMiCloudSetting = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

  };
}