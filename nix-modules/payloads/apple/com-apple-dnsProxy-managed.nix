# Auto-generated from ProfileManifests: com.apple.dnsProxy.managed.plist
# Domain: com.apple.dnsProxy.managed
# Title: DNS Proxy
# Platforms: iOS, macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "DNS Proxy";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.dnsProxy.managed";
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
        default = [ "iOS" "macOS" ];
        description = "Supported Apple platforms (pfm_platforms).";
      };

      _keyPlatforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.attrs;
        default = [
          { path = [ "DNSProxyUUID" ]; platforms = [ "iOS" ]; }
          { path = [ "ProviderDesignatedRequirement" ]; platforms = [ "macOS" ]; }
        ];
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
        default = [ "AppBundleIdentifier" "ProviderBundleIdentifier" "ProviderConfiguration" "DNSProxyUUID" "ProviderDesignatedRequirement" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AppBundleIdentifier = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The bundle identifier of the app containing the DNS proxy network extension.";
      };

      ProviderBundleIdentifier = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The bundle identifier of the DNS proxy network extension to use. Declaring the bundle identifier is useful for apps that contain more than one DNS proxy extension.";
      };

      ProviderConfiguration = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Key/value pairs.";
            };
          };
        });
        default = null;
        description = "The dictionary of vendor-specific configuration items.";
      };

      DNSProxyUUID = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "A globally unique identifier for this DNS proxy configuration. The proxy processes DNS lookups traffic for managed apps with the same 'DNSProxyUUID' in their app attributes. This key is required for user enrollment.";
      };

      ProviderDesignatedRequirement = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The designated requirement string that the system embeds in the code signature of the DNS proxy network extension. Use this to correctly identify the DNS proxy extension when 'ProviderBundleIdentifier' is present.";
      };

    };
  };
in
{
  options.payloads."apple-com-apple-dnsProxy-managed" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "DNS Proxy (com.apple.dnsProxy.managed) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}