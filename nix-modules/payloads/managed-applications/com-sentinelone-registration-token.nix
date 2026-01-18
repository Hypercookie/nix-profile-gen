# Auto-generated from ProfileManifests: com.sentinelone.registration-token.plist
# Domain: com.sentinelone.registration-token
# Title: SentinelOne
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-sentinelone-registration-token" = {
    enable = lib.mkEnableOption "SentinelOne";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.sentinelone.registration-token";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    S1InstallRegistrationToken = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Site or Group Token registers the SentinelOne installation to your instance.";
    };

  };
}