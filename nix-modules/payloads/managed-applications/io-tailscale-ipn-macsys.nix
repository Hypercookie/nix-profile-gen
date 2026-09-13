# Auto-generated from ProfileManifests: io.tailscale.ipn.macsys.plist
# Domain: io.tailscale.ipn.macsys
# Title: Tailscale (Standalone)
# Platforms: macOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Tailscale (Standalone)";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "io.tailscale.ipn.macsys";
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

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "system" "user" ];
        description = "Profile scopes this payload may be installed into (pfm_targets).";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "PFC_SegmentedControl_0" "ManagedByOrganizationName" "ManagedByCaption" "ManagedByURL" "SUEnableAutomaticChecks" "SUAutomaticallyUpdate" "ApplyUpdates" "UnstableUpdates" "TailscaleStartOnLogin" "AlwaysOn.Enabled" "AlwaysOn.OverrideWithReason" "ReconnectAfter" "ForceEnabled" "HideDHCP121Warnings" "Tailnet" "LoginURL" "AuthKey" "AuthBrowser.macos" "EncryptState" "ExitNodeID" "ExitNode.AllowOverride" "AllowedSuggestedExitNodes" "AdvertiseExitNode" "KeyExpirationNotice" "ExitNodeAllowLANAccess" "UseTailscaleSubnets" "Hostname" "UseTailscaleDNSSettings" "AllowIncomingConnections" "PostureChecking" "ExitNodesPicker" "ManageTailnetLock" "ResetToDefaults" "RunExitNode" "StartOnLoginMenuItem" "TestMenu" "UpdateMenu" "HiddenNetworkDevices" "IPAddressCopiedAlertSuppressed" "AppIntroShown" "HideDockIcon" "CLIIntegration" "OnboardingFlow" "TailscaleOnboardingSeen" "VPNOnDemandSettings" "VPNOnDemandIsUserConfigured" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      PFC_SegmentedControl_0 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
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

      SUEnableAutomaticChecks = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If you are using the Standalone version of Tailscale for macOS, the client will periodically check for updates automatically and notify the user that a new version is available, using the Sparkle framework. We recommend that you leave this feature on, in order to ensure your users receive any security updates in a timely manner. However, you might prefer to manually deploy updates and disable notifications of new available versions. Set this value to false to disable automatically checking for updates.";
      };

      SUAutomaticallyUpdate = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If you are using the Standalone version of Tailscale for macOS, the client can install updates automatically. This uses the Sparkle framework. We recommend that you always turn this feature on to make sure your users receive any security updates in a timely manner. Note, when the policy is set to true users may need to confirm the update before it is applied. However, if you manually manage updates, or prefer your users to be notified to manually update, you can disable the automatic installation. When SUAutomaticallyUpdate is set to false, the Standalone variant of Tailscale for macOS will require user input before updates are installed.";
      };

      ApplyUpdates = lib.mkOption {
        type = types.nullOr (types.enum [ "show" "hide" ]);
        default = null;
        description = "Use this if you do not want to allow the user to turn the automatic installation of updates on or off. When set to hide, the \"Automatically install updates\" menu item won’t be shown to the user, and the user won’t be able to configure automatic updates.";
      };

      UnstableUpdates = lib.mkOption {
        type = types.nullOr (types.enum [ "always" "never" "user-decides" ]);
        default = null;
        description = "Setting UnstableUpdates to \"never\" means that your users won’t be able to update to unstable versions of the client from the in-app UI. You can deploy this policy to prevent non-tech-savvy users from enrolling in pre-release builds of the client, which might be more prone to issues.";
      };

      TailscaleStartOnLogin = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "The first time the application is opened on a Mac, Tailscale installs a macOS login helper. This allows Tailscale to start automatically when the user logs into their account. This boolean controls whether the login helper should start Tailscale at login time.";
      };

      "AlwaysOn.Enabled" = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Prevents users from disconnecting from the tailnet or exiting the client. When this policy is enabled, you can also enable AlwaysOn.OverrideWithReason to require a reason for disconnecting, and ReconnectAfter to set how long the client can stay disconnected.";
      };

      "AlwaysOn.OverrideWithReason" = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Requires users to submit a reason when disconnecting the Tailscale client. User-provided reasons display in the Configuration logs page of the admin console. On macOS, a user can provide a reason in the client UI dialog or with the CLI command tailscale down --reason \"DNS issues\".";
      };

      ReconnectAfter = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Sets how long the client can remain disconnected from the tailnet before automatically reconnecting. Use a Go-style duration string, for example 24h or 5h25m30s. An empty string or a zero duration disables automatic reconnection. Can be used with or without AlwaysOn.Enabled.";
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
        description = "Specifies one or more tailnets to suggest or require during device registration. Set to a comma-separated list of tailnet IDs or organization IDs such as T123456CNTRL,o123456CNTRL. Prefix the value with required: to require one of those values and disallow registration in any other tailnet.";
      };

      LoginURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The LoginURL policy can be used to specify a custom control server URL. This should not be changed unless you are not using the standard Tailscale server. Use this policy if you’re deploying your own server, such as Headscale.";
      };

      AuthKey = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Specifies an auth key used to authenticate managed devices without user interaction. Clients automatically try to use the auth key when launched unless already logged in. Use a one-off auth key tagged for the device, with access control policies that grant only necessary access.";
      };

      "AuthBrowser.macos" = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Controls the browser used to open authentication URLs. Set this to the bundle identifier of the preferred browser. If the specified bundle is not present, the user's default system browser is used.";
      };

      EncryptState = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Instructs Tailscale to store the node state file in encrypted format on disk. The node state file contains credentials, like the node and machine keys, that could be copied to a different device if stored unencrypted. The Mac App Store variant always stores the state file encrypted regardless of this policy; this key applies to the Standalone variant only.";
      };

      ExitNodeID = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Forces the Tailscale client to always use the given exit node. This can be useful if you wish to route all Internet traffic through a node for inspection or logging purposes. Users won't be able to disable or choose another exit node when this policy is active unless ExitNode.AllowOverride is also enabled. The value should be the ID of an exit node device, or auto:any to require any regionally-routed exit node. You can optionally restrict permitted nodes with AllowedSuggestedExitNodes. If a forced exit node goes offline, Internet connectivity will be unavailable until it returns.";
      };

      "ExitNode.AllowOverride" = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Lets users select a different exit node when ExitNodeID is set to auto:any, which requires the use of an exit node. It does not allow disabling exit node usage entirely.";
      };

      AllowedSuggestedExitNodes = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Controls which exit nodes are recommended in the Tailscale client and through tailscale exit-node suggest. When ExitNodeID is set to auto:any, this list specifies the allowed regionally-routed exit nodes. If unset, all exit nodes are allowed. If set but empty, no exit nodes are allowed. Other exit nodes not specified by this policy can still be used, but they will not be recommended.";
      };

      AdvertiseExitNode = lib.mkOption {
        type = types.nullOr (types.enum [ "always" "never" "user-decides" ]);
        default = null;
        description = "Controls whether the device advertises itself as an exit node for use by other users and their devices.";
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

      AppIntroShown = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Set to true to suppress the \"Welcome to the Tailscale app\" modal window introduction that appears when you log in to Tailscale on a device for the first time.";
      };

      HideDockIcon = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "The Tailscale dock icon on macOS appears whenever an application window exists. By default, Tailscale leaves an icon in the dock to support quickly reopening the main application window. Set this to true to hide the dock icon after all windows close.";
      };

      CLIIntegration = lib.mkOption {
        type = types.nullOr (types.enum [ "show" "hide" ]);
        default = null;
        description = "When set to hide, the user will not be able to install the CLI helper, and will instead be told to contact their administrator.";
      };

      OnboardingFlow = lib.mkOption {
        type = types.nullOr (types.enum [ "show" "hide" ]);
        default = null;
        description = "Shows or hides the client onboarding flow that appears the first time Tailscale starts on a device. Hide it if end-users are already familiar with the product. On macOS, typically deploy a VPN configuration profile when hiding the onboarding flow.";
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

      VPNOnDemandIsUserConfigured = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Instructs Tailscale not to modify the VPN On Demand configuration, so that MDM-deployed OnDemandRules remain in effect. Deploy this together with VPNOnDemandSettings set to hide when providing your own VPN On Demand rules.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-io-tailscale-ipn-macsys" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Tailscale (Standalone) (io.tailscale.ipn.macsys) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}