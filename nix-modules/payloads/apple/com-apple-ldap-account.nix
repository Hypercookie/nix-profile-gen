# Auto-generated from ProfileManifests: com.apple.ldap.account.plist
# Domain: com.apple.ldap.account
# Title: LDAP
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-ldap-account" = {
    enable = lib.mkEnableOption "LDAP";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.ldap.account";
      description = "The payload domain (PayloadType) for this manifest.";
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
      default = true;
      description = "If 'true', the system enables SSL.";
    };

    LDAPSearchSettings = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          LDAPSearchSettingDescription = lib.mkOption {
            type = types.nullOr (types.str);
            default = "My Search";
            description = "The description of this search setting.";
          };
          LDAPSearchSettingScope = lib.mkOption {
            type = types.nullOr (types.enum [ "LDAPSearchSettingScopeBase" "LDAPSearchSettingScopeOneLevel" "LDAPSearchSettingScopeSubtree" ]);
            default = "LDAPSearchSettingScopeSubtree";
            description = "The type of recursion to use in the search:\n\n- 'LDAPSearchSettingScopeBase': The search uses only the immediate node that the search base points to.\n- 'LDAPSearchSettingScopeOneLevel': The search uses the node plus its immediate children.\n- 'LDAPSearchSettingScopeSubtree': The search uses the node plus all children, regardless of depth.";
          };
          LDAPSearchSettingSearchBase = lib.mkOption {
            type = types.nullOr (types.str);
            default = "o=My Company,ou=My Department";
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
}