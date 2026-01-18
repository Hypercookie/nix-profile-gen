# Auto-generated from ProfileManifests: com.apple.thirdactiveethernet.managed.plist
# Domain: com.apple.thirdactiveethernet.managed
# Title: 802.1X Ethernet: Third Active
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-thirdactiveethernet-managed" = {
    enable = lib.mkEnableOption "802.1X Ethernet: Third Active";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.thirdactiveethernet.managed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    SetupModes = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "System" "Loginwindow" ]));
      default = null;
      description = "Select \"Login Window\" to authenticate the Mac to the network when the user logs in.";
    };

    EAPClientConfiguration = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          AcceptEAPTypes = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ 13 17 21 25 43 18 23 ]));
            default = null;
            description = "The EAP types accepted.";
          };
          UserName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Username. If not provided, the user may be prompted during login.";
          };
          UserPassword = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Password. If not provided, the user may be prompted during login.";
          };
          OneTimeUserPassword = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "If set, the user will be prompted for a password each time they connect to the network.";
          };
          TLSTrustedServerNames = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Certificate Common Names expected from authentication server. The wildcard * can be used to match a range of strings.";
          };
          TLSAllowTrustExceptions = lib.mkOption {
            type = types.nullOr (types.bool);
            default = true;
            description = "Allows a dynamic trust decision by the user.";
          };
          TTLSInnerAuthentication = lib.mkOption {
            type = types.nullOr (types.enum [ "PAP" "EAP" "CHAP" "MSCHAP" "MSCHAPv2" ]);
            default = "MSCHAPv2";
            description = "Specifies the inner authentication used by the TTLS module.";
          };
          OuterIdentity = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Externally visible identification (for TTLS, PEAP, and EAP-FAST). This string is used instead of the user's identity outside the encrypted tunnel. This value can be used to mask the true identity of the person using the network.";
          };
          TLSMinimumVersion = lib.mkOption {
            type = types.nullOr (types.enum [ "1.0" "1.1" "1.2" "1.3" ]);
            default = "1.0";
            description = "TLS Minimum Version";
          };
          TLSMaximumVersion = lib.mkOption {
            type = types.nullOr (types.enum [ "1.0" "1.1" "1.2" "1.3" ]);
            default = "1.2";
            description = "TLS Maximum Version";
          };
          EAPFASTUsePAC = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "If set, the device will use an existing PAC if it's present. Otherwise the server must present its identity using a certificate.";
          };
          EAPFASTProvisionPAC = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "If set, allows PAC provisioning.";
          };
          EAPFASTProvisionPACAnonymously = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "If set, provisions the device anonymously. Note that there are known man-in-the-middle attacks for anonymous provisioning.";
          };
          EAPSIMNumberOfRANDs = lib.mkOption {
            type = types.nullOr (types.enum [ 2 3 ]);
            default = 3;
            description = "The minimum number of RAND values accepted from the server. 3 is the default, and 2 is allowed, but offers less security.";
          };
          SystemModeCredentialsSource = lib.mkOption {
            type = types.nullOr (types.enum [ "ActiveDirectory" ]);
            default = null;
            description = "Use an alternate set of credentials when in System mode (AKA not a loginwindow profile). This can be used to tell EAPOLClient to use the computer password in a bound active directory scenario for authentication.";
          };
          SystemModeUseOpenDirectoryCredentials = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "This indicates if the connection should try to use the OpenDirectory machine credentials.";
          };
          TLSTrustedCertificates = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "An array of trusted certificates. Each entry in the array must contain certificate data that represents an anchor certificate used for verifying the server certificate.";
          };
          TLSCertificateIsRequired = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If 'true', allows for two-factor authentication for EAP-TTLS, PEAP, or EAP-FAST. If 'false', allows for zero-factor authentication for EAP-TLS.\nIf you don't specify a value, the default is 'true' for EAP-TLS, and 'false' for other EAP types.";
          };
        };
      });
      default = null;
      description = "Specifies 802.1x EAP authentication parameters.";
    };

    Interface = lib.mkOption {
      type = types.nullOr (types.enum [ "ThirdActiveEthernet" ]);
      default = null;
      description = "The wired interface to use";
    };

  };
}