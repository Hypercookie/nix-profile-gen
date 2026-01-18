# Auto-generated from ProfileManifests: com.apple.familycontrols.contentfilter.plist
# Domain: com.apple.familycontrols.contentfilter
# Title: Parental Controls: Web Content Filter
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-familycontrols-contentfilter" = {
    enable = lib.mkEnableOption "Parental Controls: Web Content Filter";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.familycontrols.contentfilter";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    restrictWeb = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', enables web content filters.";
    };

    whitelistEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Use 'allowlistEnabled' instead.";
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
      description = "Use 'siteAllowlist' instead.";
    };

    useContentFilter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', filters content automatically.";
    };

    filterWhitelist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Use 'filterAllowlist' instead.";
    };

    filterBlacklist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Use 'filterDenylist' instead.";
    };

    allowlistEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', enables web content filters.";
    };

    siteAllowlist = lib.mkOption {
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
      description = "An array of sites that defines an allow list. If specified, this defines additional allowed sites besides those in the automated allow list and deny list, including disallowed adult sites.\n\nThis key is required if 'allowlistEnabled' is 'true'.";
    };

    filterAllowlist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The array of URLs that defines an allow list. When 'restrictWeb' and 'useContentFilter' are enabled, only URLs in the allow list are available to the user.";
    };

    filterDenylist = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The array of URLs that defines a deny list. When 'restrictWeb' and 'useContentFilter' are enabled, no URLs in the deny list are available to the user.";
    };

  };
}