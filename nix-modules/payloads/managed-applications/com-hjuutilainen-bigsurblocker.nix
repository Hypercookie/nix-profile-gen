# Auto-generated from ProfileManifests: com.hjuutilainen.bigsurblocker.plist
# Domain: com.hjuutilainen.bigsurblocker
# Title: Big Sur Blocker
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-hjuutilainen-bigsurblocker" = {
    enable = lib.mkEnableOption "Big Sur Blocker";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.hjuutilainen.bigsurblocker";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    bundleIDsToBlock = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Add any additional bundle identifiers to have Big Sur Blocker block those items as well.";
    };

    AlertTitle = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Custom Big Sur Blocker alert title.";
    };

    AlertText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Custom Big Sur Blocker alert text.";
    };

  };
}