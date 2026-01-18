# Auto-generated from ProfileManifests: com.apple.coreservices.uiagent.plist
# Domain: com.apple.coreservices.uiagent
# Title: CoreServices UIAgent
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-coreservices-uiagent" = {
    enable = lib.mkEnableOption "CoreServices UIAgent";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.coreservices.uiagent";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    CSUIDisable32BitWarnings = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hides the one-time alert shown when opening a 32-bit application.";
    };

  };
}