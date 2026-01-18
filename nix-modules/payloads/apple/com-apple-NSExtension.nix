# Auto-generated from ProfileManifests: com.apple.NSExtension.plist
# Domain: com.apple.NSExtension
# Title: Extensions
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-NSExtension" = {
    enable = lib.mkEnableOption "Extensions";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.NSExtension";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AllowedExtensions = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of bundle identifiers for allowed extensions.";
    };

    DeniedExtensions = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of bundle identifiers for extensions that the system doesn't allow to run.";
    };

    DeniedExtensionPoints = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "AllPublicExtensionPoints" "com.apple.ui-services" "com.apple.AudioUnit-UI" "com.apple.Safari.content-blocker" "com.apple.FinderSync" "com.apple.photo-editing" "com.apple.Safari.extension" "com.apple.share-services" "com.apple.Safari.sharedlinks-service" "com.apple.ctk-tokens" "com.apple.widget-extension" "com.apple.dt.Xcode.extension.source-editor" ]));
      default = null;
      description = "An array of extension points for extensions that the system doesn't allow to run.";
    };

  };
}