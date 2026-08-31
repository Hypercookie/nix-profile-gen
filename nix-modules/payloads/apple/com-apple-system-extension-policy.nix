# Auto-generated from ProfileManifests: com.apple.system-extension-policy.plist
# Domain: com.apple.system-extension-policy
# Title: System Extensions
# Platforms: macOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "System Extensions";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.system-extension-policy";
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
        default = [ "AllowUserOverrides" "AllowedTeamIdentifiers" "AllowedSystemExtensions" "AllowedSystemExtensionTypes" "RemovableSystemExtensions" "NonRemovableSystemExtensions" "NonRemovableFromUISystemExtensions" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AllowUserOverrides = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'false', restricts users from approving additional system extensions that configuration profiles don't explicitly allow.";
      };

      AllowedTeamIdentifiers = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "An array of team identifiers that defines valid, signed system extensions that are allowable to load. Approved system extensions are those signed with any of the specified team identifiers.\nTo avoid requiring an administrator to authorize the operation, you can activate system extensions that this key specifies using 'OSSystemExtensionActivationRequest API'.\nIt's an error for the same team identifier to appear in both this array and as a key in the 'AllowedSystemExtensions' dictionary.";
      };

      AllowedSystemExtensions = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Team Identifier";
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "The mapping of team identifiers to arrays of bundle identifiers, where the bundle identifier is that of the system extension to be installed.";
            };
          };
        });
        default = null;
        description = "A dictionary of approved system extensions on the computer. The dictionary maps the team identifiers (keys) to arrays of bundle identifiers, where the bundle identifier defines the system extension to install.\nTo avoid requiring an administrator to authorize the operation, you can activate system extensions that this key specifies using 'OSSystemExtensionActivationRequest API'.\nIt's an error for the same team identifier to appear in both the 'AllowedTeamIdentifiers' array and as a key in this dictionary.";
      };

      AllowedSystemExtensionTypes = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Team Identifier";
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.listOf (types.enum [ "DriverExtension" "NetworkExtension" "EndpointSecurityExtension" ]));
              default = null;
              description = "The mapping of team identifier to an array of strings, where each string is a type of system extension that may be installed for that team identifier.";
            };
          };
        });
        default = null;
        description = "A dictionary that maps a team identifier to an array of strings, where each string is a type of system extension that you can install for that team identifier. The allowed extension types are 'DriverExtension', 'NetworkExtension', and 'EndpointSecurityExtension'.\nIf there's no entry for a specified team identifier in the dictionary, the system allows all extension types.";
      };

      RemovableSystemExtensions = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Team Identifier";
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "The dictionary maps team identifiers (keys) to arrays of bundle identifiers, where the bundle identifier defines the system extension.";
            };
          };
        });
        default = null;
        description = "A dictionary of system extensions that are allowed to remove themselves from the machine. The dictionary maps team identifiers (keys) to arrays of bundle identifiers, where the bundle identifier defines the system extension. An application using the 'OSSystemExtensionDeactivationRequest' API can deactivate the specified system extensions without requiring an administrator to authorize the operation.\nAvailable in macOS 12 and later.";
      };

      NonRemovableSystemExtensions = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "System extension bundle identifiers";
            };
          };
        });
        default = null;
        description = "A dictionary of system extensions on the computer. The dictionary maps the team identifiers (keys) to arrays of bundle identifiers, where the bundle identifier defines the system extension which can't be disabled or uninstalled when SIP is enabled. It's an error for the same mapping to appear in the dictionary values corresponding to 'RemovableSystemExtensions' and 'NonRemovableSystemExtensions' keys.";
      };

      NonRemovableFromUISystemExtensions = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "System extension bundle identifiers";
            };
          };
        });
        default = null;
        description = "A dictionary of system extensions on the computer. The dictionary maps the team identifiers (keys) to arrays of bundle identifiers, where the bundle identifier defines the system extension which can't be disabled or uninstalled from System Settings or Finder. The set of system extensions between 'RemovableSystemExtensions' and 'NonRemovableFromUISystemExtensions' can to overlap.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-system-extension-policy" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "System Extensions (com.apple.system-extension-policy) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}