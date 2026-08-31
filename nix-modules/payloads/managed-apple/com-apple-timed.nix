# Auto-generated from ProfileManifests: com.apple.timed.plist
# Domain: com.apple.timed
# Title: macOS Time Synchronization
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "macOS Time Synchronization";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.timed";
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
        default = [ "TMAutomaticTimeOnlyEnabled" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      TMAutomaticTimeOnlyEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If enabled, ensures the uniformity of time stamps for information systems with multiple system clocks and systems connected over a network.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-timed" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "macOS Time Synchronization (com.apple.timed) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}