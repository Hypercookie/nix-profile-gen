# Auto-generated from ProfileManifests: com.twocanoes.xcreds.plist
# Domain: com.twocanoes.xcreds
# Title: XCreds
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-twocanoes-xcreds" = {
    enable = lib.mkEnableOption "XCreds";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.twocanoes.xcreds";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    ADDomain = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The desired AD domain";
    };

    mapKerberosPrincipalName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The OIDC claim that has the kerberos principal name. This is used when logging in with OIDC and ADDomain is defined. During login, the claim that contains the kerberos principal name will be read and the local account will set dsAttrTypeNative:_xcreds_activedirectory_kerberosPrincipal to the kerberos principal name. The menu item will then use this value and the password to get a kerberos ticket.";
    };

    shouldUpdateKerberosUserPrincipalADDomain = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If the user principal has a domain name and the OpenID token does not match the ADDomain name, replace it with the ADDomain name. For example: bob@sub.example.com -> bob@example.com if ADDomain was example.com.";
    };

    clientID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The OIDC client id public identifier for the app.";
    };

    clientSecret = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Client Secret sometimes required by identity provider.";
    };

    CreateAdminUser = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When set to true and the user account is created, the user will be a local admin.";
    };

    skipUserSetupBuddy = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When set to true and a new user home is created, the .skipbuddy file will be created at the top of the home folder to skip user setup screens.";
    };

    allowUsersClaim = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The claim that contains the value to check for in the allowedUsersArray. Both must be defined.";
    };

    allowedUsersArray = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of users that are allowed to log in. An empty array or undefined array means any user can log in as long their cloud credentials are valid. The preference allowUsersClaim must be defined to a claim in the idToken that identifies the users. For example, if the allowUsersClaim is set to upn and the allowedUsersArray is set to an array that contains fred@twocanoes.com and the upn of a logging in user is fred@twocanoes.com, they would be allowed to log in. barney@twocanoes.com would not.";
    };

    allowLoginIfMemberOfGroup = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "(OIDC Only) List of groups whose members should be allowed to login. If the user is a member of any of these groups they can login regardless (including creating new local account) if authorization succeeds. If a local account exists but the user is no longer part of a group the login will be denied.";
    };

    CreateAdminIfGroupMember = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of groups that should have members be given local administrator status. Local administrator status can be given on first authentication when account created, or on later sign in of existing user when a group member. Administrator status is removed if group membership later revoked. Administrator status is not removed if user is the only XCreds admin user. Set as an Array of Strings of the group identifier.";
    };

    claimsToAddToLocalUserAccount = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of claims that should be added to the user local account. Will be prefixed with _xcreds_oidc_. Set as an Array of Strings of the claim.";
    };

    systemInfoAdditionsArray = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Items to be added to the System Info Popover at login. Can be made dynamic by using the override script override to provide this setting";
    };

    shouldSwitchToLoginWindowWhenLocked = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When set to true and the user locks the current session, XCreds will tell the system to switch to Login Window. The current session will stay active but the user will login with the XCreds Login Window to resume the session.";
    };

    LocalFallback = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If the user attempts to login as an AD user and the login fails against AD, try against local user account if off domain or AD user not found.";
    };

    shouldActivateSystemInfoButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show the system info popover as active when first starting";
    };

    discoveryURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The discovery URL provided by your OIDC / Cloud provider. For Google it is typically https://accounts.google.com/.well-known/openid-configuration and for Azure it is typically https://login.microsoftonline.com/common/.well-known/openid-configuration.";
    };

    EnableFDE = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enabled FDE enabled at first login on APFS disks.";
    };

    EnableFDERecoveryKey = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Save the Personal Recovery Key (PRK) to disk for the MDM Escrow Service to collect.";
    };

    EnableFDERecoveryKeyPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specify a custom path for the recovery key.";
    };

    EnableFDERekey = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Rotate the Personal Recovery Key (PRK).";
    };

    loginWindowWidth = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Login Window webview width (Integer). If this is not defined, it will be full width. Minimum value of 150.";
    };

    loginWindowHeight = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Login Window webview height (Integer). If this is not defined, it will be full height. Minimum value of 150.";
    };

    loadPageTitle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "When no network connection or a profile is not defined, this title is shown in an HTML view to the user when cloud login is configured.";
    };

    loadPageInfo = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "When no network connection or a profile is not defined, this text is shown in an HTML view to the user when cloud login is configured.";
    };

    shouldHideLoginWindowLogo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hide the login window logo.";
    };

    loginWindowLogoPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "URL to an image to show icon in the username / password login window";
    };

    loginWindowBackgroundImageURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "URL to an image to show in the background while logging in. Default value: file:///System/Library/Desktop Pictures/Monterey Graphic.heic.";
    };

    loginWindowBackgroundImageAlpha = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "Alpha value of loginWindowBackgroundImage. Default value: 1";
    };

    loginWindowSecondaryMonitorsBackgroundImageURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "URL to an image to show in the background on secondary display while logging in. Default value: file:///System/Library/Desktop Pictures/Monterey Graphic.heic.";
    };

    menuItemIconData = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Base64 data of icon. Should be 48 x 48.";
    };

    menuItemIconCheckedData = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Base64 data of icon with checkmark. Should be 48 x 48.";
    };

    menuItemWindowBackgroundImageURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "URL to an image to show in the background of the window that appears when logged in and prompting for Active Directory username and password.";
    };

    menuItemWindowBackgroundImageAlpha = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "Alpha value of menuItemWindowBackgroundImageURL. Default value: 1";
    };

    shouldLoginWindowBackgroundImageFillScreen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set the background image to Fill Screen rather than Fit to Screen";
    };

    shouldLoginWindowSecondaryMonitorsBackgroundImageFillScreen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set the secondary monitor(s) background image to Fill Screen rather than Fit to Screen";
    };

    loginWindowSecondaryMonitorsBackgroundAlpha = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "Alpha value of loginWindowSecondaryMonitorsBackground. Default value: 1";
    };

    shouldRemoveMenuItemAutoLaunch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When XCreds is installed, a launch agent is installed to automatically keep the menu item running when a user is logged in. Setting shouldRemoveMenuItemAutoLaunch to true makes XCreds at the login window remove the launchagent plist that was installed. This will cause the launchagent to not launch XCreds menu item on log in.";
    };

    shouldUseADNativePasswordChangeMenuItem = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When changing password via menu item, use the native UI to change password in Active Directory.";
    };

    passwordChangeURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Add a menu item for changing the password that will open this URL when the menu item is selected. If shouldUseADNativePasswordChangeMenuItem is set to true, this value is not used.";
    };

    redirectURI = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The URI passed back to the webview after successful authentication. Default value: xcreds://auth/";
    };

    shouldShowCloudLoginByDefault = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determine if the Mac login window or the cloud login window is shown by default.  When not set or set to true, show cloud login. If false, shows Mac login.";
    };

    refreshRateHours = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The number of hours between checks. Default value: 3. Minimum value: 0. Max value: 168.";
    };

    refreshRateMinutes = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The number of minutes between checks. Default value: 0. Minimum value: 0. Max value: 59. This value is added to refreshRateHours. If refreshRateHours is 0, minimum for refreshRateMinutes becomes 5.";
    };

    scopes = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Scopes tell the identify provider what information to return. Note that the values are provided with a single space between them.\n\nProvide the following values the follow IdPs:\n\nGoogle: profile openid email\nAzure: profile openid offline_access\n\nNote that Google does not support the offline_access scope so instead use the preference shouldSetGoogleAccessTypeToOffline. Azure provides unique_name which is mapped to the local user account by using the prefix before \"@\" in unique_name and matching to the short name of a user account. Google provides \"email\" and is matched in the same way.";
    };

    shouldSetGoogleAccessTypeToOffline = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When using Google IdP, a refresh token may need be requested in a non-standard way.";
    };

    shouldPromptForADPasswordChange = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If the domain controller returns back that the password is expired or needs to be changed, prompt the user. If this is set to false, login will fail and an error message will be shown.";
    };

    shouldShowSignInMenuItem = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determine if the Sign In menu item is shown in the XCreds menu. When not set or set to true, show Sign In. If false, the Sign In menu item is hidden.";
    };

    shouldSuppressLocalPasswordPrompt = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Do not prompt for local password.";
    };

    shouldPreferLocalLoginInsteadOfCloudLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Favor using XCreds' local login screen over the cloud login UI.";
    };

    shouldVerifyPasswordWithRopg = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "(Deprecated in v4.0) When verifying password in the menu app, use ROPG.";
    };

    shouldUseBasicAuthWithROPG = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When using ROPG, do basic HTTP auth. Default: false";
    };

    ropgClientID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "(Removed in v4.0) ROPG Client ID for use when checking password.";
    };

    ropgClientSecret = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "(Removed in v4.0) ROPG Client Secret for use when checking password.";
    };

    shouldUseROPGForLoginWindowLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When verifying password in the login window, use ROPG.";
    };

    shouldUseROPGForMenuLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When verifying password in the menu app, use ROPG.";
    };

    shouldUseROPGForPasswordChangeChecking = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When verifying local password matches cloud password in the background, use ROPG. If set to false, the refresh token will be used to verify password change.";
    };

    shouldUseLDAPForPasswordChangeChecking = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When verifying local password matches cloud password in the background, use Google LDAP. If set to false, the refresh token will be used to verify password change.";
    };

    resource = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Resource URL when using ROPG. Typically needed only for Azure. Common value is https://graph.microsoft.com";
    };

    ropgResponseValue = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "When a ROPG request is completed successfully to verify password, it may return an error that two factor is required. Add the string that is returned for the JSON response. For Azure, it is typically interaction_required. For Okta, the response is usually {\"error\":\"invalid_grant\",\"error_description\":\"Resource owner password credentials authentication denied by sign on policy.\"} Can be a string or an array of strings.";
    };

    hideIfPathExists = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Don't show the UI if this key is defined and a file or folder exists at this path.";
    };

    aliasName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Name of OIDC claim that contains an alias to add to a user account. Usually this is the \"upn\" (eg syd@twocanoes.com) so the user can log in at the standard login window the same as the IdP login window. Adds the value to record name of the user account as an alias.";
    };

    autoRefreshLoginTimer = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Timer for automatically refreshing login screen in seconds. If set to 0, does not automatically refresh.";
    };

    cloudLoginText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Text for return to cloud login on Mac login screen";
    };

    shouldShowAboutMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show the About Menu item menu. Default value: true";
    };

    shouldSkipFileVaultLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Skip FileVault login during startup if FileVault is enabled. The current username and password are used to tell fdesetup to silently use the credentials during next reboot to unlock FileVault. Passthrough is also disabled and the user will see the XCreds Login Window. To avoid the user being prompted for admin credentials, set the \"Login And Background Item Management\" management item (com.apple.servicemanagement) to allow teamid UXP6YEHSPW to have background tasks.";
    };

    shouldSkipFileVaultLoginAdmin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Skip FileVault authentication at startup if FileVault is enabled. The admin credentials will be used to tell fdesetup to silently use the credentials during next reboot to unlock FileVault. Passthrough is also disabled and the user will see the XCreds Login Window. To avoid the user being prompted for admin credentials, set the \"Login And Background Item Management\" management item (com.apple.servicemanagement) to allow teamid UXP6YEHSPW to have background tasks. Default value: false";
    };

    shouldShowMenuBarSignInWithoutLoginWindowSignin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If the discovery URL is defined and there are no tokens or tickets, the sign in window in the user session will show even if the user did not log in from the XCreds Login Window";
    };

    refreshBannerText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Text at top of window shown in user session when prompting for password.";
    };

    shouldShowRefreshBanner = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show text at the top of the prompt window when tokens expire.";
    };

    shouldShowConfigureWifiButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show Configure WiFi button in XCreds Login.";
    };

    shouldShowShutdownButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show Shutdown button in XCreds Login.";
    };

    shouldShowRestartButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show Restart button in XCreds Login.";
    };

    shouldShowSystemInfoButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show Configure System Info in XCreds Login.";
    };

    shouldShowPreferencesOnStart = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show Settings on start if none are defined. Default value: false";
    };

    shouldPromptForMigration = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Prompt for local account username and password if no account was mapped and there are standard users already on the system.";
    };

    shouldAllowKeyComboForMacLoginWindow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow key combo (control-option return) to switch logon window. Use command-option-control-return for Mac Login Window. ";
    };

    keyCodeForLoginWindowChange = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "key code for shouldAllowKeyComboForMacLoginWindow. If not defined, it is return or enter. If this is defined, this key is used with control-option to switch to login window and command-option-control and this key is used to switch to Mac Login Window. Uses CGKeyCode (for example, enter is 76 and return is 36)";
    };

    shouldShowMacLoginButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show the Mac Login Window button in XCreds Login.";
    };

    shouldShowLocalOnlyCheckbox = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show the local only checkbox on the local login page ";
    };

    usernamePlaceholder = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Placeholder text in local / AD login window for username";
    };

    passwordPlaceholder = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Placeholder text in local / AD login window for password";
    };

    shouldShowSupportStatus = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show message in XCreds Login reminding people to buy support.";
    };

    shouldShowQuitMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show Quit in the menu item menu. Default value: true";
    };

    shouldShowVersionInfo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "(Removed in v5.4 and replaced by shouldActivateSystemInfoButton) Show the version number and build number in the lower left corner of XCreds Login.";
    };

    showDebug = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show push notifications for authentication progress. Default value: false";
    };

    username = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "When a user uses cloud login, XCreds will try and figure out the local username based on the email or other data returned for the IdP. Use this value to force the local username for any cloud login. Provide only the shortname.";
    };

    KeychainReset = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When a local user password does not match the cloud or AD password, this key will allow the user to select a Reset button to set their password to match their AD/cloud password, move their current keychain aside and create a new keychain. If XCreds does not have access to local admin credentials set from the XCreds command line tools, the user will prompted to enter local admin credentials.";
    };

    PasswordOverwriteSilent = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Update the local user password silently to match the cloud / AD password. Requires access to admin credentials. See command line help to set admin username and password.";
    };

    HideExpiration = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hide AD Expiration even if defined in AD Account";
    };

    localAdminUserName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Username of local admin user. DO NOT SET THIS IN PREFERENCES. It is recommended to set this with the settingsOverrideScriptPath script. This user is used to reset the keychain if the user forgets their local password and to setup a secure token for newly created users.";
    };

    localAdminPassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Password of local admin user. DO NOT SET THIS IN PREFERENCES. It is recommended to set this with the settingsOverrideScriptPath script. This user is used to reset the keychain if the user forgets their local password and to setup a secure token for newly created users.";
    };

    accountLockedPasswordDialogTitle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Title of dialog prompting user to enter in their prior local password when account is locked.";
    };

    accountLockedPasswordDialogText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Text of dialog prompting user to enter in their prior local password when account is locked.";
    };

    resetPasswordDialogTitle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Title of dialog prompting user to enter in their prior local password.";
    };

    systemInfoButtonTitle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The title of the button for system info in the bottom right corner of the login screen. This can either be plain text or one of these special values: .os, .hostname, .ipaddress, .serial, .mac, .computername, .ssid. Using the special value will populate the associated information as the button title.";
    };

    verifyPassword = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When cloud password is changed and the local keychain password and local user account needs to be changed, a verification dialog can be shown to verify the password. Default value: true";
    };

    shouldDetectNetworkToDetermineLoginWindow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Check if network is up. If not, select username and password login window.";
    };

    idpHostName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Hostname of the page that has the password field. When the user submits the form, XCreds will use idpHostName to identify a page it needs to look for the password field. The password value is identified by an HTML id defined by passwordElementID. If this value is not defined. XCreds will look for login.microsoftonline.com and accounts.google.com. This value is commonly set for other IdP’s and for Azure environments that use ADFS.";
    };

    idpHostNames = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "array of hostnames of the page that has the password field.";
    };

    AdditionalADDomains = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "array of additional AD domains to accept";
    };

    ccidSlotName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Name of slot for CCID reader for reading RFID cards";
    };

    shouldAllowLoginCardSetup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If an unknown RFID card is tapped, show option to pair with local account.";
    };

    adUserAttributesToAddToLocalUserAccount = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "array of AD user attributes to add to local directory user account";
    };

    passwordElementID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Password element id of the html element that has the password. It is read by using JavaScript to get the value (for example, for Azure, the JavaScript document.getElementById('i0118').value is sent. If this default is not set, standard values for Azure and Google Cloud will be used. To find out this value, use a browser to inspect the source of the page that has the password on it. Find the id of the textfield that has the password. Fill in the password and then open the JavaScript console. Run:\n\ndocument.getElementById('passwordID').value\n\nchanging \"passwordID\" to the correct element ID. If the value you typed into the textfield is returned, this is the correct ID.";
    };

    map_firstname = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local DS to OIDC/AD Mapping for First Name. Default value: \"given_name\" (OIDC), \"givenName\" (AD). map_firstname should be set to an OIDC claim/AD Attribute for first name.";
    };

    map_lastname = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local DS to OIDC/AD Mapping for Last Name. Default value: \"family_name\" (OIDC), \"sn\" (AD). map_lastname should be set to an OIDC claim for last name.";
    };

    map_fullname = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local DS to OIDC/AD Attribute Mapping for Full Name. Default value: \"name\"(OIDC), \"displayName\" (AD). map_fullname should be set to an OIDC claim/AD Attribute for full name.";
    };

    map_username = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local DS to OIDC Mapping/AD Attribute for Name. Default value: \"name\" (OIDC), \"userPrincipalName\" (AD). map_username should be set to an OIDC claim/AD Attribute for name. The macOS username will be set as the portion of this value before an @ symbol if present.";
    };

    map_fullusername = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local DS to OIDC Mapping for Full Username (for example, freddy@twocanoes.com) Default value: \"unique_name\". map_username should be set to an OIDC claim for full username.";
    };

    map_uid = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Local DS to OIDC Mapping/AD Attribute for UID at initial user creation. If not set, the uid will be set to the next available. If the mapped UID is used, login will fail.";
    };

    primaryGroupID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Primary Group ID when creating a new user. Default value 20.";
    };

    map_password_expiry = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Password expiry mapping to claim. If this value is set to an OIDC claim, the value in that claim should be the number of seconds from the token issued time (iat) to the expiry date. ";
    };

    settingsOverrideScriptPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Script to override defaults. Must return valid property list with specified defaults. Script must exist at path, be owned by _securityagent and writable and executable only by _securityagent.";
    };

    upnSuffixToDomainMappings = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          upn = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "UPN";
          };
          domain = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "domain";
          };
        };
      }));
      default = null;
      description = "In some Active Directory environments, users do not use username@domain to login; they use a UPN suffix to make the username easier to use. This setting maps the UPN suffix to the correct AD domain name. For example, if you have an AD domain of foo.com but want users to sign in as user@bar.com, a UPN suffix of foo.com is created in AD and the user account is set to user@foo.com. This setting then would map foo.com to bar.com by setting the key upn to foo.com and the domain key to bar.com.";
    };

    menuItems = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          menuItemName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Menu Item";
          };
          linkOrAppPath = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Link or App Path";
          };
          separatorBefore = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Separator line before menu item";
          };
          separatorAfter = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Separator line after menu item";
          };
        };
      }));
      default = null;
      description = "Menu Items";
    };

    Shares = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Name of share to show in menu";
          };
          URL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "URL for share (eg smb://server.example.com/share)";
          };
          Groups = lib.mkOption {
            type = types.nullOr (types.listOf types.anything);
            default = null;
          };
          ConnectedOnly = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Allow mounting only if network connection is detected";
          };
          AutoMount = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Automatically mount when XCreds starts";
          };
        };
      }));
      default = null;
      description = "Add menu item and mount/automount shares";
    };

    HomeMountEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show and mount home directory from AD profile if defined.";
    };

    HomeAppendDomain = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Append the domain name to the share defined in the profile.";
    };

    shareMenuItemName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Name for Shares menu item. Default: \"Shares\".";
    };

  };
}