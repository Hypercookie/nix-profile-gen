# Auto-generated from ProfileManifests: com.apple.carddav.account.plist
# Domain: com.apple.carddav.account
# Title: Contacts
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-carddav-account" = {
    enable = lib.mkEnableOption "Contacts";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.carddav.account";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    CardDAVAccountDescription = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The description of the account.";
    };

    CardDAVHostName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The server's address.";
    };

    CardDAVPort = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The server's port.";
    };

    CardDAVPrincipalURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The base URL to the user's address book.";
    };

    CardDAVUsername = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user name for logins.";
    };

    CardDAVPassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user's password. Only use this in encrypted profiles.";
    };

    CardDAVUseSSL = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables SSL.";
    };

    CommunicationServiceRules = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          DefaultServiceHandlers = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                AudioCall = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle identifier for the default application that handles audio calls to contacts from this account.";
                };
              };
            });
            default = null;
            description = "A dictionary of service handlers for contacts from this account.";
          };
        };
      });
      default = null;
      description = "An array of communication service rules for this account.";
    };

    VPNUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The VPNUUID of the per-app VPN the account uses for network communication. Available in iOS 14 and later.";
    };

  };
}