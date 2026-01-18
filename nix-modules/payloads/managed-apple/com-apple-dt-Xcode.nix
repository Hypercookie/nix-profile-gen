# Auto-generated from ProfileManifests: com.apple.dt.Xcode.plist
# Domain: com.apple.dt.Xcode
# Title: Xcode
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-dt-Xcode" = {
    enable = lib.mkEnableOption "Xcode";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.dt.Xcode";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    IDEProhibitOnDeviceModelInteraction = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls whether Xcode Predictive Code Completion is allowed.";
    };

    IDEProhibitRemoteModelInteraction = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls whether Swift Assist is allowed.";
    };

    CodingAssistantAllowExternalIntegrations = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls whether the coding assistant is allowed.";
    };

  };
}