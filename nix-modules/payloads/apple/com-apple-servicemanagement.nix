# Auto-generated from ProfileManifests: com.apple.servicemanagement.plist
# Domain: com.apple.servicemanagement
# Title: Service Management - Managed Login Items
# Platforms: macOS
# Unique: no
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Service Management - Managed Login Items";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.servicemanagement";
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
        default = [ "Rules" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Rules = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            RuleType = lib.mkOption {
              type = types.nullOr (types.enum [ "BundleIdentifier" "BundleIdentifierPrefix" "Label" "LabelPrefix" "TeamIdentifier" ]);
              default = null;
              description = "The type of comparison to make.";
            };
            RuleValue = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The value to compare with each login item's value, to determine if this rule is a match.";
            };
            Comment = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "An optional description of the rule.";
            };
            TeamIdentifier = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "An additional constraint to limit the scope of the rule that the system tests after matching the 'RuleType' and 'RuleValue'.";
            };
          };
        }));
        default = null;
        description = "An array of service management rules.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-servicemanagement" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Service Management - Managed Login Items (com.apple.servicemanagement) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}