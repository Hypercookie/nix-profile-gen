# Auto-generated from ProfileManifests: com.apple.relay.managed.plist
# Domain: com.apple.relay.managed
# Title: Relay
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-relay-managed" = {
    enable = lib.mkEnableOption "Relay";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.relay.managed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Relays = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          HTTP3RelayURL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The URL or URI template, as defined in RFC 9298, of a relay server that's reachable using HTTP/3 and supports proxying TCP and UDP using the CONNECT method.\n\nEach relay needs to include either 'HTTP2RelayURL' or 'HTTP3RelayURL', or it can include both.";
          };
          HTTP2RelayURL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The URL or URI template, as defined in RFC 9298, of a relay server that's reachable using HTTP/2 and supports proxying TCP and UDP using the CONNECT method.\n\nEach relay needs to include either 'HTTP2RelayURL' or 'HTTP3RelayURL', or it can include both.";
          };
          AdditionalHTTPHeaderFields = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                __key__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                };
                __value__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The HTTP header field value for the corresponding header field name.";
                };
              };
            });
            default = null;
            description = "A dictionary that contains custom HTTP header keys and values to add to each request. The dictionary key name represents the HTTP header field name to use, and the dictionary value is the string to use as the HTTP header field value.";
          };
          RawPublicKeys = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "An array of DER-encoded raw public keys that the system uses to authenticate the server during a TLS handshake. The server needs to use one of the keys in the handshake to authenticate.\n\nIf this array is empty, the system uses the default TLS trust evaluation.";
          };
        };
      }));
      default = null;
      description = "An array of dictionaries that describe one or more relay servers that the system can chain together.";
    };

    MatchDomains = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "A list of domain strings that the system uses to determine which connection to route through the servers in 'Relays'.\n\nAny connection that matches a domain in the list exactly or is a subdomain of the listed domain uses the relay servers, unless it matches a domain in 'ExcludedDomains'.\n\nIf this list and 'MatchFQDNs' are empty, the system routes traffic to all domains to the relay servers, except those that match an excluded domain or excluded FQDN.";
    };

    ExcludedDomains = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "A list of domain strings to exclude from routing through the servers in 'Relays'. Any connection that matches a domain in the list exactly or is a subdomain of the listed domain won't use the relay server.";
    };

    RelayUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A globally unique identifier for this relay configuration. The system uses this UUID to route managed apps through the servers in 'Relays'. This key is required for user enrollment.";
    };

    MatchFQDNs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "A list of Fully Qualified Domain Names (FQDNs) to be routed through the servers contained in 'Relays'. Any connection that matches an FQDN in the list exactly uses the relay servers. If this list and 'MatchDomains' are empty, the system routes traffic to all domains to the relay servers, except those that match an excluded domain or excluded FQDN.";
    };

    ExcludedFQDNs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "A list of Fully Qualified Domain Names (FQDNs) to exclude from routing through the servers contained in 'Relays'. Any connection that matches an FQDN in the list exactly won't use the relay server. When 'MatchDomains' is also present, any FQDN listed in the list should be a subdomain of at least one 'MatchDomain' value, otherwise it will not have any effect.";
    };

    UIToggleEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'true', the device allows the user to disable this network relay configuration.";
    };

    AllowDNSFailover = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the device allows the relay to failover to the default system DNS resolver.";
    };

  };
}