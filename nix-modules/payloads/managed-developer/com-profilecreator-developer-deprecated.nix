# Auto-generated from ProfileManifests: com.profilecreator.developer.deprecated.plist
# Domain: com.profilecreator.developer.deprecated
# Title: Developer: Deprecated
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-deprecated" = {
    enable = lib.mkEnableOption "Developer: Deprecated";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.profilecreator.developer.deprecated";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Deprecated01 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Standard TextField.";
    };

    Deprecated02 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "TextField with a long title.";
    };

  };
}