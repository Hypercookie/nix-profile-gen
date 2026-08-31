# Auto-generated from ProfileManifests: net.whatsapp.WhatsApp.plist
# Domain: net.whatsapp.WhatsApp
# Title: WhatsApp
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "WhatsApp";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "net.whatsapp.WhatsApp";
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

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "system" "user" ];
        description = "Profile scopes this payload may be installed into (pfm_targets).";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "SUAutomaticallyUpdate" "SUEnableAutomaticChecks" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      SUAutomaticallyUpdate = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable automatic updates";
      };

      SUEnableAutomaticChecks = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable automatic update checks";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-net-whatsapp-WhatsApp" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "WhatsApp (net.whatsapp.WhatsApp) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}