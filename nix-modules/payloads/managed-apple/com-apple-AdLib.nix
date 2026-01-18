# Auto-generated from ProfileManifests: com.apple.AdLib.plist
# Domain: com.apple.AdLib
# Title: Ad Tracking
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-AdLib" = {
    enable = lib.mkEnableOption "Ad Tracking";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.AdLib";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    forceLimitAdTracking = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enabling this opts out of receiving ads targeted to interests in Apple Apps and macOS devices. May still receive the same number of ads, but the ads may be less relevant.";
    };

    allowApplePersonalizedAdvertising = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disabling ad tracking ensures that applications and advertisers are unable to track users’ interests and deliver targeted advertisements.";
    };

  };
}