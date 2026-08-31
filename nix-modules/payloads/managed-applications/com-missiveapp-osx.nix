# Auto-generated from ProfileManifests: com.missiveapp.osx.plist
# Domain: com.missiveapp.osx
# Title: Missive
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Missive";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.missiveapp.osx";
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
        default = [ "AutoUpdate" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AutoUpdate = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Prevents Missive from automatically checking for updates to its Electron core. (Users will still see periodic requests to \"update\" via reload.)";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-missiveapp-osx" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Missive (com.missiveapp.osx) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}