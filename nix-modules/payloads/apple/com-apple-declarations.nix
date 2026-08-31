# Auto-generated from ProfileManifests: com.apple.declarations.plist
# Domain: com.apple.declarations
# Title: Declarations
# Platforms: iOS, macOS, tvOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Declarations";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.declarations";
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
        default = [ "system" "user" ];
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
        default = [ "Declarations" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Declarations = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "The set of declarations to apply. The array items are Base64-encoded data representations of the declaration JSON data.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-declarations" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Declarations (com.apple.declarations) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}