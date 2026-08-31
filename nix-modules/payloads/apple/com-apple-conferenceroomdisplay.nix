# Auto-generated from ProfileManifests: com.apple.conferenceroomdisplay.plist
# Domain: com.apple.conferenceroomdisplay
# Title: Conference Room Display
# Platforms: tvOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Conference Room Display";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.conferenceroomdisplay";
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
        default = [ "Message" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Message = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The custom message displayed on the screen in Conference Room Display mode.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-conferenceroomdisplay" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Conference Room Display (com.apple.conferenceroomdisplay) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}