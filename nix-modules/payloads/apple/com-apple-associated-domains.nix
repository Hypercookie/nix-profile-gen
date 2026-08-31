# Auto-generated from ProfileManifests: com.apple.associated-domains.plist
# Domain: com.apple.associated-domains
# Title: Associated Domains
# Platforms: macOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Associated Domains";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.associated-domains";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
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
        default = [ "Configuration" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-associated-domains" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Associated Domains (com.apple.associated-domains) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}