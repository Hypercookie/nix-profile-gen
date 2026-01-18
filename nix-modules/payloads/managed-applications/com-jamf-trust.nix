# Auto-generated from ProfileManifests: com.jamf.trust.plist
# Domain: com.jamf.trust
# Title: Jamf Trust
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-jamf-trust" = {
    enable = lib.mkEnableOption "Jamf Trust";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.jamf.trust";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    activationProfileUrl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Shareable Activation URL";
    };

    oktaOrgUrl = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Okta Org ID";
    };

    requiredEndpointAgents = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Jamf Trust includes a key that you can enable for additional security. With this key enabled, Jamf Private Access operates on a computer only if your organization's required security software is running. (eg. com.jamf.protect.agent)";
    };

  };
}