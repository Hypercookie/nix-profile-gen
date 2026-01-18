# Auto-generated from ProfileManifests: corp.sap.privileges.plist
# Domain: corp.sap.privileges
# Title: SAP Privileges
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-corp-sap-privileges" = {
    enable = lib.mkEnableOption "SAP Privileges";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "corp.sap.privileges";
      description = "The payload domain (PayloadType) for this manifest.";
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

    AllowCLIBiometricAuthentication = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Specifies whether to allow biometric authentication in the PrivilegesCLI to obtain administrator privileges";
    };

    PostChangeExecutablePath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "If set, the PrivilegesAgent executes the given application or script and provides the current user's user name ($1) and its privileges (admin or user, $2) as launch arguments";
    };

    PostChangeActionOnGrantOnly = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If set to true, the application or script, specified in PostChangeExecutablePath, will only be executed if administrator privileges are granted to a user, but not the privileges are revoked.";
    };

    RevokePrivilegesAtLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If set to true, the user's administrator privileges are revoked at login";
    };

    HideOtherWindows = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "By default, Privileges hides open windows to show the desktop and ensure that only the Privileges window is visible on the screen";
    };

    EnforcePrivileges = lib.mkOption {
      type = types.nullOr (types.enum [ "admin" "user" "none" ]);
      default = "admin";
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
      default = 250;
      description = "Specifies the maximum number of characters the user can enter as the reason for becoming an admin";
    };

    ReasonMinLength = lib.mkOption {
      type = types.nullOr (types.int);
      default = 10;
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
      default = false;
      description = "If set to true, the text the user enters for a reason is roughly parsed for valid words";
    };

    HideSettingsButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If set to true, the Settings button is no longer displayed in the app";
    };

    HideSettingsFromDockMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If set to true, the Settings menu item is no longer displayed in the Dock tile's menu";
    };

    HideSettingsFromStatusItem = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If set to true, the Settings menu item is no longer displayed in the status item's menu.";
    };

    ShowInMenuBar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
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
            default = false;
            description = "If set to true, the log messages are sent via TCP instead of UDP. By default, messages are sent via UDP.";
          };
          SyslogOptions = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                LogFacility = lib.mkOption {
                  type = types.nullOr (types.enum [ 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 ]);
                  default = 4;
                  description = "Configure syslog facility.";
                };
                LogSeverity = lib.mkOption {
                  type = types.nullOr (types.enum [ 0 1 2 3 4 5 6 7 ]);
                  default = 6;
                  description = "Configure syslog severity.";
                };
                ServerPort = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = 514;
                  description = "The port of the logging server.";
                };
                MaximumMessageSize = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = 480;
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
}