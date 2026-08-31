# Auto-generated from ProfileManifests: com.profilecreator.developer.textfieldfloat.plist
# Domain: com.profilecreator.developer.TextFieldFloat
# Title: Developer: TextField Float
# Platforms: iOS, macOS, tvOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Developer: TextField Float";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.profilecreator.developer.TextFieldFloat";
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
        default = [ "TextFieldFloat01" "TextFieldFloat02" "TextFieldFloat03" "TextFieldFloat04" "TextFieldFloat05" "TextFieldFloat06" "TextFieldFloat07" "TextFieldFloat08" "TextFieldFloat09" "TextFieldFloat10" "TextFieldFloat11" "TextFieldFloat12" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-textfieldfloat" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Developer: TextField Float (com.profilecreator.developer.TextFieldFloat) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}