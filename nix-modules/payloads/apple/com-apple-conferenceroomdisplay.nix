# Auto-generated from ProfileManifests: com.apple.conferenceroomdisplay.plist
# Domain: com.apple.conferenceroomdisplay
# Title: Conference Room Display
# Platforms: tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-conferenceroomdisplay" = {
    enable = lib.mkEnableOption "Conference Room Display";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.conferenceroomdisplay";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Message = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The custom message displayed on the screen in Conference Room Display mode.";
    };

  };
}