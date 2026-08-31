# Auto-generated from ProfileManifests: com.hjuutilainen.bigsurblocker.plist
# Domain: com.hjuutilainen.bigsurblocker
# Title: Big Sur Blocker
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Big Sur Blocker";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.hjuutilainen.bigsurblocker";
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
        default = [ "bundleIDsToBlock" "AlertTitle" "AlertText" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-hjuutilainen-bigsurblocker" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Big Sur Blocker (com.hjuutilainen.bigsurblocker) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}