# Auto-generated from ProfileManifests: io.macadmins.Outset.plist
# Domain: io.macadmins.Outset
# Title: Outset
# Platforms: macOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Outset";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "io.macadmins.Outset";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
        description = "Whether macOS allows only one instance of this payload per profile.";
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

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "ignored_users" "wait_for_network" "network_timeout" "sha256sum" "verbose_logging" "script_payloads" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      ignored_users = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of usernames to add to the ignored users list";
      };

      wait_for_network = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable or disable wait for network";
      };

      network_timeout = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
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
        default = null;
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
  };
in
{
  options.programs.macprofile.payloads."managed-applications-io-macadmins-Outset" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Outset (io.macadmins.Outset) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}