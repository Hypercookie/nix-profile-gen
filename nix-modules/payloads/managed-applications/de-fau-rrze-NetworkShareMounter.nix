# Auto-generated from ProfileManifests: de.fau.rrze.NetworkShareMounter.plist
# Domain: de.fau.rrze.NetworkShareMounter
# Title: Network Share Mounter
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Network Share Mounter";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "de.fau.rrze.NetworkShareMounter";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
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
        default = [ "managedNetworkShares" "kerberosRealm" "kerberosProfileDisplayName" "usernameOverride" "singleUserMode" "ExpirationCountdownStartDay" "ExpirationNotificationStartDay" "passwordChangeURL" "allowPasswordChange" "autostart" "canChangeAutostart" "canQuit" "unmountOnExit" "location" "useNewDefaultLocation" "useLocalizedMountDirectories" "cleanupLocationDirectory" "helpURL" "menuConnectShares" "menuDisconnectShares" "menuShowSharesMountDir" "menuShowShares" "menuSettings" "menuCheckUpdates" "menuAbout" "menuQuit" "disableAutoUpdateFramework" "SUEnableAutomaticChecks" "SUAutomaticallyUpdate" "sendDiagnostics" "disableDiagnostics" "enableAutoUpdater" "networkShares" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      managedNetworkShares = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            networkShare = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The share URL, e.g. smb://fileserver.example.com/share. Note: %USERNAME% is replaced at runtime with the user's macOS login name.";
            };
            authType = lib.mkOption {
              type = types.nullOr (types.enum [ "krb" "pwd" "guest" ]);
              default = null;
              description = "Authentication method: krb (Kerberos/SSO), pwd (username + password), or guest. Default: krb.";
            };
            username = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Pre-defines a username for pwd-type shares. If omitted, the user is prompted.";
            };
            mountPoint = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Overrides the local directory name used as the mount point. Only relevant when the mount location is not /Volumes. Leave blank to use the share name (recommended).";
            };
            externalKerberosManagement = lib.mkOption {
              type = types.nullOr (types.enum [ "true" "false" ]);
              default = null;
              description = "Set to true if Kerberos tickets for this share are managed externally (AD binding, Jamf Connect, Apple SSO Extension). NSM will mount the share without interfering with ticket management and will not prompt for a Kerberos profile. Only relevant for authType: krb.";
            };
            kerberosRealm = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Per-share Kerberos realm override. Used together with externalKerberosManagement to identify which external profile to assign. Defaults to the global kerberosRealm setting.";
            };
            autoMount = lib.mkOption {
              type = types.nullOr (types.enum [ "true" "false" ]);
              default = null;
              description = "true (default): the share is mounted automatically at startup and on network changes. false: the share appears in the menu but is never mounted automatically - the user can mount it on demand.";
            };
          };
        }));
        default = null;
        description = "Array with managed network shares that are centrally deployed to users.";
      };

      kerberosRealm = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Kerberos/AD domain for user authentication (e.g. EXAMPLE.COM). When set, NSM manages Kerberos ticket acquisition and renewal automatically. Required for app-managed Kerberos SSO.";
      };

      kerberosProfileDisplayName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Friendly display name for the Kerberos authentication profile shown in the app's Settings. If not set, the realm name (e.g. EXAMPLE.COM) is used as-is.";
      };

      usernameOverride = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Overrides the %USERNAME% variable used in share paths. Use this when the local macOS login name differs from the AD or network username.";
      };

      singleUserMode = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If true, automatic Kerberos sign-in and ticket renewal only process the default account. If false, all configured accounts are processed.";
      };

      ExpirationCountdownStartDay = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Passive warning. Days before password expiry when a silent countdown item first appears in the menu bar. The user only sees it when they open the menu. Set to 0 to disable all password expiration features entirely. Mirrors the Apple Kerberos SSO Extension key of the same name.";
      };

      ExpirationNotificationStartDay = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Active warning. Days before password expiry when an alert dialog is shown automatically, once per calendar day. Set this lower than ExpirationCountdownStartDay so the dialog only interrupts when expiry is genuinely imminent. Mirrors the Jamf Connect / Apple Kerberos SSO Extension key of the same name.";
      };

      passwordChangeURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "URL of a web-based password self-service portal (SSPR). If set, a Change Password button in the expiration dialog opens this URL in the default browser. If not set, the user can change their password directly within NSM (requires kerberosRealm).";
      };

      allowPasswordChange = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true, a permanent Change Password... item is shown in the menu bar at all times, even before the expiry threshold is reached. It automatically transforms into the expiry countdown when the threshold is reached. If passwordChangeURL is also set, clicking the item opens that URL instead of the in-app dialog. Mirrors the Apple Kerberos SSO Extension key of the same name.";
      };

      autostart = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When deployed as a locked MDM key, the value is enforced on every app launch. When deployed as an unlocked default, it is applied once on the first launch only - after that, the user retains control.";
      };

      canChangeAutostart = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls only the autostart toggle in the app's Settings UI. Set to false to grey it out. Does not affect MDM enforcement. To enforce the autostart state on every launch, deploy autostart as a locked key instead.";
      };

      canQuit = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true, the user can quit the app via the menu bar. Set to false to remove the Quit item entirely.";
      };

      unmountOnExit = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true, all managed shares are automatically unmounted when the app quits.";
      };

      location = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Path where network shares are mounted. The default is a localized folder in the user's home directory (e.g. ~/Network Shares). It is strongly recommended to leave this empty and use the default - changing it can break Finder integration.";
      };

      useNewDefaultLocation = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If true, shares are mounted under /Volumes by default instead of the legacy per-user location. Ignored if 'location' is set.";
      };

      useLocalizedMountDirectories = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If false, always uses the English folder name 'Networkshares' for the legacy default mount path instead of a name localized to the user's language. Only relevant when 'useNewDefaultLocation' is false.";
      };

      cleanupLocationDirectory = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true, NSM removes files and empty directories from the mount location that would prevent a share from mounting. Read the documentation carefully before enabling - this modifies the user's file system.";
      };

      helpURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "URL to your organization's internal helpdesk or IT documentation. When set, an About Network Share Mounter item appears in the menu bar, opening this URL in the default browser.";
      };

      menuConnectShares = lib.mkOption {
        type = types.nullOr (types.enum [ "hidden" "disabled" ]);
        default = null;
        description = "Controls the \"Mount shares\" action. Set to hidden to remove the item completely, or disabled to grey it out without removing it. Leave unconfigured to show it normally.";
      };

      menuDisconnectShares = lib.mkOption {
        type = types.nullOr (types.enum [ "hidden" "disabled" ]);
        default = null;
        description = "Controls the \"Unmount shares\" action. Set to hidden to remove the item completely, or disabled to grey it out without removing it. Leave unconfigured to show it normally.";
      };

      menuShowSharesMountDir = lib.mkOption {
        type = types.nullOr (types.enum [ "hidden" "disabled" ]);
        default = null;
        description = "Controls \"Show mounted shares\" (opens the mount folder in Finder). Set to hidden to remove the item completely, or disabled to grey it out without removing it. Leave unconfigured to show it normally.";
      };

      menuShowShares = lib.mkOption {
        type = types.nullOr (types.enum [ "hidden" "disabled" ]);
        default = null;
        description = "Controls the individual share items listed in the menu. Set to hidden to remove them completely, or disabled to grey them out without removing them. Leave unconfigured to show them normally.";
      };

      menuSettings = lib.mkOption {
        type = types.nullOr (types.enum [ "hidden" "disabled" ]);
        default = null;
        description = "Controls the \"Preferences...\" item. Set to hidden to remove the item completely, or disabled to grey it out without removing it. Leave unconfigured to show it normally.";
      };

      menuCheckUpdates = lib.mkOption {
        type = types.nullOr (types.enum [ "hidden" "disabled" ]);
        default = null;
        description = "Controls the \"Check for Updates...\" item. Set to hidden to remove the item completely, or disabled to grey it out without removing it. Leave unconfigured to show it normally.";
      };

      menuAbout = lib.mkOption {
        type = types.nullOr (types.enum [ "hidden" "disabled" ]);
        default = null;
        description = "Controls the \"About Network Share Mounter\" item (only visible when helpURL is set). Set to hidden to remove the item completely, or disabled to grey it out without removing it. Leave unconfigured to show it normally.";
      };

      menuQuit = lib.mkOption {
        type = types.nullOr (types.enum [ "hidden" "disabled" ]);
        default = null;
        description = "Controls the \"Quit Network Share Mounter\" item. Set to hidden to remove the item completely, or disabled to grey it out without removing it. Leave unconfigured to show it normally.";
      };

      disableAutoUpdateFramework = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Master switch. Set to true to completely disable the Sparkle update framework. When disabled, no update checks occur and the Check for Updates menu item is removed.";
      };

      SUEnableAutomaticChecks = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When the framework is enabled, controls whether NSM actively checks for new versions in the background. Set to false to suppress checks while keeping the framework loaded.";
      };

      SUAutomaticallyUpdate = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true, updates are downloaded and installed automatically without asking the user for confirmation. Only takes effect when SUEnableAutomaticChecks is also true.";
      };

      sendDiagnostics = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If true, diagnostic and crash data is sent to help improve the app. Independent of 'disableDiagnostics', which only hides the section in Settings.";
      };

      disableDiagnostics = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true, hides the hidden \"Diagnostics\" trigger in Settings and General (five consecutive clicks) that lets users send NSM's unified-log activity to the developers for troubleshooting. Use this to prevent users from sending diagnostic data off-device, e.g. for data-privacy reasons.";
      };

      enableAutoUpdater = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Deprecated since version 4. Use 'disableAutoUpdateFramework' instead (inverted logic: enableAutoUpdater = true equals disableAutoUpdateFramework = false).";
      };

      networkShares = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Legacy array with all network shares. Example: smb://filer.your.domain/share. Note: %USERNAME% will be replaced with the login name of the current user. Still accepted for backward compatibility but should not be used in new profiles - use managedNetworkShares instead.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-de-fau-rrze-NetworkShareMounter" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Network Share Mounter (de.fau.rrze.NetworkShareMounter) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}