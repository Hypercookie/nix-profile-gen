# Auto-generated from ProfileManifests: com.apple.xsan.preferences.plist
# Domain: com.apple.xsan.preferences
# Title: Xsan Preferences
# Platforms: macOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Xsan Preferences";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.xsan.preferences";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "useDLC" "onlyMount" "denyMount" "preferDLC" "denyDLC" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      useDLC = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', use the DLC for all volumes.";
      };

      onlyMount = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of Xsan or StorNext volume names. The Xsan client attempts to automatically mount these volumes at startup. The system administrator can mount additional volumes manually by using the 'xsanctl(8)' mount command.";
      };

      denyMount = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of Xsan or StorNext volume names. If no 'onlyMount' array is present, the Xsan client automatically attempts to mount all SAN volumes except the volumes in this array. The system administrator can mount those volumes manually by using the 'xsanctl(8)' mount command.";
      };

      preferDLC = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of StorNext volume names. If the Xsan client is attempting to mount a volume named in this array, the Xsan client attempts to mount the volume using DLC. If DLC isn't available, the client attempts to mount the volume if its LUNs are available through Fibre Channel. The volume name must not also appear in 'denyDLC'.";
      };

      denyDLC = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of StorNext volume names. If the Xsan client is attempting to mount a volume named in this array, the client only mounts the volume if its logical units (LUNs) are available through Fibre Channel. It doesn't attempt to mount the volume using Distributed LAN Client (DLC).";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-xsan-preferences" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Xsan Preferences (com.apple.xsan.preferences) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}