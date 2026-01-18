# Auto-generated from ProfileManifests: com.cloudflare.warp.plist
# Domain: com.cloudflare.warp
# Title: Cloudflare WARP Client
# Platforms: macOS, iOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-cloudflare-warp" = {
    enable = lib.mkEnableOption "Cloudflare WARP Client";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.cloudflare.warp";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    display_name = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "When WARP is deployed with multiple organizations or configurations, this parameter is used to identify each configuration in the GUI.";
    };

    organization = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Required for full Cloudflare Zero Trust features. Instructs the client to register the device with your organization. Registration requires authentication via an IdP or Service Auth.";
    };

    gateway_unique_id = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Instructs the client to direct all DNS queries to a specific Gateway DNS location. This value is only necessary if deploying without a team name or in an organization with multiple DNS locations. If you do not supply a DoH subdomain, we will automatically use the default Gateway DNS location for your organization.";
    };

    service_mode = lib.mkOption {
      type = types.nullOr (types.enum [ "1dot1" "warp" ]);
      default = "warp";
      description = "Allows you to choose the operational mode of the client.";
    };

    onboarding = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Controls the visibility of the onboarding screens that ask the user to review the privacy policy during an application's first launch.";
    };

    switch_locked = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Allows the user to turn off the WARP switch and disconnect the client.";
    };

    auto_connect = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "If switch has been turned off by user, the client will automatically turn itself back on after the specified number of minutes. We recommend keeping this set to a very low value - usually just enough time for a user to log in to hotel or airport Wi-Fi. If any value is specified for auto_connect the default state of the WARP client will always be Connected (for example, after the initial install or a reboot).";
    };

    support_url = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "When the WARP client is deployed via MDM, the in-app Send Feedback button is disabled by default. This parameter allows you to re-enable the button and direct feedback towards your organization.";
    };

    override_api_endpoint = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Overrides the IP address used by the WARP client to communicate with the client orchestration API. If you set this parameter, be sure to update your organization's firewall to ensure the new IP is allowed through.";
    };

    override_doh_endpoint = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Overrides the IP address used by the WARP client to resolve DNS queries via DNS over HTTPS (DoH). If you set this parameter, be sure to update your organization's firewall to ensure the new IP is allowed through.";
    };

    override_warp_endpoint = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Overrides the IP address and UDP port used by the WARP client to send traffic to Cloudflare's edge. If you set this parameter, be sure to update your organization's firewall to ensure the new IP is allowed through.";
    };

    unique_client_id = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Assigns a unique identifier to the device for the device UUID posture check.";
    };

    auth_client_id = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enrolls the device in your Zero Trust organization using a service token. Requires the auth_client_secret parameter.";
    };

    auth_client_secret = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enrolls the device in your Zero Trust organization using a service token. Requires the auth_client_id parameter.";
    };

  };
}