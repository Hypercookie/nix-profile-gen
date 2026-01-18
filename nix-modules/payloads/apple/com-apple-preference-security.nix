# Auto-generated from ProfileManifests: com.apple.preference.security.plist
# Domain: com.apple.preference.security
# Title: Security Preferences
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-preference-security" = {
    enable = lib.mkEnableOption "Security Preferences";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.preference.security";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    dontAllowPasswordResetUI = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', disables user changes to the password.";
    };

    dontAllowLockMessageUI = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', disables user changes to the lock message.";
    };

    dontAllowFireWallUI = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', disables user changes to the firewall settings.";
    };

  };
}