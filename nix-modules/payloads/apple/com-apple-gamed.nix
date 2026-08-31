# Auto-generated from ProfileManifests: com.apple.gamed.plist
# Domain: com.apple.gamed
# Title: Parental Controls: Game Center
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Parental Controls: Game Center";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.gamed";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "GKFeatureGameCenterAllowed" "GKFeatureAccountModificationAllowed" "GKFeatureAddingGameCenterFriendsAllowed" "GKFeatureMultiplayerGamingAllowed" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      GKFeatureGameCenterAllowed = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables Game Center.";
      };

      GKFeatureAccountModificationAllowed = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', allows account modifications.";
      };

      GKFeatureAddingGameCenterFriendsAllowed = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', allows adding Game Center friends.";
      };

      GKFeatureMultiplayerGamingAllowed = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', allows multiplayer gaming.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-gamed" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Parental Controls: Game Center (com.apple.gamed) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}