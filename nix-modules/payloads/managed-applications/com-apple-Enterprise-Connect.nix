# Auto-generated from ProfileManifests: com.apple.Enterprise-Connect.plist
# Domain: com.apple.Enterprise-Connect
# Title: Enterprise Connect
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-apple-Enterprise-Connect" = {
    enable = lib.mkEnableOption "Enterprise Connect";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.Enterprise-Connect";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    adRealm = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The host name of your organization's Active Directory domain.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    launchAtLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Determines if Enterprise Connect should set itself as a login item.";
    };

    runPeriodicStateCheck = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enable or Disable periodic state checking. Customers who expose their DNS to the public Internet will need to disable periodic state checking.";
    };

    orgUsernameLabel = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The name your organization gives usernames.";
    };

    prepopulatedUsername = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Upon launch or sign out, Enterprise Connect will pre-populate the Username field with this username.";
    };

    preferredDC = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Preferred domain controller when doing LDAP queries and getting a Kerberos TGT. If this domain controller is unavailable, Enterprise Connect will fall back to domain controllers it discovers from DNS.";
    };

    setupReminderNagInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = 86400;
      description = "The interval, in seconds, between setup notifications.";
    };

    getRenewableTGT = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Acquire a renewable Kerberos TGT.";
    };

    showMenuExtra = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Determines whether the Enterprise Connect menu extra is loaded.";
    };

    checkShowLegacyCertificates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Automatically check the \"Show Legacy Certificates\" option in the certificate chooser window.";
    };

    showKeychainIdentities = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Automatically check the \"Show Legacy Certificates\" option in the certificate chooser window.";
    };

    disableQuitMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables the Quit menu item from Enterprise Connect.";
    };

    orgLogoPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The path to a file containing your organization's logo, in PNG, JPG or GIF format.";
    };

    debugMode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enables debugging mode.";
    };

    syncLocalPassword = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enables Active Directory to local account password sync. This only works if the user is logged into their Mac with a local account.";
    };

    pwReqComplexity = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Tells Enterprise Connect that passwords should meet Active Directory's definition of complexity. Used to enable and configure live password testing.";
    };

    pwReqComplexityDisableUnicode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables the \"Has a Unicode character\" password test from live password testing.";
    };

    pwReqLength = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Require passwords to be at least as long as the specified value.";
    };

    pwReqText = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to a RTF file to display for the user during password changes.";
    };

    pwReqHistoryCount = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "How many previous passwords cannot be re-used.";
    };

    pwReqMinimumPasswordAge = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The minimum age of passwords before they can be changed.";
    };

    disablePasswordFunctions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable Enterprise Connect's password management abilities, including expiration notices and the \"Change Password\" menu item. This is useful for customers who don't change their passwords in AD.";
    };

    disablePasswordExpirationChecking = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable Enterprise Connect's password expiration checking, but still leave intact the ability for the user to change their password with Enterprise Connect.";
    };

    runPasswordChangeScriptOnLocalPasswordSync = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Determines if Enterprise Connect should run the password change script upon a local password sync.";
    };

    passwordChangeScriptPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to the password change script.";
    };

    passwordChangeURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "URL to open in the user's default web browser when they use Enterprise Connect to change their password. Standard password change functionality will no longer work.";
    };

    passwordExpireOverride = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Override domain password policy when calculating password expiration.";
    };

    passwordNotificationDays = lib.mkOption {
      type = types.nullOr (types.int);
      default = 15;
      description = "Determines the amount of days before password expiration that the user receives expiration notifications.";
    };

    checkForNetworkType = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Check for a host in your organization's network.";
    };

    checkForNetworkServer = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The host Enterprise Connect should check for when connecting.";
    };

    connectDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = 0;
      description = "Delay starting the connection process when your organization's network is detected. This may be useful for customers who use Cisco NAC and need to delay connection while host checks are performed.";
    };

    connectionCompletedScriptPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to the connection completed script.";
    };

    connectReminderNagInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = 86400;
      description = "The interval, in seconds, between connection reminders.";
    };

    dailyReconnectTime = lib.mkOption {
      type = types.nullOr (types.int);
      default = 86400;
      description = "The interval, in seconds, that Enterprise Connect should attempt its daily reconnect. Set this to 0 to disable the daily reconnect.";
    };

    runAuditScript = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Tells Enterprise Connect to execute an audit script.";
    };

    runAuditScriptPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to the audit script.";
    };

    mountNetworkHomeDirectory = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Determines if Enterprise Connect mounts the user's network home directory.";
    };

    pfc_preventUserShares = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Prevents the user from adding custom shares to Enterprise Connect.";
    };

    shares = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          path = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Path";
          };
        };
      }));
      default = null;
      description = "List of shares that Enterprise Connect should attempt to mount.";
    };

    managedshares = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          path = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Path";
          };
        };
      }));
      default = null;
      description = "List of shares that Enterprise Connect should attempt to mount. Users will still be able to add their own shares.";
    };

    shareMountWaitSeconds = lib.mkOption {
      type = types.nullOr (types.int);
      default = 0;
      description = "Delay the mounting of network shares when your organization's network is detected. This may be useful for customers who use Cisco NAC and need to delay connection while host checks are performed.";
    };

    smartCardMode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Determines whether smart card mode should be enabled.";
    };

    showUsernameWithSmartcard = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Determines if Enterprise Connect should display the username field if smart card mode is enabled.";
    };

    destroyKerbTicketUponCardRemoval = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
    };

  };
}