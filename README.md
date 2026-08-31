# macOS Configuration Profile Generator for Nix/Home Manager
> Home Manager modules from Apple ProfileManifests for managing macOS configuration profiles declaratively.

The current issue with nix-darwin is that settings written by the `defaults` system are happily overwritten by applications. Enforcing these settings via the mdm tools apple allready offers fixes that. 
This module generates a provisioning profile at a given path, which can then be installed (automatic install TBD) and enforces the settings defined in it at a system level. Furthermore this module provides all possible settings (they are found via community effort) as nix options, making the process declarative and typesafe. 


## Features

- 🍎 Converts Apple ProfileManifests to Nix module options
- 🔧 Generates `.mobileconfig` files from Nix configuration
- 📋 Supports all Apple payload types (Apple, ManagedPreferences, etc.)
- 🔁 Multiple instances of the same payload type in one profile
- 🪪 Automatic User/System profile splitting based on each payload's `pfm_targets`
- 📬 Maps `accounts.email` / `accounts.calendar` / `accounts.contact` straight into Mail, CalDAV and CardDAV payloads
- 🔍 Browse options interactively with optnix

## Quick Start

Include

```nix
nix-profile-gen.url = "github:Hypercookie/nix-profile-gen";
```

in your flake inputs, then import one of:

| Module | Contents |
|---|---|
| `homeModules.profiles` | Core module + all payload options |
| `homeModules.bridges` | Home Manager account bridges (needs `profiles`) |
| `homeModules.default` | Both of the above |

Find configurable options:

```shell
optnix
```

You can also use the free software [ProfileCreator](https://github.com/ProfileCreator/ProfileManifests) and then export the profile to find the names
of options. (That is sometimes easier because of weird naming).

## Usage in Home Manager

```nix
{
  imports = [
     inputs.nix-profile-gen.homeModules.default
  ];

  programs.macprofile = {
    enable = true;
    profileName = "NixOS Enforced Config";
    organizationIdentifier = "eu.faustinus";
    scope = "System"; # System-level for network settings
    consentText = "This profile enforces nixos settings";

    payloads = {
      "managed-applications-com-1password-1password".default = {
        enable = true;
        "updates.autoUpdate" = false;
      };
      "apple-com-apple-applicationaccess-macOS".default = {
        enable = true;
        allowAppleIntelligenceReport = false;
        allowGenmoji = false;
        allowImagePlayground = false;
      };
      "apple-com-apple-loginwindow".default = {
        enable = true;
        SHOWFULLNAME = false;
        LoginwindowText = "Welcome to faustinus.eu";
      };
    };
  };
}
```

## Payload instances

Payloads are keyed by **manifest name**, then by **instance name**:

```
programs.macprofile.payloads.<manifest>.<instance>.<key>
```

Use the instance name `default` when one instance is all you need — it is
special-cased to keep the `PayloadIdentifier` un-suffixed, so single-instance
profiles get stable identifiers and UUIDs.

Several payload types may appear more than once in a profile, which is what
makes per-account mail configuration possible:

```nix
payloads."apple-com-apple-mail-managed" = {
  work = {
    enable = true;
    EmailAddress = "jane@work.example";
    IncomingMailServerHostName = "imap.work.example";
  };
  personal = {
    enable = true;
    EmailAddress = "jane@personal.example";
    IncomingMailServerHostName = "imap.personal.example";
  };
};
```

Manifests that declare `pfm_unique` accept only one instance per profile;
enabling a second one fails evaluation with an explanatory assertion.

## User and System profiles

Apple payloads are not all installable at the same scope. Each manifest
declares `pfm_targets`:

| Targets | Manifests | Examples |
|---|---|---|
| system + user | 159 | Dock, Restrictions |
| system only | 95 | Login Window, FileVault, DNS Settings |
| user only | 12 | Mail, CalDAV, CardDAV, LDAP |
| unspecified | 16 | treated as "either" |

The module therefore generates **up to two profiles** and routes each payload
into the correct one automatically:

```
Library/Application Support/HomeManager/profile-user.mobileconfig
Library/Application Support/HomeManager/profile-system.mobileconfig
```

Only the profiles that actually contain payloads are written, and `outputPath`
is the base name the scope suffix is appended to.

`scope` no longer decides the whole profile. It is the **preference for
payloads that accept either scope**, so with `scope = "System"` the Dock
payload goes into the System profile while Mail still goes into the User one.
The profile matching `scope` keeps the bare `PayloadIdentifier`; the other is
suffixed, so the two never collide.

If a manifest's metadata is missing or wrong, force an instance with `_scope`:

```nix
payloads."apple-com-apple-mail-managed".work = {
  enable = true;
  _scope = "System";   # warns, because this manifest is user-only
};
```

You can see where things landed via the read-only
`programs.macprofile.outputPaths`, an attribute set keyed by scope.

## Home Manager account bridges

Importing `homeModules.bridges` **is** the opt-in. With
`programs.macprofile.enable = true`, every eligible account is turned into the
matching payload automatically:

| Home Manager option | Payload | Notes |
|---|---|---|
| `accounts.email.accounts.<n>` | `com.apple.mail.managed` | IMAP accounts only |
| `accounts.calendar.accounts.<n>` | `com.apple.caldav.account` | `remote.type = "caldav"` only |
| `accounts.contact.accounts.<n>` | `com.apple.carddav.account` | `remote.type = "carddav"` only |

All three payloads are user-only, so they always land in the User profile
regardless of the `scope` setting.

Each account becomes one payload instance named after the account, so this is
all that is needed:

```nix
programs.macprofile = {
  enable = true;
  organizationIdentifier = "com.example";
};

accounts.email.accounts.work = {
  primary = true;
  address = "jane@work.example";
  realName = "Jane Doe";
  userName = "jane";
  imap = { host = "imap.work.example"; port = 993; };
  smtp = { host = "smtp.work.example"; port = 465; };
};
```

Every bridged value is set with `lib.mkDefault`, so it can be overridden
through the ordinary typed payload path:

```nix
programs.macprofile.payloads."apple-com-apple-mail-managed".work = {
  PreventMove = true;
  SMIMEEnabled = true;
};
```

Turn a bridge off or narrow it with:

```nix
programs.macprofile.bridges.email.enable = false;
programs.macprofile.bridges.calendar.exclude = [ "personal" ];
```

### Passwords are never written to the profile

`IncomingPassword`, `OutgoingPassword`, `CalDAVPassword` and `CardDAVPassword`
are deliberately never emitted. The generated `.mobileconfig` is built in a Nix
derivation and therefore lives in the **world-readable Nix store**, and Home
Manager only exposes `passwordCommand`, which cannot be evaluated at build
time. macOS prompts for the password when the profile is installed.

### Other deliberate omissions

- `aliases`, `folders`, `signature`, `gpg`, `maildir` — no equivalent payload keys.
- `imap.tls.useStartTls` — the payload only has a boolean `*UseSSL` key, so the STARTTLS distinction is lost. A warning is emitted.
- `authentication` values `gssapi` and `xoauth2` — no equivalent; the key is left unset and a warning is emitted.
- Calendar/contact remotes of type `http`, `google_calendar` and `google_contacts` — skipped with a warning.

## Development

Regenerate the payload modules after updating the submodule:

```bash
git submodule update --remote ProfileManifests
python3 nix_o_s_module_generator.py
```

Run the test suite:

```bash
nix flake check
```

This project uses ProfileManifests from [ProfileCreator](https://github.com/ProfileCreator/ProfileManifests), which is licensed under the Apache License 2.0.
