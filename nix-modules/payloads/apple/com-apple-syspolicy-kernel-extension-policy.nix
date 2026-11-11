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
        description = "Whether only one instance of this payload is allowed per profile.";
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

      _platforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "macOS" ];
        description = "Supported Apple platforms (pfm_platforms).";
      };

      _keyPlatforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.attrs;
        default = [ ];
        description = "Keys restricted to a subset of the manifest's platforms (key-level pfm_platforms).";
      };

      _allowUnsupportedPlatform = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Emit this instance even if its manifest says the target platform does not support it or some of its keys. Produces a warning instead of an error.";
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
        description = "If 'true', nonadministrative users can approve additional kernel extensions in the Security & Privacy preferences.";
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
  options.payloads."apple-com-apple-syspolicy-kernel-extension-policy" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "System Policy - Kernel Extensions (com.apple.syspolicy.kernel-extension-policy) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}