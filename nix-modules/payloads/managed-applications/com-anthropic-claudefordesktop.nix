# Auto-generated from ProfileManifests: com.anthropic.claudefordesktop.plist
# Domain: com.anthropic.claudefordesktop
# Title: Claude
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-anthropic-claudefordesktop" = {
    enable = lib.mkEnableOption "Claude";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.anthropic.claudefordesktop";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    disableAutoUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable automatic updates for Claude Desktop.";
    };

    autoUpdaterEnforcementHours = lib.mkOption {
      type = types.nullOr (types.int);
      default = 72;
      description = "Hours before forcefully restarting Claude to apply a prepared update. Must be between 1 and 72 hours.";
    };

    isDesktopExtensionEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enable or disable Claude Desktop extensions.";
    };

    isDesktopExtensionDirectoryEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enable or disable access to the extension directory.";
    };

    isLocalDevMcpEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enable or disable local Model Context Protocol (MCP) servers.";
    };

  };
}