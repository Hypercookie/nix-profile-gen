# Auto-generated from ProfileManifests: com.apple.systempolicy.control.plist
# Domain: com.apple.systempolicy.control
# Title: System Policy Control
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-systempolicy-control" = {
    enable = lib.mkEnableOption "System Policy Control";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.systempolicy.control";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    EnableAssessment = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', enables Gatekeeper. If 'false', disables Gatekeeper.";
    };

    AllowIdentifiedDevelopers = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', enables Gatekeeper's \"Mac App Store and identified developers\" option.\n\nIf 'false', enables Gatekeeper's \"Mac App Store\" option.\n\nIf the value of 'EnableAssessment' isn't set to 'true', this key has no effect.";
    };

    EnableXProtectMalwareUpload = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', prevents Gatekeeper from prompting the user to upload blocked malware to Apple for purposes of improving malware detection.";
    };

  };
}