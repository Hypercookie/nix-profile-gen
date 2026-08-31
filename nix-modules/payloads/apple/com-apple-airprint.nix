# Auto-generated from ProfileManifests: com.apple.airprint.plist
# Domain: com.apple.airprint
# Title: AirPrint
# Platforms: iOS, macOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "AirPrint";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.airprint";
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
        default = [ "AirPrint" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
              description = "The resource path associated with the printer. This path corresponds to the 'rp' parameter of the '_ipps.tcp' Bonjour record. For example:\n'printers/Canon_MG5300_series'\n'printers/Xerox_Phaser_7600'\n'ipp/print'\n'Epson_IPP_Printer'";
            };
            ForceTLS = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', AirPrint connections are secured by Transport Layer Security (TLS). Available only in iOS 11 and later.";
            };
          };
        }));
        default = null;
        description = "An array of AirPrint printers that are presented to the user.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-airprint" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "AirPrint (com.apple.airprint) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}