# Auto-generated from ProfileManifests: com.apple.airplay.plist
# Domain: com.apple.airplay
# Title: AirPlay
# Platforms: iOS, macOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "AirPlay";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.airplay";
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
        default = [ "system" "user" ];
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
        default = [ "AllowList" "Whitelist" "Passwords" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AllowList = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            DeviceID = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The device ID of the AirPlay destination in the format 'xx:xx:xx:xx:xx:xx'. This field isn't case-sensitive.\nThe system limits the list of visible AirPlay destinations to devices that are present in the 'AllowList' field of all installed AirPlay payloads.\nSpecifying the same MACAddress more than once, whether in the same payload across different payloads, results in undefined behavior.\nAs of tvOS 18, 'DeviceID' isn't supported.";
            };
            DeviceName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The name of the AirPlay device.\nThe system limits the list of visible AirPlay destinations to devices that are present in the 'AllowList' field of all installed AirPlay payloads.";
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
              description = "The device ID of the AirPlay destination in the format 'xx:xx:xx:xx:xx:xx'. This field isn't case-sensitive.\nThe system limits the list of visible AirPlay destinations to devices that are present in the 'AllowList' field of all installed AirPlay payloads.\nSpecifying the same MACAddress more than once, whether in the same payload across different payloads, results in undefined behavior.\nAs of tvOS 18, 'DeviceID' isn't supported.";
            };
            DeviceName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The name of the AirPlay device.\nThe system limits the list of visible AirPlay destinations to devices that are present in the 'AllowList' field of all installed AirPlay payloads.";
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
              description = "The device ID of the AirPlay destination; used in macOS.\nDeprecated in macOS 15 and later as tvOS 18 AirPlay destinations don't support it; use 'DeviceName' instead.";
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
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-airplay" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "AirPlay (com.apple.airplay) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}