# Auto-generated from ProfileManifests: corp.sap.privileges.plist
# Domain: corp.sap.privileges
# Title: SAP Privileges
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "SAP Privileges";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "corp.sap.privileges";
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
        default = [ "system" ];
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
        default = [ "ExpirationInterval" "ExpirationIntervalMax" "AllowPrivilegeRenewal" "RenewalFollowsAuthSetting" "AllowCLIBiometricAuthentication" "PostChangeExecutablePath" "PostChangeActionOnGrantOnly" "PassReasonToExecutable" "RevokePrivilegesAtLogin" "RevokeAtLoginExcludedUsers" "HideOtherWindows" "EnforcePrivileges" "DockToggleTimeout" "DockToggleMaxTimeout" "LimitToGroup" "LimitToUser" "ReasonRequired" "ReasonMaxLength" "ReasonMinLength" "ReasonPresetList" "ReasonCheckingEnabled" "HideSettingsButton" "HideHelpButton" "HelpButtonCustomURL" "HideSettingsFromDockMenu" "HideSettingsFromStatusItem" "ShowInMenuBar" "RequireAuthentication" "RemoteLogging" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      ExpirationInterval = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Set a fixed time interval after which administrator privileges expire and revert to standard user rights";
      };

      ExpirationIntervalMax = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Set a maximum time interval for a user to request administrative privileges";
      };

      AllowPrivilegeRenewal = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Specifies whether expiring administrator privileges can be renewed. When set to true, the user receives a notification one minute before administrator privileges expire and can renew them.";
      };

      RenewalFollowsAuthSetting = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When set to true, renewing privileges requires the same kind of authentication as initially requesting administrator privileges (for example, Touch ID or password).";
      };

      AllowCLIBiometricAuthentication = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Specifies whether to allow biometric authentication in the PrivilegesCLI to obtain administrator privileges";
      };

      PostChangeExecutablePath = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "If set, the PrivilegesAgent executes the given application or script and provides the current user's user name ($1) and its privileges (admin or user, $2) as launch arguments";
      };

      PostChangeActionOnGrantOnly = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true, the application or script, specified in PostChangeExecutablePath, will only be executed if administrator privileges are granted to a user, but not the privileges are revoked.";
      };

      PassReasonToExecutable = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Specifies whether the reason that the user entered when requesting administrator privileges should be passed to the executable configured with the PostChangeExecutablePath key. The reason is passed as the third launch argument ($3).";
      };

      RevokePrivilegesAtLogin = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true, the user's administrator privileges are revoked at login";
      };

      RevokeAtLoginExcludedUsers = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "If RevokePrivilegesAtLogin is set to true, the specified users are excluded from privilege revocation at login. Provide an array of strings containing the short names of the users.";
      };

      HideOtherWindows = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "By default, Privileges hides open windows to show the desktop and ensure that only the Privileges window is visible on the screen";
      };

      EnforcePrivileges = lib.mkOption {
        type = types.nullOr (types.enum [ "admin" "user" "none" ]);
        default = null;
        description = "Enforces certain privileges. Whenever Privileges.app or the PrivilegesCLI command line tool are launched, the corresponding privileges are set.";
      };

      DockToggleTimeout = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Sets a fixed timeout for the Dock tile's Toggle Privileges command. After this time, the admin rights are removed and set back to standard user rights. A value of 0 disables the timeout and allows the user to permanently toggle privileges.";
      };

      DockToggleMaxTimeout = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Set a maximum timeout for the Dock tile's Toggle Privileges command. This generally works the same way as the DockToggleTimeout but allows the user to choose every timeout value up to the one specified. If set to 20 min. for example, the user may decide to set it to a value below 20 instead of being forced to use the 20 minute timeout.";
      };

      LimitToGroup = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Limits the usage of Privileges.app to the given user group.";
      };

      LimitToUser = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Limits the usage of Privileges.app to the given user account.";
      };

      ReasonRequired = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If ReasonRequired is set to true, the user must provide a reason for needing admin rights.";
      };

      ReasonMaxLength = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Specifies the maximum number of characters the user can enter as the reason for becoming an admin";
      };

      ReasonMinLength = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Specifies the minimum number of characters the user has to enter as the reason for becoming an admin.";
      };

      ReasonPresetList = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            de = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Localization (de)";
            };
            en = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Localization (en)";
            };
            es = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Localization (es)";
            };
            it = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Localization (it)";
            };
            default = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Unlocalization";
            };
          };
        }));
        default = null;
        description = "If ReasonRequired is set to true, this key allows to pre-define a list of possible reasons (for becoming an admin) the user can choose from";
      };

      ReasonCheckingEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true, the text the user enters for a reason is roughly parsed for valid words";
      };

      HideSettingsButton = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true, the Settings button is no longer displayed in the app";
      };

      HideHelpButton = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true, the Help (?) button is no longer displayed in the app.";
      };

      HelpButtonCustomURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "If specified, this URL is opened instead of the Privileges GitHub URL when the user clicks the help button. Must use http:// or https://.";
      };

      HideSettingsFromDockMenu = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true, the Settings menu item is no longer displayed in the Dock tile's menu";
      };

      HideSettingsFromStatusItem = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true, the Settings menu item is no longer displayed in the status item's menu.";
      };

      ShowInMenuBar = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true, a Privileges status item is displayed in the Menu Bar.";
      };

      RequireAuthentication = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Requires authentication before using Privileges.app. If set to true, the logged-in user is prompted to authenticate via Touch ID or by entering their account password.";
      };

      RemoteLogging = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            ServerType = lib.mkOption {
              type = types.nullOr (types.enum [ "syslog" "webhook" ]);
              default = null;
            };
            ServerAddress = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "This will usually be an IP address, unless the syslog server is set up to respond using a DNS hostname.";
            };
            EnableTCP = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If set to true, the log messages are sent via TCP instead of UDP. By default, messages are sent via UDP.";
            };
            WebhookCustomData = lib.mkOption {
              type = types.nullOr (types.attrsOf types.anything);
              default = null;
              description = "A dictionary of custom data (such as machine name or serial number) that is added to the webhook's JSON payload as the custom_data field.";
            };
            SyslogOptions = lib.mkOption {
              type = types.nullOr (types.submodule {
                options = {
                  LogFacility = lib.mkOption {
                    type = types.nullOr (types.enum [ 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 ]);
                    default = null;
                    description = "Configure syslog facility.";
                  };
                  LogSeverity = lib.mkOption {
                    type = types.nullOr (types.enum [ 0 1 2 3 4 5 6 7 ]);
                    default = null;
                    description = "Configure syslog severity.";
                  };
                  ServerPort = lib.mkOption {
                    type = types.nullOr (types.int);
                    default = null;
                    description = "The port of the logging server.";
                  };
                  MaximumMessageSize = lib.mkOption {
                    type = types.nullOr (types.int);
                    default = null;
                    description = "Specify the maximum size of the syslog message (header + event message). If the syslog message is larger than the specified maximum, the message will be truncated at the end.";
                  };
                };
              });
              default = null;
              description = "Syslog-specific options";
            };
          };
        });
        default = null;
        description = "Remote logging settings";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-corp-sap-privileges" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "SAP Privileges (corp.sap.privileges) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}