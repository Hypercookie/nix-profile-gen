# Auto-generated from ProfileManifests: com.apple.systempolicy.control.plist
# Domain: com.apple.systempolicy.control
# Title: System Policy Control
# Platforms: macOS
# Unique: no
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "System Policy Control";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.systempolicy.control";
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
        default = [ "EnableAssessment" "AllowIdentifiedDevelopers" "EnableXProtectMalwareUpload" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      EnableAssessment = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables Gatekeeper. If 'false', disables Gatekeeper.";
      };

      AllowIdentifiedDevelopers = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables Gatekeeper's \"Mac App Store and identified developers\" option.\nIf 'false', enables Gatekeeper's \"Mac App Store\" option.\nIf the value of 'EnableAssessment' isn't set to 'true', this key has no effect.";
      };

      EnableXProtectMalwareUpload = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'false', prevents Gatekeeper from prompting the user to upload blocked malware to Apple for purposes of improving malware detection.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-systempolicy-control" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "System Policy Control (com.apple.systempolicy.control) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}