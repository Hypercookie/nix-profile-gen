# Auto-generated from ProfileManifests: com.apple.jabber.account.plist
# Domain: com.apple.jabber.account
# Title: Jabber Account
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-jabber-account" = {
    enable = lib.mkEnableOption "Jabber Account";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.jabber.account";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    JabberAccountDescription = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The description of the account.";
    };

    JabberUserName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user's user name.";
    };

    JabberPassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user's password.";
    };

    JabberAuthentication = lib.mkOption {
      type = types.nullOr (types.enum [ "JabberAuthPassword" "JabberAuthKerberos" ]);
      default = null;
      description = "The authentication method for the account.";
    };

    JabberHostName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The server's address.";
    };

    JabberPort = lib.mkOption {
      type = types.nullOr (types.int);
      default = 5222;
      description = "The server's port.";
    };

    JabberUseSSL = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', enables SSL.";
    };

  };
}