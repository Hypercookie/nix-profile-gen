# Auto-generated from ProfileManifests: com.frontapp.Front.plist
# Domain: com.frontapp.Front
# Title: Front
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Front";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.frontapp.Front";
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
        default = [ "DisableAutoUpdate" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      DisableAutoUpdate = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Prevents Front from updating automatically.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-frontapp-Front" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Front (com.frontapp.Front) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}