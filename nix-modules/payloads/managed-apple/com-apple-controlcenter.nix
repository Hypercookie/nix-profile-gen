# Auto-generated from ProfileManifests: com.apple.controlcenter.plist
# Domain: com.apple.controlcenter
# Title: Control Center
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Control Center";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.controlcenter";
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
        default = [ "system" ];
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
        default = [ "AirplayRecieverEnabled" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AirplayRecieverEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Airplay Receiver allows you to send content from another Apple device to be displayed on the screen as it's being played from your other device.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-controlcenter" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Control Center (com.apple.controlcenter) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}