# Auto-generated from ProfileManifests: com.unity3d.UnityEditor5.x.plist
# Domain: com.unity3d.UnityEditor5.x
# Title: Unity Editor
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-unity3d-UnityEditor5-x" = {
    enable = lib.mkEnableOption "Unity Editor";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.unity3d.UnityEditor5.x";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    EditorUpdateShowAtStartup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Check to show the Unity Editor updater at launch";
    };

    ReopenLastUsedProjectOnStartup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Check to open the previously opened project at launch";
    };

  };
}