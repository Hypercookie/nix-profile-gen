# Auto-generated from ProfileManifests: com.zscaler.installparams.plist
# Domain: com.zscaler.installparams
# Title: Zscaler Client Connector
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Zscaler Client Connector";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.zscaler.installparams";
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
        default = [ "system" ];
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
        default = [ "installation_parameters" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      installation_parameters = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            cloudName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The name of the cloud on which your organization is provisioned";
            };
            deviceToken = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The appropriate device token from the Zscaler Client Connector Portal";
            };
            hideAppUIOnLaunch = lib.mkOption {
              type = types.nullOr (types.enum [ "0" "1" ]);
              default = null;
              description = "Forces the app window to stay hidden before users enroll";
            };
            launchTray = lib.mkOption {
              type = types.nullOr (types.enum [ "0" "1" ]);
              default = null;
              description = "Prevents Zscaler Client Connector from automatically starting after installation";
            };
            policyToken = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Allows you to specify which app profile policy you want to enforce for the app before the user enrolls";
            };
            strictEnforcement = lib.mkOption {
              type = types.nullOr (types.enum [ "0" "1" ]);
              default = null;
              description = "Allows you to block internet traffic before the user enrolls in Zscaler Client Connector";
            };
            userDomain = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Allows you to configure the user domain so that the users skip the Zscaler Client Connector enrollment page and directly go to the SSO login page";
            };
            externalRedirect = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Allows you to redirect authentication to your organization's SAML IdP through the Safari browser";
            };
          };
        });
        default = null;
        description = "Install Paramters";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-zscaler-installparams" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Zscaler Client Connector (com.zscaler.installparams) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}