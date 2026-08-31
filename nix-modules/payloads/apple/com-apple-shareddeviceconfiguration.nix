# Auto-generated from ProfileManifests: com.apple.shareddeviceconfiguration.plist
# Domain: com.apple.shareddeviceconfiguration
# Title: Lock Screen Message
# Platforms: iOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Lock Screen Message";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.shareddeviceconfiguration";
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
        default = [ "IfLostReturnToMessage" "LockScreenFootnote" "AssetTagInformation" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      IfLostReturnToMessage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Deprecated. Use 'LockScreenFootnote' instead.";
      };

      LockScreenFootnote = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The footnote displayed in the Login Window and Lock Screen.";
      };

      AssetTagInformation = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The asset tag information for the device, displayed in the Login Window and Lock Screen.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-shareddeviceconfiguration" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Lock Screen Message (com.apple.shareddeviceconfiguration) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}