# Auto-generated from ProfileManifests: com.apple.eas.account.plist
# Domain: com.apple.eas.account
# Title: Exchange ActiveSync
# Platforms: iOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-eas-account" = {
    enable = lib.mkEnableOption "Exchange ActiveSync";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.eas.account";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    UserName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "This user name for this Exchange account. Required for noninteractive installations like MDM in iOS.";
    };

    EmailAddress = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The full email address for the account. If not present in the payload, the device prompts for this string during profile installation.";
    };

    Password = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The password of the account. Use only with encrypted profiles.";
    };

    OverridePreviousPassword = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system overrides the previous user/EAS password with the new EAS password in the payload. Available in iOS 14 and later.";
    };

    Host = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Exchange server host name or IP address.";
    };

    SSL = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables SSL for authentication.";
    };

    OAuth = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', enables OAuth for authentication. If enabled, don't specify a password.\n\nAvailable only in iOS 12.0 and above.";
    };

    Certificate = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The '.p12' identity certificate in NSData blob format, for accounts that allow authentication via certificate.";
    };

    CertificateName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The name or description of the certificate.";
    };

    CertificatePassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The password necessary for the '.p12' identity certificate. Used with mandatory encryption of profiles.";
    };

    PreventMove = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system prevents moving messages from out of this email account into another account. This setting also prevents forwarding or replying from an account other than the recipient of the message.";
    };

    PreventAppSheet = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', prevents this account from sending mail in any app other than the Apple Mail app.";
    };

    SMIMEEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables S/MIME encryption. In iOS 10.0 and later, this key is ignored. Use 'SMIMESigningEnabled' instead.";
    };

    SMIMESigningEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables S/MIME signing for this account. Available in iOS 10.0 and later.";
    };

    SMIMESigningCertificateUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The UUID of the identity certificate used to sign messages sent from this account.";
    };

    SMIMEEncryptionEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables S/MIME encryption for this account. Available in iOS 10.0 and later. As of iOS 12.0, this key is deprecated. Use 'SMIMEEncryptByDefault' instead.";
    };

    SMIMEEncryptionCertificateUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The payload UUID of the identity certificate used to decrypt messages sent to this account. The system attaches the public certificate to outgoing mail to allow the user to receive encrypted mail. When the user sends encrypted mail, the system uses the public certificate to encrypt the copy of the mail in the user's Sent mailbox.";
    };

    SMIMEEnablePerMessageSwitch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system displays the per-message encryption switch in the Mail Compose UI.\n\nAvailable in iOS 8.0 and later. As of iOS 12.0, this key is deprecated. Use 'SMIMEEnableEncryptionPerMessageSwitch' instead.";
    };

    SMIMESigningUserOverrideable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the user can turn S/MIME signing on or off in Settings. Available in iOS 12.0 and later.";
    };

    SMIMESigningCertificateUUIDUserOverrideable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the user can select the signing identity. Available in iOS 12.0 and later.";
    };

    SMIMEEncryptByDefault = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables S/MIME encryption by default. If 'SMIMEEnableEncryptionPerMessageSwitch' is 'false', the user can't change this default. Available in iOS 12.0 and later.";
    };

    SMIMEEncryptByDefaultUserOverrideable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables encryption by default and the user can't change it. Available in iOS 12.0 and later.";
    };

    SMIMEEncryptionCertificateUUIDUserOverrideable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the user can select the S/MIME encryption identity, and encryption is on.Available in iOS 12.0 and later.";
    };

    SMIMEEnableEncryptionPerMessageSwitch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system displays the per-message encryption switch in the Mail Compose UI. Available in iOS 12.0 and later.";
    };

    EnableCalendars = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the Calendars service for this account. The user can reenable Calendars service in Settings unless 'EnableCalendarsUserOverridable' is 'false'.\n\nNote:\nAt least of the following fields needs to be 'true': 'EnableMail', 'EnableContacts', 'EnableCalendars', 'EnableReminders', and 'EnableNotes'.";
    };

    EnableContacts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the Contacts service for this account. The user can reenable Contacts service in Settings unless 'EnableContactsUserOverridable' is 'false'.\n\nNote:\nAt least of the following fields needs to be 'true': 'EnableMail', 'EnableContacts', 'EnableCalendars', 'EnableReminders', and 'EnableNotes'.";
    };

    EnableMail = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the Mail service for this account. The user can reenable Mail service in Settings unless 'EnableMailUserOverridable' is 'false'.\n\nNote:\nAt least of the following fields needs to be 'true': 'EnableMail', 'EnableContacts', 'EnableCalendars', 'EnableReminders', and 'EnableNotes'.";
    };

    EnableNotes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the Notes service for this account. The user can reenable Notes service in Settings unless 'EnableNotesUserOverridable' is 'false'.\n\nNote:\nAt least of the following fields needs to be 'true': 'EnableMail', 'EnableContacts', 'EnableCalendars', 'EnableReminders', and 'EnableNotes'.";
    };

    EnableReminders = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the Reminders service for this account. The user can reenable Reminders service in Settings unless 'EnableRemindersUserOverridable' is 'false'.\n\nNote:\nAt least of the following fields needs to be 'true': 'EnableMail', 'EnableContacts', 'EnableCalendars', 'EnableReminders', and 'EnableNotes'.";
    };

    EnableCalendarsUserOverridable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents the user from changing the state of the Calendars service for this account in Settings.";
    };

    EnableContactsUserOverridable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents the user from changing the state of the Contacts service for this account in Settings.";
    };

    EnableMailUserOverridable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents the user from changing the state of the Mail service for this account in Settings.";
    };

    EnableNotesUserOverridable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', prevents the user from changing the state of the Notes service for this account in Settings.";
    };

    EnableRemindersUserOverridable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents the user from changing the state of the Reminders service for this account in Settings.";
    };

    disableMailRecentsSyncing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system excludes this account from Recent Addresses syncing.";
    };

    MailNumberOfPastDaysToSync = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 3 7 14 31 ]);
      default = 7;
      description = "The number of days in the past to sync mail on the device.\n\nFor no limit, use the value '0'.";
    };

    CommunicationServiceRules = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          DefaultServiceHandlers = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                AudioCall = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle identifier of the default application to use for audio calls made to contacts from this account.";
                };
              };
            });
            default = null;
            description = "The default handlers to use for contacts from this account.";
          };
        };
      });
      default = null;
      description = "The communication service handler rules for this account.";
    };

    VPNUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The VPNUUID of the per-app VPN the account uses for network communication. Available in iOS 14 and later.";
    };

    HeaderMagic = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The value of the 'X-Apple-Config-Magic' header in each EAS HTTP request.";
    };

    allowMailDrop = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables this account to use Mail Drop.";
    };

    OAuthSignInURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The URL that this account should use for signing in through OAuth. Ignored unless 'OAuth' is 'true'. If you specify this URL, auto-discovery isn't used for this account, so you need to also specify a host.";
    };

    OAuthTokenRequestURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The URL that this account should use for token requests through OAuth. Ignored unless 'OAuth' is 'true'.";
    };

  };
}