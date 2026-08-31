# Auto-generated from ProfileManifests: com.apple.osxserver.account.plist
# Domain: com.apple.osxserver.account
# Title: macOS Server Account
# Platforms: iOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "macOS Server Account";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.osxserver.account";
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
        default = [ "AccountDescription" "HostName" "UserName" "Password" "ConfiguredAccounts" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AccountDescription = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The description of the account.";
      };

      HostName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The server's address.";
      };

      UserName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The user's user name.";
      };

      Password = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The user's password.";
      };

      ConfiguredAccounts = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            Type = lib.mkOption {
              type = types.nullOr (types.enum [ "com.apple.osxserver.documents" ]);
              default = null;
              description = "com.apple.osxserver.documents (the Documents account type).";
            };
            Port = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "Designates the port number to use when contacting the server. If no port number is specified, the default port is used.";
            };
          };
        }));
        default = null;
        description = "An array of dictionaries containing configured account types and relevant settings";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-osxserver-account" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "macOS Server Account (com.apple.osxserver.account) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}