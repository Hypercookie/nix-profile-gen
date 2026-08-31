# Auto-generated from ProfileManifests: com.jamf.connect.sync.plist
# Domain: com.jamf.connect.sync
# Title: Jamf Connect Sync
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Jamf Connect Sync";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.jamf.connect.sync";
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
        default = [ "AuthServer" "PFC_SegmentedControl_0" "LicenseFile" "PeriodicUpdateTime" "SignInCommand" "DontShowWelcome" "UseKeychain" "LocalPasswordSync" "LocalPasswordSyncOnMatchOnly" "LocalPasswordSyncMessage" "PasswordCheckUpdateTime" "KeychainItems" "KeychainItemsInternet" "KeychainItemsDebug" "ADExpirationShow" "WarnOnPasswordExpiration" "ExpirationWarningDays" "PasswordExpirationMenu" "PasswordExpirationMenuDays" "ChangePasswordTimer" "ChangePasswordOrder" "PasswordChangeCommand" "PasswordPolicy" "MessagePasswordChangePolicy" "KerberosRealm" "TicketsOnSignIn" "KerberosRenew" "KerberosShortName" "KerberosShortNameAsk" "KerberosShortNameAskMessage" "IgnoreDomainReachability" "LDAPServers" "MenuIcon" "PFC_SegmentedControl_Menu" "HideAbout" "HideActions" "HideChangePassword" "HideGetHelp" "HideGetSoftware" "HideLockScreen" "HidePreferences" "HideQuit" "HideSignIn" "MenuAbout" "MenuActions" "MenuChangePassword" "MenuGetHelp" "MenuGetSoftware" "MenuLockScreen" "MenuPreferences" "MenuSignIn" "ActionsUpdateTime" "GetHelpType" "GetHelpOptions" "SelfServicePath" "UseKeychainPrompt" "UseKeychainPromptExlusions" "CenterSignIn" "SignInLogo" "LabelUsername" "LabelPassword" "TitleSignIn" "AutoAuth" "CheckSafariExtension" "MessagePluginDisabled" "GetCertificateAutomatically" "X509CA" "Template" "ExportableKey" "WifiNetworks" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AuthServer = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Specifies your Okta authentication domain.";
      };

      PFC_SegmentedControl_0 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      LicenseFile = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The contents of a .jamfconnectlicense file encoded in Base64 data format.";
      };

      PeriodicUpdateTime = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Specifies the interval, in minutes, between background updates.";
      };

      SignInCommand = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Specifies a script or other binary to be run after a successful sign in.";
      };

      DontShowWelcome = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      UseKeychain = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      LocalPasswordSync = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      LocalPasswordSyncOnMatchOnly = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      LocalPasswordSyncMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      PasswordCheckUpdateTime = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Specifies the interval, in minutes, that Jamf Connect Sync checks the local password for synchronization. If unspecified, Jamf Connect Sync will check every 15 minutes by default.";
      };

      KeychainItems = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Keychain Item";
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Account";
            };
          };
        });
        default = null;
        description = "Determines which keychain items Jamf Connect Sync should synchronize with the local password.";
      };

      KeychainItemsInternet = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Keychain Item";
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Account";
            };
          };
        });
        default = null;
        description = "Determines which internet accounts Jamf Connect Sync should synchronize with the local password.";
      };

      KeychainItemsDebug = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      ADExpirationShow = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      WarnOnPasswordExpiration = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Determines whether Jamf Connect Sync should warn the user on sign in if the password is about to expire.";
      };

      ExpirationWarningDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
      };

      PasswordExpirationMenu = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Determines if the countdown before password expiration is displayed in the menu bar.";
      };

      PasswordExpirationMenuDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "An integer, in days remaining, before the password expiration countdown is displayed in the menu bar.";
      };

      ChangePasswordTimer = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Specifies an interval, in minutes, until the user is prompted to sign in again after a password change.";
      };

      ChangePasswordOrder = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
          };
        }));
        default = null;
        description = "Determines the order and setting for the password change menu. If unspecified, Okta is used by default for password changes. If Kerberos is enabled, Jamf Connect Sync will use Kerberos to authenticate to your Active Directory domain, and then authenticate to Okta.";
      };

      PasswordChangeCommand = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Specifies a script or other binary to be run after the user changes a password.";
      };

      PasswordPolicy = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            minLength = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
            minLowerCase = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
            minNumber = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
            minSymbol = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
            minUpperCase = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
            minMatches = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
          };
        });
        default = null;
      };

      MessagePasswordChangePolicy = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      KerberosRealm = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      TicketsOnSignIn = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Determines if Jamf Connect Sync retrieves Kerberos Tickets on sign in.";
      };

      KerberosRenew = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      KerberosShortName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      KerberosShortNameAsk = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      KerberosShortNameAskMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      IgnoreDomainReachability = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      LDAPServers = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Specifies domain controllers to use for Active Directory lookups.";
      };

      MenuIcon = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Path to the menu bar icon image.";
      };

      PFC_SegmentedControl_Menu = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      HideAbout = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      HideActions = lib.mkOption {
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

      HideLockScreen = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Hides the Lock Screen menu item.";
      };

      HidePreferences = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      HideQuit = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      HideSignIn = lib.mkOption {
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

      MenuLockScreen = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MenuPreferences = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      MenuSignIn = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      ActionsUpdateTime = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
      };

      GetHelpType = lib.mkOption {
        type = types.nullOr (types.enum [ "Bomgar" "URL" "App" ]);
        default = null;
        description = "Determines which GetHelp type is used.";
      };

      GetHelpOptions = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Specifies the URL or path for GetHelpType. <<serial>>, <<fullname>>, <<shortname>> and <<domain>> are supported as substitutions.";
      };

      SelfServicePath = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      UseKeychainPrompt = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Displays the Sign In window on launch.";
      };

      UseKeychainPromptExlusions = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
      };

      CenterSignIn = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      SignInLogo = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Specifies the path to image file used as a logo.";
      };

      LabelUsername = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      LabelPassword = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      TitleSignIn = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      AutoAuth = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      CheckSafariExtension = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      MessagePluginDisabled = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Text displayed to users when the Safari plugin is not enabled.";
      };

      GetCertificateAutomatically = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      X509CA = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      Template = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      ExportableKey = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      WifiNetworks = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-jamf-connect-sync" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Jamf Connect Sync (com.jamf.connect.sync) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}