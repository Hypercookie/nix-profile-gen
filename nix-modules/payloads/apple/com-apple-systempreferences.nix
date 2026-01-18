# Auto-generated from ProfileManifests: com.apple.systempreferences.plist
# Domain: com.apple.systempreferences
# Title: System Preferences
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-systempreferences" = {
    enable = lib.mkEnableOption "System Preferences";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.systempreferences";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    DisabledSystemSettings = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "com.apple.Accessibility-Settings.extension" "com.apple.AirDrop-Handoff-Settings.extension" "com.apple.Battery-Settings.extension" "com.apple.BluetoothSettings" "com.apple.CD-DVD-Settings.extension" "com.apple.ClassKit-Settings.extension" "com.apple.Classroom-Settings.extension" "com.apple.ControlCenter-Settings.extension" "com.apple.Date-Time-Settings.extension" "com.apple.Desktop-Settings.extension" "com.apple.Displays-Settings.extension" "com.apple.ExtensionsPreferences" "com.apple.Family-Settings.extension" "com.apple.Focus-Settings.extension" "com.apple.Game-Center-Settings.extension" "com.apple.Game-Controller-Settings.extension" "com.apple.HeadphoneSettings" "com.apple.Internet-Accounts-Settings.extension" "com.apple.Keyboard-Settings.extension" "com.apple.Localization-Settings.extension" "com.apple.Lock-Screen-Settings.extension" "com.apple.LoginItems-Settings.extension" "com.apple.Mouse-Settings.extension" "com.apple.Network-Settings.extension" "com.apple.NetworkExtensionSettingsUI.NESettingsUIExtension" "com.apple.Notifications-Settings.extension" "com.apple.Passwords-Settings.extension" "com.apple.Print-Scan-Settings.extension" "com.apple.Screen-Time-Settings.extension" "com.apple.ScreenSaver-Settings.extension" "com.apple.Sharing-Settings.extension" "com.apple.Siri-Settings.extension" "com.apple.Software-Update-Settings.extension" "com.apple.Sound-Settings.extension" "com.apple.Startup-Disk-Settings.extension" "com.apple.Time-Machine-Settings.extension" "com.apple.Touch-ID-Settings.extension" "com.apple.Trackpad-Settings.extension" "com.apple.Transfer-Reset-Settings.extension" "com.apple.Users-Groups-Settings.extension" "com.apple.WalletSettingsExtension" "com.apple.Wallpaper-Settings.extension" "com.apple.settings.Storage" "com.apple.systempreferences.AppleIDSettings" "com.apple.wifi-settings-extension" ]));
      default = null;
      description = "The list of disabled System Settings extensions. All other items will be enabled. When 'DisabledSystemSettings' is specified, the device ignores 'DisabledPreferencePanes' and 'EnabledPreferencePanes'.\n\nNote:\nA given System Settings extension can supply more than one section in System Settings; disabling such an extension disables all sections it supplies.";
    };

    EnabledPreferencePanes = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "com.apple.preference.universalaccess" "com.apple.preferences.appstore" "com.apple.preferences.AppleIDPrefPane" "com.apple.preference.battery" "com.apple.preferences.Bluetooth" "com.apple.preference.digihub.discs" "com.apple.ClassroomSettings" "com.apple.preference.datetime" "com.apple.preference.desktopscreeneffect" "com.apple.preference.displays" "com.apple.preference.dock" "com.apple.preference.energysaver" "com.apple.preferences.extensions" "com.apple.preferences.FamilySharingPrefPane" "com.apple.prefpanel.fibrechannel" "com.apple.preference.general" "com.apple.preferences.icloud" "com.apple.preference.ink" "com.apple.preferences.internetaccounts" "com.apple.preference.keyboard" "com.apple.Localization" "com.apple.preference.expose" "com.apple.preference.internet" "com.apple.preference.mouse" "com.apple.preference.network" "com.apple.preference.notifications" "com.apple.preferences.parentalcontrols" "com.apple.preference.printfax" "com.apple.preferences.configurationprofiles" "com.apple.preference.screentime" "com.apple.preference.security" "com.apple.preferences.sharing" "com.apple.preference.sidecar" "com.apple.preference.speech" "com.apple.preferences.softwareupdate" "com.apple.preference.sound" "com.apple.preference.spotlight" "com.apple.preference.startupdisk" "com.apple.prefs.backup" "com.apple.preferences.password" "com.apple.preference.trackpad" "com.apple.preferences.users" "com.apple.preferences.wallet" "com.apple.Xsan" "com.adobe.flashplayerpreferences" "com.euphonix.prefpanel" "com.blackmagic-design.Blackmagic-Desktop-Video" "com.websense.endpoint.preference" "com.kensington.trackballworks2.prefPane" "com.mysql.prefpane" "com.oracle.java.JavaControlPanel" "com.smarttech.SMARTBoardPref" "cl.fail.lordkamina.SwiftDefaultApps" "com.tenablesecurity.NessusAgent.Preferences" "com.tuxera.ntfs.mac.prefpane" ]));
      default = null;
      description = "The list of enabled System Preferences panes.";
    };

    DisabledPreferencePanes = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "com.apple.preference.universalaccess" "com.apple.preferences.appstore" "com.apple.preferences.AppleIDPrefPane" "com.apple.preference.battery" "com.apple.preferences.Bluetooth" "com.apple.preference.digihub.discs" "com.apple.ClassroomSettings" "com.apple.preference.datetime" "com.apple.preference.desktopscreeneffect" "com.apple.preference.displays" "com.apple.preference.dock" "com.apple.preference.energysaver" "com.apple.preferences.extensions" "com.apple.preferences.FamilySharingPrefPane" "com.apple.prefpanel.fibrechannel" "com.apple.preference.general" "com.apple.preferences.icloud" "com.apple.preference.ink" "com.apple.preferences.internetaccounts" "com.apple.preference.keyboard" "com.apple.Localization" "com.apple.preference.expose" "com.apple.preference.internet" "com.apple.preference.mouse" "com.apple.preference.network" "com.apple.preference.notifications" "com.apple.preferences.parentalcontrols" "com.apple.preference.printfax" "com.apple.preferences.configurationprofiles" "com.apple.preference.screentime" "com.apple.preference.security" "com.apple.preferences.sharing" "com.apple.preference.sidecar" "com.apple.preference.speech" "com.apple.preferences.softwareupdate" "com.apple.preference.sound" "com.apple.preference.spotlight" "com.apple.preference.startupdisk" "com.apple.prefs.backup" "com.apple.preferences.password" "com.apple.preference.trackpad" "com.apple.preferences.users" "com.apple.preferences.wallet" "com.apple.Xsan" "com.adobe.flashplayerpreferences" "com.euphonix.prefpanel" "com.blackmagic-design.Blackmagic-Desktop-Video" "com.websense.endpoint.preference" "com.kensington.trackballworks2.prefPane" "com.mysql.prefpane" "com.oracle.java.JavaControlPanel" "com.smarttech.SMARTBoardPref" "cl.fail.lordkamina.SwiftDefaultApps" "com.tenablesecurity.NessusAgent.Preferences" "com.tuxera.ntfs.mac.prefpane" ]));
      default = null;
      description = "The list of disabled System Preferences panes.";
    };

    HiddenPreferencePanes = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "com.apple.preference.universalaccess" "com.apple.preferences.appstore" "com.apple.preferences.AppleIDPrefPane" "com.apple.preference.battery" "com.apple.preferences.Bluetooth" "com.apple.preference.digihub.discs" "com.apple.ClassroomSettings" "com.apple.preference.datetime" "com.apple.preference.desktopscreeneffect" "com.apple.preference.displays" "com.apple.preference.dock" "com.apple.preference.energysaver" "com.apple.preferences.extensions" "com.apple.preferences.FamilySharingPrefPane" "com.apple.prefpanel.fibrechannel" "com.apple.preference.general" "com.apple.preferences.icloud" "com.apple.preference.ink" "com.apple.preferences.internetaccounts" "com.apple.preference.keyboard" "com.apple.Localization" "com.apple.preference.expose" "com.apple.preference.internet" "com.apple.preference.mouse" "com.apple.preference.network" "com.apple.preference.notifications" "com.apple.preferences.parentalcontrols" "com.apple.preference.printfax" "com.apple.preferences.configurationprofiles" "com.apple.preference.screentime" "com.apple.preference.security" "com.apple.preferences.sharing" "com.apple.preference.sidecar" "com.apple.preference.speech" "com.apple.preferences.softwareupdate" "com.apple.preference.sound" "com.apple.preference.spotlight" "com.apple.preference.startupdisk" "com.apple.prefs.backup" "com.apple.preferences.password" "com.apple.preference.trackpad" "com.apple.preferences.users" "com.apple.preferences.wallet" "com.apple.Xsan" "com.adobe.flashplayerpreferences" "com.euphonix.prefpanel" "com.blackmagic-design.Blackmagic-Desktop-Video" "com.websense.endpoint.preference" "com.kensington.trackballworks2.prefPane" "com.mysql.prefpane" "com.oracle.java.JavaControlPanel" "com.smarttech.SMARTBoardPref" "cl.fail.lordkamina.SwiftDefaultApps" "com.tenablesecurity.NessusAgent.Preferences" "com.tuxera.ntfs.mac.prefpane" ]));
      default = null;
      description = "Hidden Preference Panes within the System Preferences application.";
    };

    AttentionPrefBundleIDs = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          __key__ = lib.mkOption {
            type = types.nullOr (types.enum [ "com.apple.preferences.softwareupdate" ]);
            default = null;
          };
          __value__ = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
          };
        };
      });
      default = null;
      description = "Not documented by Apple, but by entering 0 for individual System Preference pane bundle IDs, or by adding this preference and leaving the dictionary blank, it is possible to suppress the alert icon from appearing on the System Preferences app (ex. when software updates are available).";
    };

  };
}