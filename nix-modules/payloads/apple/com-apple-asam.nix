# Auto-generated from ProfileManifests: com.apple.asam.plist
# Domain: com.apple.asam
# Title: Autonomous Single App Mode
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Autonomous Single App Mode";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.asam";
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
        default = [ "AllowedApplications" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AllowedApplications = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            BundleIdentifier = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The unique bundle identifier. If two dictionaries contain the same 'BundleIdentifier' value but a different 'TeamIdentifier' value, an error occurs and the profile won't be installed.";
            };
            TeamIdentifier = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The developer's team identifier that the system used when it signed the app.";
            };
          };
        }));
        default = null;
        description = "An array of dictionaries that specifies the apps that the system grants access to the Accessibility APIs.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-asam" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Autonomous Single App Mode (com.apple.asam) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}