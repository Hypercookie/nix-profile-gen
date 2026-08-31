# Auto-generated from ProfileManifests: com.sentinelone.registration-token.plist
# Domain: com.sentinelone.registration-token
# Title: SentinelOne
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "SentinelOne";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.sentinelone.registration-token";
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

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "system" ];
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
        default = [ "S1InstallRegistrationToken" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      S1InstallRegistrationToken = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The Site or Group Token registers the SentinelOne installation to your instance.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-sentinelone-registration-token" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "SentinelOne (com.sentinelone.registration-token) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}