# Auto-generated from ProfileManifests: com.profilecreator.developer.textfieldinteger.plist
# Domain: com.profilecreator.developer.TextFieldInteger
# Title: Developer: TextField Integer
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-textfieldinteger" = {
    enable = lib.mkEnableOption "Developer: TextField Integer";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.profilecreator.developer.TextFieldInteger";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    TextFieldInteger01 = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "TextField Integer.";
    };

    TextFieldInteger02 = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "TextField Integer with a long title.";
    };

    TextFieldInteger03 = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "TextFieldInteger with a long long long long long long long long long long long long long long long long long long long long long long long long long description.";
    };

    TextFieldInteger04 = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "TextFieldInteger with a placeholder value.";
    };

    TextFieldInteger05 = lib.mkOption {
      type = types.nullOr (types.int);
      default = 99;
      description = "TextFieldInteger with a default value.";
    };

    TextFieldInteger06 = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "TextFieldInteger with no title.";
    };

    TextFieldInteger07 = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "TextFieldInteger with an empty title.";
    };

    TextFieldInteger08 = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "TextFieldInteger 08: No Description";
    };

    TextFieldInteger09 = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
    };

    TextFieldInteger10 = lib.mkOption {
      type = types.nullOr (types.int);
      default = 98;
      description = "TextFieldInteger with a max value of: 99";
    };

    TextFieldInteger11 = lib.mkOption {
      type = types.nullOr (types.int);
      default = 2;
      description = "TextFieldInteger with a min value of: 1";
    };

    TextFieldInteger12 = lib.mkOption {
      type = types.nullOr (types.int);
      default = 2;
      description = "TextFieldInteger with a min value of: 1 and max value of: 99";
    };

  };
}