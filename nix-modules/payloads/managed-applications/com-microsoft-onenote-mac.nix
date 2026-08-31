# Auto-generated from ProfileManifests: com.microsoft.onenote.mac.plist
# Domain: com.microsoft.onenote.mac
# Title: Microsoft OneNote
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Microsoft OneNote";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.microsoft.onenote.mac";
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
        default = [ "system" "user" ];
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
        default = [ "kSubUIAppCompletedFirstRunSetup1507" "SendASmileEnabled" "SendAllTelemetryEnabled" "SendCrashReportsEvenWithTelemetryDisabled" "SignInOptions" "kFRETelemetryConsentKey" "kFREEnterpriseTelemetryInfoKey" "kFREIntelligenceServicesConsentV2Key" "PII_And_Intelligent_Services_Preference" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      kSubUIAppCompletedFirstRunSetup1507 = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls the original \"What's New\" dialog and Office 365 activation prompt on first launch. Replaced by 'OfficeAutoSignIn' in the main Office profile starting in version 16.17 and should not be used for Office 2019.";
      };

      SendASmileEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "This key when set to false will deactivate the ability for users to use the \"Smile\" feature to send feedback to Microsoft.";
      };

      SendAllTelemetryEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Set to FALSE to send minimal heartbeat data, no application usage, and no environment details.";
      };

      SendCrashReportsEvenWithTelemetryDisabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Sends crash reports even if telemetry is disabled. Will only be evaluated if 'Send Telemetry Data' is FALSE.";
      };

      SignInOptions = lib.mkOption {
        type = types.nullOr (types.enum [ 0 1 2 4 ]);
        default = null;
        description = "Prevent users from signing in to any O365 service. This has the added effect of making sure users store no data online via microsoft servers.";
      };

      kFRETelemetryConsentKey = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disable the \"Connected Services\" dialog for MSA-based (personal) accounts.";
      };

      kFREEnterpriseTelemetryInfoKey = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Suppresses a temporary Privacy and Services Update dialog in 16.27 ONLY. (Was previously used for a similar purpose in 16.13.1 but the key was recycled.)";
      };

      kFREIntelligenceServicesConsentV2Key = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Suppress the \"Use Intelligent Services?\" pop-up dialog and auto-accept the terms in 16.17 through 16.27.";
      };

      PII_And_Intelligent_Services_Preference = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Suppress the \"Use Intelligent Services?\" pop-up dialog and auto-accept the terms in 16.17 through 16.27.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-onenote-mac" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Microsoft OneNote (com.microsoft.onenote.mac) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}