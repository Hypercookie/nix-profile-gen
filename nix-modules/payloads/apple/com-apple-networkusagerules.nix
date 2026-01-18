# Auto-generated from ProfileManifests: com.apple.networkusagerules.plist
# Domain: com.apple.networkusagerules
# Title: Network Usage Rules
# Platforms: iOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-networkusagerules" = {
    enable = lib.mkEnableOption "Network Usage Rules";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.networkusagerules";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    ApplicationRules = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          AppIdentifierMatches = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "A list of managed app identifiers, as strings, that must follow the associated rules. If this key is missing, the rules apply to all managed apps on the device.\n\n\n\nEach string in the 'AppIdentifierMatches' array may either be an exact app identifier match (for example, 'com.mycompany.myapp') or it may specify a prefix match for the bundle ID by using the \\* wildcard character. If used, this character must appear after a period (.) and may only appear once, at the end of the string; for example, 'com.mycompany.*'.";
          };
          AllowCellularData = lib.mkOption {
            type = types.nullOr (types.bool);
            default = true;
            description = "If 'false', disables cellular data for all matching managed apps.";
          };
          AllowRoamingCellularData = lib.mkOption {
            type = types.nullOr (types.bool);
            default = true;
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
            description = "The Wi-Fi Assist policy to apply to the SIM cards specified in the ICCIDs. Allowed values:\n\n- '2': Use the default system policy for the specified SIM card(s).\n- '3': Make Wi-Fi Assist switch more aggressively from a poor Wi-Fi connection to cellular data for the specified SIM card(s). This setting may increase cellular data use and may impact battery life.\n\nFor more information, see [About Wi-Fi Assist](https://support.apple.com/en-us/HT205296).";
          };
        };
      }));
      default = null;
      description = "An array of SIM rules, that apply to all apps.";
    };

  };
}