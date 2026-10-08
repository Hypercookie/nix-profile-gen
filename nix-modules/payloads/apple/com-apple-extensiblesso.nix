# Auto-generated from ProfileManifests: com.apple.extensiblesso.plist
# Domain: com.apple.extensiblesso
# Title: Extensible Single Sign-On
# Platforms: iOS, macOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Extensible Single Sign-On";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.extensiblesso";
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
        default = [ "ExtensionIdentifier" "Type" "TeamIdentifier" "Hosts" "Realm" "URLs" "DeniedBundleIdentifiers" "ScreenLockedBehavior" "ExtensionData" "AuthenticationMethod" "PlatformSSO" "RegistrationToken" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      ExtensionIdentifier = lib.mkOption {
        type = types.nullOr (types.enum [ "com.apple.AppSSOKerberos.KerberosExtension" "com.microsoft.azureauthenticator.ssoextension" "com.microsoft.CompanyPortalMac.ssoextension" ]);
        default = null;
        description = "The bundle identifier of the app extension that performs SSO for the specified URLs.";
      };

      Type = lib.mkOption {
        type = types.nullOr (types.enum [ "Credential" "Redirect" ]);
        default = null;
        description = "The type of SSO.";
      };

      TeamIdentifier = lib.mkOption {
        type = types.nullOr (types.enum [ "apple" ]);
        default = null;
        description = "The team identifier of the app extension. The device requires this key on macOS and ignores it elsewhere.";
      };

      Hosts = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of host or domain names that apps can authenticate through the app extension.\nRequired for 'Credential' payloads. Ignored for 'Redirect' payloads.\nThe system:\nMatches host or domain names case-insensitively\nRequires that all the host and domain names of all installed Extensible SSO payloads are unique\nNote: Host names that begin with a \".\" are wildcard suffixes that match all subdomains; otherwise the host name needs be an exact match.";
      };

      Realm = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The realm name for 'Credential' payloads. Use proper capitalization for this value. Ignored for 'Redirect' payloads.";
      };

      URLs = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of URL prefixes of identity providers where the app extension performs SSO.\nRequired for 'Redirect' payloads. Ignored for 'Credential' payloads.\nThe URLs need to begin with 'http://' or 'https://'.\nThe system:\nMatches scheme and host name case-insensitively\nDoesn't allow query parameters and URL fragments\nRequires that the URLs of all installed Extensible SSO payloads are unique";
      };

      DeniedBundleIdentifiers = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of bundle identifiers of apps that don't use SSO provided by this extension.";
      };

      ScreenLockedBehavior = lib.mkOption {
        type = types.nullOr (types.enum [ "Cancel" "DoNotHandle" ]);
        default = null;
        description = "If set to 'Cancel', the system cancels authentication requests when the screen is locked. If set to 'DoNotHandle', the request continues without SSO instead. This doesn't apply to requests where 'userInterfaceEnabled' is 'false', or for background 'URLSession' requests.";
      };

      ExtensionData = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            allowAutomaticLogin = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'false', the system doesn't allow saving passwords in the keychain.";
            };
            allowPasswordChange = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'false', the system disables password changes.";
            };
            usePlatformSSOTGT = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the system requires this configuration uses a TGT from Platform SSO instead of requesting a new one.";
            };
            allowPlatformSSOAuthFallback = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true' and 'usePlatformSSOTGT' is 'true', the system allows the user to manually sign in.";
            };
            performKerberosOnly = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the Kerberos Extension handles Kerberos requests only. It doesn't check for password expiration, show the password expiration in the menu, check for external password changes, perform password sync, or retrieve the home directory.";
            };
            cacheName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The GSS name of the Kerberos cache to use. Rarely set by an administrator.";
            };
            certificateUUID = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The PayloadUUID of a PKINIT certificate.";
            };
            credentialBundleIdACL = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "A list of bundle IDs allowed to access the ticket-granting ticket (TGT).";
            };
            credentialUseMode = lib.mkOption {
              type = types.nullOr (types.enum [ "always" "whenNotSpecified" "kerberosDefault" ]);
              default = null;
              description = "This setting affects how other processes use the Kerberos Extension credential. Allowed values:\n'always': The system always uses the credential if the SPN matches the Kerberos Extension 'Hosts' array and the caller hasn't specified another credential. However, the system won't use the credential if the calling app isn't in the 'credentialBundleIDACL'.\n'whenNotSpecified': The system only uses the extension credential if the SPN matches the Kerberos Extension 'Hosts' array. However, the system won't use the credential if the calling app isn't in the 'credentialBundleIDACL'.\n'kerberosDefault': The system uses the default Kerberos processes to select credentials, and normally uses the default Kerberos credential. This is the same as turning off this capability.";
            };
            customUsernameLabel = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The custom user name label used in the Kerberos extension instead of \"Username,\" such as \"Company ID\".";
            };
            delayUserSetup = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the system doesn't prompt the user to setup the Kerberos extension until either the administrator enables it with the 'app-sso' tool or the system receives a Kerberos challenge.";
            };
            helpText = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The text to display to the user at the bottom of the Kerberos Login Window. You can also use this to display help information or disclaimer text.";
            };
            isDefaultRealm = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Specifies whether this is the default realm if there's more than one Kerberos extension configuration.";
            };
            includeManagedAppsInBundleIdACL = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the Kerberos extension allows only managed apps to access and use the credential. This is in addition to the 'credentialBundleIDACL', if you specify that value.";
            };
            includeKerberosAppsInBundleIdACL = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the Kerberos extension allows the standard Kerberos utilities including 'TicketViewer' and 'klist' to access and use the credential. This is in addition to 'includeManagedAppsInBundleIdACL' or the 'credentialBundleIdACL', if you specify those values.";
            };
            monitorCredentialsCache = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'false', the system requests the credential on the next matching Kerberos challenge or network state change. If the credential is expired or missing, the system creates a new one.";
            };
            principalName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The principal (username) to use. You don't need to include the realm.";
            };
            preferredKDCs = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "The ordered list of preferred Key Distribution Centers (KDCs) to use for Kerberos traffic. Use this if the servers aren't discoverable through DNS. If you specify the servers, the system uses them for both connectivity checks and attempts to use them first for Kerberos traffic. If the servers don't respond, the device falls back to DNS discovery. Format each entry the same as it would be in a 'krb5.conf' file, for example:\n'adserver1.example.com'\n'tcp/adserver1.example.com:88'\n'kkdcp://kerberosproxy.example.com:443/kkdcp'";
            };
            pwChangeURL = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "This URL will launch in the user's default web browser when they initiate a password change.";
            };
            pwNotificationDays = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The number of days prior to password expiration when the system sends a notification of password expiration to the user.";
            };
            pwExpireOverride = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The number of days that the system allows using passwords on this domain. For most domains, this calculation is automatic.";
            };
            pwReqComplexity = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the system requires passwords to meet Active Directory's definition of \"complex\".";
            };
            pwReqHistory = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The number of prior passwords that the system disallows reuse on this domain.";
            };
            pwReqLength = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The minimum length of passwords on the domain.";
            };
            pwReqMinAge = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The minimum age of passwords before the system allows changing them on this domain.";
            };
            pwReqText = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The text version of the domain's password requirements. Only for use if 'pwReqComplexity' or 'pwReqLength' aren't specified.";
            };
            pwReqRTFData = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The RTF file formatted version of the domain's password requirements. Only for use if 'pwReqComplexity' or 'pwReqLength' aren't specified.";
            };
            replicationTime = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The time, in seconds, required to replicate changes in the Active Directory domain. The Kerberos extension uses this when checking password age after a change.";
            };
            requireTLSForLDAP = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Require that LDAP connections use TLS.";
            };
            requireUserPresence = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the system requires the user to provide Touch ID, Face ID or their passcode to access the keychain entry.";
            };
            siteCode = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The name of the Active Directory site the Kerberos extension should use. Most administrators don't need to modify this value, as the Kerberos extension can normally find the site automatically.";
            };
            syncLocalPassword = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'false', the system disables password sync. Note that this will not work if the user is logged in with a mobile account.";
            };
            useSiteAutoDiscovery = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'false', the Kerberos extension doesn't automatically use LDAP and DNS to determine its AD site name.";
            };
            domainRealmMapping = lib.mkOption {
              type = types.nullOr (types.submodule {
                options = {
                  Realm = lib.mkOption {
                    type = types.nullOr (types.listOf (types.str));
                    default = null;
                    description = "The key should be the name of the realm, and the value is an array of DNS suffixes that map to the realm.";
                  };
                };
              });
              default = null;
              description = "A custom domain-realm mapping for Kerberos. The system uses this when the DNS name of hosts doesn't match the realm name. Most administrators don't need to customize this.";
            };
            Enable_SSO_On_All_ManagedApps = lib.mkOption {
              type = types.nullOr (types.enum [ 0 1 ]);
              default = null;
              description = "Enable SSO on All Managed Apps";
            };
            AppAllowList = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Enable SSO for specific apps";
            };
            AppPrefixAllowList = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Enable SSO for all apps with a specific bundle ID prefix";
            };
            AppBlockList = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Disable SSO for specific apps";
            };
            AppCookieSSOAllowList = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Enable SSO through cookies for a specific application";
            };
            browser_sso_interaction_enabled = lib.mkOption {
              type = types.nullOr (types.enum [ 0 1 ]);
              default = null;
              description = "Allow Users to Sign in from Unknown Applications using the Safari Browser";
            };
            browser_sso_disable_mfa = lib.mkOption {
              type = types.nullOr (types.enum [ 0 1 ]);
              default = null;
              description = "Disable Asking for MFA During Initial Bootstrapping";
            };
            disable_explicit_app_prompt = lib.mkOption {
              type = types.nullOr (types.enum [ 0 1 ]);
              default = null;
              description = "Disable OAuth2 Application Prompts";
            };
            disable_explicit_app_prompt_and_autologin = lib.mkOption {
              type = types.nullOr (types.enum [ 0 1 ]);
              default = null;
              description = "Disable OAuth2 Application Prompts and Autologin";
            };
            identityIssuerAutoSelectFilter = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "A string with wildcards that can use used to filter the list of available SmartCards by issuer. e.g \"*My CA2*\". If there's one remaining, it will be auto-selected. If there more than one remaining, then the list is shorter.";
            };
            allowSmartCard = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', allow the user to switch the user interface to SmartCard mode.";
            };
            allowPassword = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', allow the user to switch the user interface to Password mode.";
            };
            startInSmartCardMode = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the user interface will start in SmartCard mode.";
            };
          };
        });
        default = null;
        description = "A dictionary of arbitrary data passed through to the app extension.";
      };

      AuthenticationMethod = lib.mkOption {
        type = types.nullOr (types.enum [ "Password" "UserSecureEnclaveKey" "SmartCard" "OpenID" ]);
        default = null;
        description = "The Platform SSO authentication method the extension uses. Requires that the SSO Extension also supports the method. Don't use this. Use the 'AuthenticationMethod' key in the 'PlatformSSO' dictionary instead.";
      };

      PlatformSSO = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            AuthenticationMethod = lib.mkOption {
              type = types.nullOr (types.enum [ "Password" "UserSecureEnclaveKey" "SmartCard" "OpenID" ]);
              default = null;
              description = "The Platform SSO authentication method to use with the extension. Requires that the SSO Extension also support the method. 'OpenID' is available in macOS 27 and later.";
            };
            UseSharedDeviceKeys = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the system uses the same signing and encryption keys for all users. Only supported on the device channel.";
            };
            AccountDisplayName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The display name for the account in notifications and authentication requests.";
            };
            LoginFrequency = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The duration, in seconds, until the system requires a full login instead of a refresh. The default value is 64,800 (18 hours). The minimum value is 3600 (1 hour).";
            };
            EnableCreateUserAtLogin = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Enables creating users at the Login Window with an 'AuthenticationMethod' of either 'Password' or 'SmartCard'. Requires that 'UseSharedDeviceKeys' is 'true'.";
            };
            EnableAuthorization = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Enables using identity provider accounts at authorization prompts. Requires that 'UseSharedDeviceKeys' is 'true'. The system assigns groups using 'AdministratorGroups', 'AdditionalGroups', or 'AuthorizationGroups'.";
            };
            TokenToUserMapping = lib.mkOption {
              type = types.nullOr (types.submodule {
                options = {
                  AccountName = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The claim name to use for the user's account name.";
                  };
                  FullName = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The claim name to use for the user's full name.";
                  };
                };
              });
              default = null;
              description = "The attribute mapping to use when creating users, or for authorization.";
            };
            NewUserAuthorizationMode = lib.mkOption {
              type = types.nullOr (types.enum [ "Standard" "Admin" "Groups" "Temporary" ]);
              default = null;
              description = "The permission to apply to newly created accounts at login. Allowed values:\n'Standard': The account is a standard user.\n'Admin': The system adds the account to the local administrators group.\n'Groups': The system assigns groups to the account using 'AdministratorGroups', 'AdditionalGroups', or 'AuthorizationGroups'.\n'Temporary': The system uses a temporary session configuration for newly created accounts at login.";
            };
            UserAuthorizationMode = lib.mkOption {
              type = types.nullOr (types.enum [ "Standard" "Admin" "Groups" ]);
              default = null;
              description = "The permission to apply to an account each time the user authenticates. Allowed values:\n'Standard': The account is a standard user.\n'Admin': The system adds the account to the local administrators group.\n'Groups': The system assigns group to the account using 'AdministratorGroups', 'AdditionalGroups', or 'AuthorizationGroups'.";
            };
            AdministratorGroups = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "The list of groups to use for administrator access. The system requests membership during authentication.";
            };
            AdditionalGroups = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "The list of created groups that don't have administrator access.";
            };
            AuthorizationGroups = lib.mkOption {
              type = types.nullOr (types.submodule {
                options = {
                  __key__ = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                  };
                  __value__ = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The key is an access right value, the value is the group to be associated with that access right.";
                  };
                };
              });
              default = null;
              description = "The pairing of Authorization Rights to group names. When using this, the system updates the Authorization Right to use the group.";
            };
            FileVaultPolicy = lib.mkOption {
              type = types.nullOr (types.listOf (types.enum [ "AttemptAuthentication" "RequireAuthentication" "AllowOfflineGracePeriod" "AllowAuthenticationGracePeriod" "RequireTouchID" "RequireTouchIDOrWatch" "AllowOpenIDForTouchIDFallback" ]));
              default = null;
              description = "The policy to apply when using Platform SSO at FileVault unlock on a Mac with Apple silicon.\n'AttemptAuthentication': The device attempts Platform SSO authentication before proceeding. If offline, unlock continues if the local account password matches. If online and the credential is incorrect, then the device requires a successful Platform SSO authentication is required, even if taken offline. Only use when 'AuthenticationMethod' is 'Password'.\n'RequireAuthentication': The device requires Platform SSO authentication before proceeding. If the device is offline and 'AllowOfflineGracePeriod' is enabled, then the device uses the offline 'OfflineGracePeriod' to determine if the user can proceed or not. If online and the credential is incorrect, then the device requires a valid Platform SSO authentication to proceed, regardless of the 'OfflineGracePeriod'. If the account isn't registered for Platform SSO and 'AllowAuthenticationGracePeriod' is enabled, then the device uses 'AuthenticationGracePeriod' to determine if the user can proceed or not. Only use when 'AuthenticationMethod' is 'Password'.\n'AllowOfflineGracePeriod': The device allows the use of the 'OfflineGracePeriod'. If 'AllowOfflineGracePeriod' isn't set, then the device denies offline access. Only use when 'AuthenticationMethod' is 'Password' and 'RequireAuthentication' is enabled, or 'AuthenticationMethod' is 'OpenID'.\n'AllowAuthenticationGracePeriod': The device allows the use of the 'AuthenticationGracePeriod' for other local accounts when 'RequireAuthentication' is enabled. The 'AuthenticationGracePeriod' starts when any of the policies are updated. If 'AllowAuthenticationGracePeriod' isn't set, then the device denies unregistered account access. Only use when 'AuthenticationMethod' is 'Password'.\n'RequireTouchID': The device requires the use of Touch ID (and not Apple Watch) for FileVault unlock. Only use when 'AuthenticationMethod' is 'Password' or 'UserSecureEnclaveKey'.\n'RequireTouchIDOrWatch': The device requires the use of Touch ID or Apple Watch for FileVault unlock. Only use when 'AuthenticationMethod' is 'Password' or 'UserSecureEnclaveKey'.\n'AllowOpenIDForTouchIDFallback': The device allows web login as a fallback if Touch ID fails or isn't available. Only use when 'AuthenticationMethod' is 'Password' or 'UserSecureEnclaveKey'.";
            };
            LoginPolicy = lib.mkOption {
              type = types.nullOr (types.listOf (types.enum [ "AttemptAuthentication" "RequireAuthentication" "AllowOfflineGracePeriod" "AllowAuthenticationGracePeriod" "RequireTouchID" "RequireTouchIDOrWatch" "AllowOpenIDForTouchIDFallback" ]));
              default = null;
              description = "The policy to apply when using Platform SSO at the Login Window.\n'AttemptAuthentication': The device attempts Platform SSO authentication before proceeding. If offline, login continues if the local account password matches. If online and the credential is incorrect, then the device requires a successful Platform SSO authentication to proceed, even if taken offline. Only use when 'AuthenticationMethod' is 'Password'.\n'RequireAuthentication': The device requires Platform SSO authentication before proceeding. If the device is offline and 'AllowOfflineGracePeriod' is enabled, then the device uses the offline 'OfflineGracePeriod' to determine if the user can proceed or not. If online and the credential is incorrect, then the device requires a valid Platform SSO authentication to proceed, regardless of the 'OfflineGracePeriod'. If the account isn't registered for Platform SSO and 'AllowAuthenticationGracePeriod' is enabled, then the device uses the 'AuthenticationGracePeriod' to determine if the user can proceed or not. Only use when 'AuthenticationMethod' is 'Password'.\n'AllowOfflineGracePeriod': The device allows the use of the 'OfflineGracePeriod'. If 'AllowOfflineGracePeriod' isn't set, then the device denies offline access. Only use when 'AuthenticationMethod' is 'Password' and 'RequireAuthentication' is enabled, or 'AuthenticationMethod' is 'OpenID'.\n'AllowAuthenticationGracePeriod': The device allows the use of the 'AuthenticationGracePeriod' for other local accounts when 'RequireAuthentication' is enabled. The 'AuthenticationGracePeriod' starts when any of the policies have been updated. If 'AllowAuthenticationGracePeriod' isn't set, then the device denies unregistered account access. Only use when 'AuthenticationMethod' is 'Password'.\n'RequireTouchID': The device requires the use of Touch ID (and not Apple Watch) for login. Only use when 'AuthenticationMethod' is 'Password' or 'UserSecureEnclaveKey'.\n'RequireTouchIDOrWatch': The device requires the use of Touch ID or Apple Watch for login. Only use when 'AuthenticationMethod' is 'Password' or 'UserSecureEnclaveKey'.\n'AllowOpenIDForTouchIDFallback': The device allows web login as fallback if Touch ID fails or isn't available. Only use when 'AuthenticationMethod' is 'Password' or 'UserSecureEnclaveKey'.";
            };
            UnlockPolicy = lib.mkOption {
              type = types.nullOr (types.listOf (types.enum [ "AttemptAuthentication" "RequireAuthentication" "AllowOfflineGracePeriod" "AllowAuthenticationGracePeriod" "AllowTouchIDOrWatchForUnlock" "RequireTouchID" "RequireTouchIDOrWatch" "AllowOpenIDForTouchIDFallback" ]));
              default = null;
              description = "The policy to apply when using Platform SSO at screensaver unlock.\n'AttemptAuthentication': The device attempts Platform SSO authentication before proceeding. If offline, unlock will continue if the local account password matches. If online and the credential is incorrect, then the device requires a successful Platform SSO authentication to proceed, even if taken offline. Only use when 'AuthenticationMethod' is 'Password'.\n'RequireAuthentication': The device requires Platform SSO authentication before proceeding. If the device is offline and 'AllowOfflineGracePeriod' is enabled, then the offline 'OfflineGracePeriod' is used to determine if the user can proceed or not. If online and the credential is incorrect, then the device requires a valid Platform SSO authentication to proceed regardless of the 'OfflineGracePeriod'. If the account isn't registered for Platform SSO and 'AllowAuthenticationGracePeriod' is enabled, then the device uses 'AuthenticationGracePeriod' to determine if the user can proceed or not. Only use when 'AuthenticationMethod' is 'Password'.\n'AllowOfflineGracePeriod': The device allows the use of the 'OfflineGracePeriod'. If 'AllowOfflineGracePeriod' isn't set, then the device denies offline access. Only use when 'AuthenticationMethod' is 'Password' and 'RequireAuthentication' is enabled, or 'AuthenticationMethod' is 'OpenID'.\n'AllowAuthenticationGracePeriod': The device allows the use of the 'AuthenticationGracePeriod' for other local accounts when 'RequireAuthentication' is enabled. The 'AuthenticationGracePeriod' starts when any of the policies have been updated. If 'AllowAuthenticationGracePeriod' isn't set, then the device denies the unregistered account access. Only use when 'AuthenticationMethod' is 'Password'.\n'AllowTouchIDOrWatchForUnlock': The device allows Touch ID or Apple Watch to unlock the screensaver instead of Platform SSO authentication when 'RequireAuthentication' is enabled. Only use when 'AuthenticationMethod' is 'Password'.\n'RequireTouchID': The device requires the use of Touch ID (and not Apple Watch) for unlock. Only use when 'AuthenticationMethod' is 'Password' or 'UserSecureEnclaveKey'.\n'RequireTouchIDOrWatch': The device requires the use of Touch ID or Apple Watch for unlock. Only use when 'AuthenticationMethod' is 'Password' or 'UserSecureEnclaveKey'.\n'AllowOpenIDForTouchIDFallback': The device allows web login as fallback if Touch ID fails or isn't available. Only use when 'AuthenticationMethod' is 'Password' or 'UserSecureEnclaveKey'.";
            };
            OfflineGracePeriod = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The amount of time (in seconds) after the last successful Platform SSO login for using a local account password offline. Required when setting 'AllowOfflineGracePeriod'.";
            };
            AuthenticationGracePeriod = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The amount of time (in seconds) after receiving or updating a 'FileVaultPolicy', 'LoginPolicy', or 'UnlockPolicy' that the system can use unregistered local accounts. Required when 'AllowAuthenticationGracePeriod' is set.";
            };
            NonPlatformSSOAccounts = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "The list of local accounts that aren't subject to the 'FileVaultPolicy', 'LoginPolicy', or 'UnlockPolicy'. The accounts don't receive a prompt to register for Platform SSO.";
            };
            AllowDeviceIdentifiersInAttestation = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the system includes the device UDID and serial number in Platform SSO attestations.";
            };
            EnableCreateFirstUserDuringSetup = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the device uses Platform SSO to create the first user account on the Mac during 'Setup Assistant'.";
            };
            NewUserAuthenticationMethods = lib.mkOption {
              type = types.nullOr (types.listOf (types.enum [ "Password" "SmartCard" "AccessKey" "OpenID" ]));
              default = null;
              description = "The set of authentication methods to use for newly created accounts at login or during 'Setup Assistant'. The system uses 'Password' and 'SmartCard' if this key isn't present.";
            };
            AccessKeyReaderGroupIdentifier = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The reader group identifier for use with the 'AccessKey'. The value needs to match the configured access key. Required if 'NewUserAuthenticationMethods' contains 'AccessKey'.";
            };
            AccessKeyTerminalIdentityUUID = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The 'PayloadUUID' of an identity payload to use as the 'Terminal' identity of the access key. The identity needs to be trusted by the access key. Required if 'NewUserAuthenticationMethods' includes 'AccessKey'. Allowed identity payload types:\n'com.apple.security.pkcs12'\n'com.apple.security.acme'\n'com.apple.security.scep'";
            };
            AccessKeyReaderIssuerCertificateUUID = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The 'PayloadUUID' of a certificate payload for the issuer certificate of the 'Terminal' identity of the access key. Other specifications refer to the key as the \"Reader CA Public Key\". The key must be an elliptic curve key. Required if 'NewUserAuthenticationMethods' includes 'AccessKey'. The issuer of the Terminal identity of the access key needs to match this certificate, otherwise the device fails the authentication.";
            };
            AllowAccessKeyExpressMode = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the system uses the access key in express mode, and doesn't require authentication before use.";
            };
            SynchronizeProfilePicture = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the system requests the user's profile picture from the SSO extension.";
            };
            TemporarySessionQuickLogin = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the system uses a quicker Authenticated Guest Mode login to Mac behavior. The system erases user data from only select locations in the user home directory after each session completes. Once every eight hours the system erases the full user home directory after a session completes. Turn this on for shared environments that have a high frequency of short sessions.";
            };
            EnableRegistrationDuringSetup = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the system enables the PlatformSSO registration process during Setup Assistant on devices running macOS 26 and later. Set this key to 'true' when configuring PlatformSSO before enrollment using the 'com.apple.psso.required' error response.";
            };
            WebLoginURLAllowList = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "The set of allowed hosts that the system can load in the PSSO web view. Required if 'AuthenticationMethod' is 'OpenID', or 'NewUserAuthenticationMethods' contains 'OpenID'.";
            };
            AllowWebLoginPasswordSync = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'true', the system detects the password during web login and synchronizes it to the local account password for the user.";
            };
          };
        });
        default = null;
        description = "The dictionary to configure Platform SSO. Requires setting 'Type' to 'Redirect'.";
      };

      RegistrationToken = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The token this device uses for registration with Platform SSO. Use it for silent registration with the Identity Provider. Requires that 'AuthenticationMethod' in 'PlatformSSO' isn't empty.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-extensiblesso" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Extensible Single Sign-On (com.apple.extensiblesso) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}