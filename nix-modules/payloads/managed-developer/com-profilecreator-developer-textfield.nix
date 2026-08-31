# Auto-generated from ProfileManifests: com.profilecreator.developer.textfield.plist
# Domain: com.profilecreator.developer.textfield
# Title: Developer: TextField
# Platforms: iOS, macOS, tvOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Developer: TextField";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.profilecreator.developer.textfield";
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
        default = [ "system" "user" ];
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
        default = [ "TextField01" "TextField02" "TextField03" "TextField04" "TextField05" "TextField06" "TextField07" "TextField08" "TextField09" "TextField10" "TextField11" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-textfield" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Developer: TextField (com.profilecreator.developer.textfield) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}