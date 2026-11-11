# Auto-generated from ProfileManifests: com.trelica.macapp.plist
# Domain: com.trelica.macapp
# Title: Trelica Browser Helper
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Trelica Browser Helper";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.trelica.macapp";
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
        default = [ "OrgId" "Domain" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      OrgId = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The unique identifier for your organization in Trelica.";
      };

      Domain = lib.mkOption {
        type = types.nullOr (types.enum [ "app.trelica.com" "eu.trelica.com" ]);
        default = null;
        description = "The domain your organization uses for Trelica. Use app.trelica.com for US-hosted organizations or eu.trelica.com for EU-hosted organizations.";
      };

    };
  };
in
{
  options.payloads."managed-applications-com-trelica-macapp" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Trelica Browser Helper (com.trelica.macapp) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}