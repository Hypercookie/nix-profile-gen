# Auto-generated from ProfileManifests: com.apple.fileproviderd.plist
# Domain: com.apple.fileproviderd
# Title: File Provider
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-fileproviderd" = {
    enable = lib.mkEnableOption "File Provider";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.fileproviderd";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AllowManagedFileProvidersToRequestAttribution = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', enables file providers access to the path of the requesting process.";
    };

    ManagementAllowsKnownFolderSyncing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the device prevents the File Provider extension from using desktop and documents synchronization in any app. This does not impact the ability for apps to utilize the File Provider extension for file and folder syncing with remote storage.";
    };

    ManagementKnownFolderSyncingAllowList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of strings representing the composed identifiers of apps. The device allows the corresponding apps to use File Provider extension desktop and documents synchronization. If present, and 'ManagementAllowsKnownFolderSyncing' is set to 'true', the device allows only the apps in this list to use desktop and documents synchronization. This key is ignored if 'ManagementAllowsKnownFolderSyncing' is set to 'false'. This setting does not impact the ability for apps to use File Provider extension volume access. The format of the app identifiers is \"Bundle-ID (Team-ID)\", for example 'com.example.app (ABCD1234)'.";
    };

  };
}