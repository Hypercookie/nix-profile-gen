# Auto-generated from ProfileManifests: com.jamf.trust.plist
# Domain: com.jamf.trust
# Title: Jamf Trust
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Jamf Trust";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.jamf.trust";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "activationProfileUrl" "oktaOrgUrl" "requiredEndpointAgents" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-jamf-trust" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Jamf Trust (com.jamf.trust) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}