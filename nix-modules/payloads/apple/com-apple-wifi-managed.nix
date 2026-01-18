# Auto-generated from ProfileManifests: com.apple.wifi.managed.plist
# Domain: com.apple.wifi.managed
# Title: Wi-Fi
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-wifi-managed" = {
    enable = lib.mkEnableOption "Wi-Fi";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.wifi.managed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_InterfaceSelector = lib.mkOption {
      type = types.nullOr (types.enum [ "BuiltInWireless" "Hotspot" "Hotspot2" ]);
      default = null;
      description = "Type of network interface on the device.";
    };

    IsHotspot = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the device treats the network as a hotspot.";
    };

    SSID_STR = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The SSID of the Wi-Fi network to use. In iOS 7.0 and later, the SSID is optional if a value exists for 'DomainName' value.";
    };

    HIDDEN_NETWORK = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', defines this network as hidden.";
    };

    AutoJoin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'true', the device joins the network automatically.\n\nIf 'false', the user must tap the network name to join it.";
    };

    CaptiveBypass = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system bypasses Captive Network detection when the device connects to the network.";
    };

    DisableAssociationMACRandomization = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true,' disables MAC address randomization for a Wi-Fi network while associated with that network. This feature also shows a privacy warning in Settings indicating that the network has reduced privacy protections.\n\nIf 'false', then the system enables MAC address randomization on iOS, watchOS, and visionOS.\n\nThis value is only locked when MDM installs the profile. If the profile is manually installed, the system sets the value but the user can change it.";
    };

    EnableIPv6 = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'true', enables IPv6 on this interface.";
    };

    ProxyType = lib.mkOption {
      type = types.nullOr (types.enum [ "None" "Manual" "Auto" ]);
      default = "None";
      description = "The proxy type, if any, to use. If you choose the manual proxy type, you need the proxy server address, including its port and optionally a user name and password into the proxy server. If you choose the auto proxy type, you can enter a proxy autoconfiguration (PAC) URL.";
    };

    ProxyServer = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The proxy server's network address.";
    };

    ProxyServerPort = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The proxy server's port number.";
    };

    ProxyUsername = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user name used to authenticate to the proxy server.";
    };

    ProxyPassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The password used to authenticate to the proxy server.";
    };

    ProxyPACURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The URL of the PAC file that defines the proxy configuration.";
    };

    ProxyPACFallbackAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', allows connecting directly to the destination if the PAC file is unreachable.";
    };

    EncryptionType = lib.mkOption {
      type = types.nullOr (types.enum [ "WEP" "WPA" "WPA2" "WPA3" "Any" "None" ]);
      default = "Any";
      description = "The encryption type for the network.\n\nIf set to anything except 'None', the payload may contain the following three keys: 'Password', 'PayloadCertificateUUID', or 'EAPClientConfiguration'.\n\nAs of iOS 16, tvOS 16, watchOS 9, and macOS 13:\n\n- 'WPA' allows joining WPA or WPA2 networks\n- 'WPA2' allows joining WPA2 or WPA3 networks\n- 'WPA3' allows joining WPA3 networks only\n- 'Any' allows joining WPA, WPA2, WPA3, and WEP networks\n\nPrior to iOS 16, tvOS 16, and watchOS 9, specifying 'WPA', 'WPA2', and 'WPA3' were equivalent and would allow joining any WPA network.\n\nPrior to macOS 13, the encryption type, if specified explicitly, needed to match the encryption type of the network exactly.";
    };

    Password = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The password for the access point.";
    };

    DisplayedOperatorName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The operator name to display when connected to this network. Used only with Wi-Fi Hotspot 2.0 access points.";
    };

    DomainName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The primary domain of the tunnel.";
    };

    ServiceProviderRoamingEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', allows connection to roaming service providers.";
    };

    RoamingConsortiumOIs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of Roaming Consortium Organization Identifiers used for Wi-Fi Hotspot 2.0 negotiation.";
    };

    NAIRealmNames = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of Network Access Identifier Realm names used for Wi-Fi Hotspot 2.0 negotiation.";
    };

    MCCAndMNCs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of Mobile Country Code/Mobile Network Code (MCC/MNC) pairs used for Wi-Fi Hotspot 2.0 negotiation. Each string must contain exactly six digits.";
    };

    HESSID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The HESSID used for Wi-Fi Hotspot 2.0 negotiation.";
    };

    SetupModes = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "System" "Loginwindow" ]));
      default = null;
      description = "An array of strings that contain the type of connection mode to attach.";
    };

    EAPClientConfiguration = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          AcceptEAPTypes = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ 13 17 18 21 23 25 43 ]));
            default = null;
            description = "The EAP types that the system accepts. Allowed values:\n\n- '13': EAP-TLS\n- '17': LEAP\n- '18': EAP-SIM\n- '21': EAP-TTLS\n- '23': EAP-AKA\n- '25': PEAPv0/v1\n- '43': EAP-FAST\n\nFor EAP-TLS authentication without a network payload, install the necessary identity certificates and have your users select EAP-TLS mode in the 802.1X credentials dialog that appears when they connect to the network. For other EAP types, a network payload is necessary and must specify the correct settings for the network.";
          };
          UserName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The user name for the account. If you don't specify a value, the system prompts the user during login.";
          };
          UserPassword = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The user's password. If you don't specify a value, the system prompts the user during login.";
          };
          OneTimeUserPassword = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "If 'true', the user receives a prompt for a password each time they connect to the network.";
          };
          TLSTrustedServerNames = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "The list of accepted server certificate common names. If a server presents a certificate that isn't in this list, the system doesn't trust it.\nIf you specify this property, the system disables dynamic trust (the certificate dialog) unless you also specify 'TLSAllowTrustExceptions' with the value 'true'.\nIf necessary, use wildcards to specify the name, such as 'wpa.*.example.com'.";
          };
          TLSAllowTrustExceptions = lib.mkOption {
            type = types.nullOr (types.bool);
            default = true;
            description = "If 'true', allows a dynamic trust decision by the user. The dynamic trust is the certificate dialogue that appears when the system doesn't trust a certificate.\nIf 'false', the authentication fails if the system doesn't already trust the certificate.\nAs of iOS 8, Apple no longer supports this key.";
          };
          TTLSInnerAuthentication = lib.mkOption {
            type = types.nullOr (types.enum [ "PAP" "EAP" "CHAP" "MSCHAP" "MSCHAPv2" ]);
            default = "MSCHAPv2";
            description = "The inner authentication that the TTLS module uses.";
          };
          OuterIdentity = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A name that hides the user's true name. The user's actual name appears only inside the encrypted tunnel. For example, you might set this to anonymous or anon, or anon@mycompany.net. It can increase security because an attacker can't see the authenticating user's name in the clear.\nThis key is only relevant to TTLS, PEAP, and EAP-FAST.\nThis field is required if 'TLSMinimumVersion' is '1.3'.";
          };
          TLSMinimumVersion = lib.mkOption {
            type = types.nullOr (types.enum [ "1.0" "1.1" "1.2" "1.3" ]);
            default = "1.0";
            description = "The minimum TLS version for EAP authentication.";
          };
          TLSMaximumVersion = lib.mkOption {
            type = types.nullOr (types.enum [ "1.0" "1.1" "1.2" "1.3" ]);
            default = "1.2";
            description = "The maximum TLS version for EAP authentication.";
          };
          EAPFASTUsePAC = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "If 'true', the device uses an existing PAC if it's present. Otherwise, the server must present its identity using a certificate.";
          };
          EAPFASTProvisionPAC = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "If 'true', allows PAC provisioning.\n\nThis value is only applicable if 'EAPFASTUsePAC' is 'true'. This value must be 'true' for EAP-FAST PAC usage to succeed because there's no other way to provision a PAC.";
          };
          EAPFASTProvisionPACAnonymously = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "If 'true', provisions the device anonymously. Note that there are known machine-in-the-middle attacks for anonymous provisioning.";
          };
          EAPSIMNumberOfRANDs = lib.mkOption {
            type = types.nullOr (types.enum [ 2 3 ]);
            default = 3;
            description = "The minimum number of RAND values to accept from the server.\nFor use with EAP-SIM only.";
          };
          SystemModeCredentialsSource = lib.mkOption {
            type = types.nullOr (types.enum [ "ActiveDirectory" ]);
            default = null;
            description = "Set this string to 'ActiveDirectory' to use the AD computer name and password credentials.\nIf using this property, you can't use 'SystemModeUseOpenDirectoryCredentials'.";
          };
          SystemModeUseOpenDirectoryCredentials = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "If 'true', the system mode connection tries to use the Open Directory credentials.\nIf using this property, you can't use 'SystemModeCredentialsSource'.";
          };
          TLSTrustedCertificates = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "An array of trusted certificates. Each entry in the array must contain certificate data that represents an anchor certificate used for verifying the server certificate.";
          };
          TLSCertificateIsRequired = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "If 'true', allows for two-factor authentication for EAP-TTLS, PEAP, or EAP-FAST. If 'false', allows for zero-factor authentication for EAP-TLS.\nIf you don't specify a value, the default is 'true' for EAP-TLS, and 'false' for other EAP types.";
          };
        };
      });
      default = null;
      description = "The enterprise network configuration.";
    };

    QoSMarkingPolicy = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          QoSMarkingEnabled = lib.mkOption {
            type = types.nullOr (types.bool);
            default = true;
            description = "If 'true', disables L3 marking and only uses L2 marking for traffic that goes to the Wi-Fi network.\n\n\n\nIf 'false', the system behaves as if Wi-Fi doesn't have an association with a Cisco QoS fast lane network.";
          };
          QoSMarkingAppleAudioVideoCalls = lib.mkOption {
            type = types.nullOr (types.bool);
            default = true;
            description = "If 'true', adds audio and video traffic of built-in audio or video services, such as FaceTime and Wi-Fi Calling, to the allow list for L2 and L3 marking for traffic that goes to the Wi-Fi network.";
          };
          QoSMarkingAllowListAppIdentifiers = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "An array of app bundle identifiers that defines the allow list for L2 and L3 marking for traffic that goes to the Wi-Fi network. If the array isn't present, but the 'QoSMarkingPolicy' key is present — even empty — no apps can use L2 and L3 marking.";
          };
          QoSMarkingWhitelistedAppIdentifiers = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Use 'QoSMarkingAllowListAppIdentifiers' instead.";
          };
        };
      });
      default = null;
      description = "A dictionary that contains the list of apps that the system allows to benefit from L2 and L3 marking. When this dictionary isn't present, the system allows all apps to use L2 and L3 marking when the Wi-Fi network supports Cisco QoS fast lane.";
    };

    TLSCertificateRequired = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', allows for two-factor authentication for EAP-TTLS, PEAP, or EAP-FAST. If 'false', allows for zero-factor authentication for EAP-TLS.";
    };

  };
}