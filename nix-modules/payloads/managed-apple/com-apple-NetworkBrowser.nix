# Auto-generated from ProfileManifests: com.apple.NetworkBrowser.plist
# Domain: com.apple.NetworkBrowser
# Title: AirDrop (macOS)
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "AirDrop (macOS)";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.NetworkBrowser";
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
        default = [ "DisableAirDrop" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      DisableAirDrop = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-NetworkBrowser" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "AirDrop (macOS) (com.apple.NetworkBrowser) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}