# Auto-generated from ProfileManifests: com.apple.dnsSettings.managed.plist
# Domain: com.apple.dnsSettings.managed
# Title: DNS Settings
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-dnsSettings-managed" = {
    enable = lib.mkEnableOption "DNS Settings";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.dnsSettings.managed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    DNSSettings = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          DNSProtocol = lib.mkOption {
            type = types.nullOr (types.enum [ "HTTPS" "TLS" ]);
            default = null;
            description = "The encrypted transport protocol used to communicate with the DNS server.";
          };
          ServerAddresses = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "An unordered list of DNS server IP address strings. These IP addresses can be a mixture of IPv4 and IPv6 addresses.";
          };
          ServerName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The hostname of a DNS-over-TLS server used to validate the server certificate, as defined in RFC 7858. If no 'ServerAddresses' are provided, the system uses the hostname to determine the server addresses. This key must be present only if the DNSProtocol is 'TLS'.";
          };
          ServerURL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The URI template of a DNS-over-HTTPS server, as defined in RFC 8484. This URL needs to use the 'https://' scheme, and the system uses the hostname or address in the URL to validate the server certificate. If no 'ServerAddresses' are provided, the system uses the hostname or address in the URL to determine the server addresses. Required if 'DNSProtocol' is 'HTTPS'.";
          };
          SupplementalMatchDomains = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "A list of domain strings used to determine which DNS queries use the DNS server. If not set, all domains use the DNS server.\n\nThe system supports a single wildcard ('*') prefix, but it's not required. For example, both '*.example.com' and 'example.com' match against 'mydomain.example.com' and 'your.domain.example.com', but don't match against 'mydomain-example.com'.";
          };
          AllowFailover = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If 'true', the device allows failover to the default system DNS resolver.";
          };
        };
      });
      default = null;
      description = "A dictionary that defines a configuration for an encrypted DNS server.";
    };

    OnDemandRules = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Action = lib.mkOption {
            type = types.nullOr (types.enum [ "Connect" "Disconnect" "EvaluateConnection" ]);
            default = null;
            description = "The action to take if this dictionary matches the current network. Allowed values:\n\n- 'Connect': Apply DNS Settings when the dictionary matches.\n- 'Disconnect': Don't apply DNS Settings when the dictionary matches.\n- 'EvaluateConnection': Apply DNS Settings with per-domain exceptions when the dictionary matches.";
          };
          ActionParameters = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                DomainAction = lib.mkOption {
                  type = types.nullOr (types.enum [ "NeverConnect" "ConnectIfNeeded" ]);
                  default = null;
                  description = "The DNS settings behavior for the specified domains. Allowed values:\n\n* 'NeverConnect': Don't use the DNS Settings for the specified domains.\n* 'ConnectIfNeeded': Allow using the DNS Settings for the specified domains.";
                };
                Domains = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "The domains for which this evaluation applies.";
                };
              };
            }));
            default = null;
            description = "An array of dictionaries that provide per-connection rules. The system uses this array only for settings where the 'Action' value is 'EvaluateConnection'.";
          };
          DNSDomainMatch = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "An array of domain names. This rule matches if any of the domain names in the specified list matches any domain in the device's search domains list.\n\nThe system supports a single wildcard ('*') prefix, but it's not required. For example, both '*.example.com' and 'example.com' match against 'mydomain.example.com' and 'your.domain.example.com', but don't match against 'mydomain-example.com'.";
          };
          DNSServerAddressMatch = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "An array of IP addresses. This rule matches if any of the network's specified DNS servers match any entry in the array.\n\nThe system supports matching with a single wildcard. For example, '17.*' matches any DNS server in the 17.0.0.0/8 subnet.";
          };
          InterfaceTypeMatch = lib.mkOption {
            type = types.nullOr (types.enum [ "Ethernet" "WiFi" "Cellular" ]);
            default = null;
            description = "An interface type. If specified, this rule matches only if the primary network interface hardware matches the specified type.";
          };
          SSIDMatch = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "An array of SSIDs to match against the current network. If the network isn't a Wi-Fi network or if the SSID doesn't appear in this array, the match fails. Omit this key and the corresponding array to match against any SSID.";
          };
          URLStringProbe = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A URL to probe. This rule matches if this URL is successfully fetched and returns a 200 HTTP status code without redirection.";
          };
        };
      }));
      default = null;
      description = "An array of rules that define the DNS settings. If not set, the system always applies the DNS settings. These rules are identical to the 'OnDemandRules' array in VPN payloads.";
    };

    ProhibitDisablement = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system prohibits users from disabling DNS settings. This key is only available on supervised devices.";
    };

  };
}