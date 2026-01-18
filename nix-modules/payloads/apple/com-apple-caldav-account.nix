# Auto-generated from ProfileManifests: com.apple.caldav.account.plist
# Domain: com.apple.caldav.account
# Title: Calendar
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-caldav-account" = {
    enable = lib.mkEnableOption "Calendar";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.caldav.account";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    CalDAVAccountDescription = lib.mkOption {
      type = types.nullOr (types.str);
      default = "My Calendar Account";
      description = "The description of the account.";
    };

    CalDAVHostName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The server's address.";
    };

    CalDAVPort = lib.mkOption {
      type = types.nullOr (types.int);
      default = 443;
      description = "The server's port.";
    };

    CalDAVPrincipalURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The base URL to the user's calendar.";
    };

    CalDAVUsername = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user name for logins. If this profile is part of a non-interactive install, the system requires this field.";
    };

    CalDAVPassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user's password. Only use this in encrypted profiles.";
    };

    CalDAVUseSSL = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'true', the system enables SSL.";
    };

    VPNUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The VPNUUID of the per-app VPN the account uses for network communication. Available in iOS 14 and later.";
    };

  };
}