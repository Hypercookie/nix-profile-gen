# Auto-generated from ProfileManifests: com.apple.sso.plist
# Domain: com.apple.sso
# Title: Single Sign-On
# Platforms: iOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-sso" = {
    enable = lib.mkEnableOption "Single Sign-On";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.sso";
      description = "The payload domain (PayloadType) for this manifest.";
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
            description = "The list of app identifiers that the system allows to use this login. If this field missing, the system matches all app identifiers with this login.\n\nDon't set an empty array. The array needs to contain strings that match App Bundle IDs. These strings can be exact matches such as 'com.mycompany.myapp', or they may specify a prefix match on the Bundle ID by using the '*' wildcard character. The wildcard character needs to appear after a period ('.'), and may only appear once, at the end of the string, for example, 'com.mycompany.*'. When you provide a wildcard, the system grants access to the account to any app with a Bundle ID that begins with the prefix.";
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
            description = "The list of URL prefixes to match in order to use this account for Kerberos authentication over HTTP. If this key is missing, the system makes the account eligible to match all 'http://' and 'https://' URLs.\n\nBegin the URL matching patterns with either 'http://' or 'https://'. The system performs a simple string match, so the URL prefix 'http://www.apple.com/' doesn't match 'http://www.apple.com:80/'. However, if a matching pattern doesn't end in '/', the system automatically append a '/' to it.";
          };
        };
      });
      default = null;
      description = "The Kerberos dictionary.";
    };

  };
}