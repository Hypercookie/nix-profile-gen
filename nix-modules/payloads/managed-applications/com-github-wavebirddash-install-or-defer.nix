# Auto-generated from ProfileManifests: com.github.wavebirddash.install-or-defer.plist
# Domain: com.github.wavebirddash.install-or-defer
# Title: Install or Defer
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-github-wavebirddash-install-or-defer" = {
    enable = lib.mkEnableOption "Install or Defer";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.github.wavebirddash.install-or-defer";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    InstallButtonLabel = lib.mkOption {
      type = types.nullOr (types.str);
      default = "Install";
      description = "The label of the install button.";
    };

    DeferButtonLabel = lib.mkOption {
      type = types.nullOr (types.str);
      default = "Defer";
      description = "The label of the defer button.";
    };

    DisablePostInstallAlert = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Whether to suppress the persistent alert to run updates.";
    };

    MessagingLogo = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "File path to a logo that will be used in messaging.";
    };

    SupportContact = lib.mkOption {
      type = types.nullOr (types.str);
      default = "IT";
      description = "Contact information for technical support included in messaging alerts.";
    };

    DeferralPeriod = lib.mkOption {
      type = types.nullOr (types.int);
      default = 14400;
      description = "Number of seconds between when the user clicks \"Defer\" and the next prompt appears.";
    };

    HardRestartDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = 300;
      description = "Number of seconds to wait between attempting a soft restart and forcing a restart.";
    };

    MaxDeferralTime = lib.mkOption {
      type = types.nullOr (types.int);
      default = 259200;
      description = "Number of seconds between the first script run and the updates being enforced.";
    };

    PromptTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = 3600;
      description = "Number of seconds to wait before timing out the Install or Defer prompt.";
    };

    SkipDeferral = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Whether to bypass deferral time entirely and skip straight to update enforcement.";
    };

    UpdateDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = 600;
      description = "Number of seconds to wait between displaying the \"install updates\" message and applying updates, then attempting a soft restart.";
    };

    WorkdayStartHour = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 ]);
      default = null;
      description = "The hour that a workday starts in your organization.";
    };

    WorkdayEndHour = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 ]);
      default = null;
      description = "The hour that a workday ends in your organization.";
    };

    DiagnosticLog = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Whether to write to a persistent log file at /var/log/install-or-defer.log.";
    };

    ManualUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Whether to prompt users to run updates manually via System Preferences.";
    };

  };
}