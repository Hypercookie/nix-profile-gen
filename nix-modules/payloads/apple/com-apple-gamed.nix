# Auto-generated from ProfileManifests: com.apple.gamed.plist
# Domain: com.apple.gamed
# Title: Parental Controls: Game Center
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-gamed" = {
    enable = lib.mkEnableOption "Parental Controls: Game Center";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.gamed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    GKFeatureGameCenterAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'true', enables Game Center.";
    };

    GKFeatureAccountModificationAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'true', allows account modifications.";
    };

    GKFeatureAddingGameCenterFriendsAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'true', allows adding Game Center friends.";
    };

    GKFeatureMultiplayerGamingAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'true', allows multiplayer gaming.";
    };

  };
}