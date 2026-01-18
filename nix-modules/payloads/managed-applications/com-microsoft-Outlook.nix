# Auto-generated from ProfileManifests: com.microsoft.Outlook.plist
# Domain: com.microsoft.Outlook
# Title: Microsoft Outlook
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-Outlook" = {
    enable = lib.mkEnableOption "Microsoft Outlook";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.microsoft.Outlook";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AllowedEmailDomains = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Specify one or more domains users are allowed to add in Outlook. Format strings as regular expressions. Does not remove or disconnect accounts already added in Outlook. Supports regular expressions to allow for catching multiple domains.";
    };

    AutomaticallyDownloadExternalContent = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = 0;
      description = "Set when pictures are automatically downloaded from the Internet for email.";
    };

    CalendarFirstDayOfWeek = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 3 4 5 6 7 ]);
      default = 1;
      description = "Set the first day of week in calendar view.";
    };

    DefaultEmailAddressOrDomain = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Set the domain or full email address of Office 365 mailbox to be added on first launch. The full email address or domain specified will be added in Outlook instead of the Office activation email address. For a domain use \"example.com\" formatting (no \"@\") and the alias/username from the activation email address will be combined with the domain entered in this pref key.";
    };

    NSRequiresAquaSystemAppearance = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable macOS Dark Mode settings for application.";
    };

    DisableExport = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent users from being able to export archive files (.olm).";
    };

    DisableImport = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent users from being able to import archive files (.olm and .pst) and Outlook 2011 for Mac data.";
    };

    DisableModernAuth = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable Modern Authentication connections from Outlook.";
    };

    DisablePreviewForSMIME = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable preview generation for encrypted email messages.";
    };

    DisableSignatures = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent users from being able to create, edit, and add client-side signatures.";
    };

    DisableDefaultAppSignature = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent Outlook from being able to use the default signature. This will keep the default Outlook signature but disable the settings to apply the default Outlook signatures for new messages and for reply/forward message settings.";
    };

    DisableSkypeMeeting = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent users from adding Skype for Business online meeting details to events.";
    };

    DisableTeamsMeeting = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent users from adding Teams online meeting details to events.";
    };

    FirstRunExperienceCompletedO15 = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable the offer to import mailbox or setup an email account in Outlook 2016.";
    };

    kSubUIAppCompletedFirstRunSetup1507 = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Controls the original \"What's New\" dialog and Office 365 activation prompt on first launch. Replaced by 'OfficeAutoSignIn' in the main Office profile starting in version 16.17 and should not be used for Office 2019.";
    };

    HideFoldersOnMyComputerRootInFolderList = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent users from viewing local On My Computer folders in the sidebar. Found under Outlook > Preferences > General > Sidebar.";
    };

    HideCanAddOtherAccountTypesTipText = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Hide the \"Did you know? Outlook supports…\" text in the Set Up Your Email success dialog box. Only hides text. Does not impact ability to add non-corporate mailboxes.";
    };

    SignInOptions = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 4 ]);
      default = null;
      description = "Prevent users from signing in to any O365 service. This has the added effect of making sure users store no data online via microsoft servers.";
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

    OverrideAccountConfigurationWindow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable account configuration window when the profile is empty.";
    };

    kFRETelemetryConsentKey = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable the \"Connected Services\" dialog for MSA-based (personal) accounts.";
    };

    o365GroupsOobePromoTriggeredPref = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable the \"Introducing groups in Outlook\" dialog.";
    };

    googlePromoTriggeredPref = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable promotion dialog about adding Google Contacts/Calendar.";
    };

    TrustO365AutodiscoverRedirect = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Suppress the warning when Autodiscover is redirected from HTTP to HTTPS.";
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

    DefaultWeatherLocation = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Set default location for weather in calendar view. Use the format returned by the weather location search within Outlook. Example: \"Paris, France\"";
    };

    Weather_update_automatically = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent users from choosing Update Location Automatically for weather location.";
    };

    EnableNewOutlook = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 ]);
      default = 0;
      description = "Lets users on the production channel try out the new Outlook. This key can be used to manage the deployment and default position of the new Outlook switch.";
    };

  };
}