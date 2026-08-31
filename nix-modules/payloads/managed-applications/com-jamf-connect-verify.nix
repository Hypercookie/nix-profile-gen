# Auto-generated from ProfileManifests: com.jamf.connect.verify.plist
# Domain: com.jamf.connect.verify
# Title: Jamf Connect Verify
# Platforms: macOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Jamf Connect Verify";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.jamf.connect.verify";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
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
        default = [ "OIDCProvider" "OIDCROPGID" "PFC_SegmentedControl_0" "DontShowWelcome" "FailToolPath" "ForceSignInWindow" "GetHelpType" "GetHelpOptions" "LoginLogo" "SelfServicePath" "MenuIconActive" "MenuIconDark" "PFC_SegmentedControl_1" "HideAbout" "HideChangePassword" "HideGetHelp" "HideGetSoftware" "HideHomeDirectory" "HideLastUser" "HidePrefs" "HideResetPassword" "HideShares" "HideSignIn" "HideTickets" "HideQuit" "MenuAbout" "MenuActions" "MenuChangePassword" "MenuGetHelp" "MenuGetSoftware" "MenuHomeDirectory" "MenuKerberosTickets" "MenuResetPassword" "MenuShares" "Version" "MenuIcon" "MenuText" "KerberosGetTicketsAutomatically" "KerberosRealm" "KerberosShowCountdown" "KerberosShowCountdownLimit" "TimerKerberosCheck" "KeychainItemsCreateSerial" "KeychainItems" "KeychainItemsInternet" "KeychainItemsDebug" "NetworkCheckAutomatically" "TimerLocalCheck" "TimerNetworkCheck" "LocalPasswordIgnore" "WindowSignIn" "WindowAbout" "MessageBrowserPasswordChange" "MessageLocalSync" "MessageNetworkPasswordWrong" "OIDCClientSecret" "OIDCChangePasswordURL" "OIDCLoginURL" "OIDCRedirectURI" "OIDCResetPasswordURL" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      OIDCProvider = lib.mkOption {
        type = types.nullOr (types.enum [ "Azure" ]);
        default = null;
        description = "Specifies the IdP provider integrated with Jamf Connect Verify.";
      };

      OIDCROPGID = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The Client ID of the added app in your IdP used for authenticating the user's password via a resource owner password grant (ROPG) workflow.";
      };

      PFC_SegmentedControl_0 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      DontShowWelcome = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      FailToolPath = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      ForceSignInWindow = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      GetHelpType = lib.mkOption {
        type = types.nullOr (types.enum [ "URL" "Path" "App" ]);
        default = null;
      };

      GetHelpOptions = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Specifies the URL or path for GetHelpType. <<serial>>, <<fullname>>, <<shortname>> and <<domain>> are supported as substitutions.";
      };

      LoginLogo = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      SelfServicePath = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MenuIconActive = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MenuIconDark = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      PFC_SegmentedControl_1 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      HideAbout = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      HideChangePassword = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      HideGetHelp = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      HideGetSoftware = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      HideHomeDirectory = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      HideLastUser = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      HidePrefs = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      HideResetPassword = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      HideShares = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      HideSignIn = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      HideTickets = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      HideQuit = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      MenuAbout = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MenuActions = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MenuChangePassword = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MenuGetHelp = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MenuGetSoftware = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MenuHomeDirectory = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MenuKerberosTickets = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MenuResetPassword = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MenuShares = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      Version = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The numeric version of the preference file. Currently, only \"1\" is supported.";
      };

      MenuIcon = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Determines if the Action menu will display a status icon (green, yellow, or red).";
      };

      MenuText = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Determines if the text of the main action menu will be the result of the command.";
      };

      KerberosGetTicketsAutomatically = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      KerberosRealm = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      KerberosShowCountdown = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      KerberosShowCountdownLimit = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "An integer, in days remaining, before the password expiration countdown is displayed in the menu bar.";
      };

      TimerKerberosCheck = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
      };

      KeychainItemsCreateSerial = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      KeychainItems = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
      };

      KeychainItemsInternet = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
      };

      KeychainItemsDebug = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      NetworkCheckAutomatically = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Determines if the network password is verified automatically";
      };

      TimerLocalCheck = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
      };

      TimerNetworkCheck = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
      };

      LocalPasswordIgnore = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      WindowSignIn = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      WindowAbout = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MessageBrowserPasswordChange = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MessageLocalSync = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MessageNetworkPasswordWrong = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      OIDCClientSecret = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      OIDCChangePasswordURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      OIDCLoginURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      OIDCRedirectURI = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      OIDCResetPasswordURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-jamf-connect-verify" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Jamf Connect Verify (com.jamf.connect.verify) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}