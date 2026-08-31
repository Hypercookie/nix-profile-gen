# Auto-generated from ProfileManifests: com.apple.familycontrols.timelimits.v2.plist
# Domain: com.apple.familycontrols.timelimits.v2
# Title: Parental Controls: Time Limits
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Parental Controls: Time Limits";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.familycontrols.timelimits.v2";
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
        default = [ "familyControlsEnabled" "time_limits" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
                    type = types.nullOr (types.enum [ 0 1 ]);
                    default = null;
                    description = "The type of day range, which has the following possible values:\n'0': Weekday\n'1': Weekend";
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
                    description = "The curfew start time, in the format '%d:%d:%d'.";
                  };
                  end = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The curfew end time, in the format '%d:%d:%d'.";
                  };
                  rangeType = lib.mkOption {
                    type = types.nullOr (types.enum [ 0 1 ]);
                    default = null;
                    description = "The type of day range, which has the following possible values:\n'0': Weekday\n'1': Weekend";
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
                    type = types.nullOr (types.enum [ 0 1 ]);
                    default = null;
                    description = "The type of day range, which has the following possible values:\n'0': Weekday\n'1': Weekend";
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
                    description = "The curfew start time, in the format '%d:%d:%d'.";
                  };
                  end = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The curfew end time, in the format '%d:%d:%d'.";
                  };
                  rangeType = lib.mkOption {
                    type = types.nullOr (types.enum [ 0 1 ]);
                    default = null;
                    description = "The type of day range, which has the following possible values:\n'0': Weekday\n'1': Weekend";
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
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-familycontrols-timelimits-v2" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Parental Controls: Time Limits (com.apple.familycontrols.timelimits.v2) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}