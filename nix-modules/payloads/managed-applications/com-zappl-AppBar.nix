# Auto-generated from ProfileManifests: com.zappl.AppBar.plist
# Domain: com.zappl.AppBar
# Title: Zappl AppBar
# Platforms: macOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Zappl AppBar";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.zappl.AppBar";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
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
        default = [ "Title" "TitleFontSize" "CustomLogo" "CustomLogoDark" "NotificationIcon" "MenuBarIcon" "AccentColor" "InstallsTabEnabled" "HistoryTabEnabled" "LiquidGlassEnabled" "AllowUpdateNotifications" "AllowInstallNotifications" "AllowFailureNotifications" "EnableQuitButton" "EnableAboutButton" "CustomCategories" "CustomDescriptions" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Title = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The title text shown in the top left of the AppBar window";
      };

      TitleFontSize = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The font size of the title text shown in the top left of the AppBar window. Accepts numerical values between 16 and 32. Values outside this range will default to 22";
      };

      CustomLogo = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The logo shown to the left of the title text. Can be a file path, URL to an image, or an SFSymbol name. Defaults to the 'Custom Logo (Dark Mode)' option if specified, or the 'app.badge.fill' SFSymbol if neither Custom Logo options are specified";
      };

      CustomLogoDark = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The logo shown to the left of the title text in dark mode. Can be a file path, URL to an image, or an SFSymbol name. Defaults to the 'Custom Logo' option if specified, or the 'app.badge.fill' SFSymbol if neither Custom Logo options are specified";
      };

      NotificationIcon = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "A path or URL to a custom branding logo shown to the right hand side of macOS notifications";
      };

      MenuBarIcon = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Either a path to an icon (must be 16x16 points) or an SFSymbol name to be used as the menu bar icon. Defaults to the 'square.and.arrow.down.on.square' SFSymbol if not specified";
      };

      AccentColor = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Custom colour to be used for buttons and highlighting. Accepts hex colour codes (e.g., #0000FF). Defaults to macOS system accent colour if not specified";
      };

      InstallsTabEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Determines whether the installs tab is enabled. Disabled by default. When disabled, users will see a message indicating installs are not allowed. When enabled, users can use the installs tab to install approved apps. To customise approved apps, use the 'Allowed Installs' or 'Excluded Installs' options in the com.dare.zappl.preferences configuration profile";
      };

      HistoryTabEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Determines whether the history tab is enabled. Uncheck to hide the history tab which shows recent updates, installs and failures";
      };

      LiquidGlassEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enables the liquid glass effect on macOS 26 (Tahoe) and later. This option has no effect on macOS versions prior to macOS 26";
      };

      AllowUpdateNotifications = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Shows a macOS notification when new updates are cached by Zappl and are available to be updated via AppBar. Requires a notifications configuration profile which approves com.zappl.AppBar notifications";
      };

      AllowInstallNotifications = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Shows a macOS notification when installs complete. Requires a notifications configuration profile which approves com.zappl.AppBar notifications";
      };

      AllowFailureNotifications = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Shows a macOS notification when installs or updates fail. Requires a notifications configuration profile which approves com.zappl.AppBar notifications";
      };

      EnableQuitButton = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enables the quit button when right-clicking the menu bar icon. Uncheck to disable";
      };

      EnableAboutButton = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enables the about button which shows AppBar information such as installed version when right-clicking the menu bar icon";
      };

      CustomCategories = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            identifier = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The identifier of the application (e.g., com.example.app)";
            };
            category = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The custom category label to assign to this app";
            };
          };
        }));
        default = null;
        description = "Customise the default categories apps are assigned to in the installs tab by specifying app identifiers and their desired custom category labels";
      };

      CustomDescriptions = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            identifier = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The identifier of the application (e.g., com.example.app)";
            };
            description = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The custom description to display for this app";
            };
          };
        }));
        default = null;
        description = "Customise the descriptions shown for apps in the installs tab by specifying app identifiers and their desired custom descriptions";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-zappl-AppBar" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Zappl AppBar (com.zappl.AppBar) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}