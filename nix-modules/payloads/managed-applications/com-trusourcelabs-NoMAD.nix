# Auto-generated from ProfileManifests: com.trusourcelabs.NoMAD.plist
# Domain: com.trusourcelabs.NoMAD
# Title: NoMAD
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-trusourcelabs-NoMAD" = {
    enable = lib.mkEnableOption "NoMAD";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.trusourcelabs.NoMAD";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    ADDomain = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Defines the AD domain you're working with.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    LDAPType = lib.mkOption {
      type = types.nullOr (types.enum [ "OD" ]);
      default = "OD";
      description = "LDAP Type";
    };

    LDAPOverSSL = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "LDAP Over SSL";
    };

    LDAPAnonymous = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Anonymous LDAP";
    };

    LDAPOnly = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "LDAP Only";
    };

    LDAPServerList = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "LDAP Server List";
    };

    CustomLDAPAttributes = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Custom LDAP Attributes";
    };

    HomeAppendDomain = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Append Domain to User Home";
    };

    RecursiveGroupLookup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Recursive Group Lookup";
    };

    KerberosRealm = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Kerberos Realm";
    };

    RenewTickets = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Renew Kerberos Tickets";
    };

    SecondsToRenew = lib.mkOption {
      type = types.nullOr (types.int);
      default = 3600;
      description = "Seconds To Renew Kerberos Tickets";
    };

    UserSwitch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use Active User";
    };

    DontMatchKerbPrefs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Don't Match Kerberos Preferences";
    };

    ConfigureChrome = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Configure Chrome";
    };

    ConfigureChromeDomain = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Configure Chrome Domain";
    };

    UseKeychain = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use Keychain";
    };

    LocalPasswordSync = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Local Password Sync";
    };

    LocalPasswordSyncOnMatchOnly = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Only Sync Local Password on Match";
    };

    LocalPasswordSyncDontSyncLocalUsers = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Local Users to Not Sync Password";
    };

    LocalPasswordSyncDontSyncNetworkUsers = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Network Users to Not Sync Password";
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
      description = "Keychain Items";
    };

    KeychainItemsDebug = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Keychain Items Debugging";
    };

    HicFix = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable High Sierra Fix";
    };

    PFC_SegmentedControl_Password = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    PasswordPolicy = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          minLength = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Minimum password length";
          };
          minLowerCase = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Minimum # of lowercase letters required in password";
          };
          minUpperCase = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Minimum # of uppercase letters required in password";
          };
          minNumber = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Minimum # of numbers required in password";
          };
          minSymbol = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Minimum # of symbols required in password";
          };
          minMatches = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Minimum # of password policies that must be met (not including length)";
          };
        };
      });
      default = null;
      description = "Complexity policy for changing the password via Kerberos.";
    };

    ChangePasswordCommand = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Change Password Command";
    };

    ChangePasswordType = lib.mkOption {
      type = types.nullOr (types.enum [ "Kerberos" "Task" "App" "URL" "None" ]);
      default = null;
      description = "Type of the ChangePassword function.";
    };

    ChangePasswordOptions = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Task, URL or App path for ChangePasswordType. (<<serial>>, <<fullname>>, <<shortname>> and <<domain>> are currently supported as substitutions)";
    };

    HideExpiration = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hide Password Expiration";
    };

    HideExpirationMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Message text to show in the menu bar when the password countdown has been suppressed.";
    };

    PasswordExpireAlertTime = lib.mkOption {
      type = types.nullOr (types.int);
      default = 1296000;
      description = "Number of seconds before a user's password expiration that an alert is shown. (Set to 0 to never be bothered. Defaults to 15 days or 1,296,000 seconds.)";
    };

    PasswordExpireCustomAlert = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Password Expiration Custom Alert";
    };

    PasswordExpireCustomWarnTime = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Number of days remaining before the custom alert is shown, and in yellow.";
    };

    PasswordExpireCustomAlertTime = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Number of days remaining before the custom alert is shown, and in red.";
    };

    UPCAlert = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Alerts the user to Unannounced Password Changes, typically when the password was changed in AD and not from the user's system.";
    };

    MessageUPCAlert = lib.mkOption {
      type = types.nullOr (types.str);
      default = "Your password was changed elsewhere.";
      description = "Message to be shown in an UPCAlert notification.";
    };

    UPCAlertAction = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a script or other binary to execute when a UPC Alert occurs.";
    };

    GetCertificateAutomatically = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Automatically request a certificate for a user when they don't have a valid certificate in the keychain.";
    };

    AutoRenewCert = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Number of days until the certificate expires before automatically renewing it.";
    };

    ExportableKey = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows the private key from any NoMAD generated certificate to be exported.";
    };

    CleanCerts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Automatically remove extra certificates from the user's keychain. This will leave the 2 newest and the 2 oldest certificates.";
    };

    X509CA = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "FQDN of the Windows web CA for NoMAD to use for certificates.";
    };

    Template = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Certificate template to request when using the Windows CA.";
    };

    WifiNetworks = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "A list of wireless networks that the certificate created by NoMAD should be associated with.";
    };

    LightsOutIKnowWhatImDoing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Removes the icon from the menu bar. Note that NoMAD still is in the menu bar, just with no icon and taking up less space.";
    };

    PFC_SegmentedControl_Menu = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    MountSharesWithFinder = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use the Finder instead of the API for automounted file shares.";
    };

    GetHelpType = lib.mkOption {
      type = types.nullOr (types.enum [ "Bomgar" "URL" "App" ]);
      default = null;
      description = "Determines type of GetHelp function.";
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

    HideGetSoftware = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Get Software menu item.";
    };

    HideHelp = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Get Help menu item.";
    };

    ShowHome = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows the Home Directory share menu item.";
    };

    HideLockScreen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Lock Screen menu item.";
    };

    HidePrefs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables the Preferences menu item.";
    };

    HideQuit = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Quit menu item.";
    };

    HideRenew = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Renew Tickets menu item.";
    };

    HideSignOut = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Sign Out menu item.";
    };

    PersistExpiration = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows the password expiration countdown even when the user is not logged into the domain.";
    };

    MessageNotConnected = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Message text to show in the menu bar when NoMAD is not connected to the AD domain.";
    };

    MessagePasswordChangePolicy = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Message text to display in the password change dialog to help the user understand how complex they need to be.";
    };

    MessageLocalSync = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Message text for when a user is asked for their local password to sync their network password to their local account.";
    };

    MenuAbout = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the About item.";
    };

    MenuChangePassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the Change Password item.";
    };

    MenuFileServers = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the File Servers item.";
    };

    MenuGetCertificate = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the Get Certificate item.";
    };

    MenuGetSoftware = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the Get Software item.";
    };

    MenuGetHelp = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the Get Help item.";
    };

    MenuHomeDirectory = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the Home Directory item.";
    };

    MenuRenewTickets = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the Renew Tickets item.";
    };

    MenuUserName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the user name item before a user logs in.";
    };

    MenuPasswordExpires = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Menu item text for the password expiration item before a user logs in.";
    };

    CaribouTime = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Changes the icon set to Carrie the Caribou.";
    };

    IconOn = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a 16x16 pixel image to use as the icon in the menu bar when NoMAD is connected.";
    };

    IconOff = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a 16x16 pixel image to use as the icon in the menu bar when NoMAD is not connected.";
    };

    IconOnDark = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a 16x16 pixel image to use as the icon in the menu bar when NoMAD is connected in dark mode.";
    };

    IconOffDark = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a 16x16 pixel image to use as the icon in the menu bar when NoMAD is not connected in dark mode.";
    };

    Verbose = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables verbose logging.";
    };

    LoginItem = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Adds NoMAD to the user's start up items.";
    };

    SignInCommand = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a script or command to be run after a successful sign in.";
    };

    SignOutCommand = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a script or other binary to be run on sign out.";
    };

    StateChangeAction = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a script that will be launched on network changes.";
    };

    AutoConfigure = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Keyword to determine what auto configuration scheme to use.";
    };

    PFC_SegmentedControl_General = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    DontShowWelcome = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the Welcome window on first launch.";
    };

    DontShowWelcomeDefaultOn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows the Welcome Screen, but checks the \"Don't show again\" box by default. Useful for when you want to show the Welcome screen only once.";
    };

    MenuWelcome = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a folder containing an index.html file and associated resources for displaying as a Welcome window.";
    };

    SignInWindowOnLaunch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows the Sign In window on launch.";
    };

    UseKeychainPrompt = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows the Sign In window on launch unless the user has a password in the keychain.";
    };

    SignInWindowAlert = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Makes the Sign In window the foremost window when a user is not signed in.";
    };

    SignInWindowAlertTime = lib.mkOption {
      type = types.nullOr (types.int);
      default = 360;
      description = "Time in seconds between the SignInWindowAlert making the Sign In window the foremost window.";
    };

    TitleSignIn = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Title of the Sign In window.";
    };

    SignInWindowOnLaunchExclusions = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Local users that will not be shown the Sign In window automatically.";
    };

  };
}