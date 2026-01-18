# Auto-generated from ProfileManifests: org.videolan.vlc.plist
# Domain: org.videolan.VLC
# Title: VLC
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-org-videolan-vlc" = {
    enable = lib.mkEnableOption "VLC";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "org.videolan.VLC";
      description = "The payload domain (PayloadType) for this manifest.";
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
}