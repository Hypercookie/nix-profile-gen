# Auto-generated from ProfileManifests: com.apple.security.certificatepreference.plist
# Domain: com.apple.security.certificatepreference
# Title: Certificate Preference
# Platforms: macOS
# Unique: no
# Targets: user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Certificate Preference";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.security.certificatepreference";
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

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "user" ];
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
        default = [ "Name" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Name = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "An email address (in RFC 822 format) or other name for which a preferred certificate is requested.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-security-certificatepreference" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Certificate Preference (com.apple.security.certificatepreference) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}