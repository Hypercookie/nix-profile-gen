# Auto-generated from ProfileManifests: com.apple.systemuiserver.plist
# Domain: com.apple.systemuiserver
# Title: SystemUI Server
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-systemuiserver" = {
    enable = lib.mkEnableOption "SystemUI Server";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.systemuiserver";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    menuExtras = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu" "/System/Library/CoreServices/Menu Extras/Displays.menu" "/System/Library/CoreServices/Menu Extras/DwellControl.menu" "/System/Library/CoreServices/Menu Extras/Eject.menu" "/System/Library/CoreServices/Menu Extras/ExpressCard.menu" "/System/Library/CoreServices/Menu Extras/Ink.menu" "/System/Library/CoreServices/Menu Extras/IrDA.menu" "/System/Library/CoreServices/Menu Extras/PPP.menu" "/System/Library/CoreServices/Menu Extras/PPPoE.menu" "/System/Library/CoreServices/Menu Extras/SafeEjectGPUExtra.menu" "/System/Library/CoreServices/Menu Extras/Script" "/System/Library/CoreServices/Menu Extras/Menu.menu" "/System/Library/CoreServices/Menu Extras/TextInput.menu" "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" "/System/Library/CoreServices/Menu Extras/UniversalAccess.menu" "/System/Library/CoreServices/Menu Extras/User.menu" "/System/Library/CoreServices/Menu Extras/VPN.menu" "/System/Library/CoreServices/Menu Extras/Volume.menu" "/System/Library/CoreServices/Menu Extras/WWAN.menu" "/System/Library/CoreServices/Menu Extras/iChat.menu" ]));
      default = null;
      description = "List of menu extras to combine with the user's menu bar";
    };

  };
}