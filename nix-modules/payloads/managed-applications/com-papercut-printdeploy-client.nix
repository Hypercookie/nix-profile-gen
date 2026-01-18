# Auto-generated from ProfileManifests: com.papercut.printdeploy.client.plist
# Domain: com.papercut.printdeploy.client
# Title: PaperCut Print Deploy
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-papercut-printdeploy-client" = {
    enable = lib.mkEnableOption "PaperCut Print Deploy";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.papercut.printdeploy.client";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    server_host = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "FQDN taken from inside the square brackets in the file name of the client .dmg.";
    };

    server_port = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Server Port";
    };

    server_scheme = lib.mkOption {
      type = types.nullOr (types.enum [ "http" "https" ]);
      default = "https";
      description = "Server Scheme";
    };

    skip_dpm = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Skip Direct Print Monitor Tool";
    };

    strict_ssl = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Strict SSL";
    };

  };
}