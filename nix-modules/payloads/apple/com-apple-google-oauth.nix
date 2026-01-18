# Auto-generated from ProfileManifests: com.apple.google-oauth.plist
# Domain: com.apple.google-oauth
# Title: Google Account
# Platforms: iOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-google-oauth" = {
    enable = lib.mkEnableOption "Google Account";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.google-oauth";
      description = "The payload domain (PayloadType) for this manifest.";
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
}