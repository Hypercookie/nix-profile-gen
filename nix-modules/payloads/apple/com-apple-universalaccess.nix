# Auto-generated from ProfileManifests: com.apple.universalaccess.plist
# Domain: com.apple.universalaccess
# Title: Accessibility
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Accessibility";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.universalaccess";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "closeViewScrollWheelToggle" "closeViewHotkeysEnabled" "closeViewNearPoint" "closeViewFarPoint" "closeViewShowPreview" "closeViewSmoothImages" "whiteOnBlack" "grayscale" "contrast" "mouseDriverCursorSize" "voiceOverOnOffKey" "flashScreen" "stereoAsMono" "stickyKey" "stickyKeyShowWindow" "stickyKeyBeepOnModifier" "slowKey" "slowKeyBeepOn" "slowKeyDelay" "mouseDriver" "mouseDriverInitialDelay" "mouseDriverMaxSpeed" "mouseDriverIgnoreTrackpad" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      closeViewScrollWheelToggle = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables \"Use scroll gesture\" in the Zoom options.";
      };

      closeViewHotkeysEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables \"Use keyboard shortcuts\" in the Zoom options.";
      };

      closeViewNearPoint = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The maximum zoom level in the Zoom options.";
      };

      closeViewFarPoint = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The minimum zoom level in the Zoom options.";
      };

      closeViewShowPreview = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables \"Show preview rectangle\" in the Zoom options. Only available in macOS 10.15 and earlier.";
      };

      closeViewSmoothImages = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables \"Smooth images\" in the Zoom options.";
      };

      whiteOnBlack = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables Invert Colors in Display Accommodations.";
      };

      grayscale = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables \"Use grayscale\" in the Display options.\nThis option is deprecated in macOS 11.";
      };

      contrast = lib.mkOption {
        type = types.nullOr (types.float);
        default = null;
        description = "The contrast value in the Display options.";
      };

      mouseDriverCursorSize = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The size of the cursor.";
      };

      voiceOverOnOffKey = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables Voice Over.";
      };

      flashScreen = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables \"Flash the screen\" in the Audio options.";
      };

      stereoAsMono = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', plays stereo audio as mono.";
      };

      stickyKey = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables Sticky Keys in the Keyboard options.";
      };

      stickyKeyShowWindow = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables \"Display pressed keys on screen\" for Sticky Keys.";
      };

      stickyKeyBeepOnModifier = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables the beep when a modifier key is set for Sticky Keys.";
      };

      slowKey = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables \"Slow Keys\" in the Keyboard options.";
      };

      slowKeyBeepOn = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables \"click key sounds\" for Slow Keys.";
      };

      slowKeyDelay = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The acceptance delay, in milliseconds, for Slow Keys.";
      };

      mouseDriver = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', enables Mouse Keys in the Mouse & Trackpad options.";
      };

      mouseDriverInitialDelay = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The initial delay before moving the mouse with Mouse Keys.";
      };

      mouseDriverMaxSpeed = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The maximum speed for the cursor when using Mouse Keys.";
      };

      mouseDriverIgnoreTrackpad = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', ignores the built-in trackpad.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-universalaccess" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Accessibility (com.apple.universalaccess) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}