# Auto-generated from ProfileManifests: com.apple.mcxloginscripts.plist
# Domain: com.apple.mcxloginscripts
# Title: Login Window: Scripts
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Login Window: Scripts";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.mcxloginscripts";
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

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "system" ];
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
        default = [ "loginscripts" "skipLoginHook" "logoutscripts" "skipLogoutHook" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      loginscripts = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            filename = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The filename for display purposes.";
            };
            filedata = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The UTF-8 encoded data object representing the executable script.";
            };
          };
        }));
        default = null;
        description = "An array of one or more dictionaries of scripts to run at user login time.";
      };

      skipLoginHook = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system doesn't execute the login scripts during login.";
      };

      logoutscripts = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            filename = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The filename for display purposes.";
            };
            filedata = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The UTF-8 encoded data object representing the executable script.";
            };
          };
        }));
        default = null;
        description = "An array of one or more dictionaries of scripts to run at user logout time.";
      };

      skipLogoutHook = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system doesn't execute the logout scripts during logout.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-mcxloginscripts" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Login Window: Scripts (com.apple.mcxloginscripts) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}