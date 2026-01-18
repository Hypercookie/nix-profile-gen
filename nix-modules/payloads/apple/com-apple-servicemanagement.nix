# Auto-generated from ProfileManifests: com.apple.servicemanagement.plist
# Domain: com.apple.servicemanagement
# Title: Service Management - Managed Login Items
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-servicemanagement" = {
    enable = lib.mkEnableOption "Service Management - Managed Login Items";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.servicemanagement";
      description = "The payload domain (PayloadType) for this manifest.";
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
}