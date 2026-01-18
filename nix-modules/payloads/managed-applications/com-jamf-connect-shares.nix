# Auto-generated from ProfileManifests: com.jamf.connect.shares.plist
# Domain: com.jamf.connect.shares
# Title: Jamf Connect Shares
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-jamf-connect-shares" = {
    enable = lib.mkEnableOption "Jamf Connect Shares";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.jamf.connect.shares";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Version = lib.mkOption {
      type = types.nullOr (types.enum [ "1" ]);
      default = null;
      description = "Required.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    HomeMount = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Mount = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Mount the user's home automatically or not.";
          };
          Groups = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Specifies which active directory group members should have their home profile mounted.";
          };
          Options = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Array of optional mount options. See the Options table in the documentation linked below for more information.";
          };
        };
      });
      default = null;
      description = "This is a dictionary of attributes for scenarios where the user's home profile should be mounted.";
    };

    Shares = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Name as it will appear in the Jamf Connect menu item.";
          };
          URL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The actual URL of the mount point in the form of \"smb://dc1.example.com/Homes\".\n\nFor the URLs, you can use variable substitution to allow for custom mounts without having to create even more XML. Jamf Connect understands <<domain>>, <<fullname>>, <<serial>>, <<shortname>>, <<upn>> and <<email>>";
          };
          Groups = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "An array of AD groups allowed to mount the share.";
          };
          LocalMount = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Optional local mount point.";
          };
          AutoMount = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If enabled, the share is automatically mounted.";
          };
          ConnectedOnly = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If enabled, the share is only mounted when the computer is connected to the active directory domain.";
          };
          Options = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Array of optional mount options. See the Options table in the documentation linked below for more information.";
          };
        };
      }));
      default = null;
      description = "Array of dictionaries of each share and their settings.";
    };

  };
}