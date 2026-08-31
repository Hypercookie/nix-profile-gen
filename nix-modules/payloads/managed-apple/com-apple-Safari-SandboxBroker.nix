# Auto-generated from ProfileManifests: com.apple.Safari.SandboxBroker.plist
# Domain: com.apple.Safari.SandboxBroker
# Title: Safari Developer
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Safari Developer";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.Safari.SandboxBroker";
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
        default = [ "ShowDevelopMenu" "AlwaysPromptForDownloadFolder" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-Safari-SandboxBroker" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Safari Developer (com.apple.Safari.SandboxBroker) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}