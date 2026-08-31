# Auto-generated from ProfileManifests: com.apple.mDNSResponder.plist
# Domain: com.apple.mDNSResponder
# Title: Bonjour
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Bonjour";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.mDNSResponder";
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
        default = [ "NoMulticastAdvertisements" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      NoMulticastAdvertisements = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-mDNSResponder" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Bonjour (com.apple.mDNSResponder) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}