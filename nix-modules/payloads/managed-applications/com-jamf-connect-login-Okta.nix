# Auto-generated from ProfileManifests: com.jamf.connect.login-Okta.plist
# Domain: com.jamf.connect.login
# Title: Jamf Connect Login (Okta)
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-jamf-connect-login-Okta" = {
    enable = lib.mkEnableOption "Jamf Connect Login (Okta)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.jamf.connect.login";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AuthServer = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    LicenseFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    DenyLocal = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines if users can bypass network authentication and use the Local Auth button at the loginwindow.";
    };

    DenyLocalExcluded = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
    };

    LocalFallback = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    Migrate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows local accounts to be migrated to network accounts. This is typically used when the user account was already created on the system, but you want the accounts to have the same username and password as the user's Okta identity.";
    };

    MigrateUsersHide = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
    };

    OIDCAccessClientID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    OIDCAdminClientID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    OIDCAuthServer = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    OIDCIgnoreCookies = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    OIDCSecondaryLoginClientID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    OIDCRedirectURI = lib.mkOption {
      type = types.nullOr (types.str);
      default = "nomadoauth://oauth-callback/okta";
      description = "The Redirect URI the user is sent to after successful authentication.";
    };

    LoginLogo = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    BackgroundImage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    LoginScreen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines if Jamf Connect Login displays a macOS style login screen instead of a window.";
    };

    MessageOTPEntry = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Text displayed when a user must enter a one time password (OTP).";
    };

    HelpURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    HelpURLLogo = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    LocalHelpFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A path to a local file that users can access by clicking the \"Help\" button in the Jamf Connect Login window.";
    };

    EULATitle = lib.mkOption {
      type = types.nullOr (types.str);
      default = "End User License Agreement";
      description = "Title of the end user license agreement";
    };

    EULASubTitle = lib.mkOption {
      type = types.nullOr (types.str);
      default = "Terms and Conditions";
      description = "Subtitle of the end user license agreement";
    };

    EULAText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Text used for the end user license agreement (use three asterisks to create a line break in the text)";
    };

    EULAPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The path to a file storing the end user license agreement record";
    };

    CreateAdminUser = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    EnableFDE = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    EnableFDERecoveryKey = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    EnableFDERecoveryKeyPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    ScriptPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    ScriptArgs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The arguments used with a specified script run by the RunScript mechanism";
    };

    DemobilizeUsers = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

  };
}