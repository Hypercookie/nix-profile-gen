# Auto-generated from ProfileManifests: com.apple.google-oauth.plist
# Domain: com.apple.google-oauth
# Title: Google Account
# Platforms: iOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Google Account";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.google-oauth";
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
        default = [ "AccountDescription" "AccountName" "EmailAddress" "CommunicationServiceRules" "VPNUUID" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AccountDescription = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "A user-visible description of the Google account, shown in the Mail and Settings apps.";
      };

      AccountName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The user's full name for the Google account. This name appears in sent messages.";
      };

      EmailAddress = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The full Google email address for the account.";
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
              description = "A dictionary that defines which app to use for audio calls from this account.";
            };
          };
        });
        default = null;
        description = "The communication service handler rules for this account.";
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
  options.programs.macprofile.payloads."apple-com-apple-google-oauth" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Google Account (com.apple.google-oauth) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}