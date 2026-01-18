# Auto-generated from ProfileManifests: loginwindow.plist
# Domain: loginwindow
# Title: Login Window: Login Items
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-loginwindow" = {
    enable = lib.mkEnableOption "Login Window: Login Items";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "loginwindow";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    DisableLoginItemsSuppression = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system prevents the user from disabling login item launches by using the Shift key.";
    };

    AutoLaunchedApplicationDictionary_managed = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Hide = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Hide application at launch.";
          };
          AuthenticateAsLoginUserShortName = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Authenticate to the URL with the current users short name. Required if URL is specified, but not for Path";
          };
          MCX_NetworkHomeDirectoryItem = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Mount network home.";
          };
        };
      }));
      default = null;
      description = "Automatically launch the users network home share point when logging in.";
    };

  };
}