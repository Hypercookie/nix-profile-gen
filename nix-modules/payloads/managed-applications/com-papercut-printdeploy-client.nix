# Auto-generated from ProfileManifests: com.papercut.printdeploy.client.plist
# Domain: com.papercut.printdeploy.client
# Title: PaperCut Print Deploy
# Platforms: macOS
# Unique: yes
# Targets: system, user

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
        description = "Whether only one instance of this payload is allowed per profile.";
      };

      _displayName = lib.mkOption {
        internal = true;
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "PayloadDisplayName for this instance. Defaults to the domain.";
      };

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "system" "user" ];
        description = "Profile scopes this payload may be installed into (pfm_targets).";
      };

      _platforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "macOS" ];
        description = "Supported Apple platforms (pfm_platforms).";
      };

      _keyPlatforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.attrs;
        default = [ ];
        description = "Keys restricted to a subset of the manifest's platforms (key-level pfm_platforms).";
      };

      _allowUnsupportedPlatform = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Emit this instance even if its manifest says the target platform does not support it or some of its keys. Produces a warning instead of an error.";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
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
  options.payloads."managed-applications-com-papercut-printdeploy-client" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "PaperCut Print Deploy (com.papercut.printdeploy.client) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}