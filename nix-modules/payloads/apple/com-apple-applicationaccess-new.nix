# Auto-generated from ProfileManifests: com.apple.applicationaccess.new.plist
# Domain: com.apple.applicationaccess.new
# Title: Parental Controls: Application Restrictions
# Platforms: macOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Parental Controls: Application Restrictions";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.applicationaccess.new";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "familyControlsEnabled" "whiteList" "pathWhiteList" "pathBlackList" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
              default = null;
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
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-applicationaccess-new" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Parental Controls: Application Restrictions (com.apple.applicationaccess.new) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}