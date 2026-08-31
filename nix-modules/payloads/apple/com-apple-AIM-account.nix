# Auto-generated from ProfileManifests: com.apple.AIM.account.plist
# Domain: com.apple.AIM.account
# Title: AIM Account
# Platforms: macOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "AIM Account";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.AIM.account";
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
        default = [ "AIMAccountDescription" "AIMUserName" "AIMPassword" "AIMAuthentication" "AIMHostName" "AIMPort" "AIMUseSSL" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AIMAccountDescription = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The description of the account.";
      };

      AIMUserName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The user's login name.";
      };

      AIMPassword = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The user's password.";
      };

      AIMAuthentication = lib.mkOption {
        type = types.nullOr (types.enum [ "AIMAuthPassword" ]);
        default = null;
        description = "The authentication method for the account.";
      };

      AIMHostName = lib.mkOption {
        type = types.nullOr (types.enum [ "slogin.oscar.aol.com" ]);
        default = null;
        description = "The server address.";
      };

      AIMPort = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The connection port for the server.";
      };

      AIMUseSSL = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables SSL.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-AIM-account" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "AIM Account (com.apple.AIM.account) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}