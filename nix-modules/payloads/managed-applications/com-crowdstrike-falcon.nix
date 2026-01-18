# Auto-generated from ProfileManifests: com.crowdstrike.falcon.plist
# Domain: com.crowdstrike.falcon
# Title: CrowdStrike Falcon
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-crowdstrike-falcon" = {
    enable = lib.mkEnableOption "CrowdStrike Falcon";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.crowdstrike.falcon";
      description = "The payload domain (PayloadType) for this manifest.";
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
}