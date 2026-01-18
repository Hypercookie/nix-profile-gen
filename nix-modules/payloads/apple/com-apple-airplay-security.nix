# Auto-generated from ProfileManifests: com.apple.airplay.security.plist
# Domain: com.apple.airplay.security
# Title: AirPlay Security
# Platforms: tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-airplay-security" = {
    enable = lib.mkEnableOption "AirPlay Security";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.airplay.security";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AccessType = lib.mkOption {
      type = types.nullOr (types.enum [ "ANY" "WIFI_ONLY" ]);
      default = null;
      description = "The access policy for AirPlay.\n\n'ANY' allows connections from both Ethernet, Wi-Fi, and Apple Wireless Direct Link.\n\n'WIFI_ONLY' allows connections only from devices on the same Ethernet or Wi-Fi network as Apple TV.";
    };

    SecurityType = lib.mkOption {
      type = types.nullOr (types.enum [ "NONE" "PASSCODE_ONCE" "PASSCODE_ALWAYS" "PASSWORD" ]);
      default = null;
      description = "The security policy for AirPlay. Allowed values:\n\n- 'PASSCODE_ONCE': Requires an onscreen passcode on first connection from a device. Subsequent connections from the same device aren't prompted.\n- 'PASSCODE_ALWAYS': Requires an onscreen passcode for every AirPlay connection. After an AirPlay connection ends, the system allows reconnecting within 30 seconds without a password.\n- 'PASSWORD': Requires the passphrase set for 'Password'.\n\nNote:\n'NONE' was deprecated in tvOS 11.3. Existing profiles that use 'NONE' get the 'PASSWORD_ONCE' behavior.";
    };

    Password = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The AirPlay password; required if 'SecurityType' is 'PASSWORD'.";
    };

  };
}