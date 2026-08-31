# Auto-generated from ProfileManifests: com.apple.NSExtension.plist
# Domain: com.apple.NSExtension
# Title: Extensions
# Platforms: macOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Extensions";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.NSExtension";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
        description = "Whether macOS allows only one instance of this payload per profile.";
      };

      _displayName = lib.mkOption {
        internal = true;
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "PayloadDisplayName for this instance. Defaults to the domain.";
      };

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "system" "user" ];
        description = "Profile scopes this payload may be installed into (pfm_targets).";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "AllowedExtensions" "DeniedExtensions" "DeniedExtensionPoints" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-NSExtension" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Extensions (com.apple.NSExtension) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}