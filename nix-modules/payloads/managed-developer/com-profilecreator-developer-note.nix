# Auto-generated from ProfileManifests: com.profilecreator.developer.note.plist
# Domain: com.profilecreator.developer.note
# Title: Developer: Note
# Platforms: iOS, macOS, tvOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Developer: Note";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.profilecreator.developer.note";
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
        default = [ "Note01" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Note01 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "TextField Note.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-note" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Developer: Note (com.profilecreator.developer.note) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}