# Auto-generated from ProfileManifests: com.microsoft.OneDriveUpdater.plist
# Domain: com.microsoft.OneDriveUpdater
# Title: Microsoft OneDrive Updater
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-OneDriveUpdater" = {
    enable = lib.mkEnableOption "Microsoft OneDrive Updater";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.microsoft.OneDriveUpdater";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Tier = lib.mkOption {
      type = types.nullOr (types.enum [ "Production" "Insiders" "Enterprise" ]);
      default = "Production";
      description = "Defines the update ring.";
    };

  };
}