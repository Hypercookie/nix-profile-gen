# Auto-generated from ProfileManifests: com.apple.declarations.plist
# Domain: com.apple.declarations
# Title: Declarations
# Platforms: iOS, tvOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-declarations" = {
    enable = lib.mkEnableOption "Declarations";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.declarations";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Declarations = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The set of declarations to apply. The array items are Base64-encoded data representations of the declaration JSON data.";
    };

  };
}