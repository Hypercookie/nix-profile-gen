# Auto-generated from ProfileManifests: com.apple.systempolicy.managed.plist
# Domain: com.apple.systempolicy.managed
# Title: System Policy Managed
# Platforms: macOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "System Policy Managed";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.systempolicy.managed";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
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
        default = [ "DisableOverride" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      DisableOverride = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', disables the Finder's contextual menu item.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-systempolicy-managed" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "System Policy Managed (com.apple.systempolicy.managed) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}