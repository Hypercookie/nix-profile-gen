# Auto-generated from ProfileManifests: org.videolan.vlc.plist
# Domain: org.videolan.VLC
# Title: VLC
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "VLC";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "org.videolan.VLC";
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
  options.programs.macprofile.payloads."managed-applications-org-videolan-vlc" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "VLC (org.videolan.VLC) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}