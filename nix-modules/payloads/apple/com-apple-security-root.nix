# Auto-generated from ProfileManifests: com.apple.security.root.plist
# Domain: com.apple.security.root
# Title: Certificate (Root)
# Platforms: iOS, macOS, tvOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Certificate (Root)";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.security.root";
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
        default = [ ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-security-root" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Certificate (Root) (com.apple.security.root) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}