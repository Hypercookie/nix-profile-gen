# Auto-generated from ProfileManifests: com.jamf.setupmanager.plist
# Domain: com.jamf.setupmanager
# Title: Jamf Setup Manager
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-jamf-setupmanager" = {
    enable = lib.mkEnableOption "Jamf Setup Manager";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.jamf.setupmanager";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    DEBUG = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables debug mode. See documentation for behavior changes.";
    };

    title = lib.mkOption {
      type = types.nullOr (types.str);
      default = "Welcome to Setup Manager";
      description = "The main title over the window. Supports substitutions.\n(v1.4+) When the title is empty or unset, the default message 'Welcome to Setup Manager' will be shown, unless the banner is set, then no title will be shown instead. This allows for a custom branded title and icon in the banner image.";
    };

    icon = lib.mkOption {
      type = types.nullOr (types.str);
      default = "name:AppIcon";
      description = "The icon shown at the top center of the window. There are many options to define icons, as described in the documentation.\n(v1.4+) When the icon is empty or unset, Setup Manager will show the Setup Manager app icon, unless the banner is set, then no icon will be shown instead. This allows for a custom branded icon and title in the banner image.";
    };

    message = lib.mkOption {
      type = types.nullOr (types.str);
      default = "Setup Manager is configuring your Mac…";
      description = "The message shown below the title. Supports Markdown and substitutions.";
    };

    banner = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A banner image or color that covers the top of the Setup Manager window. See the documentation for dimensions. Supports both images (using the same sources as Icon) and colors.";
    };

    background = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "When set, Setup Manager displays the image full screen as a background behind the main window. Supports images (using the same sources as Icon) and also colors from v1.4 on.";
    };

    runAt = lib.mkOption {
      type = types.nullOr (types.enum [ "enrollment" "loginwindow" ]);
      default = "enrollment";
      description = "This value determines when Setup Manager should launch.";
    };

    accentColor = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Sets the accent color for buttons, progress bar, SF Symbol icons, and other UI elements. Use this to match branding. Color is encoded as a six digit hex code, e.g. #FF0088.";
    };

    tileColor = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Sets the action tile background color for all action tiles, unless the value is overridden by an individual action's tileColor key.";
    };

    finalCountdown = lib.mkOption {
      type = types.nullOr (types.int);
      default = 60;
      description = "Changes the duration (in seconds) of the \"final countdown\" before the app automatically performs the finalAction. Set to -1 (or any negative number) to disable automated execution. This setting is ignored if finalAction is set to 'none'.";
    };

    finalAction = lib.mkOption {
      type = types.nullOr (types.enum [ "continue" "restart" "shutdown" "none" ]);
      default = "continue";
      description = "Sets the action and label for the button shown when Setup Manger has completed.";
    };

    totalDownloadBytes = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Use this value to provide an estimate for the total size of all items that will be downloaded.";
    };

    jssID = lib.mkOption {
      type = types.nullOr (types.enum [ "$JSSID" ]);
      default = null;
      description = "When using JSM with Jamf Pro, set this to $JSSID in a Jamf Pro configuration profile and Setup Manager will be aware of its computer's id in Jamf Pro.";
    };

    computerID = lib.mkOption {
      type = types.nullOr (types.enum [ "$JSSID" "%udid%" ]);
      default = null;
      description = "When using JSM with Jamf Pro, set this to $JSSID in a Jamf Pro configuration profile and Setup Manager will be aware of its computer's id in Jamf Pro. For similar effect with Jamf School, set this to %udid%.";
    };

    userID = lib.mkOption {
      type = types.nullOr (types.enum [ "$EMAIL" "$USERNAME" ]);
      default = null;
      description = "Set this to $EMAIL in the configuration profile. This communicates the user who logged in to customized enrollment to Setup Manager. This can be used together with the userEntry.showForUserIDs key to control which users see the user entry UI.";
    };

    enrollmentUserID = lib.mkOption {
      type = types.nullOr (types.enum [ "$EMAIL" "$USERNAME" ]);
      default = null;
      description = "Set this to $EMAIL in the configuration profile. This communicates the user who logged in to customized enrollment to Setup Manager. This can be used together with the userEntry.showForUserIDs key to control which users see the user entry UI.";
    };

    computerNameTemplate = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Setup Manager will generate the computer name from this template and set it automatically. See the documentation for substitutions that can used in the template. (Setting this overrides the Computer Name field in user entry.)";
    };

    overrideSerialNumber = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "When set, the \"About this Mac\" info window will show this value instead of the real serial number.";
    };

    hideActionLabels = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the individual labels under each action's icon.";
    };

    actionOutputLogging = lib.mkOption {
      type = types.nullOr (types.enum [ "always" "error" "never" ]);
      default = "error";
      description = "Controls whether the output of actions is written to the Setup Manager log file.";
    };

    networkQualityCheck = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Set this key to false to suppress the network quality check.";
    };

    hideDebugLabel = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Suppresses display of the red 'DEBUG' label in debug mode.";
    };

    simulateMDM = lib.mkOption {
      type = types.nullOr (types.enum [ "Jamf Pro" "Jamf School" ]);
      default = null;
      description = "When debug mode is enabled, you can set this to Jamf Pro or Jamf School. This allows you to do test runs on un-enrolled Macs.";
    };

    help = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          title = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The title for the help message.";
          };
          message = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The help message. Supports Markdown.";
          };
          url = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The URL will be translated into a QR code and displayed next to the help message.";
          };
        };
      });
      default = null;
      description = "When you provide help, a help button (with a circled question mark) will be shown in the lower right corner (for left-to-right localizations). When you click on the help button a window with information will be shown.";
    };

    userEntry = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          userID = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                default = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A pre-populated value for the User ID field.";
                };
                placeholder = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A placeholder value for User ID. This is displayed in gray when no value has been entered.";
                };
                options = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Options displayed in a dropdown menu for User ID.";
                };
                validation = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A regular expression used to validate the value of User ID.";
                };
                validationMessage = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A message displayed to the user when User ID fails to match the regular expression.";
                };
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = "User ID";
                  description = "Override the default label for the User ID field.";
                };
              };
            });
            default = null;
          };
          email = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                default = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A pre-populated value for the Email field.";
                };
                placeholder = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A placeholder value for Email. This is displayed in gray when no value has been entered.";
                };
                options = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Options displayed in a dropdown menu for Email.";
                };
                validation = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A regular expression used to validate the value of Email.";
                };
                validationMessage = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A message displayed to the user when Email fails to match the regular expression.";
                };
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = "Email";
                  description = "Override the default label for the Email field.";
                };
              };
            });
            default = null;
          };
          endUsername = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                default = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A pre-populated value for the Account Name field.";
                };
                placeholder = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A placeholder value for Account Name. This is displayed in gray when no value has been entered.";
                };
                options = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Options displayed in a dropdown menu for Account Name.";
                };
                validation = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A regular expression used to validate the value of Account Name.";
                };
                validationMessage = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A message displayed to the user when Account Name fails to match the regular expression.";
                };
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = "Account Name";
                  description = "Override the default label for the Account Name field.";
                };
              };
            });
            default = null;
          };
          realname = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                default = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A pre-populated value for the Full Name field.";
                };
                placeholder = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A placeholder value for Full Name. This is displayed in gray when no value has been entered.";
                };
                options = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Options displayed in a dropdown menu for Full Name.";
                };
                validation = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A regular expression used to validate the value of Full Name.";
                };
                validationMessage = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A message displayed to the user when Full Name fails to match the regular expression.";
                };
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = "Full Name";
                  description = "Override the default label for the Full Name field.";
                };
              };
            });
            default = null;
          };
          position = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                default = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A pre-populated value for the Position field.";
                };
                placeholder = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A placeholder value for Position. This is displayed in gray when no value has been entered.";
                };
                options = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Options displayed in a dropdown menu for Position.";
                };
                validation = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A regular expression used to validate the value of Position.";
                };
                validationMessage = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A message displayed to the user when Position fails to match the regular expression.";
                };
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = "Position";
                  description = "Override the default label for the Position field.";
                };
              };
            });
            default = null;
          };
          phone = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                default = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A pre-populated value for the Phone field.";
                };
                placeholder = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A placeholder value for Phone. This is displayed in gray when no value has been entered.";
                };
                options = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Options displayed in a dropdown menu for Phone.";
                };
                validation = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A regular expression used to validate the value of Phone.";
                };
                validationMessage = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A message displayed to the user when Phone fails to match the regular expression.";
                };
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = "Phone";
                  description = "Override the default label for the Phone field.";
                };
              };
            });
            default = null;
          };
          department = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                default = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A pre-populated value for the Department field.";
                };
                placeholder = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A placeholder value for Department. This is displayed in gray when no value has been entered.";
                };
                options = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Options displayed in a dropdown menu for Department.";
                };
                validation = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A regular expression used to validate the value of Department.";
                };
                validationMessage = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A message displayed to the user when Department fails to match the regular expression.";
                };
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = "Department";
                  description = "Override the default label for the Department field.";
                };
              };
            });
            default = null;
          };
          building = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                default = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A pre-populated value for the Building field.";
                };
                placeholder = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A placeholder value for Building. This is displayed in gray when no value has been entered.";
                };
                options = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Options displayed in a dropdown menu for Building.";
                };
                validation = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A regular expression used to validate the value of Building.";
                };
                validationMessage = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A message displayed to the user when Building fails to match the regular expression.";
                };
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = "Building";
                  description = "Override the default label for the Building field.";
                };
              };
            });
            default = null;
          };
          room = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                default = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A pre-populated value for the Room field.";
                };
                placeholder = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A placeholder value for Room. This is displayed in gray when no value has been entered.";
                };
                options = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Options displayed in a dropdown menu for Room.";
                };
                validation = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A regular expression used to validate the value of Room.";
                };
                validationMessage = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A message displayed to the user when Room fails to match the regular expression.";
                };
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = "Room";
                  description = "Override the default label for the Room field.";
                };
              };
            });
            default = null;
          };
          assetTag = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                default = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A pre-populated value for the Asset Tag field.";
                };
                placeholder = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A placeholder value for Asset Tag. This is displayed in gray when no value has been entered.";
                };
                options = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Options displayed in a dropdown menu for Asset Tag.";
                };
                validation = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A regular expression used to validate the value of Asset Tag.";
                };
                validationMessage = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A message displayed to the user when Asset Tag fails to match the regular expression.";
                };
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = "Asset Tag";
                  description = "Override the default label for the Asset Tag field.";
                };
              };
            });
            default = null;
          };
          computerName = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                default = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A pre-populated value for the Computer Name field.";
                };
                placeholder = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A placeholder value for Computer Name. This is displayed in gray when no value has been entered.";
                };
                options = lib.mkOption {
                  type = types.nullOr (types.listOf (types.str));
                  default = null;
                  description = "Options displayed in a dropdown menu for Computer Name.";
                };
                validation = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A regular expression used to validate the value of Computer Name.";
                };
                validationMessage = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "A message displayed to the user when Computer Name fails to match the regular expression.";
                };
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = "Computer Name";
                  description = "Override the default label for the Computer Name field.";
                };
              };
            });
            default = null;
            description = "If computerNameTemplate is set, any data entry for computer name is ignored.";
          };
          showForUserIDs = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "You can configure Setup Manager to only show the user entry section when specified users have authenticated in enrollment customization.";
          };
        };
      });
      default = null;
      description = "When any of these are defined, Setup Manager will prompt for user data while the enrollment actions are running.";
    };

    enrollmentActions = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          label = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The label is used as the name of the action in display.";
          };
          icon = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The icon shown for the action.";
          };
          tileColor = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The background color of the action's tile.";
          };
          shell = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The absolute path to the command or script that should be run for this action.";
          };
          requiresRoot = lib.mkOption {
            type = types.nullOr (types.enum [ True ]);
            default = null;
            description = "Shell: run as root";
          };
          policy = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The absolute path to the command or script that should be run for this action.";
          };
          watchPath = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "This action will wait until a file at the given path exists or is removed.";
          };
          timeout = lib.mkOption {
            type = types.nullOr (types.int);
            default = 600;
            description = "The watchPath action will fail after this timeout.";
          };
          wait = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "Wait for a given time.";
          };
          waitForUserEntry = lib.mkOption {
            type = types.nullOr (types.enum [ "" ]);
            default = null;
            description = "If Setup Manager reaches this action before the user entry has been completed, it will wait until the user entry is completed and the user has clicked 'Save.'";
          };
          recon = lib.mkOption {
            type = types.nullOr (types.enum [ "" ]);
            default = null;
            description = "This will run a Jamf Inventory update.";
          };
          installomator = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The installomator label to run. Can also use Arguments.";
          };
          arguments = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "Arguments";
          };
        };
      }));
      default = null;
      description = "Describes the individual actions to be performed by Setup Manager. For each row, complete the Label, Icon, and then one of the following: Shell command, Jamf Pro Policy Trigger, Watch Path, Wait, Wait For User Entry, Jamf Pro Recon, or Installomator Label.";
    };

    finishedScript = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A full path to a script file which will be executed after Setup Manager has finished its workflow. This process runs independently of Setup Manager, so it can run installers or scripts that affect Setup Manager.";
    };

    finishedTrigger = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A custom Jamf Pro policy trigger which will be executed after Setup Manager has finished its workflow. This process runs independently of Setup Manager, so it can run installers or scripts that affect Setup Manager.";
    };

    finishedMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Custom message when Setup Manager workflow is complete. Supports Markdown and substitutions.";
    };

    webhooks = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          started = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                kind = lib.mkOption {
                  type = types.nullOr (types.enum [ "generic" "teams" "slack" ]);
                  default = "generic";
                  description = "Kind of webhook";
                };
                url = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Webhook URL";
                };
              };
            }));
            default = null;
            description = "Webhooks called when Setup Manager starts its workflow.";
          };
          finished = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                kind = lib.mkOption {
                  type = types.nullOr (types.enum [ "generic" "teams" "slack" ]);
                  default = "generic";
                  description = "Kind of webhook";
                };
                url = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Webhook URL";
                };
              };
            }));
            default = null;
            description = "Webhooks called when Setup Manager finishes its workflow.";
          };
          DEBUG = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Enables webhook debug mode.";
          };
        };
      });
      default = null;
      description = "Webhooks";
    };

    networkCheck = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          host = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The host name, e.g. host.example.com (no url scheme) to test a connection to.";
          };
          port = lib.mkOption {
            type = types.nullOr (types.int);
            default = 443;
            description = "The port to test a connection to.";
          };
          protocol = lib.mkOption {
            type = types.nullOr (types.enum [ "tcp" "udp" ]);
            default = "tcp";
            description = "The connection protocol to test";
          };
          label = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A display label for the connection test.";
          };
        };
      }));
      default = null;
      description = "Provides a list of hosts to check connectivity to. These will be shown in the 'Connectivity' section in the network info pane. Be sure to read the documentation before configuring.";
    };

    PLEASE_DO_NOT_TRACK = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Suppress launch tracking by enabling this setting.";
    };

  };
}