# Auto-generated from ProfileManifests: com.apple.FinalCut.plist
# Domain: com.apple.FinalCut
# Title: Final Cut Pro
# Platforms: macOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Final Cut Pro";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.FinalCut";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "LKWelcomeDisplayedForAppVersion" "LKWhatsNewDisplayedForAppVersion" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      LKWelcomeDisplayedForAppVersion = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
            };
          };
        });
        default = null;
        description = "Suppress the Welcome screen on the selected versions of Final Cut Pro.";
      };

      LKWhatsNewDisplayedForAppVersion = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
            };
          };
        });
        default = null;
        description = "Suppress the Whats New screen on the selected versions of Final Cut Pro.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-apple-FinalCut" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Final Cut Pro (com.apple.FinalCut) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}