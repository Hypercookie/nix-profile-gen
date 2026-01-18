# Auto-generated from ProfileManifests: com.secondsonconsulting.renew.plist
# Domain: com.secondsonconsulting.renew
# Title: Renew - Second Son Consulting
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-secondsonconsulting-renew" = {
    enable = lib.mkEnableOption "Renew - Second Son Consulting";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.secondsonconsulting.renew";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    RequiredArguments = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          MaximumDeferrals = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "This is the maximum number of deferrals a user receives before Renew enters \"Aggressive\" mode. Set to '-1' to disable deferrals.";
          };
          UptimeThreshold = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The number of days which a device is online prior to the Renew experience starting.";
          };
          NotificationThreshold = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The number of times the user will get a macOS Notification Center event prior to the full Swift Dialog experience. Set to '-1' to configure an infinite threshold.";
          };
          DeferralDuration = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The minimum number of hours between when a user is notified that they need to restart.";
          };
        };
      });
      default = null;
      description = "There are four required arguments to make a valid Renew configuration.";
    };

    OptionalArguments = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          NotificationActionEnabled = lib.mkOption {
            type = types.nullOr (types.bool);
            default = true;
            description = "If enabled, interacting with the notification will initiate a restart. Defaults to true.";
          };
          Title = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The title of your dialog windows and notifications. Maps to the swiftDialog option: --title";
          };
          AggroMessage = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The message body you want in your Aggressive Mode dialog windows. Maps to SwiftDialog option: --message";
          };
          NormalMessage = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
          };
          NotificationMessage = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The message body you want in your Notification Center alerts. Maps to SwiftDialog option: --message";
          };
          NotificationSubtitle = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The subtitle field of your notifications. Maps to SwiftDialog option: --subtitle";
          };
          DeferralButtonText = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "What do you want your deferral button to say? Maps to SwiftDialog option: --button1text";
          };
          NoDeferralsRemainingButtonText = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "What do you want your deferral button to say when it's greyed out in Aggressive Mode? Maps to SwiftDialog option: --button1text";
          };
          RestartButtonText = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "What do you want your \"Restart Now\" button to say? Maps to SwiftDialog option: --infobuttontext";
          };
          ShowDeferralCount = lib.mkOption {
            type = types.nullOr (types.bool);
            default = null;
            description = "If true, an additional sentence is added to your Normal Mode dialog windows indicating how many deferrals the user has remaining. Omit this key if you don't want the extra information.";
          };
          NotificationIcon = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "This is the icon included on the right side of the Dialog Notification. Can be an app or a file path. Maps to SwiftDialog option: --icon";
          };
          NotificationIconDarkMode = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "This is the icon included on the right side of the Dialog Notification. Can be an app or a file path. Use this key if you have to differentiate between light and dark mode icons. Maps to SwiftDialog option: --icon";
          };
          MessageIcon = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The icon used in your Normal and Aggressive Mode dialogs. Use \"none\" to disable.  This can be a path to an image file, an app, or an SF symbol by using \"SF=symbol.name\". This maps to SwiftDialog option: --icon";
          };
          MessageIconDarkMode = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The icon used in your Normal and Aggressive Mode dialogs. Use this key if you have to differentiate between light and dark mode icons.This can be a path to an image file, an app, or an SF symbol by using \"SF=symbol.name\". This maps to SwiftDialog option: --icon";
          };
          BannerImage = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Use this key to designate a file path to a Banner Image for your Normal and Aggressive Mode dialog windows. Maps to SwiftDialog option: --bannerimage";
          };
          BannerImageDarkMode = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Use this key to designate a file path to a Banner Image for your Normal and Aggressive Mode dialog windows.  Use this key if you have to differentiate between light and dark mode banners. Maps to SwiftDialog option: --bannerimage";
          };
          AdditionalDialogOptions = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Use this key to pass additional options you want for all dialog events. See SwiftDialog documentation for advanced options.";
          };
          AdditionalAggressiveOptions = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Use this key to pass additional options you want for only Aggressive Mode dialog events. See SwiftDialog documentation for advanced options.";
          };
          AdditionalNormalOptions = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Use this key to pass additional options you want for only Normal Mode dialog events. See SwiftDialog documentation for advanced options.";
          };
          AdditionalNotificationOptions = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Use this key to pass additional options you want for only Notification Mode dialog events. See SwiftDialog documentation for advanced options.";
          };
          IgnoreAssertions = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "The applications which Renew ignores when checking for display assertions. (You can specify one or more, EX: zoom.us firefox).";
          };
          Deadline = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "Use this option to enable \"Deadline\" mode. If a device's uptime exceeds the \"Deadline\" value in days, Renew will enter Aggressive Mode regardless of the remaining deferrals.";
          };
          SecretQuitKey = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "This key in combination with the \"Command\" key will allow you to quit a dialog window without restarting. Cannot be set to Q! Omit this to leave the default combination (Cmd+]. Maps to SwiftDialog option --quitkey";
          };
        };
      });
      default = null;
      description = "There are a number of optional arguments to change Renew to look and act how you want.";
    };

  };
}