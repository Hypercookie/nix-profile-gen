# Auto-generated from ProfileManifests: com.apple.MCX-TimeServer.plist
# Domain: com.apple.MCX
# Title: Time Server
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-MCX-TimeServer" = {
    enable = lib.mkEnableOption "Time Server";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.MCX";
      description = "The payload domain (PayloadType) for this manifest.";
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
}