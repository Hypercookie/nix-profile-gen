# Auto-generated from ProfileManifests: com.macpaw.site.theunarchiver.plist
# Domain: com.macpaw.site.theunarchiver
# Title: The Unarchiver (Standalone)
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "The Unarchiver (Standalone)";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.macpaw.site.theunarchiver";
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
        default = [ "userAgreedToNewTOSAndPrivacy" "SUEnableAutomaticChecks" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      userAgreedToNewTOSAndPrivacy = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable this option to automatically accept the Privacy Policy and Terms of Service for users.";
      };

      SUEnableAutomaticChecks = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Automatically check for The Unarchiver (Standalone) updates";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-macpaw-site-theunarchiver" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "The Unarchiver (Standalone) (com.macpaw.site.theunarchiver) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}