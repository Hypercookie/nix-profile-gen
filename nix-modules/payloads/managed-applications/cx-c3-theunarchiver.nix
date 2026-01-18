# Auto-generated from ProfileManifests: cx.c3.theunarchiver.plist
# Domain: cx.c3.theunarchiver
# Title: The Unarchiver (MAS)
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-cx-c3-theunarchiver" = {
    enable = lib.mkEnableOption "The Unarchiver (MAS)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "cx.c3.theunarchiver";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    OnboardingUserViewedWelcomeSlide = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Suppress \"Welcome to The Unarchiver!\" slide.";
    };

  };
}