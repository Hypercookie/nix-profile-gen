# Auto-generated from ProfileManifests: com.fxfactory.FxFactory.plist
# Domain: com.fxfactory.FxFactory
# Title: FxFactory
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-fxfactory-FxFactory" = {
    enable = lib.mkEnableOption "FxFactory";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.fxfactory.FxFactory";
      description = "The payload domain (PayloadType) for this manifest.";
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
}