# Auto-generated from ProfileManifests: com.apple.domains.plist
# Domain: com.apple.domains
# Title: Domains
# Platforms: iOS, macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Domains";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.domains";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
        description = "Whether macOS allows only one instance of this payload per profile.";
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
        default = [ "system" "user" ];
        description = "Profile scopes this payload may be installed into (pfm_targets).";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "EmailDomains" "WebDomains" "SafariPasswordAutoFillDomains" "CrossSiteTrackingPreventionRelaxedDomains" "CrossSiteTrackingPreventionRelaxedApps" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      EmailDomains = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of domains. Mail marks in red all email addresses that lack a suffix matching any of these strings.\nAvailable in iOS 8 and later and macOS 10.10 and later.";
      };

      WebDomains = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of domains. The system considers URLs matching the patterns listed in this property managed.\nAvailable in iOS 9.3 and later.";
      };

      SafariPasswordAutoFillDomains = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of domains. Users can only save passwords in Safari from URLs matching the patterns listed here. This property doesn't disable the autofill feature itself.\nSupervised devices or Shared iPads need this property to enable saving passwords in Safari.\nAvailable in iOS 9.3 and later.";
      };

      CrossSiteTrackingPreventionRelaxedDomains = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of up to 10 strings. URLs matching the patterns listed here have relaxed enforcement of cross-site tracking prevention.\nAvailable in iOS 16.2 and later and macOS 13.1 and later.";
      };

      CrossSiteTrackingPreventionRelaxedApps = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of up to 10 strings representing app bundle-ids. Apps matching the bundle-ids listed here have relaxed enforcement of cross-site tracking prevention for the domains listed in 'CrossSiteTrackingPreventionRelaxedDomains'.\nAvailable in iOS 18 and later and macOS 15 and later.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-domains" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Domains (com.apple.domains) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}