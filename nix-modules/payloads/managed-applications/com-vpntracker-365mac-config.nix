# Auto-generated from ProfileManifests: com.vpntracker.365mac-config.plist
# Domain: com.vpntracker.365mac
# Title: VPN Tracker
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "VPN Tracker";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.vpntracker.365mac";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
        description = "Whether only one instance of this payload is allowed per profile.";
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

      _platforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "macOS" ];
        description = "Supported Apple platforms (pfm_platforms).";
      };

      _keyPlatforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.attrs;
        default = [ ];
        description = "Keys restricted to a subset of the manifest's platforms (key-level pfm_platforms).";
      };

      _allowUnsupportedPlatform = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Emit this instance even if its manifest says the target platform does not support it or some of its keys. Produces a warning instead of an error.";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "Managed_Onboarding_TeamUUID" "Managed_Onboarding_TeamAPIToken" "Managed_Onboarding_Greeting" "Managed_Onboarding_EmailDomains" "Managed_Onboarding_Email" "Managed_Onboarding_GivenName" "Managed_Onboarding_FamilyName" "Managed_Onboarding_FullName" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.payloads."managed-applications-com-vpntracker-365mac-config" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "VPN Tracker (com.vpntracker.365mac) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}