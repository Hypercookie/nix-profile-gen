# Auto-generated from ProfileManifests: com.apple.mail.managed.plist
# Domain: com.apple.mail.managed
# Title: Mail
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-mail-managed" = {
    enable = lib.mkEnableOption "Mail";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.mail.managed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    EmailAccountType = lib.mkOption {
      type = types.nullOr (types.enum [ "EmailTypeIMAP" "EmailTypePOP" ]);
      default = "EmailTypeIMAP";
      description = "Defines the protocol to use for the account.";
    };

    EmailAccountDescription = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A user-visible description of the email account, shown in the Mail and Settings applications.";
    };

    IncomingMailServerIMAPPathPrefix = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The path prefix for the IMAP mail server.";
    };

    EmailAccountName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The full user name for the account. The system displays this name in sent messages.";
    };

    EmailAddress = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The full email address for the account. If this string isn't present in the payload, the device prompts the user for this string during interactive profile installation in Settings or System Preferences.";
    };

    IdentificationUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The UUID of the Identification Payload to use as the source for the user email and username values.";
    };

    PreventMove = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system prevents moving messages out of this email account and into another account. It also prevents forwarding or replying from an account other than the recipient of the message.";
    };

    disableMailRecentsSyncing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system excludes this account from Recent Addresses syncing.";
    };

    allowMailDrop = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables this account to use Mail Drop.";
    };

    PreventAppSheet = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system prevents this account from sending mail in any app other than the Apple Mail app.";
    };

    SMIMEEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables S/MIME encryption. The system ignores this key in iOS 10.0 and later.";
    };

    SMIMESigningEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables S/MIME signing for this account.";
    };

    SMIMESigningCertificateUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The payload UUID of the identity certificate used to sign messages sent from this account.";
    };

    SMIMEEncryptionEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables S/MIME encryption for this account.";
    };

    SMIMEEncryptionCertificateUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The UUID of the identity certificate used to decrypt messages sent to this account. The system attaches the public certificate to outgoing mail to allow the user to receive encrypted mail. When the user sends encrypted mail, the system uses the public certificate to encrypt the copy of the mail in their Sent mailbox.";
    };

    SMIMEEnablePerMessageSwitch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system displays the per-message encryption switch in the Mail Compose UI. Deprecated in iOS 12.0. Use 'SMIMEEnableEncryptionPerMessageSwitch' instead.";
    };

    SMIMESigningUserOverrideable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the user can turn S/MIME signing on or off in Settings.";
    };

    SMIMESigningCertificateUUIDUserOverrideable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the user can select the signing identity.";
    };

    SMIMEEncryptByDefault = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables S/MIME encryption by default.";
    };

    SMIMEEncryptByDefaultUserOverrideable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the user can turn encryption by default on/off, and encryption is on.";
    };

    SMIMEEncryptionCertificateUUIDUserOverrideable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the user can select the S/MIME encryption identity, and encryption is on.";
    };

    SMIMEEnableEncryptionPerMessageSwitch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system displays the per-message encryption switch in the Mail Compose UI.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    IncomingMailServerHostName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The incoming mail server host name.";
    };

    IncomingMailServerPortNumber = lib.mkOption {
      type = types.nullOr (types.int);
      default = 993;
      description = "The incoming mail server port number. If not set, the system uses the default port for a given protocol.";
    };

    IncomingMailServerUsername = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user name for the email account, usually the same as the email address up to the \"@\" character. If not set and the account requires authentication for incoming email, the device prompts the user for this string during interactive profile installation in Settings or System Preferences.";
    };

    IncomingMailServerAuthentication = lib.mkOption {
      type = types.nullOr (types.enum [ "EmailAuthNone" "EmailAuthPassword" "EmailAuthCRAMMD5" "EmailAuthNTLM" "EmailAuthHTTPMD5" ]);
      default = "EmailAuthPassword";
      description = "The authentication scheme for incoming mail.";
    };

    IncomingPassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The password for the incoming mail server. Only use this in encrypted profiles.";
    };

    IncomingMailServerUseSSL = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables SSL for authentication on the incoming mail server.";
    };

    OutgoingMailServerHostName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The outgoing mail server host name.";
    };

    OutgoingMailServerPortNumber = lib.mkOption {
      type = types.nullOr (types.int);
      default = 587;
      description = "The outgoing mail server port number. If not set, the system uses ports 25, 587, and 465, in that order.";
    };

    OutgoingMailServerUsername = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user name for the email account, usually the same as the email address up to the \"@\" character. If not set and the account requires authentication for outgoing email, the device prompts the user for this string during interactive profile installation in Settings or System Preferences.";
    };

    OutgoingMailServerAuthentication = lib.mkOption {
      type = types.nullOr (types.enum [ "EmailAuthNone" "EmailAuthPassword" "EmailAuthCRAMMD5" "EmailAuthNTLM" "EmailAuthHTTPMD5" ]);
      default = "EmailAuthPassword";
      description = "The authentication scheme for outgoing mail.";
    };

    OutgoingPassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The password for the outgoing mail server. Only use this in encrypted profiles.";
    };

    OutgoingPasswordSameAsIncomingPassword = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system prompts the user only once for the password, which it uses for both outgoing and incoming mail.\n\nThis setting is only supported by interactive profile installations. Not supported by non-interactive installations, such as MDM on iOS.";
    };

    OutgoingMailServerUseSSL = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables SSL authentication on the outgoing mail server.";
    };

    VPNUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The VPNUUID of the per-app VPN the account uses for network communication. Available in iOS 14 and later.";
    };

  };
}