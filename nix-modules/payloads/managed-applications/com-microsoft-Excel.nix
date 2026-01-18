# Auto-generated from ProfileManifests: com.microsoft.Excel.plist
# Domain: com.microsoft.Excel
# Title: Microsoft Excel
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-Excel" = {
    enable = lib.mkEnableOption "Microsoft Excel";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.microsoft.Excel";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    NSRequiresAquaSystemAppearance = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable macOS Dark Mode settings for application.";
    };

    kSubUIAppCompletedFirstRunSetup1507 = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Controls the original \"What's New\" dialog and Office 365 activation prompt on first launch. Replaced by 'OfficeAutoSignIn' in the main Office profile starting in version 16.17 and should not be used for Office 2019.";
    };

    SendASmileEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "This key when set to false will deactivate the ability for users to use the \"Smile\" feature to send feedback to Microsoft.";
    };

    SendAllTelemetryEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
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
      default = false;
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

    TryDefaultPassword = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Uncheck to prevent Excel from using a default password when attempting to unlock encrypted files.";
    };

  };
}