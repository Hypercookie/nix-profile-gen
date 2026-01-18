# Auto-generated from ProfileManifests: com.apple.familycontrols.timelimits.v2.plist
# Domain: com.apple.familycontrols.timelimits.v2
# Title: Parental Controls: Time Limits
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-familycontrols-timelimits-v2" = {
    enable = lib.mkEnableOption "Parental Controls: Time Limits";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.familycontrols.timelimits.v2";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    familyControlsEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', enables time limits.";
    };

    time_limits = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          weekday_allowance = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                enabled = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If 'true', enable these settings.";
                };
                secondsPerDay = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "The allowance for that day, in seconds.";
                };
                rangeType = lib.mkOption {
                  type = types.nullOr (types.enum [ 0 ]);
                  default = null;
                  description = "Range Type";
                };
              };
            });
            default = null;
            description = "The weekday allowance settings.";
          };
          weekday_curfew = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                enabled = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If 'true', enable these settings.";
                };
                start = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The start time for the curfew in 'hours:minutes:seconds' format.";
                };
                end = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The end time for the curfew in 'hours:minutes:seconds' format.";
                };
                rangeType = lib.mkOption {
                  type = types.nullOr (types.enum [ 0 ]);
                  default = null;
                  description = "Range Type";
                };
              };
            });
            default = null;
            description = "The weekday curfew settings.";
          };
          weekend_allowance = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                enabled = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If 'true', enable these settings.";
                };
                secondsPerDay = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "The allowance for that day, in seconds.";
                };
                rangeType = lib.mkOption {
                  type = types.nullOr (types.enum [ 1 ]);
                  default = null;
                  description = "Range Type";
                };
              };
            });
            default = null;
            description = "The weekend allowance settings.";
          };
          weekend_curfew = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                enabled = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If 'true', enable these settings.";
                };
                start = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The start time for the curfew in 'hours:minutes:seconds' format.";
                };
                end = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The end time for the curfew in 'hours:minutes:seconds' format.";
                };
                rangeType = lib.mkOption {
                  type = types.nullOr (types.enum [ 1 ]);
                  default = null;
                  description = "Range Type";
                };
              };
            });
            default = null;
            description = "The weekend curfew settings.";
          };
        };
      });
      default = null;
      description = "The time limits to enforce if 'familyControlsEnabled' is enabled.";
    };

  };
}