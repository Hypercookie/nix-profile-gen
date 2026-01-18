# Auto-generated from ProfileManifests: com.apple.subscribedcalendar.account.plist
# Domain: com.apple.subscribedcalendar.account
# Title: Subscribed Calendars
# Platforms: iOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-subscribedcalendar-account" = {
    enable = lib.mkEnableOption "Subscribed Calendars";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.subscribedcalendar.account";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    SubCalAccountDescription = lib.mkOption {
      type = types.nullOr (types.str);
      default = "My Subscribed Calendar";
      description = "The description of the account.";
    };

    SubCalAccountHostName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The server's address.";
    };

    SubCalAccountUsername = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user's user name.";
    };

    SubCalAccountPassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user's password.";
    };

    SubCalAccountUseSSL = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables SSL.";
    };

    VPNUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The VPNUUID of the per-app VPN the account uses for network communication. Available in iOS 14 and later.";
    };

  };
}