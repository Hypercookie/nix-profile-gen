# Auto-generated from ProfileManifests: com.apple.assistant.support.plist
# Domain: com.apple.assistant.support
# Title: Assistant (Siri)
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-assistant-support" = {
    enable = lib.mkEnableOption "Assistant (Siri)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.assistant.support";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Assistant_Enabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    Siri_Data_Sharing_Opt_In_Status = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Improve Siri & Dictation";
    };

    Search_Queries_Data_Sharing_Status = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Improve Search";
    };

  };
}