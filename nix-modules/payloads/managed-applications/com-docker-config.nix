# Auto-generated from ProfileManifests: com.docker.config.plist
# Domain: com.docker.config
# Title: Docker Desktop
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Docker Desktop";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.docker.config";
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
        default = [ "allowedOrgs" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      allowedOrgs = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Add your organization(s) name";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-docker-config" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Docker Desktop (com.docker.config) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}