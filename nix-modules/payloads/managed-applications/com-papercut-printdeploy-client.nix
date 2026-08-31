# Auto-generated from ProfileManifests: com.papercut.printdeploy.client.plist
# Domain: com.papercut.printdeploy.client
# Title: PaperCut Print Deploy
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "PaperCut Print Deploy";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.papercut.printdeploy.client";
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
        default = [ "server_host" "server_port" "server_scheme" "skip_dpm" "strict_ssl" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
        default = null;
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
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-papercut-printdeploy-client" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "PaperCut Print Deploy (com.papercut.printdeploy.client) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}