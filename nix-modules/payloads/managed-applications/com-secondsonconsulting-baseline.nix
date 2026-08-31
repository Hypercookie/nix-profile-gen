# Auto-generated from ProfileManifests: com.secondsonconsulting.baseline.plist
# Domain: com.secondsonconsulting.baseline
# Title: Baseline by Second Son Consulting
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Baseline by Second Son Consulting";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.secondsonconsulting.baseline";
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
        default = [ "PFC_SegmentedControl_0" "InitialScripts" "Installomator" "Packages" "Scripts" "WaitFor" "FinalScripts" "WaitForTimeout" "Restart" "LogOut" "CleanupAfterUse" "IgnoreDefaultInstallomatorOptions" "SkipSuccessDialog" "SkipFailDialog" "SilentMode" "CloseListBeforeFinalScripts" "DialogListOptions" "DialogSuccessOptions" "DialogFailureOptions" "DialogInspectModeOptions" "InspectModeJSON" "BlurScreen" "ShowList" "ProgressBar" "ProgressBarDisplayNames" "InstallomatorSwiftDialogIntegration" "JamfVerbose" "Button1Enabled" "GlobalDialogStatusIconWait" "GlobalDialogStatusIconSuccess" "GlobalDialogStatusIconFail" "PendingWaitForIcon" "ReinstallDialog" "ExitCondition" "BailOutFile" "DefaultInstallomatorRetries" "DefaultScriptRetries" "DefaultPackageRetries" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      PFC_SegmentedControl_0 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      InitialScripts = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            DisplayName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The name you want to appear in SwiftDialog and logs. Initial Scripts will only be shown to the user if the item Fails.";
            };
            ScriptPath = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "A path to the script you want to run. Can be a local file path or a URL.";
            };
            SHA256 = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The expected SHA256 of the script being run.";
            };
            MD5 = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The expected MD5 of the script being run.";
            };
            Arguments = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Arguments you want to pass to the script when it is run.";
            };
            AsUser = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Enable this option to run the script as the logged in user.";
            };
            Retries = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The number of times Baseline will retry this specific item if it fails. If omitted, will use the Global Retries Default.";
            };
            CurlOptions = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Custom Curl Options to used when downloading this script.";
            };
          };
        }));
        default = null;
        description = "Define scripts that are run immediately as the user logs in, prior to any Baseline SwiftDialog windows. These scripts are the place to add your custom welcome messages or pre-flight scripts.";
      };

      Installomator = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            DisplayName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The name you want to appear in the SwiftDialog menu as this Installomator label is processed.";
            };
            Label = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The Installomator label.";
            };
            Arguments = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Arguments you want to pass to the Installomator command for this label.";
            };
            Icon = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The icon you want to appear in the SwiftDialog menu as this Installomator label is processed. Can be a URL or local file path.";
            };
            Subtitle = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The subtitle text to appear on this line item.";
            };
            StatusIconWait = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The icon used for the wait list status, for this specific line item.";
            };
            StatusIconSuccess = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The icon used for the success list status, for this specific line item.";
            };
            StatusIconFail = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The icon used for the fail list status, for this specific line item.";
            };
            Retries = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The number of times Baseline will retry this specific item if it fails. If omitted, will use the Global Retries Default.";
            };
            HideListView = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Hide the window while this item is running. Default is false";
            };
          };
        }));
        default = null;
        description = "Define Installomator labels to be run by Baseline. For information specific to Installomator, see the Installomator Github: https://github.com/Installomator/Installomator";
      };

      Packages = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            DisplayName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The name you want to appear in the SwiftDialog menu as this package is installed.";
            };
            PackagePath = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "A path to the package you want to install. Can be a local file path or a URL.";
            };
            TeamID = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The expected TeamID of the package being installed.";
            };
            SHA256 = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The expected SHA256 of the package being installed.";
            };
            MD5 = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The expected MD5 of the package being installed.";
            };
            Arguments = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Arguments you want to pass to the installer command for this package.";
            };
            Icon = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The icon you want to appear in the SwiftDialog menu as this package is installed. Can be a URL or local file path.";
            };
            Subtitle = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The subtitle text to appear on this line item.";
            };
            StatusIconWait = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The icon used for the wait list status, for this specific line item.";
            };
            StatusIconSuccess = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The icon used for the success list status, for this specific line item.";
            };
            StatusIconFail = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The icon used for the fail list status, for this specific line item.";
            };
            Retries = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The number of times Baseline will retry this specific item if it fails. If omitted, will use the Global Retries Default.";
            };
            HideListView = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Hide the window while this item is running. Default is false";
            };
            CurlOptions = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Custom Curl Options to used when downloading this package.";
            };
          };
        }));
        default = null;
        description = "Define Packages to be run by Baseline";
      };

      Scripts = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            DisplayName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The name you want to appear in the SwiftDialog menu as this script is run.";
            };
            ScriptPath = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "A path to the script you want to run. Can be a local file path or a URL.";
            };
            SHA256 = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The expected SHA256 of the script being run.";
            };
            MD5 = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The expected MD5 of the script being run.";
            };
            Arguments = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Arguments you want to pass to the script when it is run.";
            };
            AsUser = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Enable this option to run the script as the logged in user.";
            };
            Icon = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The icon you want to appear in the SwiftDialog menu as this script is run. Can be a URL or local file path.";
            };
            Subtitle = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The subtitle text to appear on this line item.";
            };
            HideListView = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Hide the window while this item is running. Default is false";
            };
            StatusIconWait = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The icon used for the wait list status, for this specific line item.";
            };
            StatusIconSuccess = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The icon used for the success list status, for this specific line item.";
            };
            StatusIconFail = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The icon used for the fail list status, for this specific line item.";
            };
            Retries = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The number of times Baseline will retry this specific item if it fails. If omitted, will use the Global Retries Default.";
            };
            CurlOptions = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Custom Curl Options to used when downloading this script.";
            };
          };
        }));
        default = null;
        description = "Define Scripts to be run by Baseline";
      };

      WaitFor = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            DisplayName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The name you want to appear in the SwiftDialog menu for this item we are waiting for.";
            };
            Path = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "A path to the file you want Baseline to wait for.";
            };
            Icon = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The icon you want to appear in the SwiftDialog menu for this item. Can be a URL or local file path.";
            };
            Subtitle = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The subtitle text to appear on this line item.";
            };
          };
        }));
        default = null;
        description = "Define files which you want Baseline to wait for. Use this for items not directly installed by Baseline, like VPP or MDM installed apps.";
      };

      FinalScripts = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            DisplayName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The name you want to appear SwiftDialog and logs. Final Scripts will only be shown to the user if the item Fails.";
            };
            ScriptPath = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "A path to the script you want to run. Can be a local file path or a URL.";
            };
            SHA256 = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The expected SHA256 of the script being run.";
            };
            MD5 = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The expected MD5 of the script being run.";
            };
            Arguments = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Arguments you want to pass to the script when it is run.";
            };
            AsUser = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Enable this option to run the script as the logged in user.";
            };
            Retries = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The number of times Baseline will retry this specific item if it fails. If omitted, will use the Global Retries Default.";
            };
            CurlOptions = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Custom Curl Options to used when downloading this script.";
            };
          };
        }));
        default = null;
        description = "Define scripts that are run just before completion dialogs. For reporting webhooks, cleanup tasks, etc. Similar to InitialScripts, these items do not appear on the List View.";
      };

      WaitForTimeout = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "When using WaitFor, enter the number of seconds you wish to wait before Baseline considers remaining items a failure. This timer does not start until all other items are processed. Default if key is omitted is 600.";
      };

      Restart = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "This setting controls whether Baseline forces a restart after completion.";
      };

      LogOut = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "This setting controls whether Baseline forces a restart after completion.";
      };

      CleanupAfterUse = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "This setting controls whether Baseline deletes it's install directory after use: /usr/local/Baseline.";
      };

      IgnoreDefaultInstallomatorOptions = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "By default, Baseline uses \"NOTIFY=silent\" and \"BLOCKING_PROCESS_ACTION=kill\" Installomator options. Setting this to True means Baseline will not use those options.";
      };

      SkipSuccessDialog = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true, Baseline will not present a Success dialog at completion.";
      };

      SkipFailDialog = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true, Baseline will not present a Failure dialog at completion.";
      };

      SilentMode = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true, no dialog windows will be created. All items and item types will process as normal.";
      };

      CloseListBeforeFinalScripts = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true, Baseline will close the list view window before running FinalScripts. Use this option if you want to utilize FinalScripts to have the user complete actions prior to the Baseline completion dialog.";
      };

      DialogListOptions = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "SwiftDialog options for the primary Baseline progress list window.";
      };

      DialogSuccessOptions = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "SwiftDialog options for the Success Dialog window.";
      };

      DialogFailureOptions = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "SwiftDialog options for the Failure Dialog window.";
      };

      DialogInspectModeOptions = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "SwiftDialog options for Inspect Mode. Most options should be in the JSON file, but some can be passed here. See swiftDialog documentation for specifics.";
      };

      InspectModeJSON = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Path to your Inspect Mode JSON file. Using this option enables \"Inspect Mode\". DialogListView options will not be respected, and no Baseline DialogListView will be drawn. Inspect Mode is enabled after InitialScripts";
      };

      BlurScreen = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "This setting controls whether Baseline uses the SwiftDialog --blurscreen feature. Default is true. If you set to false, consider using --ontop in your DialogListOptions key";
      };

      ShowList = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If false, the ListView will not show any list items. Instead, a standard Dialog window is drawn with the options configured in `DialogListOptions`. If used with progress bar, the progress bar will still be displayed.";
      };

      ProgressBar = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "This setting controls whether Baseline displays a progress bar.";
      };

      ProgressBarDisplayNames = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "This setting controls whether Baseline displays the current item being processed under the progress bar.";
      };

      InstallomatorSwiftDialogIntegration = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Tell Installomator to use it's built in SwiftDialog integration for the List View.";
      };

      JamfVerbose = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true, when a Script is processing a jamf policy (/usr/local/bin/jamf), Baseline will watch the Jamf log to provide more verbose output on that line item. Similar to the Installomator integration, text and a progress circle will be used for all jamf items. ";
      };

      Button1Enabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "This setting enables SwiftDialog \"Button 1\" (the OK button) on the Baseline List View. This allows users to dismiss the list view and continue working while Baseline runs. By default this button is disabled.";
      };

      GlobalDialogStatusIconWait = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The icon used for the wait list status, if no specific wait status icon is set.";
      };

      GlobalDialogStatusIconSuccess = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The icon used for the success list status, if no specific success status icon is set.";
      };

      GlobalDialogStatusIconFail = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The icon used for the fail list status, if no specific fail status icon is set.";
      };

      PendingWaitForIcon = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The icon used for the \"pending\" status of all WaitFor items. Leave blank for nothing. Use \"pending\" for swiftDialog Default.";
      };

      ReinstallDialog = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Deprecated: This feature was removed in v.2.3, as it is no longer needed. This setting controls whether Baseline will reinstall SwiftDialog as the final step before completion. Default behavior if this key is omitted will reinstall SwiftDialog if a custom PNG is found in /Library/Application Support/Dialog/Dialog.png. Leave this as default if you use Baseline to deploy a custom SwiftDialog icon. Set to false if you do not want Baseline to ever reinstall SwiftDialog. Set to True if you always want to reinstall SwiftDialog after each Baseline.";
      };

      ExitCondition = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Define a file or folder path. When Baseline starts, if this file or folder exists, Baseline will exit quietly without processing any items. Use this option if your management tool may re-send scripts when not desired.";
      };

      BailOutFile = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Define a file path. If this file exists at any point while Baseline is running, Baseline will exit and will not process additional items.";
      };

      DefaultInstallomatorRetries = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Default number of retries for Installomator items. Default 0";
      };

      DefaultScriptRetries = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Default number of retries for Script items. Default 0";
      };

      DefaultPackageRetries = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Default number of retries for Package items. Default 0";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-secondsonconsulting-baseline" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Baseline by Second Son Consulting (com.secondsonconsulting.baseline) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}