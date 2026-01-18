# Auto-generated from ProfileManifests: com.grammarly.ProjectLlama.plist
# Domain: com.grammarly.ProjectLlama
# Title: Grammarly
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-grammarly-ProjectLlama" = {
    enable = lib.mkEnableOption "Grammarly";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.grammarly.ProjectLlama";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    GrammarlyEnrollmentToken = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Ensures that only the users who belong to your organization's Grammarly Business subscription can sign in to Grammarly's product offerings";
    };

  };
}