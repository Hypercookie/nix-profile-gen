# Auto-generated from ProfileManifests: io.macadmins.Outset.plist
# Domain: io.macadmins.Outset
# Title: Outset
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-io-macadmins-Outset" = {
    enable = lib.mkEnableOption "Outset";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "io.macadmins.Outset";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    ignored_users = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of usernames to add to the ignored users list";
    };

    wait_for_network = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enable or disable wait for network";
    };

    network_timeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = 180;
      description = "Specify how long Outset waits for network activity";
    };

    sha256sum = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          __key__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
          __value__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
        };
      });
      default = null;
      description = "Manage file verification checksums";
    };

    verbose_logging = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enable or disable verbose logging";
    };

    script_payloads = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          boot_every = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                __key__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Name";
                };
                __value__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Data";
                };
              };
            });
            default = null;
            description = "Boot-Every Action Scripts";
          };
          boot_once = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                __key__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Name";
                };
                __value__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Data";
                };
              };
            });
            default = null;
            description = "Boot-Once Action Scripts";
          };
          login_every = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                __key__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Name";
                };
                __value__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Data";
                };
              };
            });
            default = null;
            description = "Login-Every Action Scripts";
          };
          login_once = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                __key__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Name";
                };
                __value__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Data";
                };
              };
            });
            default = null;
            description = "Login-Once Action Scripts";
          };
          login_privileged_every = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                __key__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Name";
                };
                __value__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Data";
                };
              };
            });
            default = null;
            description = "Login-Privileged-Every Action Scripts";
          };
          login_privileged_once = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                __key__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Name";
                };
                __value__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Data";
                };
              };
            });
            default = null;
            description = "Login-Privileged-Once Action Scripts";
          };
          login_window = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                __key__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Name";
                };
                __value__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Data";
                };
              };
            });
            default = null;
            description = "Login-Window Action Scripts";
          };
          on_demand = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                __key__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Name";
                };
                __value__ = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Script Data";
                };
              };
            });
            default = null;
            description = "On-Demand Action Scripts";
          };
        };
      });
      default = null;
      description = "Script Payloads";
    };

  };
}