# Auto-generated from ProfileManifests: com.apple.system.logging.plist
# Domain: com.apple.system.logging
# Title: System Logging
# Platforms: macOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "System Logging";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.system.logging";
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
        default = [ "System" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-system-logging" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "System Logging (com.apple.system.logging) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}