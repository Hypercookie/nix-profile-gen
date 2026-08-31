# Auto-generated from ProfileManifests: com.apple.syspolicy.kernel-extension-policy.plist
# Domain: com.apple.syspolicy.kernel-extension-policy
# Title: System Policy - Kernel Extensions
# Platforms: macOS
# Unique: no
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "System Policy - Kernel Extensions";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.syspolicy.kernel-extension-policy";
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
        default = [ "system" ];
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
        default = [ "AllowUserOverrides" "AllowNonAdminUserApprovals" "AllowedTeamIdentifiers" "AllowedKernelExtensions" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AllowUserOverrides = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', users can approve additional kernel extensions that configuration profiles don't explicitly allow.";
      };

      AllowNonAdminUserApprovals = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', nonadministrative users can approve additional kernel extensions in the Security & Privacy preferences.\nAvailable in macOS 11 and later.";
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
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-syspolicy-kernel-extension-policy" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "System Policy - Kernel Extensions (com.apple.syspolicy.kernel-extension-policy) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}