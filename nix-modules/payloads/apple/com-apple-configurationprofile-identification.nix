# Auto-generated from ProfileManifests: com.apple.configurationprofile.identification.plist
# Domain: com.apple.configurationprofile.identification
# Title: Identification
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-configurationprofile-identification" = {
    enable = lib.mkEnableOption "Identification";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.configurationprofile.identification";
      description = "The payload domain (PayloadType) for this manifest.";
    };

  };
}