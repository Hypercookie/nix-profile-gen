# Auto-generated from ProfileManifests: com.apple.tvremote.plist
# Domain: com.apple.tvremote
# Title: TV Remote
# Platforms: iOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-tvremote" = {
    enable = lib.mkEnableOption "TV Remote";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.tvremote";
      description = "The payload domain (PayloadType) for this manifest.";
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
}