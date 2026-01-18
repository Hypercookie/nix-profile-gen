# Auto-generated from ProfileManifests: io.tailscale.ipn.macos.plist
# Domain: io.tailscale.ipn.macos
# Title: Tailscale (MAS)
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-io-tailscale-ipn-macos" = {
    enable = lib.mkEnableOption "Tailscale (MAS)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "io.tailscale.ipn.macos";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    ManagedByOrganizationName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies the name of the organization managing Tailscale, for instance “XYZ Corp, Inc.”. The value will be displayed in the Tailscale client, so that users can easily reach your internal support resources.";
    };

    ManagedByCaption = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies a caption to be displayed in the Managed By view in the Tailscale client. Use this string value to provide your users with information on how to reach support resources for Tailscale in your organization.";
    };

    ManagedByURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specifies a URL pointing to a help desk webpage, or other helpful resources for users in the organization. Clicking the Support button in the Tailscale UI will open this webpage.";
    };

    TailscaleStartOnLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "The first time the application is opened on a Mac, Tailscale installs a macOS login helper. This allows Tailscale to start automatically when the user logs into their account. This boolean controls whether the login helper should start Tailscale at login time.";
    };

    ForceEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When set to true, this boolean instructs Tailscale to always be connected and actively monitor the tunnel state for disconnections. The Disconnect toggle will be disabled, to prevent users from disabling the VPN themselves. An attempt to disconnect will present a banner informing the user the organization’s policy prevents Tailscale from being disconnected. If the client detects the VPN tunnel is down because the Tailscale VPN process was terminated, Tailscale will automatically restart it and reconnect. You might want to use this policy together with an always-on VPN configuration profile.";
    };

    HideDHCP121Warnings = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "By default, Tailscale v1.68 and later detect when DHCP Option 121 is being used, and the client will display a warning to the user in the UI when usage of this option is detected. You may set the HideDHCP121Warnings system policy to true to hide such warnings if you have a legitimate need to use Option 121.";
    };

    Tailnet = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Specify a tailnet, and its identity provider will be used on the login page. If the policy value is prefixed with \"required:\"\", Tailscale will force that identity provider to be used and won’t allow logging in with anything else.";
    };

    LoginURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The LoginURL policy can be used to specify a custom control server URL. This should not be changed unless you are not using the standard Tailscale server. Use this policy if you’re deploying your own server, such as Headscale.";
    };

    ExitNodeID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Forces the Tailscale client to always use the given exit node. This can be useful if you wish to route all Internet traffic through a node for inspection or logging purposes. Users won't be able to disable or choose another exit node when this policy is active. A message will be displayed in the client UI informing users about this restriction. The value for this key should be the ID of an exit node device. You can find the ID for any device in your tailnet by looking at the Machines page of the admin console, or by using the Tailscale API. Note that if a forced exit node goes offline, Internet connectivity will be unavailable on client devices until the exit node comes back online.";
    };

    KeyExpirationNotice = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The KeyExpirationNotice policy controls how long before key expiry should a notice be displayed. The default is 24 hours (\"24h\"). Use a Go-style Duration for this policy value, for instance \"24h\" or \"5h25m30s\".";
    };

    ExitNodeAllowLANAccess = lib.mkOption {
      type = types.nullOr (types.enum [ "always" "never" "user-decides" ]);
      default = null;
      description = "Allow Local Network Access determines whether users can still access devices on the local network while using an exit node.";
    };

    UseTailscaleSubnets = lib.mkOption {
      type = types.nullOr (types.enum [ "always" "never" "user-decides" ]);
      default = null;
      description = "Determines whether the client accepts subnets advertised by other nodes in your tailnet.";
    };

    Hostname = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Hostname policy allows IT administrators to override the hostname configured in the operating system and reported to the coordination server. This can be particularly useful on mobile devices, where the hostname provided by the operating system usually only contains the device's manufacturer name and model.";
    };

    UseTailscaleDNSSettings = lib.mkOption {
      type = types.nullOr (types.enum [ "always" "never" "user-decides" ]);
      default = null;
      description = "Determines whether to apply the DNS configuration provided by the coordination server when the tunnel is connected.";
    };

    AllowIncomingConnections = lib.mkOption {
      type = types.nullOr (types.enum [ "always" "never" "user-decides" ]);
      default = null;
      description = "Determines whether Tailscale should allow incoming connections to the device.";
    };

    PostureChecking = lib.mkOption {
      type = types.nullOr (types.enum [ "always" "never" "user-decides" ]);
      default = null;
      description = "Enables gathering of device posture data.";
    };

    ExitNodesPicker = lib.mkOption {
      type = types.nullOr (types.enum [ "show" "hide" ]);
      default = null;
      description = "Shows or hides all UI items to choose an exit node in the Tailscale client.";
    };

    ManageTailnetLock = lib.mkOption {
      type = types.nullOr (types.enum [ "show" "hide" ]);
      default = null;
      description = "Shows or hides the \"Manage Tailnet lock\" menu item.";
    };

    ResetToDefaults = lib.mkOption {
      type = types.nullOr (types.enum [ "show" "hide" ]);
      default = null;
      description = "Shows or hides the \"Reset to Defaults\" menu item.";
    };

    RunExitNode = lib.mkOption {
      type = types.nullOr (types.enum [ "show" "hide" ]);
      default = null;
      description = "Shows or hides the \"Run as Exit Node\" menu item, controlling the user's ability to toggle this option.";
    };

    StartOnLoginMenuItem = lib.mkOption {
      type = types.nullOr (types.enum [ "show" "hide" ]);
      default = null;
      description = "Shows or hides the \"Start on Login\" menu item, controlling the user's ability to toggle this option.";
    };

    TestMenu = lib.mkOption {
      type = types.nullOr (types.enum [ "show" "hide" ]);
      default = null;
      description = "Shows or hides the debug menu in the Tailscale client. On macOS, this system policy will also hide any information displayed when holding down the Option key while clicking on the Tailscale menubar item.";
    };

    UpdateMenu = lib.mkOption {
      type = types.nullOr (types.enum [ "show" "hide" ]);
      default = null;
      description = "Shows or hides the \"Update Available\" menu item which appears when a newer version of Tailscale is available.";
    };

    HiddenNetworkDevices = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "current-user" "other-users" "tagged-devices" ]));
      default = null;
      description = "Can be used to hide one or more categories of network devices normally displayed in the Tailscale client. Administrators can choose to hide: devices owned by the current user; devices owned by other users; tagged devices. If all three options are chosen, the \"Network Devices\" menu item disappears entirely and users aren’t able to see any device on the tailnet.";
    };

    IPAddressCopiedAlertSuppressed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When you use the Tailscale menu bar item to copy to the Clipboard the IP address of a device, a notification displaying the IP address is presented. Use this to suppress this Copied IP address to clipboard notification.";
    };

    CLIIntegration = lib.mkOption {
      type = types.nullOr (types.enum [ "show" "hide" ]);
      default = null;
      description = "When set to hide, the user will not be able to install the CLI helper, and will instead be told to contact their administrator.";
    };

    TailscaleOnboardingSeen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When you start Tailscale on your Mac for the first time, an onboarding flow is presented. It explains the Tailscale privacy policy, and guides the user in setting up the VPN configuration on their Mac. You might want to disable this onboarding flow if you are going to automatically set up the VPN configuration on the system by using a configuration profile. In order to do so, this boolean suppresses the onboarding flow when Tailscale launches for the first time and the value is set to true.";
    };

    VPNOnDemandSettings = lib.mkOption {
      type = types.nullOr (types.enum [ "show" "hide" ]);
      default = null;
      description = "The VPNOnDemandSettings policy can be used to show or hide the VPN On Demand menu item. You might want to use this setting if you're deploying your own VPN configuration profile for Tailscale, and you don't want your users to interact with the on-demand VPN configuration you set up for them.";
    };

  };
}