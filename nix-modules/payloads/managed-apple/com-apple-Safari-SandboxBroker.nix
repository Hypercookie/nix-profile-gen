# Auto-generated from ProfileManifests: com.apple.Safari.SandboxBroker.plist
# Domain: com.apple.Safari.SandboxBroker
# Title: Safari Developer
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-Safari-SandboxBroker" = {
    enable = lib.mkEnableOption "Safari Developer";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.Safari.SandboxBroker";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    ShowDevelopMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, displays the 'Develop' menu bar item (Preferences > Advanced > Show Develop).";
    };

    AlwaysPromptForDownloadFolder = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, sets 'File download location' to 'Ask for each download' (Settings > General).";
    };

  };
}