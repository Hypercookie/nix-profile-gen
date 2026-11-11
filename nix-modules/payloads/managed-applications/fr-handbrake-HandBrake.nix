# Auto-generated from ProfileManifests: fr.handbrake.HandBrake.plist
# Domain: fr.handbrake.HandBrake
# Title: Handbrake
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Handbrake";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "fr.handbrake.HandBrake";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
        description = "Whether only one instance of this payload is allowed per profile.";
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

      _platforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "macOS" ];
        description = "Supported Apple platforms (pfm_platforms).";
      };

      _keyPlatforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.attrs;
        default = [ ];
        description = "Keys restricted to a subset of the manifest's platforms (key-level pfm_platforms).";
      };

      _allowUnsupportedPlatform = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Emit this instance even if its manifest says the target platform does not support it or some of its keys. Produces a warning instead of an error.";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "SUFeedURL" "SUEnableAutomaticChecks" "SUScheduledCheckInterval" "SUAllowsAutomaticUpdates" "SUAutomaticallyUpdate" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  options.payloads."managed-applications-fr-handbrake-HandBrake" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Handbrake (fr.handbrake.HandBrake) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}