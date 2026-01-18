# Auto-generated from ProfileManifests: com.apple.DiscRecording.plist
# Domain: com.apple.DiscRecording
# Title: Media Management: Disc Burning
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-DiscRecording" = {
    enable = lib.mkEnableOption "Media Management: Disc Burning";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.DiscRecording";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    BurnSupport = lib.mkOption {
      type = types.nullOr (types.enum [ "off" "authenticate" "on" ]);
      default = null;
      description = "Configure disc-burn. Allowed values:\n- 'off': The system disables disc burning.\n- 'on': The system allows normal default operation. Setting this key to 'on' doesn't enable disc burn support if other mechanisms or preferences disabled it. Needs to be enabled with the 'Finder' profile.\n- 'authenticate': The system requires authentication.";
    };

  };
}