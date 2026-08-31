# Auto-generated from ProfileManifests: com.profilecreator.developer.substitution_variables.plist
# Domain: com.profilecreator.developer.substitution_variables
# Title: Developer: Substitution Variables
# Platforms: iOS, macOS, tvOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Developer: Substitution Variables";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.profilecreator.developer.substitution_variables";
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
        default = [ "SubstitutionVariables01" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      SubstitutionVariables01 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "TextField with substitution variables: <<serial>>";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-substitution_variables" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Developer: Substitution Variables (com.profilecreator.developer.substitution_variables) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}