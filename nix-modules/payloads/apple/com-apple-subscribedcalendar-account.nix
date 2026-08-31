# Auto-generated from ProfileManifests: com.apple.subscribedcalendar.account.plist
# Domain: com.apple.subscribedcalendar.account
# Title: Subscribed Calendars
# Platforms: iOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Subscribed Calendars";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.subscribedcalendar.account";
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
        default = [ "SubCalAccountDescription" "SubCalAccountHostName" "SubCalAccountUsername" "SubCalAccountPassword" "SubCalAccountUseSSL" "VPNUUID" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      SubCalAccountDescription = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
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
        default = null;
        description = "If 'true', the system enables SSL.";
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
  options.programs.macprofile.payloads."apple-com-apple-subscribedcalendar-account" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Subscribed Calendars (com.apple.subscribedcalendar.account) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}