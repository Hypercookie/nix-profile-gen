# Auto-generated from ProfileManifests: com.apple.AdLib.plist
# Domain: com.apple.AdLib
# Title: Ad Tracking
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Ad Tracking";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.AdLib";
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
        default = [ "forceLimitAdTracking" "allowApplePersonalizedAdvertising" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-AdLib" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Ad Tracking (com.apple.AdLib) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}