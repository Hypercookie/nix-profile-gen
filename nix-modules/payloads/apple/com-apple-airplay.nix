# Auto-generated from ProfileManifests: com.apple.airplay.plist
# Domain: com.apple.airplay
# Title: AirPlay
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-airplay" = {
    enable = lib.mkEnableOption "AirPlay";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.airplay";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AllowList = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          DeviceID = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The device ID of the AirPlay destination in the format 'xx:xx:xx:xx:xx:xx'. This field isn't case-sensitive.\n\nThe system limits the list of visible AirPlay destinations to devices that are present in the 'AllowList' field of all installed AirPlay payloads.\n\nSpecifying the same MACAddress more than once, whether in the same payload across different payloads, results in undefined behavior.\n\nAs of tvOS 18, 'DeviceID' isn't supported.";
          };
          DeviceName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The name of the AirPlay device.\n\nThe system limits the list of visible AirPlay destinations to devices that are present in the 'AllowList' field of all installed AirPlay payloads.";
          };
        };
      }));
      default = null;
      description = "If present, only AirPlay destinations in this list are available to the device. This allow list applies to supervised devices.";
    };

    Whitelist = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          DeviceID = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The device ID of the AirPlay destination in the format 'xx:xx:xx:xx:xx:xx'. This field isn't case-sensitive.\n\nThe system limits the list of visible AirPlay destinations to devices that are present in the 'AllowList' field of all installed AirPlay payloads.\n\nSpecifying the same MACAddress more than once, whether in the same payload across different payloads, results in undefined behavior.\n\nAs of tvOS 18, 'DeviceID' isn't supported.";
          };
          DeviceName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The name of the AirPlay device.\n\nThe system limits the list of visible AirPlay destinations to devices that are present in the 'AllowList' field of all installed AirPlay payloads.";
          };
        };
      }));
      default = null;
      description = "Use 'AllowList' instead. This key is deprecated in iOS 14.5 and macOS 11.3.";
    };

    Passwords = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          DeviceName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The name of the AirPlay destination; used in iOS, and available in macOS 15 and later.";
          };
          DeviceID = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The device ID of the AirPlay destination; used in macOS.\n\nDeprecated in macOS 15 and later as tvOS 18 AirPlay destinations don't support it; use 'DeviceName' instead.";
          };
          Password = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The password for the AirPlay destination.";
          };
        };
      }));
      default = null;
      description = "If present, sets passwords for known AirPlay destinations. Using multiple entries for the same destination, whether within the same payload or across multiple installed payloads, is an error and results in undefined behavior.";
    };

  };
}