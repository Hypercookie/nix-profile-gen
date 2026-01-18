# Auto-generated from ProfileManifests: com.apple.security.firewall.plist
# Domain: com.apple.security.firewall
# Title: Firewall
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-security-firewall" = {
    enable = lib.mkEnableOption "Firewall";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.security.firewall";
      description = "The payload domain (PayloadType) for this manifest.";
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
      description = "If 'true', the system allows built-in software to receive incoming connections. Available in macOS 12.3 and later.\n\nNote:\nThe system ensures that 'AllowSigned' always has a value. If missing from the payload, the system sets it to 'true'.";
    };

    AllowSignedApp = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system allows downloaded signed software to receive incoming connections. Available in macOS 12.3 and later.\n\nNote:\nThe system ensures that 'AllowSignedApp' always has a value. If missing from the payload, the system sets it to 'true'.";
    };

  };
}