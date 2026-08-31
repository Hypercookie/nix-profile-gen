# Auto-generated from ProfileManifests: com.gingerlabs.notability-macOS.plist
# Domain: com.gingerlabs.notability
# Title: Notability
# Platforms: macOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Notability";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.gingerlabs.notability";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
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
        default = [ "com.apple.configuration.managed" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      "com.apple.configuration.managed" = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            License_Key = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Required for Notability for Education or Notability for Business access. Obtain this key from the Notability admin panel after registering at gingerlabs.com. The active license count in the admin panel increments the first time each device launches Notability with this key while online.";
            };
            iCloud_Allowed = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Allows iCloud sync.";
            };
            Link_Sharing_Allowed = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Allows note sharing via links. Disabling both Link Sharing Allowed and Note Gallery Allowed will remove Notability Account access entirely.";
            };
            Note_Gallery_Allowed = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Allows publishing and downloading notes from the Notability community gallery. Disabling both Note Gallery Allowed and Link Sharing Allowed will remove Notability Account access entirely.";
            };
            GIF_Library_Allowed = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Allows use of Tenor GIFs inside notes.";
            };
            Photo_Library_Allowed = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Allows importing photos from the device Camera Roll into notes.";
            };
            Web_Clip_Allowed = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Allows inserting live webpage previews into notes.";
            };
            Locked_Folders_Allowed = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Allows users to password-protect Folders.";
            };
            Allowed_Export_Options = lib.mkOption {
              type = types.nullOr (types.listOf (types.enum [ "GoogleDrive" "Dropbox" "OneDrive" "Box" "WebDAV" "Email" "AirDrop" "OpenIn" ]));
              default = null;
              description = "Array of permitted export and import destinations. Supported values: GoogleDrive, Dropbox, OneDrive, Box, WebDAV, Email, AirDrop, OpenIn. Defaults to all.";
            };
            GoogleDrive_Allowed_Domains = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "Restricts Google Drive exports to the specified domains. Include the domain portion only — do not prefix with \"www.\" (e.g., use \"school.edu\", not \"www.school.edu\"). Leave empty to allow all domains.";
            };
            OneDrive_Allowed_Domains = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "Restricts OneDrive exports to the specified domains. Include the domain portion only — do not prefix with \"www.\" (e.g., use \"school.edu\", not \"www.school.edu\"). Leave empty to allow all domains.";
            };
            Box_Allowed_Domains = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "Restricts Box exports to the specified domains. Include the domain portion only — do not prefix with \"www.\" (e.g., use \"school.edu\", not \"www.school.edu\"). Leave empty to allow all domains.";
            };
          };
        });
        default = null;
        description = "MDM Configurable Settings for Notability. Delivered as a managed preferences dictionary under the com.apple.configuration.managed key in the com.gingerlabs.notability preference domain.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-gingerlabs-notability-macOS" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Notability (com.gingerlabs.notability) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}