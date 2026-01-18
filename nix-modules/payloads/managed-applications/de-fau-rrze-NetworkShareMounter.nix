# Auto-generated from ProfileManifests: de.fau.rrze.NetworkShareMounter.plist
# Domain: de.fau.rrze.NetworkShareMounter
# Title: Network Share Mounter
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-de-fau-rrze-NetworkShareMounter" = {
    enable = lib.mkEnableOption "Network Share Mounter";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "de.fau.rrze.NetworkShareMounter";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    autostart = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If set to true, the app will be launched on user-login.";
    };

    canChangeAutostart = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Optional. If set to false, the user can not change the Autostart option.";
    };

    enableAutoUpdater = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Turns the auto update framework on or off, so the App can update itself.";
    };

    helpURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = "https://www.anleitungen.rrze.fau.de/betriebssysteme/apple-macos-und-ios/macos/#networksharemounter";
      description = "Configure a help URL to help users interact with the application.";
    };

    unmountOnExit = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Configure a help URL to help users interact with the application.";
    };

    useNewDefaultLocation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "With version 3 the old default mount path (~/Netzlaufwerke/) is deprecated. New default is (/Volumes). This key allows administrators to adopt this default value ahead of the official release. This option is provided to ease the transition for administrators.";
    };

    location = lib.mkOption {
      type = types.nullOr (types.str);
      default = "";
      description = "Path where network shares will be mounted. Leave blank for the default value (highly recommended).";
    };

    cleanupLocationDirectory = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If set to true, the mount location will be cleaned up from obstructing files and directories. Please read the wiki before enabling this option and use it with caution!";
    };

    canQuit = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Show exit button in the menu bar.";
    };

    kerberosRealm = lib.mkOption {
      type = types.nullOr (types.str);
      default = "";
      description = "Kerberos/AD Domain for user authentication. If set, automatic AD/Kerberos authentication and ticket renewal will be enabled.";
    };

    managedNetworkShares = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          networkShare = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Example: smb://filer.your.domain.tld/share. Note: %USERNAME% will be replaced with the current user's login name.";
          };
          authType = lib.mkOption {
            type = types.nullOr (types.enum [ "krb" "password" "guest" ]);
            default = "krb";
            description = "Authentication type for the share, it can be either through Kerberos (krb) or using a username/password (auth). Default: Kerberos.";
          };
          username = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Optional: Predefine a username for authentication using username/password";
          };
          mountPoint = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Optional: Change the mount point name for the network share. Leave blank for the default value (recommended)";
          };
        };
      }));
      default = null;
      description = "Array with managed network shares.";
    };

    networkShares = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Array with all network shares. Example: smb://filer.your.domain/share. Note: %USERNAME% will be replaced with the login name of the current user.";
    };

  };
}