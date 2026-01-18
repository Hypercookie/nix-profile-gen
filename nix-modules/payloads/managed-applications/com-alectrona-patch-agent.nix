# Auto-generated from ProfileManifests: com.alectrona.patch-agent.plist
# Domain: com.alectrona.patch-agent
# Title: Alectrona Patch Agent
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-alectrona-patch-agent" = {
    enable = lib.mkEnableOption "Alectrona Patch Agent";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.alectrona.patch-agent";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    InstallOrUpdate = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The software titles to automatically install or update (even if they are not currently installed) using the Patch Agent.";
    };

    UpdateOnly = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The software titles to automatically update if installed and out-of-date using the Patch Agent.";
    };

    OtherManagedSoftware = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The software titles to enable the Active Intervals feature for even when not included in the InstallOrUpdate or UpdateOnly preference keys. These software titles might be updated using the patch command line tool in scripted workflows external to the Patch Agent.";
    };

    RunInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The Patch Agent runs every 4 hours by default. You can adjust this interval time for your environment. Note: This key is configured in seconds. The minimum setting is 600 seconds (10 minutes) and there is currently no maximum.";
    };

    SkipFirstPatchAgentRun = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When Alectrona Patch runs for the first time, it performs what is called a \"Patch Agent Run\" where it runs all configured installs/updates. You can skip the first Patch Agent Run by setting this key to true.";
    };

    ActiveIntervals = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "The Patch Agent will attempt to silently update any recently deferred app that exists in the InstallOrUpdate or UpdateOnly keys immediately after that app has been terminated by the user (even during an interval period). You can disable this behavior by setting to false.";
    };

    RemovePatchSymlink = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set to true to remove the symlink located at /usr/local/bin/patch. This will remove patch from the user's $PATH and allows for accessing the built-in BSD patch command (opens new window)without using it's full path. Note: When setting this key to true you will need to access the Patch CLT at it's full path (opens new window)in Terminal or custom scripts.";
    };

    ReconAfterInstall = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set to true to perform a Jamf Pro inventory update after a software title is installed or updated using the Patch Agent.";
    };

    DeferIfRunning = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If an app is running when an update occurs, setting this key to true will suppress the update dialog and automatically perform a deferral.";
    };

    UpdateMAS = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set to true to attempt to update and convert Mac App Store (MAS) apps to their non-MAS counterpart.";
    };

  };
}