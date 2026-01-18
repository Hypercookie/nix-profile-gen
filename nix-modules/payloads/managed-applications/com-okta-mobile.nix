# Auto-generated from ProfileManifests: com.okta.mobile.plist
# Domain: com.okta.mobile
# Title: Okta Verify
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-okta-mobile" = {
    enable = lib.mkEnableOption "Okta Verify";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.okta.mobile";
      description = "The payload domain (PayloadType) for this manifest.";
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
}