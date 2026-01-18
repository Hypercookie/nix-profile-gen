# Auto-generated from ProfileManifests: com.apple.mcxloginscripts.plist
# Domain: com.apple.mcxloginscripts
# Title: Login Window: Scripts
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-mcxloginscripts" = {
    enable = lib.mkEnableOption "Login Window: Scripts";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.mcxloginscripts";
      description = "The payload domain (PayloadType) for this manifest.";
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
      default = false;
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
      default = false;
      description = "If 'true', the system doesn't execute the logout scripts during logout.";
    };

  };
}