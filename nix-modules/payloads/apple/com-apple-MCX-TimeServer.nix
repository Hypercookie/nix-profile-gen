# Auto-generated from ProfileManifests: com.apple.MCX-TimeServer.plist
# Domain: com.apple.MCX
# Title: Time Server
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Time Server";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.MCX";
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
        default = [ "timeServer" "timeZone" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      timeServer = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The NTP server to connect to. In macOS 10.13 and later, only one time server is supported.";
      };

      timeZone = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The time zone path location string in '/usr/share/zoneinfo/'; for example, 'America/Denver' or 'Zulu'.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-MCX-TimeServer" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Time Server (com.apple.MCX) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}