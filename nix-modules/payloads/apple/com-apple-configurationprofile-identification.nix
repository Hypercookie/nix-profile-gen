# Auto-generated from ProfileManifests: com.apple.configurationprofile.identification.plist
# Domain: com.apple.configurationprofile.identification
# Title: Identification
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Identification";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.configurationprofile.identification";
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
        default = [ ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-configurationprofile-identification" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Identification (com.apple.configurationprofile.identification) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}