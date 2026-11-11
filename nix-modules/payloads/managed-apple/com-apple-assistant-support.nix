# Auto-generated from ProfileManifests: com.apple.assistant.support.plist
# Domain: com.apple.assistant.support
# Title: Assistant (Siri)
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Assistant (Siri)";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.assistant.support";
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
        default = [ "macOS" ];
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
        default = [ "Assistant_Enabled" "Siri_Data_Sharing_Opt_In_Status" "Search_Queries_Data_Sharing_Status" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Assistant_Enabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      Siri_Data_Sharing_Opt_In_Status = lib.mkOption {
        type = types.nullOr (types.enum [ 0 1 2 ]);
        default = null;
        description = "Improve Siri & Dictation";
      };

      Search_Queries_Data_Sharing_Status = lib.mkOption {
        type = types.nullOr (types.enum [ 1 2 ]);
        default = null;
        description = "Improve Search";
      };

    };
  };
in
{
  options.payloads."managed-apple-com-apple-assistant-support" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Assistant (Siri) (com.apple.assistant.support) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}