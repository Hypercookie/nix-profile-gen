# Auto-generated from ProfileManifests: com.apple.system.logging.plist
# Domain: com.apple.system.logging
# Title: System Logging
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-system-logging" = {
    enable = lib.mkEnableOption "System Logging";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.system.logging";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    System = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Enable_Private_Data = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Enables private data logging for the entire system";
          };
        };
      });
      default = null;
      description = "This dictionary has one key, 'Enable-Private-Data'. Setting that value to 'true' enables private data logging for the entire system.";
    };

  };
}