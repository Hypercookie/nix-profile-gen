# Auto-generated from ProfileManifests: com.google.Keystone.plist
# Domain: com.google.Keystone
# Title: Google Software Updates
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-google-Keystone" = {
    enable = lib.mkEnableOption "Google Software Updates";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.google.Keystone";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    updatePolicies = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          global = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                UpdateDefault = lib.mkOption {
                  type = types.nullOr (types.enum [ 0 1 2 3 ]);
                  default = 0;
                  description = "Enable auto-updates & installs = Turns on auto-updates. Updates are always applied when detected by Google Software Update.\nInstall updates at scheduled update checks = Manual update checks will not install updates.\nTurn off updates = Stops Google Software Update automatically updating all users to the latest stable version of Google apps. Updates are only applied when the user manually checks for updates.\nUpdates never applied = Never update Google apps";
                };
                UpdatesSupressedStartHour = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "The time in 24-hour clock format, that auto-updates start. Use a value between 0 - midnight - and 23.";
                };
                UpdatesSupressedStartMinute = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "The minute, within the starting hour, that auto-updates start. Use a value between 0 and 59.";
                };
                UpdatesSupressedDurationMin = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "The length of time, in minutes, that auto-updates can be made. If you set this value to 0, the system behaves as if no update window is specified.";
                };
                ComponentUpdatesEnabled = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "Even if you turn off automatic updates for Chrome Browser, browser components won't automatically stop updating, including Adobe Flash, Widevine DRM - for encrypted media -, and the Chrome updater recovery component.";
                };
                DownloadPreference = lib.mkOption {
                  type = types.nullOr (types.enum [ "cacheable" ]);
                  default = null;
                  description = "This preference is referenced in an example property list in the documentation, but is not discussed. So it exists, but what it manages and the possible string values are not known.";
                };
              };
            });
            default = null;
            description = "Configure Global Google update settings";
          };
          com_google_Chrome = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                UpdateDefault = lib.mkOption {
                  type = types.nullOr (types.enum [ 0 1 2 3 ]);
                  default = 0;
                  description = "Enable auto-updates & installs = Turns on auto-updates. Chrome updates are always applied when detected by Google Software Update.\nInstall updates at scheduled update checks = Manual update checks will not install updates.\nTurn off updates = Stops Google Software Update automatically updating all users to the latest stable version of Chrome. Updates are only applied when the user manually checks for updates.\nUpdates never applied = Never update Chrome";
                };
                TargetVersionPrefix = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Pin an application to a single version. This stops your devices from updating to versions of the app beyond the number you specify. This should be done only temporarily, such as while testing a new version.";
                };
                TargetChannel = lib.mkOption {
                  type = types.nullOr (types.enum [ "stable" "extended" "beta" "dev" ]);
                  default = "stable";
                  description = "Choose the Stable, Extended stable, Beta, or Dev Chrome browser update channel for Chrome version 90 or above.\nGoogle Software Update will not downgrade Chrome to a lower version when switching channels.\nChrome continues to follow the last channel on which it received an update if the TargetChannel policy is cleared.";
                };
              };
            });
            default = null;
            description = "Configure Chrome update settings";
          };
          com_google_drivefs = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                UpdateDefault = lib.mkOption {
                  type = types.nullOr (types.enum [ 0 1 2 3 ]);
                  default = 0;
                  description = "Enable auto-updates & installs = Turns on auto-updates. FileStream updates are always applied when detected by Google Software Update.\nInstall updates at scheduled update checks = Manual update checks will not install updates.\nTurn off updates = Stops Google Software Update automatically updating all users to the latest stable version of FileStream. Updates are only applied when the user manually checks for updates.\nUpdates never applied = Never update FileStream";
                };
                TargetVersionPrefix = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Pin an application to a single version. This stops your devices from updating to versions of the app beyond the number you specify. This should be done only temporarily, such as while testing a new version.";
                };
              };
            });
            default = null;
            description = "Configure Drive File Stream update settings";
          };
          com_google_chat = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                UpdateDefault = lib.mkOption {
                  type = types.nullOr (types.enum [ 0 1 2 3 ]);
                  default = 0;
                  description = "Enable auto-updates & installs = Turns on auto-updates. Chat updates are always applied when detected by Google Software Update.\nInstall updates at scheduled update checks = Manual update checks will not install updates.\nTurn off updates = Stops Google Software Update automatically updating all users to the latest stable version of Chat. Updates are only applied when the user manually checks for updates.\nUpdates never applied = Never update Chat";
                };
                TargetVersionPrefix = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Pin an application to a single version. This stops your devices from updating to versions of the app beyond the number you specify. This should be done only temporarily, such as while testing a new version.";
                };
              };
            });
            default = null;
            description = "Configure Chat update settings";
          };
          com_google_GoogleDrive = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                UpdateDefault = lib.mkOption {
                  type = types.nullOr (types.enum [ 0 1 2 3 ]);
                  default = 0;
                  description = "Enable auto-updates & installs = Turns on auto-updates. Backup & Sync updates are always applied when detected by Google Software Update.\nInstall updates at scheduled update checks = Manual update checks will not install updates.\nTurn off updates = Stops Google Software Update automatically updating all users to the latest stable version of Backup & Sync. Updates are only applied when the user manually checks for updates.\nUpdates never applied = Never update Backup & Sync";
                };
                TargetVersionPrefix = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Pin an application to a single version. This stops your devices from updating to versions of the app beyond the number you specify. This should be done only temporarily, such as while testing a new version.";
                };
              };
            });
            default = null;
            description = "Configure Backup & Sync update settings";
          };
        };
      });
      default = null;
    };

  };
}