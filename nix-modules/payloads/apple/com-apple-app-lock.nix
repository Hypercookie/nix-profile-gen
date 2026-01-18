# Auto-generated from ProfileManifests: com.apple.app.lock.plist
# Domain: com.apple.app.lock
# Title: App Lock
# Platforms: iOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-app-lock" = {
    enable = lib.mkEnableOption "App Lock";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.app.lock";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    App = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Identifier = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The app's bundle identifier.";
          };
          Options = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                DisableTouch = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system disables the touch screen. In tvOS, it disables the touch surface on the Apple TV Remote.";
                };
                DisableDeviceRotation = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system disables device rotation sensing.";
                };
                DisableVolumeButtons = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system disables the volume buttons.";
                };
                DisableRingerSwitch = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system disables the ringer switch. When disabled, the ringer behavior depends on what position the switch was in when it was first disabled.";
                };
                DisableSleepWakeButton = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system disables the sleep/wake button.";
                };
                DisableAutoLock = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the device doesn't automatically go to sleep after an idle period.";
                };
                EnableVoiceOver = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system enables VoiceOver.";
                };
                EnableZoom = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system enables Zoom.";
                };
                EnableInvertColors = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system enables Invert Colors.";
                };
                EnableAssistiveTouch = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system enables AssistiveTouch.";
                };
                EnableSpeakSelection = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system enables Speak Selection.";
                };
                EnableMonoAudio = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system enables Mono Audio.";
                };
                EnableVoiceControl = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system enables Voice Control.";
                };
              };
            });
            default = null;
            description = "A dictionary of options that the user can't change.";
          };
          UserEnabledOptions = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                VoiceOver = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system allows the user to toggle VoiceOver.";
                };
                Zoom = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system allows the user to toggle Zoom.";
                };
                InvertColors = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system allows the user to toggle Invert Colors.";
                };
                AssistiveTouch = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system allows the user to toggle AssistiveTouch.";
                };
                VoiceControl = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = false;
                  description = "If 'true', the system allows the user to toggle Voice Control.";
                };
              };
            });
            default = null;
            description = "A dictionary of user-editable options.";
          };
        };
      });
      default = null;
      description = "A dictionary that contains information about the app.";
    };

  };
}