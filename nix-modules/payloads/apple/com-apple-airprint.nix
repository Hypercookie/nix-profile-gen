# Auto-generated from ProfileManifests: com.apple.airprint.plist
# Domain: com.apple.airprint
# Title: AirPrint
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-airprint" = {
    enable = lib.mkEnableOption "AirPrint";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.airprint";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AirPrint = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          IPAddress = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The IP address or hostname of the AirPrint destination.";
          };
          Port = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The listening port of the AirPrint destination. Available only in iOS 11 and later.";
          };
          ResourcePath = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The resource path associated with the printer. This path corresponds to the 'rp' parameter of the '_ipps.tcp' Bonjour record. For example:\n\n- 'printers/Canon_MG5300_series'\n- 'printers/Xerox_Phaser_7600'\n- 'ipp/print'\n- 'Epson_IPP_Printer'";
          };
          ForceTLS = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "If 'true', AirPrint connections are secured by Transport Layer Security (TLS). Available only in iOS 11 and later.";
          };
        };
      }));
      default = null;
      description = "An array of AirPrint printers that are presented to the user.";
    };

  };
}