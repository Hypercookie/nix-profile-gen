# Auto-generated from ProfileManifests: com.apple.fileproviderd.plist
# Domain: com.apple.fileproviderd
# Title: File Provider
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "File Provider";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.fileproviderd";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "AllowManagedFileProvidersToRequestAttribution" "ManagementAllowsKnownFolderSyncing" "ManagementKnownFolderSyncingAllowList" "ManagementAllowsRemoteSyncing" "ManagementRemoteSyncingAllowList" "ManagementAllowsExternalVolumeSyncing" "ManagementExternalVolumeSyncingAllowList" "ManagementDomainAutoEnablementList" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AllowManagedFileProvidersToRequestAttribution = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables file providers access to the path of the requesting process.";
      };

      ManagementAllowsKnownFolderSyncing = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'false', the device prevents the File Provider extension from using desktop and documents synchronization in any app. This does not impact the ability for apps to utilize the File Provider extension for file and folder syncing with remote storage.";
      };

      ManagementKnownFolderSyncingAllowList = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of strings representing the composed identifiers of apps. The device allows the corresponding apps to use File Provider extension desktop and documents synchronization. If present, and 'ManagementAllowsKnownFolderSyncing' is set to 'true', the device allows only the apps in this list to use desktop and documents synchronization. This key is ignored if 'ManagementAllowsKnownFolderSyncing' is set to 'false'. This setting does not impact the ability for apps to use File Provider extension volume access. The format of the app identifiers is \"Bundle-ID (Team-ID)\", for example 'com.example.app (ABCD1234)'.";
      };

      ManagementAllowsRemoteSyncing = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'false', the device prevents the File Provider extension from using synchronization in any app. Also, none of the other options will be evaluated. Synchronization will be totally disabled for any application.";
      };

      ManagementRemoteSyncingAllowList = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of strings representing the composed identifiers of apps. The device allows the corresponding apps to use File Provider extension synchronization. If present, and 'ManagementAllowsRemoteSyncing' is set to 'true', the device allows only the apps in this list to use synchronization. This key is ignored if 'ManagementAllowsRemoteSyncing' is set to 'false'. If present, the other options will only be evaluated for the apps in this list. The format of the app identifiers is \"Bundle-ID (Team-ID)\", for example 'com.example.app (ABCD1234)'.";
      };

      ManagementAllowsExternalVolumeSyncing = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'false', the device only allows File Provider extension volume synchronization for the system \"home\" volume and any data separated volume, and prevents synchronization with any other volumes. If `true``, the device allows File Provider extension volume synchronization for the system \"home\" volume, any data separated volume, and any encrypted APFS volumes (on either internal or external media).";
      };

      ManagementExternalVolumeSyncingAllowList = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of strings representing the composed identifiers of apps. The device allows the corresponding apps to use File Provider extension volume synchronization. If present, and 'ManagementAllowsExternalVolumeSyncing' is set to 'true', the device allows only the apps in this list to use volume synchronization. This key is ignored if 'ManagementAllowsExternalVolumeSyncing' is set to 'false'. The format of the app identifiers is \"Bundle-ID (Team-ID)\", for example 'com.example.app (ABCD1234)'.";
      };

      ManagementDomainAutoEnablementList = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of strings representing the composed identifiers of apps. The device automatically enables the File Provider domains for the corresponding apps. The device doesn't enable existing domains if enrollment happens after they are created. The device doesn't prevent the user from disabling these File Provider domains. Users need to manually enable File Provider domains in the Finder if their corresponding apps aren't listed here. The format of the app identifiers is \"Bundle-ID (Team-ID)\", for example 'com.example.app (ABCD1234)'.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-fileproviderd" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "File Provider (com.apple.fileproviderd) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}