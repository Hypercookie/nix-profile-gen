# Auto-generated from ProfileManifests: com.profilecreator.developer.textfieldfloat.plist
# Domain: com.profilecreator.developer.TextFieldFloat
# Title: Developer: TextField Float
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-textfieldfloat" = {
    enable = lib.mkEnableOption "Developer: TextField Float";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.profilecreator.developer.TextFieldFloat";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    TextFieldFloat01 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "TextField Float.";
    };

    TextFieldFloat02 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "TextField Float with a long title.";
    };

    TextFieldFloat03 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "TextFieldFloat with a long long long long long long long long long long long long long long long long long long long long long long long long long description.";
    };

    TextFieldFloat04 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "TextFieldFloat with a placeholder value.";
    };

    TextFieldFloat05 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "TextFieldFloat with a default value.";
    };

    TextFieldFloat06 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "TextFieldFloat with no title.";
    };

    TextFieldFloat07 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "TextFieldFloat with an empty title.";
    };

    TextFieldFloat08 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "TextFieldFloat 08: No Description";
    };

    TextFieldFloat09 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
    };

    TextFieldFloat10 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "TextFieldFloat with a max value of: 99";
    };

    TextFieldFloat11 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "TextFieldFloat with a min value of: 1";
    };

    TextFieldFloat12 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "TextFieldFloat with a min value of: 1 and max value of: 99";
    };

  };
}