# Auto-generated from ProfileManifests: com.apple.sharingd.plist
# Domain: com.apple.sharingd
# Title: AirDrop Discoverability (macOS)
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "AirDrop Discoverability (macOS)";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.sharingd";
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
        default = [ "DiscoverableMode" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      DiscoverableMode = lib.mkOption {
        type = types.nullOr (types.enum [ "Off" "Contacts Only" "Everyone" ]);
        default = null;
        description = "Configure the AirDrop option \"Allow me to be discovered by:\"";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-sharingd" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "AirDrop Discoverability (macOS) (com.apple.sharingd) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}