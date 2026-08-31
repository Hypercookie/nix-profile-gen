# Auto-generated from ProfileManifests: com.apple.tvremote.plist
# Domain: com.apple.tvremote
# Title: TV Remote
# Platforms: iOS, tvOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "TV Remote";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.tvremote";
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
        default = [ "AllowedRemotes" "AllowedTVs" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AllowedRemotes = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            RemoteDeviceID = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The MAC address of a permitted iOS device that can control this Apple TV. Use the format 'xx:xx:xx:xx:xx:xx', which isn't case-sensitive.";
            };
          };
        }));
        default = null;
        description = "The array of valid devices that Apple TV can connect to.";
      };

      AllowedTVs = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            TVDeviceID = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The MAC address of an Apple TV device that the system permits this iOS device to control. Use the format 'xx:xx:xx:xx:xx:xx', which isn't case-sensitive.";
            };
            TVDeviceName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The name of an Apple TV device that the system permits this iOS device to control.";
            };
          };
        }));
        default = null;
        description = "The array of valid Apple TV identifiers that the remote can connect to.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-tvremote" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "TV Remote (com.apple.tvremote) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}