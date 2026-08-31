# Auto-generated from ProfileManifests: com.apple.security.firewall.plist
# Domain: com.apple.security.firewall
# Title: Firewall
# Platforms: macOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Firewall";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.security.firewall";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "EnableFirewall" "BlockAllIncoming" "EnableStealthMode" "Applications" "EnableLogging" "LoggingOption" "AllowSigned" "AllowSignedApp" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      EnableFirewall = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system enables the firewall.";
      };

      BlockAllIncoming = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system enables blocking all incoming connections.";
      };

      EnableStealthMode = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system enables stealth mode.";
      };

      Applications = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            BundleID = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The bundle identifier for the app.";
            };
            Name = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Name of application (Undocumented)";
            };
            Allowed = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the system allows connections for the app.";
            };
          };
        }));
        default = null;
        description = "The list of apps with connections that the firewall controls.";
      };

      EnableLogging = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system enables logging. Available in macOS 12 through macOS 14.6.";
      };

      LoggingOption = lib.mkOption {
        type = types.nullOr (types.enum [ "throttled" "brief" "detail" ]);
        default = null;
        description = "The type of logging. Available in macOS 12 and through macOS 14.6.";
      };

      AllowSigned = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system allows built-in software to receive incoming connections. Available in macOS 12.3 and later.\nNote: The system ensures that 'AllowSigned' always has a value. If missing from the payload, the system sets it to 'true'.";
      };

      AllowSignedApp = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system allows downloaded signed software to receive incoming connections. Available in macOS 12.3 and later.\nNote: The system ensures that 'AllowSignedApp' always has a value. If missing from the payload, the system sets it to 'true'.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-security-firewall" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Firewall (com.apple.security.firewall) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}