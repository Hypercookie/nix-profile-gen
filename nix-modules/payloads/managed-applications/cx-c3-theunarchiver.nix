# Auto-generated from ProfileManifests: cx.c3.theunarchiver.plist
# Domain: cx.c3.theunarchiver
# Title: The Unarchiver (MAS)
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "The Unarchiver (MAS)";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "cx.c3.theunarchiver";
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
        default = [ "OnboardingUserViewedWelcomeSlide" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      OnboardingUserViewedWelcomeSlide = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Suppress \"Welcome to The Unarchiver!\" slide.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-cx-c3-theunarchiver" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "The Unarchiver (MAS) (cx.c3.theunarchiver) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}