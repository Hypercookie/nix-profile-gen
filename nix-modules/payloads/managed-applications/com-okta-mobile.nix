# Auto-generated from ProfileManifests: com.okta.mobile.plist
# Domain: com.okta.mobile
# Title: Okta Verify
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Okta Verify";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.okta.mobile";
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
        default = [ "system" ];
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
        default = [ "OktaVerify.DeviceHealthOptions" "OktaVerify.EnrollmentOptions" "OktaVerify.OrgUrl" "OktaVerify.ReportDiagnostics" "OktaVerify.LaunchOptions" "OktaVerify.UserPrincipalName" "OktaVerify.OSQueryCustomChecksTimeout" "OktaVerify.EnableOSQueryCustomChecks" "OktaVerify.OSQueryAllowedDomains" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      "OktaVerify.DeviceHealthOptions" = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Hide the Device Health page, or hide specific health checks in Okta Verify on user devices";
      };

      "OktaVerify.EnrollmentOptions" = lib.mkOption {
        type = types.nullOr (types.enum [ "SilentEnrollmentDisabled" "Enabled" "Disabled" ]);
        default = null;
        description = "Configure whether users are prompted to enroll in Okta Verify";
      };

      "OktaVerify.OrgUrl" = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Pre-populate the org URL so that users don't have to enter this value on the first enter your sign-in URL page";
      };

      "OktaVerify.ReportDiagnostics" = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Configure whether Okta Verify diagnostic and crash information is shared with Okta";
      };

      "OktaVerify.LaunchOptions" = lib.mkOption {
        type = types.nullOr (types.enum [ "HideMainWindow" ]);
        default = null;
        description = "Configure whether Okta Verify shows the accounts list upon launch";
      };

      "OktaVerify.UserPrincipalName" = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Automatically populates the username in the Sign-In Widget";
      };

      "OktaVerify.OSQueryCustomChecksTimeout" = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Admins can use this value to customize the osquery timeout value and fine-tune device posture checks";
      };

      "OktaVerify.EnableOSQueryCustomChecks" = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Specifies whether custom OSQuery checks can be run on this device.";
      };

      "OktaVerify.OSQueryAllowedDomains" = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Defines the organizations that can run custom OSQuery checks on this device.";
      };

    };
  };
in
{
  options.payloads."managed-applications-com-okta-mobile" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Okta Verify (com.okta.mobile) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}