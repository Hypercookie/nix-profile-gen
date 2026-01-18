# Auto-generated from ProfileManifests: com.apple.MCX-EnergySaver.plist
# Domain: com.apple.MCX
# Title: Energy Saver
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-MCX-EnergySaver" = {
    enable = lib.mkEnableOption "Energy Saver";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.MCX";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    "com.apple.EnergySaver.desktop.ACPower" = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Display_Sleep_Timer = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The display sleep time, in minutes. A value of 0 means never.";
          };
          System_Sleep_Timer = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "System sleep time, in minutes. A value of 0 means never.";
          };
          Disk_Sleep_Timer = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The disk sleep time, in minutes. A value of 0 means never.";
          };
          Wake_on_LAN = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "If 'true', enables \"Wake for network access.\"";
          };
          Wake_On_Modem_Ring = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "If 'true', enables \"Wake for modem ring.\"";
          };
          Automatic_Restart_On_Power_Loss = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "If 'true', enables \"Start up automatically after a power failure.\"";
          };
          Dynamic_Power_Step = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "May not be available on all systems.";
          };
          Reduce_Processor_Speed = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "May not be available on all systems.";
          };
        };
      });
      default = null;
      description = "The settings for a desktop computer.";
    };

    PFC_SegmentedControl_Portable = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    "com.apple.EnergySaver.portable.BatteryPower" = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Display_Sleep_Timer = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The display sleep time, in minutes. A value of 0 means never.";
          };
          System_Sleep_Timer = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "System sleep time, in minutes. A value of 0 means never.";
          };
          Disk_Sleep_Timer = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The disk sleep time, in minutes. A value of 0 means never.";
          };
          Wake_on_LAN = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "If 'true', enables \"Wake for network access.\"";
          };
          Wake_On_Modem_Ring = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "If 'true', enables \"Wake for modem ring.\"";
          };
          Automatic_Restart_On_Power_Loss = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "If 'true', enables \"Start up automatically after a power failure.\"";
          };
          Dynamic_Power_Step = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "May not be available on all systems.";
          };
          Reduce_Processor_Speed = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "May not be available on all systems.";
          };
        };
      });
      default = null;
      description = "The settings for a laptop computer using battery power.";
    };

    "com.apple.EnergySaver.portable.ACPower" = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Display_Sleep_Timer = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The display sleep time, in minutes. A value of 0 means never.";
          };
          System_Sleep_Timer = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "System sleep time, in minutes. A value of 0 means never.";
          };
          Disk_Sleep_Timer = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The disk sleep time, in minutes. A value of 0 means never.";
          };
          Wake_on_LAN = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "If 'true', enables \"Wake for network access.\"";
          };
          Wake_On_Modem_Ring = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "If 'true', enables \"Wake for modem ring.\"";
          };
          Automatic_Restart_On_Power_Loss = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "If 'true', enables \"Start up automatically after a power failure.\"";
          };
          Dynamic_Power_Step = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "May not be available on all systems.";
          };
          Reduce_Processor_Speed = lib.mkOption {
            type = types.nullOr (types.enum [ 0 1 ]);
            default = null;
            description = "May not be available on all systems.";
          };
        };
      });
      default = null;
      description = "The settings for a laptop computer using AC power.";
    };

    "com.apple.EnergySaver.desktop.Schedule" = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          RepeatingPowerOn = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                eventtype = lib.mkOption {
                  type = types.nullOr (types.enum [ "wake" "poweron" "wakepoweron" ]);
                  default = null;
                  description = "The type of action defined by this schedule.";
                };
                weekdays = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "One or more days of the week in an unsigned integer bitmap:\n\n- '1' = Mon\n- '2' = Tue\n- '4' = Wed\n- '8' = Thu\n- '16' = Fri\n- '32' = Sat\n- '64' = Sun";
                };
                time = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "The time, in minutes, since midnight.";
                };
              };
            });
            default = null;
            description = "The schedule for turning the device on.";
          };
          RepeatingPowerOff = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                eventtype = lib.mkOption {
                  type = types.nullOr (types.enum [ "sleep" "shutdown" "restart" ]);
                  default = null;
                  description = "The type of action defined by this schedule.";
                };
                weekdays = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "One or more days of the week in an unsigned integer bitmap:\n\n- '1' = Mon\n- '2' = Tue\n- '4' = Wed\n- '8' = Thu\n- '16' = Fri\n- '32' = Sat\n- '64' = Sun";
                };
                time = lib.mkOption {
                  type = types.nullOr (types.int);
                  default = null;
                  description = "The time, in minutes, since midnight.";
                };
              };
            });
            default = null;
            description = "The schedule for turning the device off.";
          };
        };
      });
      default = null;
      description = "The schedule for turning a computer on and off.";
    };

    SleepDisabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', disables sleep.";
    };

  };
}