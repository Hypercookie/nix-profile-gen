# Auto-generated from ProfileManifests: com.apple.appstore.plist
# Domain: com.apple.appstore
# Title: App Store
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-appstore" = {
    enable = lib.mkEnableOption "App Store";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.appstore";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    restrict_store_require_admin_to_install = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system restricts app installations to admin users only. Deprecated in macOS 10.14. Use the 'com.apple.SoftwareUpdate' payload key 'restrict-software-update-require-admin-to-install' instead.";
    };

    restrict_store_softwareupdate_only = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system prevents App Store from launching. Available in macOS 10.14 and later. Restricts installations to software updates only in macOS 10.10 through 10.13.";
    };

    restrict_store_disable_app_adoption = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system disables app adoption by users. Available in macOS 10.10 and later.";
    };

    DisableSoftwareUpdateNotifications = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system disables software update notifications. Available in macOS 10.10 and later.";
    };

    restrict_store_mdm_install_softwareupdate_only = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Restrict app installations to MDM-installed apps and software updates";
    };

  };
}