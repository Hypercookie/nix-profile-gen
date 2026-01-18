# Auto-generated from ProfileManifests: com.apple.loginwindow.plist
# Domain: com.apple.loginwindow
# Title: Login Window
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-loginwindow" = {
    enable = lib.mkEnableOption "Login Window";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.loginwindow";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    AdminHostInfo = lib.mkOption {
      type = types.nullOr (types.enum [ "HostName" "SystemVersion" "IPAddress" ]);
      default = null;
      description = "The admin host info. If present in the payload, the system displays its value in the Login Window as additional computer information. Before macOS 10.10, this string could only contain host name, system version, or IP address. After macOS 10.10, setting this key to any value allows the user to click the time area of the menu bar to toggle through various computer information values.";
    };

    LoginwindowText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The text to display in the Login Window.";
    };

    SHOWFULLNAME = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system shows the name and password dialog. If 'false', the system displays a list of users.";
    };

    HideLocalUsers = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system shows only network and system users when showing a user list.";
    };

    HideMobileAccounts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system hides mobile account users in a user list. In some cases, mobile users show up as network users.";
    };

    IncludeNetworkUser = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system shows network users when showing a user list.";
    };

    HideAdminUsers = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system hides administrator users when showing a user list.";
    };

    SHOWOTHERUSERS_MANAGED = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system displays \"Other...\" when it shows a list of users.";
    };

    SleepDisabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system disables the Sleep button.";
    };

    RestartDisabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system disables the Restart item.";
    };

    ShutDownDisabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system disables the Shut Down button.";
    };

    RestartDisabledWhileLoggedIn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system disables the Restart menu item when the user is logged in.";
    };

    ShutDownDisabledWhileLoggedIn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system disables the Shut Down menu item when the user is logged in.";
    };

    PowerOffDisabledWhileLoggedIn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system disables the Power Off menu item when the user is logged in.";
    };

    LogOutDisabledWhileLoggedIn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system disables the Log Out menu item when the user is logged in. Available in macOS 10.13 and later.";
    };

    DisableScreenLockImmediate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system disables the immediate Screen Lock functions. Available in macOS 10.13 and later.";
    };

    "com.apple.login.mcx.DisableAutoLoginClient" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "A loginwindow password will be required to login.";
    };

    AutologinUsername = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user short name for an existing user to set up auto login.";
    };

    AutologinPassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "An optional user password to set up auto login. This must match the 'AutologinUsername' user's current password.";
    };

    DisableFDEAutoLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system disables the automatic login option when using FileVault.";
    };

    DisableConsoleAccess = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system disregards the '>console' special user name, which provides a command line UI.";
    };

    EnableExternalAccounts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows external accounts to log in.";
    };

    AdminMayDisableMCX = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows Mac administrators on the computer to refresh or disable the management features.";
    };

    TALLogoutSavesState = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Reopens windows that were open at time of logout";
    };

    UseComputerNameForComputerRecordName = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Forces the name of the Mac to be set as the computer record name.";
    };

    AllowList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The list of user GUIDs or group GUIDs of users that the system allows to log in. An asterisk ('*') string specifies all users or groups. This only applies to network accounts and mobile accounts.";
    };

    DenyList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The list of user GUIDs or group GUIDs of users that the system disallows to log in. This list takes priority over the list in the 'AllowList' key. This only applies to network accounts and mobile accounts.";
    };

    LocalUserLoginEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Permit only local users to log in. Network users won't be allowed to log in.";
    };

    LocalUsersHaveWorkgroups = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Local users are forced to use any available workgroup settings.";
    };

    FlattenUserWorkgroups = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If users are part of a nested workgroup, only the settings of the user's workgroup are enforced.";
    };

    CombineUserWorkgroups = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If users are part of a nested workgroup, all nested workgroup settings are enforced.";
    };

    AlwaysShowWorkgroupDialog = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If the workgroup has a specific dialog, that dialog is shown when users log in.";
    };

    ChangePasswordDisabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable or disable the \"Change Password…\" button in the Users & Groups preference pane.";
    };

    RetriesUntilHint = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Number of tries until password hint is shown (0 = disable password hints).";
    };

    showInputMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system shows the Input Menu in the Login Window.";
    };

    HiddenUsersList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Hides users defined in the list from the login window under the Other button";
    };

  };
}