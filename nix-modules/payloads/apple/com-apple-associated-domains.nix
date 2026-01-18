# Auto-generated from ProfileManifests: com.apple.associated-domains.plist
# Domain: com.apple.associated-domains
# Title: Associated Domains
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-associated-domains" = {
    enable = lib.mkEnableOption "Associated Domains";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.associated-domains";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Configuration = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          ApplicationIdentifier = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The app identifier to associate the domains with.";
          };
          AssociatedDomains = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "The domains to associate with the app. Each string is in the form of 'service:domain'. Use fully qualified hostnames, such as 'www.example.com'. See 'Supporting associated domains' for more information.";
          };
          EnableDirectDownloads = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If 'true', the system enables direct download of data for this domain instead of through a CDN. Set the entitlement value for this domain to 'service:domain?mode=managed'; otherwise, the system ignores this value. Available in macOS 11 and later.";
          };
        };
      }));
      default = null;
      description = "A dictionary that maps apps to their associated domains.";
    };

  };
}