# Auto-generated from ProfileManifests: com.crowdstrike.falcon.plist
# Domain: com.crowdstrike.falcon
# Title: CrowdStrike Falcon
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "CrowdStrike Falcon";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.crowdstrike.falcon";
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
        default = [ "ccid" "groupingTags" "provisioningToken" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      ccid = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The CCID licenses the CrowdStrike Falcon sensor to your customer ID.";
      };

      groupingTags = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Grouping Tags are an optional way to add text-based attributes that can be filtered on in Host Groups management. Multiple Grouping Tags can be added, separated by commas. Do not include spaces. See Documentation > Host and Host Group Management > Using Grouping Tags for more information.";
      };

      provisioningToken = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Installation Tokens are an optional way to require additional, revocable tokens (passwords) as a security measure when licensing a sensor to your CID. See Documentation > Host and Host Group Management > Protecting your CID with installation tokens for more information. Installation Tokens are disabled by default.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-crowdstrike-falcon" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "CrowdStrike Falcon (com.crowdstrike.falcon) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}