# Auto-generated from ProfileManifests: com.apple.webClip.managed.plist
# Domain: com.apple.webClip.managed
# Title: Web Clip
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-webClip-managed" = {
    enable = lib.mkEnableOption "Web Clip";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.webClip.managed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Label = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The name of the web clip that the system displays on the Home Screen.";
    };

    URL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The URL of the web clip.";
    };

    IsRemovable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables removing the web clip.";
    };

    Icon = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The PNG icon to show on the Home Screen. If not set, the system displays a white square. For best results, provide a square image that's no larger than 400 x 400 pixels and less than 1 MB when uncompressed. The graphics file is automatically scaled and cropped to fit, if necessary, and converted to PNG format. Web clip icons are 144 x 144 pixels for iPad devices with a Retina display, and 114 x 114 pixels for iPhone devices. To prevent the device from adding a shine to the image, set 'Precomposed' to 'true'.";
    };

    Precomposed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system prevents SpringBoard from adding shine to the icon.";
    };

    FullScreen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system launches the web clip as a full-screen web app.";
    };

    IgnoreManifestScope = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', a full screen web clip can navigate to an external web site without showing Safari UI. Otherwise, Safari UI appears when navigating away from the web clip's URL. This key has no effect when 'FullScreen' is 'false'. Available in iOS 14 and later.";
    };

    TargetApplicationBundleIdentifier = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The application bundle identifier of the application that opens the URL. To use this property, install the profile through MDM. Available in iOS 14 and later.";
    };

  };
}