# Auto-generated from ProfileManifests: com.apple.ironwood.support.plist
# Domain: com.apple.ironwood.support
# Title: Parental Controls: Dictation and Profanity
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Parental Controls: Dictation and Profanity";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.ironwood.support";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
        description = "Whether macOS allows only one instance of this payload per profile.";
      };

      _displayName = lib.mkOption {
        internal = true;
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "PayloadDisplayName for this instance. Defaults to the domain.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "Ironwood_Allowed" "Profanity_Allowed" "Assistant_Allowed" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Ironwood_Allowed = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'false', disables dictation. Use 'allowDictation' in Restrictions instead.";
      };

      Profanity_Allowed = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'false', suppresses profanity. Use 'forceAssistantProfanityFilter' in Restrictions instead.";
      };

      Assistant_Allowed = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Allow Assistant";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-ironwood-support" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Parental Controls: Dictation and Profanity (com.apple.ironwood.support) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}