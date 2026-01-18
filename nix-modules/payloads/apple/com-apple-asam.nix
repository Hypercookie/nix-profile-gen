# Auto-generated from ProfileManifests: com.apple.asam.plist
# Domain: com.apple.asam
# Title: Autonomous Single App Mode
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-asam" = {
    enable = lib.mkEnableOption "Autonomous Single App Mode";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.asam";
      description = "The payload domain (PayloadType) for this manifest.";
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
}