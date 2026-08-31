# Auto-generated from ProfileManifests: com.apple.caldav.account.plist
# Domain: com.apple.caldav.account
# Title: Calendar
# Platforms: iOS, macOS
# Unique: no
# Targets: user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Calendar";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.caldav.account";
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
        default = [ "CalDAVAccountDescription" "CalDAVHostName" "CalDAVPort" "CalDAVPrincipalURL" "CalDAVUsername" "CalDAVPassword" "CalDAVUseSSL" "VPNUUID" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      CalDAVAccountDescription = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The description of the account.";
      };

      CalDAVHostName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The server's address.";
      };

      CalDAVPort = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
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
  options.programs.macprofile.payloads."apple-com-apple-caldav-account" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Calendar (com.apple.caldav.account) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}