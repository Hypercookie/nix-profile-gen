# Auto-generated from ProfileManifests: com.apple.SoftwareUpdate.plist
# Domain: com.apple.SoftwareUpdate
# Title: Software Update
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-SoftwareUpdate" = {
    enable = lib.mkEnableOption "Software Update";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.SoftwareUpdate";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    CatalogURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The URL of the software update catalog. This property is not supported in macOS 11 and later.";
    };

    SUDisableEVCheck = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This option was needed during Mojave betas which required https.";
    };

    AutomaticCheckEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', deselects the \"Check for updates\" option and prevents the user from changing the option.";
    };

    AutomaticDownload = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', deselects the \"Download new updates when available from the App Store\" option and prevents the user from changing the option.";
    };

    AutomaticallyInstallMacOSUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', restricts the \"Install macOS Updates\" option and prevents the user from changing the option.";
    };

    AutomaticallyInstallAppUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', deselects the \"Install app updates from the App Store\" option and prevents the user from changing the option.";
    };

    ConfigDataInstall = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', restricts the automatic installation of configuration data.";
    };

    CriticalUpdateInstall = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', disables the automatic installation of critical updates and prevents the user from changing the \"Install system data files and security updates\" option.";
    };

    AllowPreReleaseInstallation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', prerelease software can be installed on this computer.";
    };

    forceDelayedSoftwareUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Software updates will be delayed by the duration defined by ManagedDeferredInstallDelay.";
    };

    restrict_software_update_require_admin_to_install = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', restrict app installations to admin users. This key has the same function as the  'restrict-store-require-admin-to-install' key in the 'com.apple.appstore' payload.";
    };

    ManagedDeferredInstallDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The duration that software updates will be delayed.";
    };

  };
}