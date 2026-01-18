# Auto-generated from ProfileManifests: com.apple.AIM.account.plist
# Domain: com.apple.AIM.account
# Title: AIM Account
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-AIM-account" = {
    enable = lib.mkEnableOption "AIM Account";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.AIM.account";
      description = "The payload domain (PayloadType) for this manifest.";
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
}