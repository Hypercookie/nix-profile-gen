# Auto-generated from ProfileManifests: com.apple.xsan.plist
# Domain: com.apple.xsan
# Title: Xsan
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-xsan" = {
    enable = lib.mkEnableOption "Xsan";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.xsan";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    sanName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The name of the SAN. This key is required for all Xsan SANs. The name must exactly match the name of the SAN defined in the metadata server.";
    };

    fsnameservers = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of storage area network (SAN) File System Name Server coordinators. The list should contain the same addresses in the same order as the metadata controller (MDC) '/Library/Preferences/Xsan/fsnameservers' file.\n\nThis key is required for StorNext SANs.";
    };

    sanAuthMethod = lib.mkOption {
      type = types.nullOr (types.enum [ "auth_secret" ]);
      default = null;
      description = "The authentication method for the SAN. This key is required for all Xsan SANs. It's optional for StorNext SANs but should be set if the StorNext SAN uses an 'auth_secret' file.\n\n\n\nOnly one value is accepted: 'auth_secret'";
    };

    sharedSecret = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The shared secret used for Xsan network authentication. This key is required when the 'sanAuthMethod' key is present. The value should equal the content of the MDC's '/Library/Preferences/Xsan/.auth_secret' file.";
    };

    sanConfigURLs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of LDAP URLs where Xsan systems can obtain SAN configuration updates. There should be one entry for each Xsan MDC.\n\nThis key is required for all Xsan SANs.\n\nExample URL: 'ldaps://mdc1.example.com:389'.";
    };

  };
}