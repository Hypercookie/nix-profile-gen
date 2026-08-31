# Auto-generated from ProfileManifests: com.apple.MCX-WiFiManagedSettings.plist
# Domain: com.apple.MCX
# Title: Wi-Fi Managed Settings
# Platforms: macOS
# Unique: no
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Wi-Fi Managed Settings";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.MCX";
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
        default = [ "RequireAdminToTurnAirPortOnOff" "RequireAdminForAirPortNetworkChange" "RequireAdminForIBSS" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      RequireAdminToTurnAirPortOnOff = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', requires administrator authorization to turn Wi-Fi on or off.";
      };

      RequireAdminForAirPortNetworkChange = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', requires administrator authorization for network changes.";
      };

      RequireAdminForIBSS = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', requires administrator authorization to enable IBSS.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-MCX-WiFiManagedSettings" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Wi-Fi Managed Settings (com.apple.MCX) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}