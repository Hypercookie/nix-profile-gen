# Auto-generated from ProfileManifests: com.apple.cellularprivatenetwork.managed.plist
# Domain: com.apple.cellularprivatenetwork.managed
# Title: Cellular Private Network
# Platforms: iOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-cellularprivatenetwork-managed" = {
    enable = lib.mkEnableOption "Cellular Private Network";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.cellularprivatenetwork.managed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Geofences = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Longitude = lib.mkOption {
            type = types.nullOr (types.float);
            default = null;
            description = "The longitude of the geofence.";
          };
          Latitude = lib.mkOption {
            type = types.nullOr (types.float);
            default = null;
            description = "The latitude of the geofence.";
          };
          Radius = lib.mkOption {
            type = types.nullOr (types.float);
            default = null;
            description = "Specifies the radius of the geofence in meters. Set this value slightly greater than the private cellular network coverage area.";
          };
          GeofenceId = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A geofence identifier that's unique within a list of geofences.";
          };
        };
      }));
      default = null;
      description = "A list of up to 1000 geofences for private networks. Geofencing is only used on iPhone.";
    };

    DataSetName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The name of the private network configuration data set.";
    };

    VersionNumber = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The version number of this dataset that the system uses to track updates.";
    };

    CellularDataPreferred = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Set to 'true' to prefer this private network over Wi-Fi.";
    };

    EnableNRStandalone = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Set to 'true' if this private network is NR Standalone.";
    };

    NetworkIdentifier = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A string using the 3GPP \"Coordinated NID\" (option 1 or option 2) format (defined in 3GPP 31.102, Section 12.7.1). The device uses this value to match a SIM present on the device.\n\nAll combinations of 'NetworkIdentifier' and 'CsgNetworkIdentifier' must be unique across all profiles installed on the device.";
    };

    CsgNetworkIdentifier = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A string using the 3GPP \"CSG_ID\" format (defined in 3GPP 23.003, Section 4.7). The device uses this value to match a SIM present on the device.\n\nAll combinations of 'NetworkIdentifier' and 'CsgNetworkIdentifier' must be unique across all profiles installed on the device.";
    };

  };
}