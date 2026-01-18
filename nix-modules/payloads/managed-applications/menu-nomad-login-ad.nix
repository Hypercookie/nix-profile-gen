# Auto-generated from ProfileManifests: menu.nomad.login.ad.plist
# Domain: menu.nomad.login.ad
# Title: NoMAD Login
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-menu-nomad-login-ad" = {
    enable = lib.mkEnableOption "NoMAD Login";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "menu.nomad.login.ad";
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

    DenyLocal = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Deny Local Users";
    };

    DenyLocalExcluded = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Deny Local User Exclusions";
    };

    DenyLoginUnlessGroupMember = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Allowed Group Membership User Logins";
    };

    RecursiveGroupLookup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If set to yes, group membership lookups should be done recursively";
    };

    Migrate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If yes, migrate users";
    };

    MigrateUsersHide = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Hidden Migration User";
    };

    PasswordOverwriteSilent = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Password Overwrite Silent";
    };

    PasswordOverwriteOptional = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Password Overwrite Optional";
    };

    LocalFallback = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Local Fallback";
    };

    LDAPServers = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of LDAP servers that you would like to use for AD authentication instead of using SRV record lookup.";
    };

    LDAPOverSSL = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines if NoMAD Login uses LDAP over SSL.";
    };

    AdditionalADDomains = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of domains to append at the loginwindow. If not set, the standard Managed Domain policy will apply.";
    };

    AdditionalADDomainList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of LDAP servers to display in the pulldown menu in the Login Window. Users can select a domain from the menu and then only enter the shortname in the text field.";
    };

    NTtoADDomainMappings = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          TextFields = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                ntname = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "NT Name";
                };
                addomain = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "AD Domain";
                };
              };
            }));
            default = null;
            description = "NT to AD Domain Mappings";
          };
        };
      });
      default = null;
      description = "Maps NT to AD Domains. e.g. NOMAD: nomad.menu, would allow a user to sign in as \"NOMAD\\user\" and that would be converted to \"user@nomad.menu\" before authenticating to AD.";
    };

    AliasNTName = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Alias NT Name";
    };

    AliasUPN = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Alias User Principal Name";
    };

    IgnoreSites = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Ignore Sites";
    };

    EULATitle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Text for the large title in the EULA window.";
    };

    EULASubTitle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Text for a subtitle in the EULA window.";
    };

    EULAText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Text to present in the EULA window.";
    };

    EULAPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to save acceptance records to.";
    };

    CreateAdminUser = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will place any local user created at login by NoMAD Login in the local admin group.";
    };

    CreateAdminIfGroupMember = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of groups that should have its members created as local administrators.";
    };

    UseCNForFullName = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use the the user's CN from AD instead of attempting to create the user name from the first and last name attributes of the user's AD record.";
    };

    UseCNForFullNameFallback = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Uses the CN as the fullname on the account when the givenName and sn fields are blank";
    };

    UserProfileImage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to an image to set as the user profile image.";
    };

    DemobilizeUsers = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will convert a previously cached mobile account from AD into a regular local user account on login.";
    };

    DemobilizeSaveAltSecurityIdentities = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If true, the AltSecurityIdentities user record attribute should be preserved, useful when moving from mobile accounts with smart card mapping implemented.";
    };

    DemobilizeForcePasswordCheck = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If true, a password input at the NoMAD login window will be required to demobilize";
    };

    UserInputOutputPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path where the userinfo.plist will be written.";
    };

    UserInputLogo = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a logo file to use for the UserInput mechanism.";
    };

    UserInputTitle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Title for the UserInput mechanism.";
    };

    UserInputMainText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Text for the UserInput mechanism.";
    };

    UserInputUI = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          TextFields = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                title = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Title";
                };
                placeholder = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Placeholder";
                };
              };
            }));
            default = null;
            description = "User Input Text Fields";
          };
          PopUps = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                title = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Title";
                };
                items = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Items";
                };
              };
            }));
            default = null;
            description = "User Input Pop Ups";
          };
          Button = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                title = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Button";
                };
                enabled = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "Button Enabled";
                };
              };
            });
            default = null;
          };
        };
      });
      default = null;
      description = "UI elements shown during the UserInput mechanism.";
    };

    EnableFDE = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "On systems using the APFS filesystem, this key will enable FileVault encryption as the user is signing in for the first time.";
    };

    EnableFDERecoveryKey = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Write the output of the fdesetup command to /var/db/.NoMADFDESetup";
    };

    EnableFDERecoveryKeyPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "FileVault Recovery Key Path";
    };

    EnableFDERekey = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "FileVault Personal Recovery Key Rotation";
    };

    LoginScreen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If set to yes, a macOS-style loginscreen will be presented instead of the NoMAD Login loginwindow style.";
    };

    UsernameFieldPlaceholder = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Placeholder text to show in the username textfield.";
    };

    LoginLogo = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to the logo to display on the login screen. If set to NONE, no logo will be shown.";
    };

    LoginLogoData = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Logo to display on the login screen.";
    };

    LoginLogoAlpha = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 4 5 6 7 8 9 10 ]);
      default = null;
      description = "Alpha value of the logo image.";
    };

    BackgroundImage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to the background image to be used.";
    };

    BackgroundImageData = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Background to display on the login screen.";
    };

    BackgroundImageAlpha = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 4 5 6 7 8 9 10 ]);
      default = null;
      description = "Alpha value of the background image.";
    };

    AllowNetworkSelection = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, the network selection button is shown";
    };

    DefaultSystemInformation = lib.mkOption {
      type = types.nullOr (types.enum [ "None" "Serial" "MAC" "Hostname" "ComputerName" "SystemVersion" "IP" ]);
      default = null;
      description = "Defines which system information should be showed on login window, by default";
    };

    PowerControlDisabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If set to yes, hides the shutdown and restart buttons";
    };

    ManageSecureTokens = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This key will enable SecureToken management capabilites in NomadLogin 1.4. This utilizes a service account which can be modified from default using the below optional preferences.";
    };

    SecureTokenManagementEnableOnlyAdminUsers = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, the SecureToken service account will only enable administrative users created with NoMAD Login.";
    };

    SecureTokenManagementIconPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Secure Token Icon Path";
    };

    SecureTokenManagementOnlyEnableFirstUser = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, NoMAD Login will only enable the first user that is eligable for a SecureToken, and delete the service account afterwards.";
    };

    SecureTokenManagementFullName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Service Account Full Name";
    };

    SecureTokenManagementUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Service Account UID";
    };

    SecureTokenManagementPasswordLocation = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Service Account Password Storage Path";
    };

    SecureTokenManagementPasswordLength = lib.mkOption {
      type = types.nullOr (types.enum [ 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 ]);
      default = null;
      description = "Defines a custom SecureToken service account password length.";
    };

    SecureTokenManagementUsername = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Service Account User Name";
    };

    MessagePasswordSync = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Message to show when the password needs to sync";
    };

    ScriptPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Script Path";
    };

    ScriptArgs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Script Arguments";
    };

    UIDTool = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "String to determine the path of an executable that is run when a new user is created. It is expected to return the UID that the user should be created with. It passes in the new users username as the first argument, default is to use the built in functionality";
    };

    GUIDTool = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "String to determine the path of an executable that is run when a new user is created. It is expected to return the GUID that the user should be created with. It passes in the new users username as the first argument, default is to use the built in functionality";
    };

    NotifyLogStyle = lib.mkOption {
      type = types.nullOr (types.enum [ "none" "jamf" "filewave" "munki" ]);
      default = null;
      description = "Adds the appropriate log file to the the Notify mechanism.";
    };

    KeychainCreate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Create keychain if it does not exist.";
    };

    KeychainAddNoMAD = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Add a NoMAD entry into the keychain.";
    };

    CustomNoMADLocation = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If defined it specifies the custom location of the application to be given access to the keychain item.";
    };

    LastUser = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Shortname of the last user to login. This allows NoMAD to login on first launch.";
    };

    KeychainReset = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Reset keychain if login password doesn't match.";
    };

    GuestUser = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows guest users login";
    };

    GuestUserAccounts = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of names that can be entered into the username field to trigger a guest user creation";
    };

    GuestUserAccountPasswordPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The path to write out the guest users randomly generated password";
    };

    GuestUserFirst = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Defines the first name of the guest user account";
    };

    GuestUserLast = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Defines the last name of the guest user account";
    };

  };
}