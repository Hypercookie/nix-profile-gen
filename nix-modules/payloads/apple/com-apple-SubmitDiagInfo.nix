# Auto-generated from ProfileManifests: com.apple.SubmitDiagInfo.plist
# Domain: com.apple.SubmitDiagInfo
# Title: Submit Diagnostic Information
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-SubmitDiagInfo" = {
    enable = lib.mkEnableOption "Submit Diagnostic Information";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.SubmitDiagInfo";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AutoSubmit = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Configures the automatic submission of diagnostic information to Apple.";
    };

  };
}