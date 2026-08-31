# Auto-generated from ProfileManifests: com.apple.DiscRecording.plist
# Domain: com.apple.DiscRecording
# Title: Media Management: Disc Burning
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Media Management: Disc Burning";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.DiscRecording";
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
        default = [ "BurnSupport" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      BurnSupport = lib.mkOption {
        type = types.nullOr (types.enum [ "off" "authenticate" "on" ]);
        default = null;
        description = "Configure disc-burn. Allowed values:\n'off': The system disables disc burning.\n'on': The system allows normal default operation. Setting this key to 'on' doesn't enable disc burn support if other mechanisms or preferences disabled it. Needs to be enabled with the 'Finder' profile.\n'authenticate': The system requires authentication.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-DiscRecording" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Media Management: Disc Burning (com.apple.DiscRecording) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}