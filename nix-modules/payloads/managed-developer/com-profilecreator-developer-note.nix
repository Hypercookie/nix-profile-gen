# Auto-generated from ProfileManifests: com.profilecreator.developer.note.plist
# Domain: com.profilecreator.developer.note
# Title: Developer: Note
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-developer-com-profilecreator-developer-note" = {
    enable = lib.mkEnableOption "Developer: Note";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.profilecreator.developer.note";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Note01 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "TextField Note.";
    };

  };
}