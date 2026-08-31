# Auto-generated from ProfileManifests: com.apple.jabber.account.plist
# Domain: com.apple.jabber.account
# Title: Jabber Account
# Platforms: macOS
# Unique: no
# Targets: user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Jabber Account";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.jabber.account";
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

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "user" ];
        description = "Profile scopes this payload may be installed into (pfm_targets).";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "JabberAccountDescription" "JabberUserName" "JabberPassword" "JabberAuthentication" "JabberHostName" "JabberPort" "JabberUseSSL" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
        default = null;
        description = "The server's port.";
      };

      JabberUseSSL = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables SSL.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-jabber-account" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Jabber Account (com.apple.jabber.account) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}