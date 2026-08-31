# Auto-generated from ProfileManifests: com.okta.mobile.auth-service-extension.plist
# Domain: com.okta.mobile.auth-service-extension
# Title: Okta Verify (SSO Extension)
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Okta Verify (SSO Extension)";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.okta.mobile.auth-service-extension";
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
        default = [ "OktaVerify.DeviceHealthOptions" "OktaVerify.EnrollmentOptions" "OktaVerify.OrgUrl" "PlatformSSO.ProtocolVersion" "OktaVerify.PasswordSyncClientID" "OktaVerify.ReportDiagnostics" "OktaVerify.LaunchOptions" "OktaVerify.UserPrincipalName" "OktaVerify.EnableOSQueryCustomChecks" "OktaVerify.OSQueryCustomChecksTimeout" "OktaVerify.OSQueryAllowedDomains" ];
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

      "PlatformSSO.ProtocolVersion" = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Sets Platform SSO Protocol Version";
      };

      "OktaVerify.PasswordSyncClientID" = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Used for Platform Single Sign-on (Okta Admin Console > Applications > Catalog)";
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

      "OktaVerify.EnableOSQueryCustomChecks" = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Specifies whether custom OSQuery checks can be run on this device.";
      };

      "OktaVerify.OSQueryCustomChecksTimeout" = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Admins can use this value to customize the osquery timeout value and fine-tune device posture checks";
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
  options.programs.macprofile.payloads."managed-applications-com-okta-mobile-auth-service-extension" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Okta Verify (SSO Extension) (com.okta.mobile.auth-service-extension) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}