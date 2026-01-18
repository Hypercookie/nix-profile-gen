# Auto-generated from ProfileManifests: com.apple.cellular.plist
# Domain: com.apple.cellular
# Title: Cellular
# Platforms: iOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-cellular" = {
    enable = lib.mkEnableOption "Cellular";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.cellular";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    APNs = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The name for this configuration.";
          };
          AuthenticationType = lib.mkOption {
            type = types.nullOr (types.enum [ "CHAP" "PAP" ]);
            default = null;
            description = "The authentication type for logging in.";
          };
          Username = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The user name for the APN.";
          };
          Password = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The user's password for the APN.";
          };
          ProxyServer = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The proxy server's address.";
          };
          ProxyPort = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The proxy server's port number.";
          };
          DefaultProtocolMask = lib.mkOption {
            type = types.nullOr (types.enum [ 1 2 3 ]);
            default = null;
            description = "The default Internet Protocol versions. Available in iOS 10.3 but no longer used in iOS 11 and later. Allowed values:\n\n- '1': IPv4\n- '2': IPv6\n- '3': Both";
          };
          AllowedProtocolMask = lib.mkOption {
            type = types.nullOr (types.enum [ 1 2 3 ]);
            default = null;
            description = "The Internet Protocol versions that the system supports. Available in iOS 10.3 and later. Allowed values:\n\n- '1': IPv4\n- '2': IPv6\n- '3': Both";
          };
          AllowedProtocolMaskInRoaming = lib.mkOption {
            type = types.nullOr (types.enum [ 1 2 3 ]);
            default = null;
            description = "The Internet Protocol versions that the system supports while roaming. Available in iOS 10.3 and later. Allowed values:\n\n- '1': IPv4\n- '2': IPv6\n- '3': Both";
          };
          AllowedProtocolMaskInDomesticRoaming = lib.mkOption {
            type = types.nullOr (types.enum [ 1 2 3 ]);
            default = null;
            description = "The Internet Protocol versions that the system supports while roaming. Available in iOS 10.3 and later. Allowed values:\n\n- '1': IPv4\n- '2': IPv6\n- '3': Both";
          };
          EnableXLAT464 = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If 'true', the system enables XLAT464. Available in iOS 16 and later and watchOS 9 and later.";
          };
        };
      }));
      default = null;
      description = "An array of access point name (APN) dictionaries.";
    };

    AttachAPN = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The name for this configuration.";
          };
          AuthenticationType = lib.mkOption {
            type = types.nullOr (types.enum [ "CHAP" "PAP" ]);
            default = null;
            description = "The authentication type.";
          };
          Username = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The user name.";
          };
          Password = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The password for the user.";
          };
          AllowedProtocolMask = lib.mkOption {
            type = types.nullOr (types.enum [ 1 2 3 ]);
            default = null;
            description = "The Internet Protocol versions that the system supports. Allowed values:\n\n- '1': IPv4\n- '2': IPv6\n- '3': Both";
          };
        };
      });
      default = null;
      description = "A configuration dictionary.";
    };

  };
}