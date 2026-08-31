# Auto-generated from ProfileManifests: com.fxfactory.FxFactory.plist
# Domain: com.fxfactory.FxFactory
# Title: FxFactory
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "FxFactory";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.fxfactory.FxFactory";
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
        default = [ "allowAutomaticUpdates" "checkForUpdates" "warnAboutUpdates" "warnAboutUpdatesToOtherSoftware" "warnAboutMissingComponents" "warnAboutUnsupportedHost" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      allowAutomaticUpdates = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Setting this to true, automatic updates will be enabled";
      };

      checkForUpdates = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Setting this to true, FxFactory will check for the latest versions of installed plugins";
      };

      warnAboutUpdates = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Setting this to true, FxFactory will send a notification when a new version is available, while using any application that loads FxFactory";
      };

      warnAboutUpdatesToOtherSoftware = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Setting this to true, FxFactory will send a notification when it finds outdated software on your system that may interfere with the operation of its products";
      };

      warnAboutMissingComponents = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Setting this to true, FxFactory will send a notification when any components required for normal operation are missing from the system";
      };

      warnAboutUnsupportedHost = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Setting this to true, FxFactory will send a notification if any products cannot be loaded by the current application due to a compatibility issue";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-fxfactory-FxFactory" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "FxFactory (com.fxfactory.FxFactory) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}