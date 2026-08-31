# Auto-generated from ProfileManifests: com.apple.systemuiserver.plist
# Domain: com.apple.systemuiserver
# Title: SystemUI Server
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "SystemUI Server";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.systemuiserver";
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
        default = [ "system" "user" ];
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
        default = [ "menuExtras" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      menuExtras = lib.mkOption {
        type = types.nullOr (types.listOf (types.enum [ "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu" "/System/Library/CoreServices/Menu Extras/Displays.menu" "/System/Library/CoreServices/Menu Extras/DwellControl.menu" "/System/Library/CoreServices/Menu Extras/Eject.menu" "/System/Library/CoreServices/Menu Extras/ExpressCard.menu" "/System/Library/CoreServices/Menu Extras/Ink.menu" "/System/Library/CoreServices/Menu Extras/IrDA.menu" "/System/Library/CoreServices/Menu Extras/PPP.menu" "/System/Library/CoreServices/Menu Extras/PPPoE.menu" "/System/Library/CoreServices/Menu Extras/SafeEjectGPUExtra.menu" "/System/Library/CoreServices/Menu Extras/Script" "/System/Library/CoreServices/Menu Extras/Menu.menu" "/System/Library/CoreServices/Menu Extras/TextInput.menu" "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" "/System/Library/CoreServices/Menu Extras/UniversalAccess.menu" "/System/Library/CoreServices/Menu Extras/User.menu" "/System/Library/CoreServices/Menu Extras/VPN.menu" "/System/Library/CoreServices/Menu Extras/Volume.menu" "/System/Library/CoreServices/Menu Extras/WWAN.menu" "/System/Library/CoreServices/Menu Extras/iChat.menu" ]));
        default = null;
        description = "List of menu extras to combine with the user's menu bar";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-systemuiserver" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "SystemUI Server (com.apple.systemuiserver) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}