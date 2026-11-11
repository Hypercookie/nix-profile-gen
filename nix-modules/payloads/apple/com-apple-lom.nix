# Auto-generated from ProfileManifests: com.apple.lom.plist
# Domain: com.apple.lom
# Title: Lights Out Management (LOM)
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Lights Out Management (LOM)";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.lom";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
        description = "Whether only one instance of this payload is allowed per profile.";
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

      _platforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "macOS" ];
        description = "Supported Apple platforms (pfm_platforms).";
      };

      _keyPlatforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.attrs;
        default = [ ];
        description = "Keys restricted to a subset of the manifest's platforms (key-level pfm_platforms).";
      };

      _allowUnsupportedPlatform = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Emit this instance even if its manifest says the target platform does not support it or some of its keys. Produces a warning instead of an error.";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "ControllerCACertificateUUIDs" "ControllerCertificateUUID" "DeviceCACertificateUUIDs" "DeviceCertificateUUID" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      ControllerCACertificateUUIDs = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of payload UUIDs containing CA certificates that devices use to evaluate trust of controller certificates.\nThis key configures the device to accept the 'LOMDeviceRequestCommand' from MDM and then send it to the target device. This certificate must contain the Key Usage attributes of Digital Signature, Key Encipherment and Data Encipherment. As well as the Extended Key Usage attributes of Server Authentication and Client Authentication.";
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
  };
in
{
  options.payloads."apple-com-apple-lom" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Lights Out Management (LOM) (com.apple.lom) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}