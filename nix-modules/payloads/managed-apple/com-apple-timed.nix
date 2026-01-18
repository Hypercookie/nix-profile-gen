# Auto-generated from ProfileManifests: com.apple.timed.plist
# Domain: com.apple.timed
# Title: macOS Time Synchronization
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-timed" = {
    enable = lib.mkEnableOption "macOS Time Synchronization";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.timed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    TMAutomaticTimeOnlyEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, ensures the uniformity of time stamps for information systems with multiple system clocks and systems connected over a network.";
    };

  };
}