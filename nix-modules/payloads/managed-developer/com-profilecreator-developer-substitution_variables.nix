# Auto-generated from ProfileManifests: com.profilecreator.developer.substitution_variables.plist
# Domain: com.profilecreator.developer.substitution_variables
# Title: Developer: Substitution Variables
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-substitution_variables" = {
    enable = lib.mkEnableOption "Developer: Substitution Variables";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.profilecreator.developer.substitution_variables";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    SubstitutionVariables01 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "TextField with substitution variables: <<serial>>";
    };

  };
}