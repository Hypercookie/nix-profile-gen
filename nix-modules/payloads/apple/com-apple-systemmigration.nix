# Auto-generated from ProfileManifests: com.apple.systemmigration.plist
# Domain: com.apple.systemmigration
# Title: System Migration
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-systemmigration" = {
    enable = lib.mkEnableOption "System Migration";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.systemmigration";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    CustomBehavior = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Context = lib.mkOption {
            type = types.nullOr (types.enum [ "Windows" ]);
            default = null;
            description = "The context that custom paths apply to.";
          };
          Paths = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                SourcePath = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The path to the migrating file or directory on the source system.";
                };
                SourcePathInUserHome = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If 'true', the source path is located within a user home directory.";
                };
                TargetPath = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The path to the destination file or directory on the target system.";
                };
                TargetPathInUserHome = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If 'true', the target path is located within a user home directory.";
                };
              };
            }));
            default = null;
            description = "The list of custom behavior path dictionaries.";
          };
        };
      }));
      default = null;
      description = "The list of custom behavior dictionaries.";
    };

  };
}