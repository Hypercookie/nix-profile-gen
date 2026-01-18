# Auto-generated from ProfileManifests: menu.nomad.shares.plist
# Domain: menu.nomad.shares
# Title: NoMAD Shares
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-menu-nomad-shares" = {
    enable = lib.mkEnableOption "NoMAD Shares";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "menu.nomad.shares";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Version = lib.mkOption {
      type = types.nullOr (types.enum [ "1" ]);
      default = null;
      description = "This is the version number of the configuration specification.";
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
            description = "Only mount the home for members of these AD groups. Enter 'All' to allow all users and groups to mount their home.";
          };
          Options = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Array of optional mount options. Refer to documentation for more information.";
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
            description = "Name as it will appear in the NoMAD menu item.";
          };
          URL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The actual URL of the mount point in the form of \"smb://dc1.nomad.test/Homes\".\n\nFor the URLs, you can use variable substitution to allow for custom mounts without having to create even more XML. NoMAD understands <<domain>>, <<fullname>>, <<serial>>, <<shortname>>, <<upn>> and <<email>>";
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
            description = "If enabled, will auto mount share.";
          };
          ConnectedOnly = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If enabled, will only mount on domain.";
          };
          Options = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Array of optional mount options. Refer to documentation for more information.";
          };
        };
      }));
      default = null;
      description = "Array of dictionaries of each share and their settings.";
    };

    IgnoreShareNames = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Specify a list of shares you'd like to ignore. (Time Machine is now ignored by default.)";
    };

  };
}