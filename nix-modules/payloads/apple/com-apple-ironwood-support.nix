# Auto-generated from ProfileManifests: com.apple.ironwood.support.plist
# Domain: com.apple.ironwood.support
# Title: Parental Controls: Dictation and Profanity
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-ironwood-support" = {
    enable = lib.mkEnableOption "Parental Controls: Dictation and Profanity";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.ironwood.support";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Ironwood_Allowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables dictation. Use 'allowDictation' in Restrictions instead.";
    };

    Profanity_Allowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', suppresses profanity. Use 'forceAssistantProfanityFilter' in Restrictions instead.";
    };

    Assistant_Allowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow Assistant";
    };

  };
}