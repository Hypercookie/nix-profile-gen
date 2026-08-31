# Maps Home Manager `accounts.email.accounts.<name>` onto
# `com.apple.mail.managed` payload instances.
{ config, lib, ... }:

let
  cfg = config.programs.macprofile;
  bcfg = cfg.bridges.email;

  # Safe when this module is evaluated outside Home Manager, where the
  # accounts.* option tree does not exist.
  hasEmail = config ? accounts && config.accounts ? email;

  accounts = if hasEmail then config.accounts.email.accounts else { };

  manifest = "apple-com-apple-mail-managed";

  # Home Manager's authentication enum has ten values; the Mail payload has
  # five. Anything unmappable stays null so macOS picks its own default.
  authMap = {
    anonymous = "EmailAuthNone";
    apop = "EmailAuthPassword";
    clear = "EmailAuthPassword";
    login = "EmailAuthPassword";
    plain = "EmailAuthPassword";
    cram_md5 = "EmailAuthCRAMMD5";
    ntlm = "EmailAuthNTLM";
    digest_md5 = "EmailAuthHTTPMD5";
  };

  # The manifest marks Incoming/OutgoingMailServerAuthentication as
  # `pfm_require = "always"`. Omitting them does not make macOS fall back to
  # the documented default: Mail installs the payload and then fails account
  # verification. Home Manager's `authentication` defaults to null and its type
  # also admits free-form strings, so anything we cannot map becomes the
  # manifest default rather than a dropped key.
  defaultAuth = "EmailAuthPassword";

  mapAuth = a: if a == null then defaultAuth else authMap.${a} or defaultAuth;

  # Only IMAP accounts can become a Mail payload. JMAP-only and maildir-only
  # accounts have no representation in com.apple.mail.managed.
  eligible = lib.filterAttrs
    (name: acct: acct.imap != null && !(lib.elem name bcfg.exclude))
    accounts;

  toInstance = name: acct: {
    enable = true;

    _displayName = lib.mkDefault acct.name;

    EmailAccountType = lib.mkDefault "EmailTypeIMAP";
    EmailAccountDescription = lib.mkDefault acct.name;
    EmailAccountName = lib.mkDefault acct.realName;
    EmailAddress = lib.mkDefault acct.address;

    IncomingMailServerHostName = lib.mkDefault acct.imap.host;
    IncomingMailServerPortNumber = lib.mkDefault acct.imap.port;
    IncomingMailServerUsername = lib.mkDefault acct.userName;
    IncomingMailServerUseSSL = lib.mkDefault acct.imap.tls.enable;
    IncomingMailServerAuthentication =
      lib.mkDefault (mapAuth acct.imap.authentication);
  } // lib.optionalAttrs (acct.smtp != null) {
    OutgoingMailServerHostName = lib.mkDefault acct.smtp.host;
    OutgoingMailServerPortNumber = lib.mkDefault acct.smtp.port;
    OutgoingMailServerUsername = lib.mkDefault acct.userName;
    OutgoingMailServerUseSSL = lib.mkDefault acct.smtp.tls.enable;
    OutgoingMailServerAuthentication =
      lib.mkDefault (mapAuth acct.smtp.authentication);
    OutgoingPasswordSameAsIncomingPassword = lib.mkDefault true;
  };

  # Warn about information that is deliberately dropped.
  unsupportedAuth = lib.concatLists (lib.mapAttrsToList
    (name: acct:
      let
        vals = lib.filter (a: a != null && !(authMap ? ${a}))
          [ acct.imap.authentication (if acct.smtp == null then null else acct.smtp.authentication) ];
      in
      map
        (a: ''
          accounts.email.accounts.${name}: authentication mechanism "${a}" has no
          equivalent in com.apple.mail.managed; falling back to
          "${defaultAuth}". Set the payload's
          Incoming/OutgoingMailServerAuthentication key explicitly to override.
        '')
        vals)
    eligible);

  startTlsWarnings = lib.concatLists (lib.mapAttrsToList
    (name: acct:
      lib.optional
        (acct.imap.tls.useStartTls
          || (acct.smtp != null && acct.smtp.tls.useStartTls))
        ''
          accounts.email.accounts.${name} uses STARTTLS, but com.apple.mail.managed
          only exposes a boolean *UseSSL key. The STARTTLS distinction is lost in
          the generated profile.
        '')
    eligible);

  skippedWarnings = lib.mapAttrsToList
    (name: _: ''
      accounts.email.accounts.${name} has no IMAP configuration, so it cannot be
      mapped to a com.apple.mail.managed payload. Skipping.
    '')
    (lib.filterAttrs (name: acct: acct.imap == null && !(lib.elem name bcfg.exclude)) accounts);

in
{
  options.programs.macprofile.bridges.email = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Map {option}`accounts.email.accounts` onto `com.apple.mail.managed`
        payload instances, one per IMAP account, named after the account.

        Passwords are never written to the profile: the generated
        `.mobileconfig` lives in the world-readable Nix store, and Home Manager
        only exposes {option}`passwordCommand`, which cannot be evaluated at
        build time. macOS prompts for the password when the profile is
        installed.
      '';
    };

    exclude = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      example = [ "personal" ];
      description = "Account names to leave out of the profile.";
    };
  };

  config = lib.mkIf (cfg.enable && bcfg.enable && hasEmail) {
    warnings = unsupportedAuth ++ startTlsWarnings ++ skippedWarnings;

    programs.macprofile.payloads.${manifest} =
      lib.mapAttrs toInstance eligible;
  };
}
