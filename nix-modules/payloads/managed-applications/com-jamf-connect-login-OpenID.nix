# Auto-generated from ProfileManifests: com.jamf.connect.login-OpenID.plist
# Domain: com.jamf.connect.login
# Title: Jamf Connect Login (OIDC)
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-jamf-connect-login-OpenID" = {
    enable = lib.mkEnableOption "Jamf Connect Login (OIDC)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.jamf.connect.login";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    OIDCProvider = lib.mkOption {
      type = types.nullOr (types.enum [ "Azure" "GoogleID" "IBMCI" "OneLogin" "PingFederate" "Custom" ]);
      default = null;
      description = "Specifies the IdP provider integrated with Jamf Connect Login.";
    };

    OIDCRedirectURI = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    OIDCClientID = lib.mkOption {
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

    Migrate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows local accounts to be migrated to network accounts. This is typically used when the user account was already created on the system, but you want the accounts to have the same username and password as the user's Okta identity.";
    };

    MigrateUsersHide = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
    };

    OIDCROPGID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Client ID of the added app in you IdP used for authenticating the user's password via a resource owner password grant (ROPG) workflow. This value should match the OIDCClientID key.";
    };

    OIDCNewPassword = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If set to true, the user must create a new password on the computer\nIf set to false, the user must validate with their existing IdP password, which will also become the local password.";
    };

    OIDCAdmin = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Determines which roles become an admin at the loginwindow. Users assigned a specified role become an admin at the loginwindow.";
    };

    OIDCAdminAttribute = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    OIDCClientSecret = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The client secret used by Jamf Connect Login and your IdP.";
    };

    OIDCTenant = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    OIDCDiscoveryURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    OIDCIgnoreCookies = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    RightsTmpCache = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When using the AuthUI rule, determines if the token cache is set to /tmp/cachedata.";
    };

    LoginLogo = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    BackgroundImage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
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
      default = null;
      description = "Title of the end user license agreement";
    };

    EULASubTitle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
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