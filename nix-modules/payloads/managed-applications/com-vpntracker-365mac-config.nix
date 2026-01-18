# Auto-generated from ProfileManifests: com.vpntracker.365mac-config.plist
# Domain: com.vpntracker.365mac
# Title: VPN Tracker
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-vpntracker-365mac-config" = {
    enable = lib.mkEnableOption "VPN Tracker";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.vpntracker.365mac";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Managed_Onboarding_TeamUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Have new users automatically join your organization's VPN Tracker team and automatically receive their VPN connection. Find yours at my.vpntracker.com/teamprofile.";
    };

    Managed_Onboarding_TeamAPIToken = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The team's API Token – find it at my.vpntracker.com/teamprofile.";
    };

    Managed_Onboarding_Greeting = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Greeting text to show instead of the default \"Welcome, {name}\".";
    };

    Managed_Onboarding_EmailDomains = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A comma-separated list of email domains that users are allowed to use when joining your team.";
    };

    Managed_Onboarding_Email = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "You can optionally set the email address the user will use to sign in to VPN Tracker, when deploying a personalized profile.";
    };

    Managed_Onboarding_GivenName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Used in the onboarding greeting and during VPN Tracker account registration for new users.";
    };

    Managed_Onboarding_FamilyName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Used in the onboarding greeting and during VPN Tracker account registration for new users.";
    };

    Managed_Onboarding_FullName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Full name of the user displayed during onboarding. If given name and family name are set, this value is ignored.";
    };

  };
}