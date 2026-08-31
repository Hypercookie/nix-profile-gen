# Auto-generated from ProfileManifests: com.apple.appstore.plist
# Domain: com.apple.appstore
# Title: App Store
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "App Store";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.appstore";
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
        default = [ "restrict_store_require_admin_to_install" "restrict_store_softwareupdate_only" "restrict_store_disable_app_adoption" "DisableSoftwareUpdateNotifications" "restrict_store_mdm_install_softwareupdate_only" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-appstore" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "App Store (com.apple.appstore) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}