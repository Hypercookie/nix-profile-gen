# Auto-generated from ProfileManifests: com.apple.airplay.security.plist
# Domain: com.apple.airplay.security
# Title: AirPlay Security
# Platforms: tvOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "AirPlay Security";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.airplay.security";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "AccessType" "SecurityType" "Password" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AccessType = lib.mkOption {
        type = types.nullOr (types.enum [ "ANY" "WIFI_ONLY" ]);
        default = null;
        description = "The access policy for AirPlay.\n'ANY' allows connections from both Ethernet, Wi-Fi, and Apple Wireless Direct Link.\n'WIFI_ONLY' allows connections only from devices on the same Ethernet or Wi-Fi network as Apple TV.";
      };

      SecurityType = lib.mkOption {
        type = types.nullOr (types.enum [ "NONE" "PASSCODE_ONCE" "PASSCODE_ALWAYS" "PASSWORD" ]);
        default = null;
        description = "The security policy for AirPlay. Allowed values:\n'PASSCODE_ONCE': Requires an onscreen passcode on first connection from a device. Subsequent connections from the same device aren't prompted.\n'PASSCODE_ALWAYS': Requires an onscreen passcode for every AirPlay connection. After an AirPlay connection ends, the system allows reconnecting within 30 seconds without a password.\n'PASSWORD': Requires the passphrase set for 'Password'.\nNote: 'NONE' was deprecated in tvOS 11.3. Existing profiles that use 'NONE' get the 'PASSWORD_ONCE' behavior.";
      };

      Password = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The AirPlay password; required if 'SecurityType' is 'PASSWORD'.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-airplay-security" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "AirPlay Security (com.apple.airplay.security) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}