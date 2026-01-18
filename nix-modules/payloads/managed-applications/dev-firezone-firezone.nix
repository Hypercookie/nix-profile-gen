# Auto-generated from ProfileManifests: dev.firezone.firezone.plist
# Domain: dev.firezone.firezone
# Title: Firezone
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-dev-firezone-firezone" = {
    enable = lib.mkEnableOption "Firezone";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "dev.firezone.firezone";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    authURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The base URL to open when users click \"Sign in\". The accountSlug will be appended to this.";
    };

    apiURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The WebSocket URL of the Firezone control plane to connect to.";
    };

    logFilter = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The RUST_LOG-style filter string to apply to the connectivity library for increasing log output to use for connectivity troubleshooting.";
    };

    accountSlug = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Your Firezone account ID or slug which will be appended to the authURL to form the complete sign in URL. Will be set automatically by the client after the first successful authentication.";
    };

    hideAdminPortalMenuItem = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hide the Admin portal link in the Firezone menu in the macOS menu bar.";
    };

    hideResourceList = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Hide the resource list in the Firezone menu in the macOS menu bar.";
    };

    connectOnStart = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Try to connect to Firezone using the saved token and configuration when the client application starts. If the authentication token is expired, the client will start in a disconnected state.";
    };

    startOnLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Start the Firezone client when the user logs into the machine. Requires the Firezone client to be running to take effect. In many cases you probably want to configure this using a Managed Login Items payload instead to force the client to be running.";
    };

    disableUpdateCheck = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables the update check and notification for the Standalone variant of the macOS client. App Store variant versions 1.4.15 and higher already have this disabled.";
    };

    supportURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The URL to which users will be taken to when clicking the Help -> Support link in the menu bar.";
    };

  };
}