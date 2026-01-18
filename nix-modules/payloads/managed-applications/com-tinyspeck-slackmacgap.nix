# Auto-generated from ProfileManifests: com.tinyspeck.slackmacgap.plist
# Domain: com.tinyspeck.slackmacgap
# Title: Slack
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-tinyspeck-slackmacgap" = {
    enable = lib.mkEnableOption "Slack";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.tinyspeck.slackmacgap";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    ClientEnvironment = lib.mkOption {
      type = types.nullOr (types.enum [ 1000 1001 ]);
      default = null;
      description = "Configures the client to run in either commercial mode or government compliance mode (GovSlack).";
    };

    HardwareAcceleration = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable or disable hardware accelerated rendering via GPU.";
    };

    DownloadPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Defines the download location for documents from Slack. This must be a valid user accessible path.";
    };

    DefaultSignInTeam = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Sets the default team/workspace for Slack sign-ins.";
    };

    ReleaseChannel = lib.mkOption {
      type = types.nullOr (types.enum [ "prod" "beta" ]);
      default = null;
      description = "Configure the client to receive updates from either the production or beta channel.";
    };

    AutoUpdate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable or disable auto updates.";
    };

    Defaults = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          ClientEnvironment = lib.mkOption {
            type = types.nullOr (types.enum [ 1000 1001 ]);
            default = null;
            description = "Configures the client to run in either commercial mode or government compliance mode (GovSlack) by default. The user can still change this setting.";
          };
          HardwareAcceleration = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "Enables or disable hardware accelerated rendering via GPU. The user can still change this setting.";
          };
          DownloadPath = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Defines the download location for documents from Slack. This must be a valid user accesible path. The user can still change this setting.";
          };
          ReleaseChannel = lib.mkOption {
            type = types.nullOr (types.enum [ "prod" "beta" ]);
            default = null;
            description = "Configure the client to receive updates from either the production or beta channel. The user can still change this setting.";
          };
        };
      });
      default = null;
      description = "List of default values.";
    };

    SlackNoAutoUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When true, disables Slack's built-in automatic update mechanism. Useful if you update Slack using a tool like Munki.";
    };

    SlackDefaultSignInWorkspace = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Sets the default workspace for Slack sign-ins.";
    };

  };
}