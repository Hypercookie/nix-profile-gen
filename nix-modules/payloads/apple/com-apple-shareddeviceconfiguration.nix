# Auto-generated from ProfileManifests: com.apple.shareddeviceconfiguration.plist
# Domain: com.apple.shareddeviceconfiguration
# Title: Lock Screen Message
# Platforms: iOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-shareddeviceconfiguration" = {
    enable = lib.mkEnableOption "Lock Screen Message";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.shareddeviceconfiguration";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    IfLostReturnToMessage = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Deprecated. Use 'LockScreenFootnote' instead.";
    };

    LockScreenFootnote = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The footnote displayed in the Login Window and Lock Screen.";
    };

    AssetTagInformation = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The asset tag information for the device, displayed in the Login Window and Lock Screen.";
    };

  };
}