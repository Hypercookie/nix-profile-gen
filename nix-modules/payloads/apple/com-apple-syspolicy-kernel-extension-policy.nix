# Auto-generated from ProfileManifests: com.apple.syspolicy.kernel-extension-policy.plist
# Domain: com.apple.syspolicy.kernel-extension-policy
# Title: System Policy - Kernel Extensions
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-syspolicy-kernel-extension-policy" = {
    enable = lib.mkEnableOption "System Policy - Kernel Extensions";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.syspolicy.kernel-extension-policy";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AllowUserOverrides = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', users can approve additional kernel extensions that configuration profiles don't explicitly allow.";
    };

    AllowNonAdminUserApprovals = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', nonadministrative users can approve additional kernel extensions in the Security & Privacy preferences.\n\nAvailable in macOS 11 and later.";
    };

    AllowedTeamIdentifiers = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The array of team identifiers that define which validly signed kernel extensions can load.";
    };

    AllowedKernelExtensions = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          __value__ = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "The kernel extension data.";
          };
          __key__ = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
        };
      });
      default = null;
      description = "The dictionary that represents a set of kernel extensions that the system always allows to load on the computer. The dictionary maps team identifiers (keys) to arrays of bundle identifiers.";
    };

  };
}