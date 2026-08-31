# Auto-generated from ProfileManifests: com.apple.iBooksX.plist
# Domain: com.apple.iBooksX
# Title: Books/iBooks
# Platforms: macOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Books/iBooks";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.iBooksX";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
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
        default = [ "system" "user" ];
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
        default = [ "BKDisableBookStorePreferenceKey" "BKAlreadyDisplayedGDPRWelcomeExperience" "BKAlreadyDisplayedUbiquity" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-iBooksX" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Books/iBooks (com.apple.iBooksX) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}