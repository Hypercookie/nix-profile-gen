# Auto-generated from ProfileManifests: com.profilecreator.developer.textfieldinteger.plist
# Domain: com.profilecreator.developer.TextFieldInteger
# Title: Developer: TextField Integer
# Platforms: iOS, macOS, tvOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Developer: TextField Integer";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.profilecreator.developer.TextFieldInteger";
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
        default = [ "TextFieldInteger01" "TextFieldInteger02" "TextFieldInteger03" "TextFieldInteger04" "TextFieldInteger05" "TextFieldInteger06" "TextFieldInteger07" "TextFieldInteger08" "TextFieldInteger09" "TextFieldInteger10" "TextFieldInteger11" "TextFieldInteger12" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
        default = null;
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
        default = null;
        description = "TextFieldInteger with a max value of: 99";
      };

      TextFieldInteger11 = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "TextFieldInteger with a min value of: 1";
      };

      TextFieldInteger12 = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "TextFieldInteger with a min value of: 1 and max value of: 99";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-textfieldinteger" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Developer: TextField Integer (com.profilecreator.developer.TextFieldInteger) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}