# Auto-generated from ProfileManifests: com.apple.systemuiserver.plist
# Domain: com.apple.systemuiserver
# Title: Allowed Media and Menu Bar Extras
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-systemuiserver" = {
    enable = lib.mkEnableOption "Allowed Media and Menu Bar Extras";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.systemuiserver";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    mount_controls = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          harddisk_external = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A string or an array of media action strings. Internally installed SD cards and USB flash drives are included in the hard disk-external category.\n\nThis key is the default for media types that don't fall into other categories.";
          };
          harddisk_internal = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          networkdisk = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          disk_image = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          bd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          cd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          dvd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          dvdram = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          blankbd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          blankcd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          blankdvd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          all_media = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Unused; set to an empty string.";
          };
        };
      });
      default = null;
      description = "The media type dictionary that controls volume mounting.";
    };

    unmount_controls = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          harddisk_external = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A string or an array of media action strings. Internally installed SD cards and USB flash drives are included in the hard disk-external category.\n\nThis key is the default for media types that don't fall into other categories.";
          };
          harddisk_internal = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          networkdisk = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          disk_image = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          bd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          cd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          dvd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          dvdram = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          blankbd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          blankcd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          blankdvd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          all_media = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Unused; set to an empty string.";
          };
        };
      });
      default = null;
      description = "The media type dictionary that controls volume unmounting.";
    };

    logout_eject = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          harddisk_external = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A string or an array of media action strings. Internally installed SD cards and USB flash drives are included in the hard disk-external category.\n\nThis key is the default for media types that don't fall into other categories.";
          };
          harddisk_internal = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          networkdisk = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          disk_image = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          bd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          cd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          dvd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          dvdram = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          blankbd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          blankcd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          blankdvd = lib.mkOption {
            type = types.nullOr (types.listOf (types.enum [ "authenticate" "read-only" "deny" "eject" "alert" ]));
            default = null;
            description = "A media action string or an array of media action strings.";
          };
          all_media = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Unused; set to an empty string.";
          };
        };
      });
      default = null;
      description = "The media type dictionary that defines volumes to eject when the user logs out.";
    };

    menuExtras = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu" "/System/Library/CoreServices/Menu Extras/Displays.menu" "/System/Library/CoreServices/Menu Extras/DwellControl.menu" "/System/Library/CoreServices/Menu Extras/Eject.menu" "/System/Library/CoreServices/Menu Extras/ExpressCard.menu" "/System/Library/CoreServices/Menu Extras/Ink.menu" "/System/Library/CoreServices/Menu Extras/IrDA.menu" "/System/Library/CoreServices/Menu Extras/PPP.menu" "/System/Library/CoreServices/Menu Extras/PPPoE.menu" "/System/Library/CoreServices/Menu Extras/SafeEjectGPUExtra.menu" "/System/Library/CoreServices/Menu Extras/Script" "/System/Library/CoreServices/Menu Extras/Menu.menu" "/System/Library/CoreServices/Menu Extras/TextInput.menu" "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" "/System/Library/CoreServices/Menu Extras/UniversalAccess.menu" "/System/Library/CoreServices/Menu Extras/User.menu" "/System/Library/CoreServices/Menu Extras/VPN.menu" "/System/Library/CoreServices/Menu Extras/Volume.menu" "/System/Library/CoreServices/Menu Extras/WWAN.menu" "/System/Library/CoreServices/Menu Extras/iChat.menu" ]));
      default = null;
      description = "List of menu extras to combine with the user's menu bar";
    };

  };
}