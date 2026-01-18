# Auto-generated from ProfileManifests: com.zscaler.installparams.plist
# Domain: com.zscaler.installparams
# Title: Zscaler Client Connector
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-zscaler-installparams" = {
    enable = lib.mkEnableOption "Zscaler Client Connector";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.zscaler.installparams";
      description = "The payload domain (PayloadType) for this manifest.";
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
}