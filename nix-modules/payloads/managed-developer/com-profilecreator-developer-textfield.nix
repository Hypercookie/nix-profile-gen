# Auto-generated from ProfileManifests: com.profilecreator.developer.textfield.plist
# Domain: com.profilecreator.developer.textfield
# Title: Developer: TextField
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-textfield" = {
    enable = lib.mkEnableOption "Developer: TextField";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.profilecreator.developer.textfield";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    TextField01 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Standard TextField.";
    };

    TextField02 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "TextField with a long title.";
    };

    TextField03 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "TextField with a long long long long long long long long long long long long long long long long long long long long long long long long long description.";
    };

    TextField04 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "TextField with a placeholder value.";
    };

    TextField05 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "TextField with a default value.";
    };

    TextField06 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "TextField with no title.";
    };

    TextField07 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "TextField with an empty title.";
    };

    TextField08 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "TextField 08: No Description";
    };

    TextField09 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    TextField10 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "TextField with a required format of a MAC address: ^([0-9A-Fa-f]{2}:){5}([0-9A-Fa-f]{2})$";
    };

    TextField11 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "TextField with a unit";
    };

  };
}