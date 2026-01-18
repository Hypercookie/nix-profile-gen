# Auto-generated from ProfileManifests: com.pratikkumar.airserver-mac.plist
# Domain: com.pratikkumar.airserver-mac
# Title: AirServer
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-pratikkumar-airserver-mac" = {
    enable = lib.mkEnableOption "AirServer";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.pratikkumar.airserver-mac";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    SUFeedURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Setting this to a non-existent URL will disable the ability for users to manually check for updates. Useful when you intend to use your own software distribution mechanism to deploy updates.";
    };

    SUEnableAutomaticChecks = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls automatic update checks.";
    };

    SUScheduledCheckInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Controls the automatic update check interval. The default is 1 day (86400 seconds). Setting to 0 disables updates.";
    };

    SUAllowsAutomaticUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls the automatic update install prompt. When enabled, presents users with the option to allow automatic download and install of available updates. If disabled, disallows automatic updates and requires manual installation every time.";
    };

    SUAutomaticallyUpdate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls automatic silent updates. If enabled, users will not be informed about updates and updates will be silently installed when the app quits.";
    };

    SUSendProfileInfo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When running software update checks, submit anonymous computer profile data to AirServer.";
    };

    UseLionStyleFullscreen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable this setting if you want to use the native macOS fullscreen mode - slower.";
    };

    UserDeviceName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Use this field to override the name of the computer that appears on the AirPlay network.";
    };

    UserLosslessAudioReceiverName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Only enable this preference when you wish to set a custom name for the device running AirServer in the AirPlay device list.";
    };

    autoLaunch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Have AirServer launch on system startup.";
    };

    "com.airserverapp.audioBufferSize2" = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "Use this setting to tweak multi-room audio sync when streaming music from iTunes.";
    };

    "com.airserverapp.PasswordType" = lib.mkOption {
      type = types.nullOr (types.enum [ "Fixed Password" "Onscreen Code" "Ask me" ]);
      default = null;
      description = "Choose authentication method when connecting to AirServer. While a Fixed Password is an available setting, it's not possible to define this password via profile.";
    };

    "com.airserverapp.alwaysOnTop" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable this setting if you want AirServer windows to be on top of all other windows.";
    };

    "com.airserverapp.dualAirplay" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This option creates a second AirPort Expresss-like audio receiver suffixed with an Ex. Streaming music to this endpoint will force the iOS device to stream your music in lossless quality. Enabling this setting can also allow you to watch a video on your iOS device and send only the audiostream to the AirServer.";
    };

    "com.airserverapp.linkMasterVolume" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, changing the volume on your iOS device will change the volume of your preferred output sound device; otherwise AirServer will lower the streaming music volume.";
    };

    "com.airserverapp.mirroringOptimizedFor2" = lib.mkOption {
      type = types.nullOr (types.enum [ "1080p" "720p" "iPad Retina" "iPhone 6/6s Plus Retina" "iPhone 6/6s Retina" "iPhone 5/5s Retina" "iPhone 4s Retina" "iPad" "iPhone 6/6s" "iPhone 5/5s" "iPhone 4s" "Target Display" "Projector 1024x768" "Projector 1600x1200" ]);
      default = null;
      description = "Here you can set the mirroring resolution AirServer provides to your iOS device. 'Retina' is recommended for all users, but if you are having connection problems, try the 1080p option. Do not enable this preference if you wish use the default 'Retina - High Quality' resolution setting.";
    };

    "com.airserverapp.slowNetwork" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enabling this setting will lower the mirroring quality by half but uses four times less bandwidth.";
    };

    "com.airserverapp.SoftwareDecoderOnly" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable this setting if your AirPlay device regularly freezes or if you notice green artifacts when using AirPlay mirroring. This is common on older Macs that do not properly support hardware-accelerated video encoding.";
    };

    showInDock = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use this setting to toggle between running AirServer in the Dock and in the menu bar.";
    };

  };
}