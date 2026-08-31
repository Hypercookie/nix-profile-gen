# Auto-generated from ProfileManifests: com.sqwarq.DetectX-Swift.plist
# Domain: com.sqwarq.DetectX-Swift
# Title: DetectX Swift
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "DetectX Swift";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.sqwarq.DetectX-Swift";
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
        default = [ "PFC_SegmentedControl_0" "BrandedText" "ignoreKeywords" "FobWhitelist" "folderObserver" "ObserverButton" "ObserverIcon" "ObserverMessage" "ObserverTitle" "VisualUpdates" "whitelist" "SUFeedURL" "SUEnableAutomaticChecks" "SUScheduledCheckInterval" "SUAllowsAutomaticUpdates" "SUAutomaticallyUpdate" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      PFC_SegmentedControl_0 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      BrandedText = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Display organizational branding. Maximum of 25 characters in length - including spaces and punctuation. Requires DetectX Swift to be registered.";
      };

      ignoreKeywords = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Registered users can specify key words to be ignored by the Folder Observer action when changes are made to the LaunchDaemons and LaunchAgents folders. This allows you to stop the alert from being thrown when items whose file name contains the key word is added or removed from one of the Launch folders.";
      };

      FobWhitelist = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Array of strings of key words to be ignored by Folder Observer.";
      };

      folderObserver = lib.mkOption {
        type = types.nullOr (types.enum [ 0 1 ]);
        default = null;
        description = "Folder Observer notifies users when changes are made to the LaunchDaemons and LaunchAgents folders.";
      };

      ObserverButton = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Custom button text for the Folder Observer alert. Requires DetectX Swift to be registered.";
      };

      ObserverIcon = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Path to custom image for the Folder Observer alert. By default, shows the DetectX Swift icon. Requires DetectX Swift to be registered.";
      };

      ObserverMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Custom message for the Folder Observer alert. Requires DetectX Swift to be registered.";
      };

      ObserverTitle = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Custom title for the Folder Observer alert. Requires DetectX Swift to be registered.";
      };

      VisualUpdates = lib.mkOption {
        type = types.nullOr (types.enum [ 0 1 ]);
        default = null;
        description = "In the DetectX Swift GUI, display a visual button to indicate software updates are available.";
      };

      whitelist = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            path = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Paths of files to whitelist:\nex. /Library/Scripts/script.sh\nex. ~/Library/Preferences/preference.plist";
            };
          };
        }));
        default = null;
        description = "Allowlist of file paths that produce false positives in DetectX Swift. Can be full path or in users' home folders.";
      };

      SUFeedURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Setting this to a non-existent URL will disable the ability for users to manually check for updates. Useful when you intend to use your own software distribution mechanism to deploy updates.";
      };

      SUEnableAutomaticChecks = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls automatic update checks.";
      };

      SUScheduledCheckInterval = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Controls the automatic update check interval. The default is 1 day (86400 seconds). Setting to 0 disables updates.";
      };

      SUAllowsAutomaticUpdates = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls the automatic update install prompt. When enabled, presents users with the option to allow automatic download and install of available updates. If disabled, disallows automatic updates and requires manual installation every time.";
      };

      SUAutomaticallyUpdate = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls automatic silent updates. If enabled, users will not be informed about updates and updates will be silently installed when the app quits.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-sqwarq-DetectX-Swift" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "DetectX Swift (com.sqwarq.DetectX-Swift) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}