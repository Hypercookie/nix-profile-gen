# Maps Home Manager `accounts.calendar.accounts.<name>` onto
# `com.apple.caldav.account` payload instances.
{ config, lib, ... }:

let
  cfg = config.programs.macprofile;
  bcfg = cfg.bridges.calendar;

  parseUrl = import ../lib/parseUrl.nix lib;

  hasCalendar = config ? accounts && config.accounts ? calendar;
  accounts = if hasCalendar then config.accounts.calendar.accounts else { };

  manifest = "apple-com-apple-caldav-account";

  # Only remote CalDAV storages map onto the payload; "http" and
  # "google_calendar" have no equivalent.
  candidates = lib.filterAttrs
    (name: acct:
      acct.remote != null
      && acct.remote.type == "caldav"
      && !(lib.elem name bcfg.exclude))
    accounts;

  eligible = lib.filterAttrs
    (_: acct: parseUrl acct.remote.url != null)
    candidates;

  toInstance = name: acct:
    let url = parseUrl acct.remote.url; in
    {
      enable = true;

      _displayName = lib.mkDefault acct.name;

      CalDAVAccountDescription = lib.mkDefault acct.name;
      CalDAVHostName = lib.mkDefault url.host;
      CalDAVPort = lib.mkDefault url.port;
      CalDAVPrincipalURL = lib.mkDefault url.path;
      CalDAVUseSSL = lib.mkDefault url.useSSL;
      CalDAVUsername = lib.mkDefault acct.remote.userName;
    };

  unparseableWarnings = lib.mapAttrsToList
    (name: acct: ''
      accounts.calendar.accounts.${name}.remote.url is missing or not an http(s)
      URL, so it cannot be mapped to a com.apple.caldav.account payload.
      Skipping.
    '')
    (lib.filterAttrs (n: _: !(eligible ? ${n})) candidates);

  wrongTypeWarnings = lib.mapAttrsToList
    (name: acct: ''
      accounts.calendar.accounts.${name} uses remote type "${acct.remote.type}",
      which has no com.apple.caldav.account equivalent. Skipping.
    '')
    (lib.filterAttrs
      (name: acct:
        acct.remote != null
        && acct.remote.type != "caldav"
        && !(lib.elem name bcfg.exclude))
      accounts);

in
{
  options.programs.macprofile.bridges.calendar = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Map {option}`accounts.calendar.accounts` with a `caldav` remote onto
        `com.apple.caldav.account` payload instances.

        Passwords are never written to the profile; macOS prompts on install.
      '';
    };

    exclude = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Account names to leave out of the profile.";
    };
  };

  config = lib.mkIf (cfg.enable && bcfg.enable && hasCalendar) {
    warnings = unparseableWarnings ++ wrongTypeWarnings;

    programs.macprofile.payloads.${manifest} =
      lib.mapAttrs toInstance eligible;
  };
}
