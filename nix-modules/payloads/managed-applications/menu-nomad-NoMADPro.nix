# Auto-generated from ProfileManifests: menu.nomad.NoMADPro.plist
# Domain: menu.nomad.NoMADPro
# Title: NoMAD Pro
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-menu-nomad-NoMADPro" = {
    enable = lib.mkEnableOption "NoMAD Pro";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "menu.nomad.NoMADPro";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AuthServer = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "URL for the Okta server, note no preceding https: is required.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    LicenseFile = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The contents of a .nomadlicense file encoded as Base64 data.";
    };

    PeriodicUpdateTime = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Time in minutes between periodic background updates.";
    };

    SignInCommand = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a script or other binary to be run after a successful sign in.";
    };

    PFC_SegmentedControl_General = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    UseKeychainPrompt = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows the Sign In window on launch unless the user has a password in the keychain.";
    };

    UseKeychainPromptExlusions = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of users that can ignore the keychain prompt.";
    };

    SignInLogo = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a logo file. The space is 342x90 pixels.";
    };

    TitleSignIn = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Title of the Sign In window.";
    };

    LabelUsername = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The text label for the username field in the Sign In window.";
    };

    LabelPassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The text label for the password field in the Sign In window.";
    };

    DontShowWelcome = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables the showing of the welcome splash screen on launch.";
    };

    AutoAuth = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines if web extensions automatically authenticate via the NoMAD Pro UI.";
    };

    CheckSafariExtension = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines if the user is warned that the NoMAD Pro extension has not been enabled in Safari.";
    };

    MessagePluginDisabled = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Text to show when alerting the user that the Safari plugin has not been enabled.";
    };

    IgnoreDomainReachability = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines if SRV record lookups are used to determine if the AD domain is reachable.";
    };

    LDAPServers = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Specific Domain Controllers to use for AD lookups.";
    };

    KerberosRealm = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Kerberos realm to use to get Kerberos tickets as a side effect of authentication.";
    };

    TicketsOnSignIn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Causes NoMAD Pro to get Kerberos Tickets.";
    };

    KerberosRenew = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines if the Kerberos tickets should be renewed or not.";
    };

    KerberosShortNameAsk = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines if the user is asked to enter their Kerberos short name on first sign in.";
    };

    KerberosShortNameAskMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The message text when asking the user for their Kerberos short name.";
    };

    KerberosShortName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The shortname to use for Kerberos tickets. If unset the sign in name is used.";
    };

    UseKeychain = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines if the Okta password is stored in the user's keychain.";
    };

    LocalPasswordSync = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines if the Okta password is synchronized with the local account.";
    };

    LocalPasswordSyncOnMatchOnly = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Only sync the password if the Okta account name is the same as the local account name.";
    };

    LocalPasswordSyncMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The alert dialog text that the user is presented with when asked to enter in his or her local password.";
    };

    KeychainItems = lib.mkOption {
      type = types.nullOr (types.submodule {
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
      });
      default = null;
      description = "Items to update when the user's local password is updated as well.";
    };

    KeychainItemsDebug = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Updates keychain items on every sign in. Used for debugging.";
    };

    PFC_SegmentedControl_Password = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    ChangePasswordOrder = lib.mkOption {
      type = types.nullOr (types.listOf types.attrs);
      default = null;
      description = "Determines the order and setting for the password change menu. NOT IMPLEMENTED YET, THERE IS NO DOCUMENTATION ON THIS KEY.";
    };

    PasswordChangeCommand = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Script or other binary to run when a password is successfully changed.";
    };

    ChangePasswordTimer = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Time in minutes until the user is prompted to sign in again after a Password Change.";
    };

    WarnOnPasswordExpiration = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines whether NoMAD Pro should warn the user on sign in if the password is about to expire.";
    };

    PasswordExpirationMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines if the countdown before password expiration is shown in the menu.";
    };

    PasswordExpirationMenuDays = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Number of days remaining before the password expiration countdown is shown in the menu bar.";
    };

    ExpirationWarningDays = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Number of days remaining before sending notifications via the Notification Center.";
    };

    ADExpirationShow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows a menu item beneath the current user's name showing the user's password expiration as determined by AD.";
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
      description = "Complexity policy for changing the password via Kerberos.";
    };

    ExportableKey = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows the private key of the user certificate to be exported.";
    };

    X509CA = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "FQDN of the Windows web CA for NoMAD Pro to use for certificates.";
    };

    Template = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Certificate template to request when using the Windows CA.";
    };

    WifiNetworks = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "A list of wireless networks that the certificate created by NoMAD Pro should be associated with.";
    };

    MenuIcon = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a 16x16 pixel image to use as the icon in the menu bar.";
    };

    PFC_SegmentedControl_Menu = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    ActionsUpdateTime = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Number of minutes between updating the Actions Menu.";
    };

    GetHelpType = lib.mkOption {
      type = types.nullOr (types.enum [ "Bomgar" "URL" "App" ]);
      default = null;
      description = "Determines type of GetHelp function";
    };

    GetHelpOptions = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "URL or Path for GetHelpType (<<serial>>, <<fullname>>, <<shortname>> and <<domain>> are currently supported as substitutions)";
    };

    SelfServicePath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "File path for a Self Service application not found automatically.";
    };

    HideAbout = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the About menu item.";
    };

    HideActions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Actions menu item.";
    };

    HideChangePassword = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Change Password menu item.";
    };

    HideGetHelp = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Get Help menu item.";
    };

    HideGetSoftware = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Get Software menu item.";
    };

    HideLockScreen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Lock Screen menu item.";
    };

    HidePreferences = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Preferences menu item.";
    };

    HideSignIn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Sign In menu item.";
    };

    HideQuit = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Quit menu item.";
    };

    MessagePasswordChangePolicy = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Message text when changing password via Kerberos for the AD complexity policy.";
    };

    MenuAbout = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the About item.";
    };

    MenuActions = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the Actions item.";
    };

    MenuChangePassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the Change Password item.";
    };

    MenuGetHelp = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the Get Help item.";
    };

    MenuGetSoftware = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the Get Software item.";
    };

    MenuLockScreen = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the Lock Screen item.";
    };

    MenuPreferences = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the Preferences item.";
    };

    MenuSignIn = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the Sign In item.";
    };

  };
}