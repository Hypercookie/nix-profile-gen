# Auto-generated from ProfileManifests: com.profilecreator.developer.exclude.plist
# Domain: com.profilecreator.developer.exclude
# Title: Developer: Exclude
# Platforms: iOS, macOS, tvOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Developer: Exclude";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.profilecreator.developer.exclude";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
        description = "Whether only one instance of this payload is allowed per profile.";
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

      _platforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "iOS" "macOS" "tvOS" ];
        description = "Supported Apple platforms (pfm_platforms).";
      };

      _keyPlatforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.attrs;
        default = [ ];
        description = "Keys restricted to a subset of the manifest's platforms (key-level pfm_platforms).";
      };

      _allowUnsupportedPlatform = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Emit this instance even if its manifest says the target platform does not support it or some of its keys. Produces a warning instead of an error.";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "Exclude00" "Exclude01" "Exclude02" "Exclude03" "Exclude04" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Exclude00 = lib.mkOption {
        type = types.nullOr (types.enum [ "Item01" "Item02" "Item03" "Item04" "Item05" "Item06" ]);
        default = null;
        description = "Exclude condition target.";
      };

      Exclude01 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Exclude always if Item01 is selected.";
      };

      Exclude02 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Exclude always if Item02 or Item03 is selected.";
      };

      Exclude03 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Exclude always if Item04 is NOT selected.";
      };

      Exclude04 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Exclude always if Item05 or Item06 is NOT selected.";
      };

    };
  };
in
{
  options.payloads."managed-developer-com-profilecreator-developer-exclude" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Developer: Exclude (com.profilecreator.developer.exclude) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}