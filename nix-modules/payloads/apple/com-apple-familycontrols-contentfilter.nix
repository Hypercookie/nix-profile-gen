# Auto-generated from ProfileManifests: com.apple.familycontrols.contentfilter.plist
# Domain: com.apple.familycontrols.contentfilter
# Title: Parental Controls: Web Content Filter
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Parental Controls: Web Content Filter";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.familycontrols.contentfilter";
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
        default = [ "restrictWeb" "whitelistEnabled" "siteWhitelist" "useContentFilter" "filterWhitelist" "filterBlacklist" "allowListEnabled" "siteAllowList" "filterAllowList" "filterDenyList" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      restrictWeb = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables web content filters.";
      };

      whitelistEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Use 'allowListEnabled' instead.";
      };

      siteWhitelist = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            address = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The site prefix, including http(s) scheme.";
            };
            pageTitle = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The site page title.";
            };
          };
        }));
        default = null;
        description = "Use 'siteAllowList' instead.";
      };

      useContentFilter = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', filters content automatically.";
      };

      filterWhitelist = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Use 'filterAllowList' instead.";
      };

      filterBlacklist = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Use 'filterDenyList' instead.";
      };

      allowListEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables web content filters.";
      };

      siteAllowList = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            address = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The site prefix, including the 'http(s)' scheme.";
            };
            pageTitle = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The site page title.";
            };
          };
        }));
        default = null;
        description = "An array of sites that defines an allow list. If specified, this defines additional allowed sites besides those in the automated allow list and deny list, including disallowed adult sites.\nThis key is required if 'allowListEnabled' is 'true'.";
      };

      filterAllowList = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "The array of URLs that defines an allow list. When 'restrictWeb' and 'useContentFilter' are enabled, only URLs in the allow list are available to the user.";
      };

      filterDenyList = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "The array of URLs that defines a deny list. When 'restrictWeb' and 'useContentFilter' are enabled, no URLs in the deny list are available to the user.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-familycontrols-contentfilter" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Parental Controls: Web Content Filter (com.apple.familycontrols.contentfilter) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}