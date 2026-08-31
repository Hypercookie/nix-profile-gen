# Maps Home Manager `accounts.contact.accounts.<name>` onto
# `com.apple.carddav.account` payload instances.
{ config, lib, ... }:

let
  cfg = config.programs.macprofile;
  bcfg = cfg.bridges.contact;

  parseUrl = import ../lib/parseUrl.nix lib;

  # Home Manager declares this as `accounts.contact` (singular), even though
  # its module file is named contacts.nix.
  hasContacts = config ? accounts && config.accounts ? contact;
  accounts = if hasContacts then config.accounts.contact.accounts else { };

  manifest = "apple-com-apple-carddav-account";

  # Only remote CardDAV storages map onto the payload; "http" and
  # "google_contacts" have no equivalent.
  candidates = lib.filterAttrs
    (name: acct:
      acct.remote != null
      && acct.remote.type == "carddav"
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

      CardDAVAccountDescription = lib.mkDefault acct.name;
      CardDAVHostName = lib.mkDefault url.host;
      CardDAVPort = lib.mkDefault url.port;
      CardDAVPrincipalURL = lib.mkDefault url.path;
      CardDAVUseSSL = lib.mkDefault url.useSSL;
      CardDAVUsername = lib.mkDefault acct.remote.userName;
    };

  unparseableWarnings = lib.mapAttrsToList
    (name: acct: ''
      accounts.contact.accounts.${name}.remote.url is missing or not an http(s)
      URL, so it cannot be mapped to a com.apple.carddav.account payload.
      Skipping.
    '')
    (lib.filterAttrs (n: _: !(eligible ? ${n})) candidates);

  wrongTypeWarnings = lib.mapAttrsToList
    (name: acct: ''
      accounts.contact.accounts.${name} uses remote type "${acct.remote.type}",
      which has no com.apple.carddav.account equivalent. Skipping.
    '')
    (lib.filterAttrs
      (name: acct:
        acct.remote != null
        && acct.remote.type != "carddav"
        && !(lib.elem name bcfg.exclude))
      accounts);

in
{
  options.programs.macprofile.bridges.contact = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Map {option}`accounts.contact.accounts` with a `carddav` remote onto
        `com.apple.carddav.account` payload instances.

        Passwords are never written to the profile; macOS prompts on install.
      '';
    };

    exclude = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Account names to leave out of the profile.";
    };
  };

  config = lib.mkIf (cfg.enable && bcfg.enable && hasContacts) {
    warnings = unparseableWarnings ++ wrongTypeWarnings;

    programs.macprofile.payloads.${manifest} =
      lib.mapAttrs toInstance eligible;
  };
}
