# Auto-generated from ProfileManifests: com.apple.domains.plist
# Domain: com.apple.domains
# Title: Domains
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-domains" = {
    enable = lib.mkEnableOption "Domains";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.domains";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    EmailDomains = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of domains. Mail marks in red all email addresses that lack a suffix matching any of these strings.\n\nAvailable in iOS 8 and later and macOS 10.10 and later.";
    };

    WebDomains = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of domains. The system considers URLs matching the patterns listed in this property managed.\n\nAvailable in iOS 9.3 and later.";
    };

    SafariPasswordAutoFillDomains = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of domains. Users can only save passwords in Safari from URLs matching the patterns listed here. This property doesn't disable the autofill feature itself.\n\nSupervised devices or Shared iPads need this property to enable saving passwords in Safari.\n\nAvailable in iOS 9.3 and later.";
    };

    CrossSiteTrackingPreventionRelaxedDomains = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of up to 10 strings. URLs matching the patterns listed here have relaxed enforcement of cross-site tracking prevention.\n\nAvailable in iOS 16.2 and later and macOS 13.1 and later.";
    };

    CrossSiteTrackingPreventionRelaxedApps = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of up to 10 strings representing app bundle-ids. Apps matching the bundle-ids listed here have relaxed enforcement of cross-site tracking prevention for the domains listed in 'CrossSiteTrackingPreventionRelaxedDomains'.\n\nAvailable in iOS 18 and later and macOS 15 and later.";
    };

  };
}