# Auto-generated from ProfileManifests: com.twingate.macos.plist
# Domain: com.twingate.macos
# Title: Twingate
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Twingate";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.twingate.macos";
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
        default = [ "network" "startAtLogin" "PresentedDataPrivacy" "PresentedEducation" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      network = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "A pre-configured Twingate network subdomain (eg. autoco from autoco.twingate.com). This avoids users needing to enter your Twingate network address on first run.";
      };

      startAtLogin = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Starts the Twingate Client upon user login";
      };

      PresentedDataPrivacy = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Suppresses the first run Data Privacy screen";
      };

      PresentedEducation = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Suppresses the first run Education screens";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-twingate-macos" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Twingate (com.twingate.macos) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}