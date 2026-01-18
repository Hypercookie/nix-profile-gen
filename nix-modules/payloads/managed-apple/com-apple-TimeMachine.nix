# Auto-generated from ProfileManifests: com.apple.TimeMachine.plist
# Domain: com.apple.TimeMachine
# Title: Time Machine
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-TimeMachine" = {
    enable = lib.mkEnableOption "Time Machine";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.TimeMachine";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    DoNotOfferNewDisksForBackup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

  };
}