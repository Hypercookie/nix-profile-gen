# Auto-generated from ProfileManifests: com.jamf.trust.plist
# Domain: com.jamf.trust
# Title: Jamf Trust
# Platforms: macOS
# Unique: yes
# Targets: system, user

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
        description = "Whether only one instance of this payload is allowed per profile.";
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

      _platforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "macOS" ];
        description = "Supported Apple platforms (pfm_platforms).";
      };

      _keyPlatforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.attrs;
        default = [ ];
        description = "Keys restricted to a subset of the manifest's platforms (key-level pfm_platforms).";
      };

      _allowUnsupportedPlatform = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Emit this instance even if its manifest says the target platform does not support it or some of its keys. Produces a warning instead of an error.";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
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
  options.payloads."managed-applications-com-jamf-trust" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Jamf Trust (com.jamf.trust) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}