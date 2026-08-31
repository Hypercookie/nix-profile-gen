# Auto-generated from ProfileManifests: com.apple.networkusagerules.plist
# Domain: com.apple.networkusagerules
# Title: Network Usage Rules
# Platforms: iOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Network Usage Rules";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.networkusagerules";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
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
        default = [ "ApplicationRules" "SIMRules" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      ApplicationRules = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            AppIdentifierMatches = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "A list of managed app identifiers, as strings, that must follow the associated rules. If this key is missing, the rules apply to all managed apps on the device.\nEach string in the 'AppIdentifierMatches' array may either be an exact app identifier match (for example, 'com.mycompany.myapp') or it may specify a prefix match for the bundle ID by using the * wildcard character. If used, this character must appear after a period (.) and may only appear once, at the end of the string; for example, 'com.mycompany.*'.";
            };
            AllowCellularData = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'false', disables cellular data for all matching managed apps.";
            };
            AllowRoamingCellularData = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If 'false', disables cellular data while roaming for all matching managed apps.";
            };
          };
        }));
        default = null;
        description = "An array of application rules, that apply to only managed apps.";
      };

      SIMRules = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            ICCIDs = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "One or more ICCIDs of SIM cards for which the 'WiFiAssistPolicy' applies. All ICCIDs in all installed Network Usage Rules payloads must be unique. An example ICCID is '89310410106543789301'.";
            };
            WiFiAssistPolicy = lib.mkOption {
              type = types.nullOr (types.enum [ 2 3 ]);
              default = null;
              description = "The Wi-Fi Assist policy to apply to the SIM cards specified in the ICCIDs. Allowed values:\n'2': Use the default system policy for the specified SIM card(s).\n'3': Make Wi-Fi Assist switch more aggressively from a poor Wi-Fi connection to cellular data for the specified SIM card(s). This setting may increase cellular data use and may impact battery life.\nFor more information, see About Wi-Fi Assist.";
            };
          };
        }));
        default = null;
        description = "An array of SIM rules, that apply to all apps.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-networkusagerules" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Network Usage Rules (com.apple.networkusagerules) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}