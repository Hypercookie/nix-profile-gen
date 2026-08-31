# Auto-generated from ProfileManifests: com.apple.ldap.account.plist
# Domain: com.apple.ldap.account
# Title: LDAP
# Platforms: iOS, macOS
# Unique: no
# Targets: user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "LDAP";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.ldap.account";
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
        default = [ "LDAPAccountDescription" "LDAPAccountUserName" "LDAPAccountPassword" "LDAPAccountHostName" "LDAPAccountUseSSL" "LDAPSearchSettings" "VPNUUID" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      LDAPAccountDescription = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The description of the account.";
      };

      LDAPAccountUserName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The user's user name.";
      };

      LDAPAccountPassword = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The user's password. Only use this in encrypted profiles.";
      };

      LDAPAccountHostName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The server's address.";
      };

      LDAPAccountUseSSL = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system enables SSL.";
      };

      LDAPSearchSettings = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            LDAPSearchSettingDescription = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The description of this search setting.";
            };
            LDAPSearchSettingScope = lib.mkOption {
              type = types.nullOr (types.enum [ "LDAPSearchSettingScopeBase" "LDAPSearchSettingScopeOneLevel" "LDAPSearchSettingScopeSubtree" ]);
              default = null;
              description = "The type of recursion to use in the search:\n'LDAPSearchSettingScopeBase': The search uses only the immediate node that the search base points to.\n'LDAPSearchSettingScopeOneLevel': The search uses the node plus its immediate children.\n'LDAPSearchSettingScopeSubtree': The search uses the node plus all children, regardless of depth.";
            };
            LDAPSearchSettingSearchBase = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The path to the node where a search should start.";
            };
          };
        }));
        default = null;
        description = "An array of search settings dictionaries.";
      };

      VPNUUID = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The VPNUUID of the per-app VPN the account uses for network communication. Available in iOS 14 and later.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-ldap-account" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "LDAP (com.apple.ldap.account) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}