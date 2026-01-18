# Auto-generated from ProfileManifests: com.apple.iBooksX.plist
# Domain: com.apple.iBooksX
# Title: Books/iBooks
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-iBooksX" = {
    enable = lib.mkEnableOption "Books/iBooks";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.iBooksX";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    BKDisableBookStorePreferenceKey = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This payload also requires an iTunes payload with the \"disableMusicStore\" key set.";
    };

    BKAlreadyDisplayedGDPRWelcomeExperience = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Suppresses the \"Welcome to Apple Books\" screen at launch. This payload should be used in conjunction with the \"Suppress Empty Library\" key.";
    };

    BKAlreadyDisplayedUbiquity = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Suppresses the \"There are no books in your library\" screen. This payload should be used in conjunction with the \"Suppress Welcome to Apple Books Screen\" key";
    };

  };
}