# Auto-generated from ProfileManifests: com.docker.config.plist
# Domain: com.docker.config
# Title: Docker Desktop
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-docker-config" = {
    enable = lib.mkEnableOption "Docker Desktop";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.docker.config";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    allowedOrgs = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Add your organization(s) name";
    };

  };
}