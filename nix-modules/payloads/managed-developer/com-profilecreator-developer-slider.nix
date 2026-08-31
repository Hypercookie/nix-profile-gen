# Auto-generated from ProfileManifests: com.profilecreator.developer.slider.plist
# Domain: com.profilecreator.developer.slider
# Title: Developer: Slider
# Platforms: iOS, macOS, tvOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Developer: Slider";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.profilecreator.developer.slider";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "Slider01" "Slider02" "Slider03" "Slider04" "Slider05" "Slider06" "Slider07" "Slider08" "Slider09" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-slider" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Developer: Slider (com.profilecreator.developer.slider) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}