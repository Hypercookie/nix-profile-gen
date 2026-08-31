# Auto-generated from ProfileManifests: com.alectrona.patch.plist
# Domain: com.alectrona.patch
# Title: Alectrona Patch Command Line Tool
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Alectrona Patch Command Line Tool";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.alectrona.patch";
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
        default = [ "License" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      License = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Your license key provided upon subscription to Alectrona Patch.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-alectrona-patch" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Alectrona Patch Command Line Tool (com.alectrona.patch) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}