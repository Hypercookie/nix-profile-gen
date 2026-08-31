# Auto-generated from ProfileManifests: com.apple.screencapture.plist
# Domain: com.apple.screencapture
# Title: Screencapture
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Screencapture";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.screencapture";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "disable_shadow" "location" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      disable_shadow = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      location = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "File system path (can start with ~) where screenshots will be saved.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-screencapture" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Screencapture (com.apple.screencapture) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}