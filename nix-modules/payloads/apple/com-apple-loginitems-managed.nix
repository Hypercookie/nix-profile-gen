# Auto-generated from ProfileManifests: com.apple.loginitems.managed.plist
# Domain: com.apple.loginitems.managed
# Title: Login Items: Managed Items
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-loginitems-managed" = {
    enable = lib.mkEnableOption "Login Items: Managed Items";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.loginitems.managed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AutoLaunchedApplicationDictionary_managed = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Hide = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If 'true', the system hides this item in the Users & Groups login items list.";
          };
          Path = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The URL or path string to the item's location.";
          };
          URL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "URL to mount in the form scheme://mount.point/Share";
          };
          AuthenticateAsLoginUserShortName = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Authenticate to the URL with the current users short name. Required if URL is specified, but not for Path";
          };
        };
      }));
      default = null;
      description = "An array of login item dictionaries.";
    };

  };
}