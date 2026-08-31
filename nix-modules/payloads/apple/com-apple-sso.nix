# Auto-generated from ProfileManifests: com.apple.sso.plist
# Domain: com.apple.sso
# Title: Single Sign-On
# Platforms: iOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Single Sign-On";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.sso";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
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
        default = [ "system" ];
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
        default = [ "Name" "Kerberos" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Name = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The human-readable name for the account.";
      };

      Kerberos = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            AppIdentifierMatches = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "The list of app identifiers that the system allows to use this login. If this field missing, the system matches all app identifiers with this login.\nDon't set an empty array. The array needs to contain strings that match App Bundle IDs. These strings can be exact matches such as 'com.mycompany.myapp', or they may specify a prefix match on the Bundle ID by using the '*' wildcard character. The wildcard character needs to appear after a period ('.'), and may only appear once, at the end of the string, for example, 'com.mycompany.*'. When you provide a wildcard, the system grants access to the account to any app with a Bundle ID that begins with the prefix.";
            };
            PrincipalName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The principal name. If not provided, the system prompts the user for one during profile installation. Required for MDM installation.";
            };
            Realm = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The properly capitalized realm name.";
            };
            URLPrefixMatches = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "The list of URL prefixes to match in order to use this account for Kerberos authentication over HTTP. If this key is missing, the system makes the account eligible to match all 'http://' and 'https://' URLs.\nBegin the URL matching patterns with either 'http://' or 'https://'. The system performs a simple string match, so the URL prefix 'http://www.apple.com/' doesn't match 'http://www.apple.com:80/'. However, if a matching pattern doesn't end in '/', the system automatically append a '/' to it.";
            };
          };
        });
        default = null;
        description = "The Kerberos dictionary.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-sso" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Single Sign-On (com.apple.sso) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}