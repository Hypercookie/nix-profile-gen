# Test suite, run with `nix flake check`.
{ pkgs, lib, system, home-manager, modules, mkProfile }:

let
  mkHm = extraModules: home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    modules = [
      modules.default
      {
        home.username = "testuser";
        home.homeDirectory = "/tmp/testuser";
        home.stateVersion = "24.11";
      }
    ] ++ extraModules;
  };

  # Return the generated profile for `scope`, or throw if that scope produced
  # no profile at all.
  mkProfileScope = scope: extraModules:
    let
      hm = mkHm extraModules;
      paths = hm.config.programs.appleProfile.profiles.default.outputPaths;
    in
    if !(paths ? ${scope}) then
      throw "no ${scope} profile was generated (scopes: ${
        lib.concatStringsSep ", " (lib.attrNames paths)
      })"
    else
      hm.config.home.file.${paths.${scope}}.source;

  # Shared by the scope-split checks: one user-only payload, one system-only
  # payload, and one dual-target payload that follows the `scope` preference.
  scopeSplitConfig = {
    programs.appleProfile = {
      profiles.default.enable = true;
      profiles.default.organizationIdentifier = "com.example.test";
      profiles.default.scope = "System";
      profiles.default.payloads."apple-com-apple-mail-managed".work = {
        enable = true;
        EmailAddress = "jane@work.example";
      };
      profiles.default.payloads."apple-com-apple-loginwindow".default = {
        enable = true;
        SHOWFULLNAME = false;
      };
      profiles.default.payloads."apple-com-apple-dock".default = {
        enable = true;
        tilesize = 48;
      };
    };
  };

  dnsPayload = {
    payloads."apple-com-apple-dnsSettings-managed".default = {
      enable = true;
      DNSSettings = {
        DNSProtocol = "HTTPS";
        ServerURL = "https://dns.example/dns-query";
      };
    };
  };

  testAccounts = {
    accounts.email.accounts = {
      work = {
        primary = true;
        address = "jane@work.example";
        realName = "Jane Doe";
        userName = "jane";
        imap.host = "imap.work.example";
        smtp.host = "smtp.work.example";
      };
      personal = {
        address = "jane@personal.example";
        realName = "Jane";
        userName = "jane2";
        imap.host = "imap.personal.example";
        smtp.host = "smtp.personal.example";
      };
    };
    accounts.contact.accounts.personal.remote = {
      type = "carddav";
      url = "https://dav.example.org/addressbooks/jane/";
      userName = "jane";
    };
  };

  # Assert something about the generated profile with a Python snippet.
  # `body` receives `profile` (the parsed plist) and `payloads`
  # (profile["PayloadContent"]), and should raise on failure.
  plistTest = name: extraModules: body:
    plistTestScope "User" name extraModules body;

  plistTestScope = scope: name: extraModules: body:
    plistCheck name (mkProfileScope scope extraModules) body;

  # Same, for any profile derivation (extra profiles, lib.mkProfile).
  plistCheck = name: profile: body:
    pkgs.runCommand "check-${name}"
      {
        nativeBuildInputs = [ pkgs.python3 ];
        inherit profile;
      } ''
      python3 - "$profile" <<'PYEOF'
      import plistlib, sys

      with open(sys.argv[1], "rb") as f:
          profile = plistlib.load(f)
      payloads = profile["PayloadContent"]

      ${body}

      print("ok")
      PYEOF
      touch "$out"
    '';

  # Assert that a configuration is rejected at evaluation time.
  #
  # `reason` is documentation only: Nix cannot capture the text of a `throw`,
  # so the assertion *message* is not verified, only that evaluation fails.
  #
  # Note: do not use `builtins.deepSeq` on the derivation here. Derivations are
  # self-referential (drvPath/outPath), so deepSeq recurses until the evaluator
  # segfaults, which makes tryEval report failure unconditionally and renders
  # the test vacuous. Forcing the finite `outPath` string is enough: selecting
  # anything from `config` runs Home Manager's moduleChecks, which evaluates
  # `config.assertions`.
  # Deliberately does not go through mkProfileScope: that throws when the
  # requested scope produced no profile, which would make this test pass for
  # the wrong reason. Forcing home.file's attribute names runs Home Manager's
  # moduleChecks (and therefore config.assertions) without depending on which
  # scopes exist.
  evalFailureTest = name: reason: extraModules:
    let
      hm = mkHm extraModules;
      result = builtins.tryEval
        (builtins.seq (builtins.attrNames hm.config.home.file) "evaluated");
    in
    pkgs.runCommand "check-${name}" { } ''
      ${if result.success then ''
        echo "expected evaluation to fail (${reason}), but it succeeded" >&2
        exit 1
      '' else ''
        echo "configuration correctly rejected: ${reason}"
      ''}
      touch "$out"
    '';

in
{
  # Every generated payload module still declares valid options.
  eval-all-payloads =
    let
      eval = lib.evalModules {
        modules = [ ./../nix-modules/payloads/all-payloads.nix ];
      };
      count = builtins.length (builtins.attrNames eval.options.payloads);
    in
    pkgs.runCommand "check-eval-all-payloads" { } ''
      test ${toString count} -gt 250
      echo "evaluated ${toString count} payload manifests"
      touch "$out"
    '';

  # Two instances of the same (non-unique) payload type coexist with distinct
  # identifiers and UUIDs, alongside an unrelated unique payload.
  profile-multi-instance = plistTest "profile-multi-instance"
    [{
      programs.appleProfile = {
        profiles.default.enable = true;
        profiles.default.organizationIdentifier = "com.example.test";
        profiles.default.bridges.email.enable = false;
        profiles.default.bridges.calendar.enable = false;
        profiles.default.bridges.contact.enable = false;
        profiles.default.payloads."apple-com-apple-mail-managed" = {
          work = {
            enable = true;
            EmailAddress = "a@example.org";
            IncomingMailServerHostName = "imap.example.org";
          };
          personal = {
            enable = true;
            EmailAddress = "b@example.net";
            IncomingMailServerHostName = "imap.example.net";
          };
        };
        profiles.default.payloads."apple-com-apple-dock".default = {
          enable = true;
          tilesize = 48;
        };
      };
    }]
    ''
      assert len(payloads) == 3, payloads

      mail = [p for p in payloads if p["PayloadType"] == "com.apple.mail.managed"]
      assert len(mail) == 2, mail

      assert len({p["PayloadUUID"] for p in mail}) == 2, "UUIDs collide"

      # Every UUID must be a valid RFC 4122 name-based UUID. AirDrop and the
      # installer on iOS are stricter than macOS about this.
      import uuid
      for p in [profile] + payloads:
          u = uuid.UUID(p["PayloadUUID"])
          assert u.version == 5 and u.variant == uuid.RFC_4122, p["PayloadUUID"]
      assert len({p["PayloadIdentifier"] for p in mail}) == 2, "identifiers collide"

      addrs = {p["EmailAddress"] for p in mail}
      assert addrs == {"a@example.org", "b@example.net"}, addrs

      dock = [p for p in payloads if p["PayloadType"] == "com.apple.dock"]
      assert len(dock) == 1 and dock[0]["tilesize"] == 48, dock
    '';

  # A single instance named "default" keeps the un-suffixed identifier, so
  # identifiers stay stable for single-instance configurations.
  profile-default-identifier = plistTest "profile-default-identifier"
    [{
      programs.appleProfile = {
        profiles.default.enable = true;
        profiles.default.organizationIdentifier = "com.example.test";
        profiles.default.payloads."apple-com-apple-dock".default = {
          enable = true;
          tilesize = 48;
        };
      };
    }]
    ''
      assert len(payloads) == 1, payloads
      assert payloads[0]["PayloadIdentifier"] == "com.example.test.com.apple.dock", payloads[0]
    '';

  # Regression test for the filterNulls bug: an instance with only `enable`
  # set used to abort evaluation with `{ ... } // null`.
  profile-empty-instance = plistTest "profile-empty-instance"
    [{
      programs.appleProfile = {
        profiles.default.enable = true;
        profiles.default.organizationIdentifier = "com.example.test";
        profiles.default.payloads."apple-com-apple-dock".default.enable = true;
      };
    }]
    ''
      assert len(payloads) == 1, payloads
      assert payloads[0]["PayloadType"] == "com.apple.dock", payloads[0]
    '';

  # accounts.email is mapped, one payload per IMAP account.
  bridge-email = plistTest "bridge-email"
    [{
      programs.appleProfile = {
        profiles.default.organizationIdentifier = "com.example.test";
        profiles.default.bridges.email.enable = true;
      };
      accounts.email.accounts = {
        work = {
          primary = true;
          address = "jane@work.example";
          realName = "Jane Doe";
          userName = "jane";
          imap = {
            host = "imap.work.example";
            port = 993;
            authentication = "plain";
          };
          smtp = {
            host = "smtp.work.example";
            port = 465;
          };
          passwordCommand = [ "echo" "hunter2" ];
        };
        personal = {
          address = "jane@personal.example";
          realName = "Jane";
          userName = "jane2";
          imap.host = "imap.personal.example";
          smtp.host = "smtp.personal.example";
        };
      };
    }]
    ''
      mail = [p for p in payloads if p["PayloadType"] == "com.apple.mail.managed"]
      assert len(mail) == 2, mail

      by_addr = {p["EmailAddress"]: p for p in mail}
      assert set(by_addr) == {"jane@work.example", "jane@personal.example"}, by_addr

      work = by_addr["jane@work.example"]
      assert work["IncomingMailServerHostName"] == "imap.work.example", work
      assert work["IncomingMailServerPortNumber"] == 993, work
      assert work["OutgoingMailServerHostName"] == "smtp.work.example", work
      assert work["IncomingMailServerUsername"] == "jane", work
      assert work["IncomingMailServerAuthentication"] == "EmailAuthPassword", work
      assert work["EmailAccountType"] == "EmailTypeIMAP", work
      assert work["EmailAccountName"] == "Jane Doe", work

      # Incoming/OutgoingMailServerAuthentication are pfm_require = "always".
      # Home Manager leaves `authentication` null by default, so the bridge has
      # to fall back to the manifest default; without the key macOS installs
      # the payload and then fails to verify the account.
      for p in mail:
          assert p["IncomingMailServerAuthentication"] == "EmailAuthPassword", p
          assert p["OutgoingMailServerAuthentication"] == "EmailAuthPassword", p

      # Secrets must never reach the profile: it lives in the Nix store.
      flat = repr(profile)
      assert "hunter2" not in flat, "password leaked into the profile"
      for p in mail:
          assert "IncomingPassword" not in p, p
          assert "OutgoingPassword" not in p, p
    '';

  # Payload overrides go through the normal typed payload path and win over
  # the bridge's mkDefault values.
  bridge-email-override = plistTest "bridge-email-override"
    [{
      programs.appleProfile = {
        profiles.default.organizationIdentifier = "com.example.test";
        profiles.default.bridges.email.enable = true;
        profiles.default.payloads."apple-com-apple-mail-managed".work = {
          OutgoingPasswordSameAsIncomingPassword = false;
          EmailAccountDescription = "Overridden";
        };
      };
      accounts.email.accounts.work = {
        primary = true;
        address = "jane@work.example";
        realName = "Jane Doe";
        userName = "jane";
        imap.host = "imap.work.example";
        smtp.host = "smtp.work.example";
      };
    }]
    ''
      mail = [p for p in payloads if p["PayloadType"] == "com.apple.mail.managed"]
      assert len(mail) == 1, mail
      assert mail[0]["OutgoingPasswordSameAsIncomingPassword"] is False, mail[0]
      assert mail[0]["EmailAccountDescription"] == "Overridden", mail[0]
      # Non-overridden bridge values survive.
      assert mail[0]["IncomingMailServerHostName"] == "imap.work.example", mail[0]
    '';

  # accounts.calendar / accounts.contact are split into host/port/path.
  bridge-calendar-contacts = plistTest "bridge-calendar-contacts"
    [{
      programs.appleProfile = {
        profiles.default.organizationIdentifier = "com.example.test";
        profiles.default.bridges.calendar.enable = true;
        profiles.default.bridges.contact.enable = true;
      };
      accounts.calendar.accounts.personal = {
        primary = true;
        primaryCollection = "default";
        remote = {
          type = "caldav";
          url = "https://dav.example.org:8443/calendars/jane/";
          userName = "jane";
        };
      };
      accounts.contact.accounts.personal = {
        remote = {
          type = "carddav";
          url = "https://dav.example.org/addressbooks/jane/";
          userName = "jane";
        };
      };
    }]
    ''
      cal = [p for p in payloads if p["PayloadType"] == "com.apple.caldav.account"]
      assert len(cal) == 1, cal
      assert cal[0]["CalDAVHostName"] == "dav.example.org", cal[0]
      assert cal[0]["CalDAVPort"] == 8443, cal[0]
      assert cal[0]["CalDAVPrincipalURL"] == "/calendars/jane/", cal[0]
      assert cal[0]["CalDAVUseSSL"] is True, cal[0]
      assert cal[0]["CalDAVUsername"] == "jane", cal[0]

      card = [p for p in payloads if p["PayloadType"] == "com.apple.carddav.account"]
      assert len(card) == 1, card
      assert card[0]["CardDAVHostName"] == "dav.example.org", card[0]
      # No port in the URL: the key is omitted so macOS uses its default.
      assert "CardDAVPort" not in card[0], card[0]
      # CardDAVPrincipalURL is iOS-only upstream; macOS discovers the address
      # book itself. See bridge-iphone for the iOS side.
      assert "CardDAVPrincipalURL" not in card[0], card[0]
    '';

  # User-only and system-only payloads must land in separate profiles.
  # com.apple.mail.managed is pfm_targets = [ user ],
  # com.apple.loginwindow is pfm_targets = [ system ].
  scope-split-user = plistTestScope "User" "scope-split-user"
    [ scopeSplitConfig ]
    ''
      assert profile["PayloadScope"] == "User", profile["PayloadScope"]
      types = sorted(p["PayloadType"] for p in payloads)
      assert types == ["com.apple.mail.managed"], types
    '';

  scope-split-system = plistTestScope "System" "scope-split-system"
    [ scopeSplitConfig ]
    ''
      assert profile["PayloadScope"] == "System", profile["PayloadScope"]
      types = sorted(p["PayloadType"] for p in payloads)
      assert types == ["com.apple.dock", "com.apple.loginwindow"], types
    '';

  # The two profiles must not share a top-level identifier or UUID, and the
  # profile matching the `scope` preference keeps the bare identifier.
  scope-split-identifiers =
    let
      hm = mkHm [ scopeSplitConfig ];
      paths = hm.config.programs.appleProfile.profiles.default.outputPaths;
    in
    pkgs.runCommand "check-scope-split-identifiers"
      {
        nativeBuildInputs = [ pkgs.python3 ];
        # NB: do not name these `system`; that collides with the `system`
        # variable Nix already sets in every build environment.
        userProfile = hm.config.home.file.${paths.User}.source;
        systemProfile = hm.config.home.file.${paths.System}.source;
      } ''
      python3 - "$userProfile" "$systemProfile" <<'PYEOF'
      import plistlib, sys

      def load(p):
          with open(p, "rb") as f:
              return plistlib.load(f)

      user, system = load(sys.argv[1]), load(sys.argv[2])

      assert user["PayloadIdentifier"] != system["PayloadIdentifier"], "identifiers collide"
      assert user["PayloadUUID"] != system["PayloadUUID"], "UUIDs collide"

      # scope = "System" is the preference here, so it keeps the bare identifier.
      assert system["PayloadIdentifier"] == "com.example.test", system["PayloadIdentifier"]
      assert user["PayloadIdentifier"] == "com.example.test.user", user["PayloadIdentifier"]
      PYEOF
      touch "$out"
    '';

  # Only the scopes that actually have payloads produce a file.
  scope-single-file =
    let
      hm = mkHm [{
        programs.appleProfile = {
          profiles.default.enable = true;
          profiles.default.organizationIdentifier = "com.example.test";
          profiles.default.payloads."apple-com-apple-loginwindow".default = {
            enable = true;
            SHOWFULLNAME = false;
          };
        };
      }];
      scopes = lib.attrNames hm.config.programs.appleProfile.profiles.default.outputPaths;
    in
    pkgs.runCommand "check-scope-single-file" { } ''
      test "${lib.concatStringsSep "," scopes}" = "System"
      echo "only the System profile was generated"
      touch "$out"
    '';

  # _scope forces a payload into a scope its manifest does not advertise.
  scope-override = plistTestScope "System" "scope-override"
    [{
      programs.appleProfile = {
        profiles.default.enable = true;
        profiles.default.organizationIdentifier = "com.example.test";
        profiles.default.payloads."apple-com-apple-mail-managed".work = {
          enable = true;
          _scope = "System";
          EmailAddress = "jane@work.example";
        };
      };
    }]
    ''
      assert profile["PayloadScope"] == "System", profile["PayloadScope"]
      types = [p["PayloadType"] for p in payloads]
      assert types == ["com.apple.mail.managed"], types
    '';

  # autoInstall opens the profile on change. Without it the profile is only
  # built: no file unless outputPath is set, and no hook.
  auto-install =
    let
      mk = extra:
        mkHm [{
          programs.appleProfile.profiles.default = {
            organizationIdentifier = "com.example.test";
            payloads."apple-com-apple-loginwindow".default = {
              enable = true;
              SHOWFULLNAME = false;
            };
          } // extra;
        }];
      on = mk { };
      off = mk { autoInstall = false; };
      offWithPath = mk { autoInstall = false; outputPath = "Profiles/mac.mobileconfig"; };
      onHook = on.config.home.file.${on.config.programs.appleProfile.profiles.default.outputPaths.System}.onChange;
      copyScript = offWithPath.config.home.activation.copyAppleProfiles.data;
    in
    assert on.config.programs.appleProfile.profiles.default.outputPaths
      == { System = "Library/Application Support/HomeManager/default-system.mobileconfig"; };
    assert off.config.programs.appleProfile.profiles.default.outputPaths == { };
    assert !(lib.any (lib.hasSuffix ".mobileconfig") (lib.attrNames off.config.home.file));
    # Not auto-installed: copied as a regular file, never linked or opened.
    assert !(offWithPath.config.home.file ? "Profiles/mac-system.mobileconfig");
    assert lib.hasInfix ''"$HOME"/Profiles/mac-system.mobileconfig'' copyScript;
    pkgs.runCommand "check-auto-install" { } ''
      ${lib.optionalString (!(lib.hasInfix "/usr/bin/open" onHook)) ''
        echo "autoInstall did not install an open hook" >&2; exit 1
      ''}
      echo "autoInstall decides whether a profile is written and opened"
      touch "$out"
    '';

  # Enabling two instances of a pfm_unique payload must fail evaluation.
  unique-assertion = evalFailureTest "unique-assertion" "two instances of a pfm_unique payload"
    [{
      programs.appleProfile = {
        profiles.default.enable = true;
        profiles.default.organizationIdentifier = "com.example.test";
        profiles.default.payloads."apple-com-apple-dock" = {
          one = { enable = true; tilesize = 32; };
          two = { enable = true; tilesize = 64; };
        };
      };
    }];

  # Legacy flat syntax with an attrset value is caught by the migration
  # assertion rather than producing a bogus payload.
  legacy-syntax-assertion = evalFailureTest "legacy-syntax-assertion" "legacy flat payload syntax"
    [{
      programs.appleProfile = {
        profiles.default.enable = true;
        profiles.default.organizationIdentifier = "com.example.test";
        profiles.default.payloads."apple-com-apple-dnsSettings-managed".DNSSettings = {
          enable = true;
        };
      };
    }];

  # `outputPath` is user-supplied and is interpolated into shell snippets. It
  # must be escaped, not dropped into a double-quoted string, or a path
  # containing a command substitution would execute at activation time.
  profile-path-shell-injection =
    let
      hm = mkHm [{
        programs.appleProfile = {
          profiles.default.enable = true;
          profiles.default.organizationIdentifier = "com.example.test";
          profiles.default.outputPath = ''Library/x$(touch /tmp/pwned)`id`.mobileconfig'';
          profiles.default.payloads."apple-com-apple-loginwindow".default = {
            enable = true;
            SHOWFULLNAME = false;
          };
          # Copied rather than linked, which is a third place the path is
          # interpolated.
          profiles.phone = dnsPayload // {
            platform = "iOS";
            outputPath = ''Library/x$(touch /tmp/pwned)`id`.mobileconfig'';
          };
        };
      }];
      copy = hm.config.home.activation.copyAppleProfiles.data;
      path = hm.config.programs.appleProfile.profiles.default.outputPaths.System;
      hook = hm.config.home.file.${path}.onChange;
      activation = hm.config.home.activation.installMacProfile.data;
      # `escapeShellArg` single-quotes the whole relative path, so the
      # metacharacters can only ever appear inside single quotes.
      quoted = "'${path}'";
      unsafe = s:
        lib.hasInfix ''"$HOME/'' s || !(lib.hasInfix quoted s);
    in
    pkgs.runCommand "check-profile-path-shell-injection" { } ''
      ${lib.optionalString (unsafe hook) ''
        echo "onChange hook interpolates outputPath unquoted" >&2; exit 1
      ''}
      ${lib.optionalString (unsafe activation) ''
        echo "installMacProfile interpolates outputPath unquoted" >&2; exit 1
      ''}
      ${lib.optionalString (lib.hasInfix ''"$HOME/'' copy
        || !(lib.hasInfix "'Library/x$(touch /tmp/pwned)`id`.mobileconfig'" copy)) ''
        echo "copyAppleProfiles interpolates outputPath unquoted" >&2; exit 1
      ''}
      # Nothing may have run at evaluation time either.
      test ! -e /tmp/pwned
      echo "outputPath is shell-escaped everywhere it is interpolated"
      touch "$out"
    '';

  # --- Several profiles and platforms --------------------------------------

  # An iOS profile next to an auto-installed Mac profile: one System plist
  # with no PayloadScope, its own identifier, written exactly at outputPath,
  # and never opened.
  ios-profile =
    let
      hm = mkHm [{
        programs.appleProfile = {
          organizationIdentifier = "com.example.test";
          profiles.mac.payloads."apple-com-apple-loginwindow".default = {
            enable = true;
            SHOWFULLNAME = false;
          };
          profiles.iphone = dnsPayload // {
            platform = "iOS";
            outputPath = "Profiles/iphone.mobileconfig";
          };
        };
      }];
      ap = hm.config.programs.appleProfile;
      copyScript = hm.config.home.activation.copyAppleProfiles.data;
    in
    assert !ap.profiles.iphone.autoInstall;
    assert ap.profiles.mac.autoInstall;
    assert ap.profiles.iphone.outputPaths == { System = "Profiles/iphone.mobileconfig"; };
    assert !(hm.config.home.file ? "Profiles/iphone.mobileconfig");
    assert lib.hasInfix
      (builtins.unsafeDiscardStringContext
        ''copyProfile ${ap.profiles.iphone.package} "$HOME"/Profiles/iphone.mobileconfig'')
      (builtins.unsafeDiscardStringContext copyScript);
    assert ap.profiles.mac.outputPaths == {
      System = "Library/Application Support/HomeManager/mac-system.mobileconfig";
    };
    plistCheck "ios-profile" ap.profiles.iphone.package ''
      assert "PayloadScope" not in profile, profile
      assert profile["PayloadIdentifier"] == "com.example.test.iphone", profile
      assert profile["PayloadDisplayName"] == "iphone", profile
      types = [p["PayloadType"] for p in payloads]
      assert types == ["com.apple.dnsSettings.managed"], types
      assert payloads[0]["PayloadIdentifier"] == "com.example.test.iphone.com.apple.dnsSettings.managed"
    '';

  # A payload whose manifest does not list the platform is rejected.
  # Positive control: ios-profile builds the same profile without it.
  platform-payload-assertion = evalFailureTest "platform-payload-assertion"
    "macOS-only payload on iOS"
    [{
      programs.appleProfile.profiles.iphone = dnsPayload // {
        platform = "iOS";
        payloads."apple-com-apple-dock".default.enable = true;
      };
    }];

  # A key restricted to other platforms is rejected even though its payload
  # is supported: PreventMove is iOS-only in com.apple.mail.managed.
  platform-key-assertion = evalFailureTest "platform-key-assertion"
    "iOS-only key on macOS"
    [{
      programs.appleProfile.profiles.default.payloads."apple-com-apple-mail-managed".work = {
        enable = true;
        EmailAddress = "jane@work.example";
        PreventMove = true;
      };
    }];

  # Positive control for platform-key-assertion: the identical configuration
  # passes with the escape hatch, so the key is what that test rejects.
  platform-allow-unsupported = plistTest "platform-allow-unsupported"
    [{
      programs.appleProfile.profiles.default.payloads."apple-com-apple-mail-managed".work = {
        enable = true;
        EmailAddress = "jane@work.example";
        PreventMove = true;
        _allowUnsupportedPlatform = true;
      };
    }]
    ''
      assert payloads[0]["PreventMove"] is True, payloads[0]
      assert "_allowUnsupportedPlatform" not in payloads[0], payloads[0]
    '';

  # The same accounts feed the Mac and the iPhone, filtered per profile, and
  # a profile that does not opt in gets nothing.
  bridge-several-profiles =
    let
      hm = mkHm [
        testAccounts
        {
          programs.appleProfile = {
            organizationIdentifier = "com.example.test";
            profiles.mac.bridges = {
              email.enable = true;
              contact.enable = true;
            };
            profiles.iphone = {
              platform = "iOS";
              bridges.email = { enable = true; exclude = [ "work" ]; };
              bridges.contact.enable = true;
            };
            profiles.ipad = dnsPayload // { platform = "iOS"; };
          };
        }
      ];
      ap = hm.config.programs.appleProfile.profiles;
    in
    pkgs.runCommand "check-bridge-several-profiles"
      {
        nativeBuildInputs = [ pkgs.python3 ];
        mac = ap.mac.packages.User;
        iphone = ap.iphone.package;
        ipad = ap.ipad.package;
      } ''
      python3 - "$mac" "$iphone" "$ipad" <<'PYEOF'
      import plistlib, sys

      def load(p):
          with open(p, "rb") as f:
              return plistlib.load(f)["PayloadContent"]

      def of(payloads, t):
          return [p for p in payloads if p["PayloadType"] == t]

      mac, iphone, ipad = (load(p) for p in sys.argv[1:])

      assert len(of(mac, "com.apple.mail.managed")) == 2, mac
      mail = of(iphone, "com.apple.mail.managed")
      assert [p["EmailAddress"] for p in mail] == ["jane@personal.example"], mail
      assert mail[0]["PayloadIdentifier"].startswith("com.example.test.iphone."), mail[0]

      # iOS gets the principal URL that macOS must not carry.
      card = of(iphone, "com.apple.carddav.account")
      assert card[0]["CardDAVPrincipalURL"] == "/addressbooks/jane/", card
      assert "CardDAVPrincipalURL" not in of(mac, "com.apple.carddav.account")[0]

      assert [p["PayloadType"] for p in ipad] == ["com.apple.dnsSettings.managed"], ipad
      print("ok")
      PYEOF
      touch "$out"
    '';

  # A plain profile module can be shared between profiles through `imports`.
  shared-imports =
    let
      hm = mkHm [{
        programs.appleProfile.profiles = {
          mac.imports = [ dnsPayload ];
          iphone = {
            platform = "iOS";
            imports = [ dnsPayload ];
          };
        };
      }];
      ap = hm.config.programs.appleProfile.profiles;
    in
    pkgs.runCommand "check-shared-imports"
      {
        nativeBuildInputs = [ pkgs.python3 ];
        mac = ap.mac.package;
        iphone = ap.iphone.package;
      } ''
      python3 - "$mac" "$iphone" <<'PYEOF'
      import plistlib, sys
      for path in sys.argv[1:]:
          with open(path, "rb") as f:
              payloads = plistlib.load(f)["PayloadContent"]
          assert [p["PayloadType"] for p in payloads] == ["com.apple.dnsSettings.managed"], payloads
          assert payloads[0]["DNSSettings"]["ServerURL"] == "https://dns.example/dns-query"
      print("ok")
      PYEOF
      touch "$out"
    '';

  # Two profiles writing the same file are rejected.
  duplicate-output-path = evalFailureTest "duplicate-output-path"
    "two profiles with one outputPath"
    [{
      programs.appleProfile.profiles = {
        a = dnsPayload // { platform = "iOS"; outputPath = "same.mobileconfig"; };
        b = dnsPayload // { platform = "iOS"; outputPath = "same.mobileconfig"; };
      };
    }];

  # Two auto-installed profiles with one identifier would replace each other.
  duplicate-identifier = evalFailureTest "duplicate-identifier"
    "two installed profiles with one organizationIdentifier"
    [{
      programs.appleProfile.profiles = {
        a = dnsPayload // { organizationIdentifier = "com.example.same"; };
        b = dnsPayload // { organizationIdentifier = "com.example.same"; };
      };
    }];

  # Only macOS profiles can be installed on this Mac.
  auto-install-platform-assertion = evalFailureTest "auto-install-platform-assertion"
    "autoInstall on an iOS profile"
    [{
      programs.appleProfile.profiles.iphone = dnsPayload // {
        platform = "iOS";
        autoInstall = true;
      };
    }];

  # Only macOS has a User scope.
  single-scope-assertion = evalFailureTest "single-scope-assertion"
    "User-scope payload on iOS"
    [{
      programs.appleProfile.profiles.iphone = dnsPayload // {
        platform = "iOS";
        payloads."apple-com-apple-mail-managed".work = {
          enable = true;
          EmailAddress = "jane@work.example";
          _scope = "User";
        };
      };
    }];

  # Non-autoInstall profiles are written as regular files (AirDrop refuses a
  # symlink into the Nix store). Runs the real activation snippet against a
  # scratch HOME and walks through its safety rules.
  copy-regular-file =
    let
      script = profiles:
        (mkHm [{ programs.appleProfile.profiles = profiles; }]).config.home.activation.copyAppleProfiles.data;
      withPhone = pkgs.writeText "with-phone.sh" (script {
        iphone = dnsPayload // { platform = "iOS"; outputPath = "Profiles/phone x.mobileconfig"; };
      });
      changedPhone = pkgs.writeText "changed-phone.sh" (script {
        iphone = dnsPayload // {
          platform = "iOS";
          outputPath = "Profiles/phone x.mobileconfig";
          profileName = "Changed";
        };
      });
      withoutPhone = pkgs.writeText "without-phone.sh" (script {
        mac.payloads."apple-com-apple-loginwindow".default.enable = true;
      });
    in
    pkgs.runCommand "check-copy-regular-file" { nativeBuildInputs = [ pkgs.bash ]; } ''
      export HOME="$PWD/home" XDG_STATE_HOME=""
      mkdir -p "$HOME/Profiles"
      f="$HOME/Profiles/phone x.mobileconfig"
      activate() { bash -euo pipefail -c 'run() { "$@"; }; source "$1"' _ "$1"; }

      # An old generation's store symlink is replaced by a regular file.
      ln -s /nix/store/does-not-matter "$f"
      activate ${withPhone}
      test -f "$f" && test ! -L "$f"
      test "$(stat -c %a "$f")" = 644
      grep -q PayloadContent "$f"

      # Unchanged and changed profiles both update a file it wrote itself.
      activate ${withPhone}
      activate ${changedPhone}
      grep -q Changed "$f"

      # A file edited by hand is never overwritten ...
      echo edited > "$f"
      activate ${withPhone}
      test "$(cat "$f")" = edited

      # ... nor deleted when its profile goes away.
      activate ${withoutPhone}
      test "$(cat "$f")" = edited

      # An untouched copy whose profile goes away is removed.
      rm "$f"
      activate ${withPhone}
      test -f "$f"
      activate ${withoutPhone}
      test ! -e "$f"

      echo "profiles are copied as regular files, safely"
      touch "$out"
    '';

  # lib.mkProfile needs no Home Manager evaluation, sanitizes its derivation
  # name, can still bridge accounts from a Home Manager config, and gives
  # tvOS a single profile too.
  mk-profile-standalone =
    let
      plain = mkProfile {
        inherit pkgs;
        platform = "iOS";
        name = "Jane's iPhone";
        modules = [ dnsPayload { profileName = "Jane's iPhone"; } ];
      };
      bridged = mkProfile {
        inherit pkgs;
        platform = "iOS";
        homeConfig = (mkHm [ testAccounts ]).config;
        modules = [{ bridges.email.enable = true; }];
      };
      tv = mkProfile {
        inherit pkgs;
        platform = "tvOS";
        modules = [{
          payloads."apple-com-apple-wifi-managed".default = {
            enable = true;
            SSID_STR = "home";
          };
        }];
      };
    in
    pkgs.runCommand "check-mk-profile-standalone"
      {
        nativeBuildInputs = [ pkgs.python3 ];
        inherit plain bridged tv;
      } ''
      python3 - "$plain" "$bridged" "$tv" <<'PYEOF'
      import plistlib, sys

      def load(p):
          with open(p, "rb") as f:
              return plistlib.load(f)

      plain, bridged, tv = (load(p) for p in sys.argv[1:])
      assert plain["PayloadDisplayName"] == "Jane's iPhone", plain
      assert plain["PayloadContent"][0]["PayloadType"] == "com.apple.dnsSettings.managed"

      addrs = sorted(p["EmailAddress"] for p in bridged["PayloadContent"])
      assert addrs == ["jane@personal.example", "jane@work.example"], addrs

      assert "PayloadScope" not in tv, tv
      assert tv["PayloadContent"][0]["SSID_STR"] == "home", tv
      print("ok")
      PYEOF
      touch "$out"
    '';

  # --- Uploads --------------------------------------------------------------

  # upload = true turns autoInstall off by default, writes no home.file, and
  # adds an activation step that calls the Fleet uploader with the escaped URL
  # and token path. Without an uploader there is no step at all.
  upload-defaults =
    let
      hm = mkHm [{
        programs.appleProfile = {
          upload.fleet = {
            url = "https://fleet.example";
            tokenFile = "/tmp/token dir/$(id)";
          };
          profiles.mac = {
            upload = true;
            payloads."apple-com-apple-loginwindow".default.enable = true;
          };
        };
      }];
      plain = mkHm [{
        programs.appleProfile.profiles.mac.payloads."apple-com-apple-loginwindow".default.enable = true;
      }];
      ap = hm.config.programs.appleProfile;
      script = hm.config.home.activation.uploadAppleProfiles.data;
    in
    assert !ap.profiles.mac.autoInstall;
    assert ap.profiles.mac.outputPaths == { };
    assert !(lib.any (lib.hasSuffix ".mobileconfig") (lib.attrNames hm.config.home.file));
    assert lib.hasInfix
      (builtins.unsafeDiscardStringContext "uploadProfile ${ap.profiles.mac.packages.System}")
      (builtins.unsafeDiscardStringContext script);
    assert !(plain.config.home.activation ? uploadAppleProfiles);
    pkgs.runCommand "check-upload-defaults" { script = pkgs.writeText "upload.sh" script; } ''
      fleetCommand="$(grep -o '/nix/store/[^ ]*-nix-profile-gen-upload-fleet' "$script" | head -n1)"
      test -n "$fleetCommand"
      # The token path reaches the uploader single-quoted, as one word.
      grep -q -F "'/tmp/token dir/\$(id)'" "$fleetCommand"
      grep -q -F " https://fleet.example " "$fleetCommand"
      echo "uploaded profiles are not opened and go to the configured server"
      touch "$out"
    '';

  upload-without-server = evalFailureTest "upload-without-server"
    "upload = true without upload.fleet or upload.command"
    [{
      programs.appleProfile.profiles.mac = {
        upload = true;
        payloads."apple-com-apple-loginwindow".default.enable = true;
      };
    }];

  upload-and-auto-install = evalFailureTest "upload-and-auto-install"
    "upload and autoInstall on the same profile"
    [{
      programs.appleProfile = {
        upload.command = "/bin/true";
        profiles.mac = {
          upload = true;
          autoInstall = true;
          payloads."apple-com-apple-loginwindow".default.enable = true;
        };
      };
    }];

  upload-fleet-without-token = evalFailureTest "upload-fleet-without-token"
    "upload.fleet.url without tokenFile"
    [{
      programs.appleProfile = {
        upload.fleet.url = "https://fleet.example";
        profiles.mac = {
          upload = true;
          payloads."apple-com-apple-loginwindow".default.enable = true;
        };
      };
    }];

  # Runs the real activation snippet with a fake upload command that logs its
  # calls: uploads happen only on change, a profile that goes away is removed,
  # a failure is retried on the next run, and DRY_RUN sends nothing.
  upload-activation =
    let
      log = "$TMPDIR/calls";
      fake = pkgs.writeShellScript "fake-upload" ''
        echo "$1 $(basename "$2")" >> "${log}"
        [[ ! -e "$TMPDIR/fail" ]]
      '';
      script = profiles: pkgs.writeText "upload.sh"
        (mkHm [{
          programs.appleProfile = {
            upload.command = "${fake}";
            inherit profiles;
          };
        }]).config.home.activation.uploadAppleProfiles.data;
      phone = name: dnsPayload // { platform = "iOS"; upload = true; profileName = name; };
      v1 = script { iphone = phone "One"; };
      v2 = script { iphone = phone "Two"; };
      none = script { mac.payloads."apple-com-apple-loginwindow".default.enable = true; };
    in
    pkgs.runCommand "check-upload-activation" { nativeBuildInputs = [ pkgs.bash ]; } ''
      export HOME="$PWD/home" XDG_STATE_HOME=""
      mkdir -p "$HOME"
      activate() { bash -euo pipefail -c 'source "$1"' _ "$1"; }
      calls() { if [[ -f ${log} ]]; then wc -l < ${log}; else echo 0; fi; }

      activate ${v1}
      test "$(calls)" = 1
      grep -q "^upload .*iphone" ${log}

      # Unchanged: nothing is sent again.
      activate ${v1}
      test "$(calls)" = 1

      # Changed, but the server fails: reported, not fatal, retried next time.
      touch "$TMPDIR/fail"
      activate ${v2}
      test "$(calls)" = 2
      rm "$TMPDIR/fail"
      activate ${v2}
      test "$(calls)" = 3
      activate ${v2}
      test "$(calls)" = 3

      # Dry run sends nothing.
      DRY_RUN=1 activate ${v1}
      test "$(calls)" = 3

      # The profile goes away: it is removed from the server, once.
      activate ${none}
      test "$(calls)" = 4
      tail -n1 ${log} | grep -q "^remove com.example.test.iphone\|^remove .*iphone"
      activate ${none}
      test "$(calls)" = 4

      echo "uploads follow the declared profiles and survive failures"
      touch "$out"
    '';

  # The Fleet uploader against a fake Fleet API: it sends the token as a
  # bearer header, deletes an existing profile with the same identifier before
  # uploading, and removes by identifier.
  upload-fleet-api =
    let
      uploader = pkgs.callPackage ../nix-modules/uploaders/fleet.nix { };
      profile = (mkHm [{
        programs.appleProfile.profiles.iphone = dnsPayload // { platform = "iOS"; };
      }]).config.programs.appleProfile.profiles.iphone.package;
      server = pkgs.writeText "fake-fleet.py" ''
        import http.server, json, sys
        log = open(sys.argv[2], "a")
        class H(http.server.BaseHTTPRequestHandler):
            def reply(self, body):
                self.send_response(200)
                self.end_headers()
                self.wfile.write(json.dumps(body).encode())
            def note(self):
                log.write(f"{self.command} {self.path} {self.headers.get('Authorization')}\n")
                log.flush()
            def do_GET(self):
                self.note()
                self.reply({"profiles": [{"profile_uuid": "abc-123", "identifier": "org.nixos.home-manager.iphone"}]})
            def do_DELETE(self):
                self.note()
                self.reply({})
            def do_POST(self):
                self.note()
                body = self.rfile.read(int(self.headers["Content-Length"]))
                assert b"PayloadContent" in body
                self.reply({"profile_uuid": "def-456"})
            def log_message(self, *a):
                pass
        import time
        s = http.server.HTTPServer(("127.0.0.1", 0), H)
        s.timeout = 1
        open(sys.argv[1], "w").write(str(s.server_address[1]))
        # Never outlive the check: a forgotten server would keep the build
        # waiting forever.
        deadline = time.time() + 60
        while time.time() < deadline:
            s.handle_request()
      '';
    in
    pkgs.runCommand "check-upload-fleet-api"
      { nativeBuildInputs = [ pkgs.python3 ]; __darwinAllowLocalNetworking = true; } ''
      printf 'secret-token' > token
      python3 ${server} port log &
      serverPid=$!
      trap 'kill "$serverPid" 2>/dev/null || true' EXIT
      for _ in $(seq 50); do [[ -s port ]] && break; sleep 0.1; done
      test -s port
      url="http://127.0.0.1:$(cat port)"

      ${uploader}/bin/nix-profile-gen-fleet "$url" token upload ${profile}
      ${uploader}/bin/nix-profile-gen-fleet "$url" token remove org.nixos.home-manager.iphone
      cat log

      test "$(cut -d' ' -f1 log | tr '\n' ' ')" = "GET DELETE POST GET DELETE "
      grep -q "^DELETE /api/latest/fleet/configuration_profiles/abc-123 " log
      test "$(grep -c 'Bearer secret-token$' log)" = 5

      # Missing token file: refuses before contacting the server.
      if ${uploader}/bin/nix-profile-gen-fleet "$url" missing upload ${profile} 2>/dev/null; then
        echo "uploaded without a token file" >&2; exit 1
      fi
      test "$(wc -l < log)" = 5

      echo "the Fleet uploader replaces profiles by identifier"
      touch "$out"
    '';
}
