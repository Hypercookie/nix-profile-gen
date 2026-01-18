# Auto-generated from ProfileManifests: com.apple.dnsProxy.managed.plist
# Domain: com.apple.dnsProxy.managed
# Title: DNS Proxy
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-dnsProxy-managed" = {
    enable = lib.mkEnableOption "DNS Proxy";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.dnsProxy.managed";
      description = "The payload domain (PayloadType) for this manifest.";
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
      type = types.nullOr (types.attrsOf types.anything);
      default = null;
      description = "The dictionary of vendor-specific configuration items.";
    };

    DNSProxyUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A globally unique identifier for this DNS proxy configuration. The proxy processes DNS lookups traffic for managed apps with the same 'DNSProxyUUID' in their app attributes. This key is required for user enrollment.";
    };

  };
}