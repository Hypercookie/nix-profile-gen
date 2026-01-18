# Auto-generated from ProfileManifests: com.jigsaw24.Elevate24.plist
# Domain: com.jigsaw24.Elevate24
# Title: Elevate24
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-jigsaw24-Elevate24" = {
    enable = lib.mkEnableOption "Elevate24";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.jigsaw24.Elevate24";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    LicenseKey = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enter your Elevate24 license key. Mandatory key for Premium customers only.";
    };

    LicenseAPIKey = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enter your Elevate24 license api key. Mandatory key for Premium customers only.";
    };

    newUI = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Change Elevate24 to show to the new UI. Not required for Elevate24 2.3+ as this is now default.";
    };

    message = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Change the standard application message in the application.";
    };

    iconPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Prodvide the file path to a JPEG or PNG to use as the icon in the Elevate24 application.";
    };

    heading = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Change the standard header from Elevate24 in the application. Always displays in bold.";
    };

    subheading = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Change the standard text \"Privilege Access Management\" under the Elevate24 header. New UI V2.2.0+ Only.";
    };

    mainbutton = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Change the standard button text from Elevate in the application. ";
    };

    HideLogo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hide the “Powered by Jigsaw24” logo in the application.";
    };

    Enabletimelist = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables the option for the application to display a choice of times. To be used in conjuction with Session Times list.";
    };

    enableReason = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will replace reasons drop down list with a free text entry box. ";
    };

    Sessiontime = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Change the length of time (in seconds) the user will be elevated for. Do not use this key if you want to present a list of times to choose from.";
    };

    times = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of available times to chose from in the Application. Enter time below in seconds.";
    };

    reasons = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The reasons to choose for needing elevated rights in dropbox within the application.";
    };

    sessionExpiryReminder = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Set the number of minutes before the application notifies the user that the session is expiring";
    };

    DisableDefaultLog = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "To disable sending of premium reporting data to Jigsaw24. If you are a basic customer, no data is sent from the device, it is all stored locally.";
    };

    siemURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    siemAuthHeader = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    siemAuthToken = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    microsoftsentinel = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          SentinelClientId = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Client ID";
          };
          SentinelTennantId = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Tennant ID";
          };
          SentinelClientsecret = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Client Secret";
          };
          SentinelUploadURL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Upload URL";
          };
        };
      }));
      default = null;
      description = "Microsoft Sentinel";
    };

    EnableSessionMonitoring = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "To enable monitoring of administrator activities whilst in an elevated state.";
    };

    enableAppleAuth = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Prompts the user for their local Apple credentials or TouchID (if enabled on device) before allowing elevation.";
    };

    GoogleAuth = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables the use of authenticator applications such as Google Auth or Microsoft Auth, prompting for a valid session token before Elevating to admin.";
    };

    standardAtLoad = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will remove admin rights when the application first launches.";
    };

    demoteAllAdmin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables all admin users being demoted to standard users when the current elevation period ends. If you have any accounts on the device you'd like to remain admin please configure Demote Exclusions.";
    };

    demoteAllAdminQuit = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will demote all admin accounts from admin when the application quits or the laptop is restarted.";
    };

    demoteExclusions = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Will exclude accounts on device from being demoted.";
    };

    killterminalsessions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will demote the current terminal session from sudo session to standard.";
    };

    UseSystemExtension = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Elevate24 v2.3+ Only. To ensure the Application is protected by the on-device system extension, to prevent misuse and tampering.";
    };

    userElevateAdmin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will create a temporary secondary account instead of Elevating the primary account. A temporary password will also be supplied upon elevation.";
    };

    useCurrentUserAsAdmin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If User Elevate Admin Key is enabled and this key is also enabled, the temporary account will use the current logged in users username as part of the account naming. For example, Joe.Bloggs-adm";
    };

    adminUserName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If ‘Use Current User As Admin’ is not enabled, this key allows the ability to create a temporary admin account with a standard name. Such as \"Temp Admin\"";
    };

    ComplexPassword = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables the use of a custom complex password when 'User Elevate Admin' is enabled.";
    };

    PasswordUppercase = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enter the amount of uppercase Letters required for the password.";
    };

    PasswordLowercase = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enter the amount of lowercase Letters required for the password.";
    };

    PasswordNumbers = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enter the amount of numbers required for the password.";
    };

    PasswordSymbols = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enter the amount of symbols required for the password.";
    };

    showAdminPasswordGrace = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Set the number of seconds after elevation or last showing the password that the password will be shown (Max 45 seconds). This only works if 'User Elevate Admin' is enabled.";
    };

  };
}