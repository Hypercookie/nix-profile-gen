# Auto-generated from ProfileManifests: com.apple.applicationaccess.new.plist
# Domain: com.apple.applicationaccess.new
# Title: Parental Controls: Application Restrictions
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-applicationaccess-new" = {
    enable = lib.mkEnableOption "Parental Controls: Application Restrictions";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.applicationaccess.new";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    familyControlsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', enables app access restrictions.";
    };

    whiteList = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          bundleID = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The bundle ID of the app.";
          };
          displayName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The name used for display purposes.";
          };
          appID = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The identifier of the app. Obtain this value from the Security framework using 'SecCodeCopyDesignatedRequirement'.";
          };
          subApps = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                bundleID = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID of the app.";
                };
                displayName = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The name used for display purposes.";
                };
                appID = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The identifier of the app. Obtain this value from the Security framework using 'SecCodeCopyDesignatedRequirement'.";
                };
                detachedSignature = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The signature for an unsigned binary.";
                };
                appStore = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                };
                disabled = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If 'true', this app isn't added to the allow list.";
                };
              };
            }));
            default = null;
            description = "An array of nested helper applications.";
          };
          detachedSignature = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The signature for an unsigned binary.";
          };
          appStore = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
          };
          disabled = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "If 'true', this app isn't added to the allow list.";
          };
        };
      }));
      default = null;
      description = "The allow list of app item dictionaries.";
    };

    pathWhiteList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The paths to apps in the allow list. This property is deprecated in macOS 10.15 and later.";
    };

    pathBlackList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The paths to apps in the deny list. This property is deprecated in macOS 10.15 and later.";
    };

  };
}