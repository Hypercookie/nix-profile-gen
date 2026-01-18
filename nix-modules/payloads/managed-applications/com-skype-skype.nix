# Auto-generated from ProfileManifests: com.skype.skype.plist
# Domain: com.skype.skype
# Title: Skype
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-skype-skype" = {
    enable = lib.mkEnableOption "Skype";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.skype.skype";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    SKSilentUpgradeNoticeShown = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Surpress Upgrade Notification.";
    };

    SKAllowStealthUpgrade = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Supress installation prompt for Privilege Helper Tool.";
    };

  };
}