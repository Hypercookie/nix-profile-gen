# Apple Configuration Profile Generator for Nix/Home Manager

> Home Manager modules from Apple ProfileManifests for managing macOS, iOS and tvOS configuration profiles declaratively.

The current issue with nix-darwin is that settings written by the `defaults` system are happily overwritten by applications. Enforcing these settings via the mdm tools apple allready offers fixes that.
This module generates configuration profiles, installs the macOS ones on your Mac, can upload any of them to a device management server such as Fleet (which installs them silently on enrolled devices), and writes the rest wherever you want them. Installed profiles enforce the settings defined in it at a system level. Furthermore this module provides all possible settings (they are found via community effort) as nix options, making the process declarative and typesafe.

## Features

- 🍎 Converts Apple ProfileManifests to Nix module options
- 🔧 Generates `.mobileconfig` files from Nix configuration
- 📋 Supports all Apple payload types (Apple, ManagedPreferences, etc.)
- 🔁 Multiple instances of the same payload type in one profile
- 📱 Any number of profiles, for macOS, iOS and tvOS, validated per platform down to individual keys
- 🪪 Automatic User/System profile splitting based on each payload's `pfm_targets`
- 📬 Maps `accounts.email` / `accounts.calendar` / `accounts.contact` straight into Mail, CalDAV and CardDAV payloads
- 🔍 Browse options interactively with optnix

## Quick Start

Include

```nix
nix-profile-gen.url = "github:Hypercookie/nix-profile-gen";
```

in your flake inputs, then import one of:

| Module                 | Contents                                                              |
| ---------------------- | --------------------------------------------------------------------- |
| `homeModules.profiles` | `programs.appleProfile`: profiles, payloads, account bridges, uploads |
| `homeModules.default`  | The same                                                              |

The local MDM server (`homeModules.mdm`, `programs.appleProfile.mdm`) was
removed. Setting `programs.appleProfile.mdm` fails evaluation with a pointer to
[uploads](#uploading-to-a-device-management-server).

The option used to be `programs.macprofile`, a single profile. Setting it now
fails evaluation with a pointer to the new layout below.

Find configurable options:

```shell
optnix
```

You can also use the free software [ProfileCreator](https://github.com/ProfileCreator/ProfileManifests) and then export the profile to find the names
of options. (That is sometimes easier because of weird naming).

## Usage in Home Manager

Every profile is an entry of `programs.appleProfile.profiles`, keyed by name:

```nix
{
  imports = [
     inputs.nix-profile-gen.homeModules.default
  ];

  programs.appleProfile = {
    organization = "faustinus";
    organizationIdentifier = "eu.faustinus";   # each profile: eu.faustinus.<name>

    profiles.mac = {
      # platform = "macOS" and autoInstall = true are the defaults.
      profileName = "NixOS Enforced Config";
      scope = "System"; # System-level for network settings
      consentText = "This profile enforces nixos settings";
      bridges.email.enable = true;

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

    profiles.iphone = {
      platform = "iOS";
      outputPath = "Profiles/iphone.mobileconfig";
      bridges.email = { enable = true; exclude = [ "work" ]; };
      payloads."apple-com-apple-dnsSettings-managed".default = {
        enable = true;
        DNSSettings = { DNSProtocol = "HTTPS"; ServerURL = "https://dns.example/dns-query"; };
      };
    };
  };
}
```

What happens to each profile is decided by `autoInstall` and `upload`:

| Setting                                 | Result                                                                                                                                                         |
| --------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `autoInstall = true` (default on macOS) | Written to `Library/Application Support/HomeManager/<name>-<scope>.mobileconfig` (override with `outputPath`) and opened in System Settings when it changes.   |
| `upload = true`                         | Sent to the configured device management server when it changes; see [uploads](#uploading-to-a-device-management-server). Turns the `autoInstall` default off. |
| neither (default elsewhere)             | Built only. Copied to `outputPath` as a regular file if you set one, otherwise use `package`.                                                                  |

`autoInstall = true` is only allowed for macOS profiles. A macOS profile you
do not want installed is simply `autoInstall = false` plus an `outputPath`.

Those copies are real files, not symlinks into the Nix store, because AirDrop
refuses to send a store symlink ("AirDrop failed"). They are only replaced
while they still match what was last written, and deleted when their profile
goes away under the same rule; a file you edited is left alone. The record
lives in `~/.local/state/nix-profile-gen/copies`.
Anything else can be placed by hand:

```nix
home.file."Desktop/iphone.mobileconfig".source =
  config.programs.appleProfile.profiles.iphone.package;
```

Each profile defaults to `profileName = <name>`, `organization` from the top
level, and `organizationIdentifier = <top level>.<name>`, so identifiers and
UUIDs never collide. Two auto-installed profiles with the same identifier, or
two profiles writing the same file, fail evaluation.

Share payloads between profiles with ordinary module imports. A fragment
such as `{ payloads."apple-com-apple-wifi-managed".home = { ... }; }` can go
into the `imports` of any number of profiles.

## Payload instances

Payloads are keyed by **manifest name**, then by **instance name**:

```
programs.appleProfile.profiles.<name>.payloads.<manifest>.<instance>.<key>
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

| Targets       | Manifests | Examples                              |
| ------------- | --------- | ------------------------------------- |
| system + user | 161       | Dock, Restrictions                    |
| system only   | 98        | Login Window, FileVault, DNS Settings |
| user only     | 12        | Mail, CalDAV, CardDAV, LDAP           |
| unspecified   | 16        | treated as "either"                   |

(Counts drift with upstream. User and System profiles only exist on macOS;
other platforms always get a single profile.)

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
`programs.appleProfile.profiles.<name>.outputPaths`, keyed by scope.

## Home Manager account bridges

Bridges exist on every profile and are off by default. Turn them on per
profile with `bridges.<email|calendar|contact>.enable = true`; every eligible
account is then turned into the matching payload of that profile:

| Home Manager option              | Payload                     | Notes                          |
| -------------------------------- | --------------------------- | ------------------------------ |
| `accounts.email.accounts.<n>`    | `com.apple.mail.managed`    | IMAP accounts only             |
| `accounts.calendar.accounts.<n>` | `com.apple.caldav.account`  | `remote.type = "caldav"` only  |
| `accounts.contact.accounts.<n>`  | `com.apple.carddav.account` | `remote.type = "carddav"` only |

All three payloads are user-only, so they always land in the User profile
regardless of the `scope` setting.

Each account becomes one payload instance named after the account, so this is
all that is needed:

```nix
programs.appleProfile.profiles.mac.bridges.email.enable = true;

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
programs.appleProfile.profiles.mac.payloads."apple-com-apple-mail-managed".work = {
  EmailAccountDescription = "Work";
  OutgoingPasswordSameAsIncomingPassword = false;
};
```

Narrow a bridge per profile, e.g. to keep the work account off the phone:

```nix
programs.appleProfile.profiles.iphone.bridges.email = {
  enable = true;
  exclude = [ "work" ];
};
```

### Passwords are never written to the profile

`IncomingPassword`, `OutgoingPassword`, `CalDAVPassword` and `CardDAVPassword`
are deliberately never emitted. The generated `.mobileconfig` is built in a Nix
derivation and therefore lives in the **world-readable Nix store**, and Home
Manager only exposes `passwordCommand`, which cannot be evaluated at build
time. The device prompts for the password when the profile is installed.

### Other deliberate omissions

- `aliases`, `folders`, `signature`, `gpg`, `maildir` — no equivalent payload keys.
- `imap.tls.useStartTls` — the payload only has a boolean `*UseSSL` key, so the STARTTLS distinction is lost. A warning is emitted.
- `authentication` values `gssapi` and `xoauth2` — no equivalent; the key falls back to `EmailAuthPassword` and a warning is emitted.
- `CardDAVPrincipalURL` is only emitted for iOS profiles; upstream marks it iOS-only and macOS discovers the address book itself.
- Calendar/contact remotes of type `http`, `google_calendar` and `google_contacts` — skipped with a warning.

## Platforms

Each profile has a `platform`: `macOS` (default), `iOS` or `tvOS`. Only
macOS splits into User and System profiles; other platforms always produce
one profile at `outputPath`, used as given.

### Platform validation

Every enabled payload is checked against its manifest's `pfm_platforms`, and
every key that is set is checked against its own `pfm_platforms`. Anything
unavailable on the profile's platform fails evaluation:

```
- programs.appleProfile.profiles."iphone".payloads."apple-com-apple-dock"."default"
  is not available on platform "iOS". Its manifest supports:
  macOS
```

If the upstream metadata is wrong, set `_allowUnsupportedPlatform = true` on
that instance. It is then emitted anyway, with a warning.

### Without Home Manager

`lib.mkProfile` builds one profile with plain `lib.evalModules`:

```nix
nix-profile-gen.lib.mkProfile {
  pkgs = nixpkgs.legacyPackages.aarch64-darwin;
  platform = "iOS";
  name = "iphone";          # derivation name only
  # Optional: an evaluated Home Manager config for the bridges to read.
  homeConfig = config.home-manager.users.jane;
  modules = [{
    bridges.email.enable = true;
    payloads."apple-com-apple-dnsSettings-managed".default = { ... };
  }];
}
```

## Uploading to a device management server

A profile installed by hand still needs a click in System Settings, and an
iPhone needs the file AirDropped. If your devices are enrolled in a device
management server that installs every uploaded profile, `upload = true` sends
the profile there on every `home-manager switch` that changed it:

```nix
programs.appleProfile = {
  upload.fleet = {
    url = "https://fleet.example.com";
    # Read at activation time; never put the token in the configuration.
    tokenFile = "/usr/local/var/opnix/user/fleet-token";
  };

  profiles.mac.upload = true;     # no System Settings dialog any more
  profiles.iphone = {
    platform = "iOS";
    upload = true;
    bridges.email.enable = true;
  };
};
```

- **Fleet** (`upload.fleet`): uses the Fleet REST API with an API token. An
  API-only user with the maintainer role is enough. Fleet has no in-place
  update, so a changed profile is deleted and uploaded again under the same
  PayloadIdentifier (devices remove and reinstall it). Fleet Free installs every
  profile on every enrolled Apple device; targeting by label or team needs Fleet
  Premium. `nix run .#nix-profile-gen-fleet -- <url> <token file> upload <file>`
  does the same by hand.
- **Anything else** (`upload.command`): an executable called as
  `<command> upload <file.mobileconfig>` and `<command> remove <PayloadIdentifier>`.

On macOS a profile can be two files (`-user`, `-system`); each is uploaded as
its own profile. Uploads are recorded as `<sha256> <PayloadIdentifier>` in
`~/.local/state/nix-profile-gen/uploads`: unchanged profiles are not sent again,
and a profile you stop uploading is removed from the server. A failed upload is
reported but never fails the activation; it is retried on the next switch.
`upload` and `autoInstall` on the same profile fail evaluation, because the
profile would be installed twice.

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
