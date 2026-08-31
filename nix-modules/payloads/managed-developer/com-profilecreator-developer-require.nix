# Auto-generated from ProfileManifests: com.profilecreator.developer.require.plist
# Domain: com.profilecreator.developer.require
# Title: Developer: Require
# Platforms: iOS, macOS, tvOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Developer: Require";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.profilecreator.developer.require";
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
        default = [ "Require00" "Require01" "Require02" "Require03" "Require04" "Require05" "Require06" "Require07" "Require08" "Require09" "Require10" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Require00 = lib.mkOption {
        type = types.nullOr (types.enum [ "Item01" "Item02" "Item03" "Item04" "Item05" "Item06" ]);
        default = null;
        description = "Require condition target.";
      };

      Require01 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Require always.";
      };

      Require02 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Require always if Item01 is selected.";
      };

      Require03 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Require always if Item02 or Item03 is selected.";
      };

      Require04 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Require always if Item04 is NOT selected.";
      };

      Require05 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Require always if Item05 or Item06 is NOT selected.";
      };

      Require06 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Require push.";
      };

      Require07 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Require push if Item01 is selected.";
      };

      Require08 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Require push if Item02 or Item03 is selected.";
      };

      Require09 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Require push if Item04 is NOT selected.";
      };

      Require10 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Require push if Item05 or Item06 is NOT selected.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-require" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Developer: Require (com.profilecreator.developer.require) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}