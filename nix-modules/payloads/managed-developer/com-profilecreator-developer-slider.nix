# Auto-generated from ProfileManifests: com.profilecreator.developer.slider.plist
# Domain: com.profilecreator.developer.slider
# Title: Developer: Slider
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-slider" = {
    enable = lib.mkEnableOption "Developer: Slider";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.profilecreator.developer.slider";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Slider01 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "Slider with a range list of two items: [5.0, 10.0].";
    };

    Slider02 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "Slider with a range list of three items: [5.0, 10.0, 15.0] and titles.";
    };

    Slider03 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "Slider with a range list of four items: [5.0, 6.0, 17.0003212, 20.0].";
    };

    Slider04 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "Slider with a range list of five items: [0.01, 0.02, 0.13, 0.23, 0.92] and mixed titles.";
    };

    Slider05 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "Slider with a range list of twenty items: [1.0...1.19].";
    };

    Slider06 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "Slider with a range list of twenty items: [1.0...1.19] with short titles.";
    };

    Slider07 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "Slider with a range list of twenty items: [1.0...1.19] with medium titles.";
    };

    Slider08 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "Slider with a range list of twenty items: [1.0...1.19] with long titles.";
    };

    Slider09 = lib.mkOption {
      type = types.nullOr (types.anything);
      default = null;
      description = "Slider with a range list of twenty items: [1.0...1.19] with too long titles.";
    };

  };
}