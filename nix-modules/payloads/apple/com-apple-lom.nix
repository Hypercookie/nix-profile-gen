# Auto-generated from ProfileManifests: com.apple.lom.plist
# Domain: com.apple.lom
# Title: Lights Out Management (LOM)
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-lom" = {
    enable = lib.mkEnableOption "Lights Out Management (LOM)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.lom";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    ControllerCACertificateUUIDs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of payload UUIDs containing CA certificates that devices use to evaluate trust of controller certificates.\n\nThis key configures the device to accept the 'LOMDeviceRequestCommand' from MDM and then send it to the target device. This certificate must contain the Key Usage attributes of Digital Signature, Key Encipherment and Data Encipherment. As well as the Extended Key Usage attributes of Server Authentication and Client Authentication.";
    };

    ControllerCertificateUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The UUID certificate for the LOM controller. This key configures the device to accept the 'LOMDeviceRequestCommand' from MDM and then send it to the target device.";
    };

    DeviceCACertificateUUIDs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of payload UUIDs containing CA certificates that controllers use to evaluate trust of device certificates.";
    };

    DeviceCertificateUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The UUID certificate for the device. This key indicates the device can receive 'PowerON', 'PowerOFF', and 'Reset' requests from a LOM controller. This certificate must contain the Key Usage attributes of Digital Signature, Key Encipherment and Data Encipherment. As well as the Extended Key Usage attributes of Server Authentication and Client Authentication.";
    };

  };
}