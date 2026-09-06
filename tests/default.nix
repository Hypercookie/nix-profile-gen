# Test suite, run with `nix flake check`.
{ pkgs, lib, system, home-manager, modules }:

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
      paths = hm.config.programs.macprofile.outputPaths;
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
    programs.macprofile = {
      enable = true;
      organizationIdentifier = "com.example.test";
      scope = "System";
      payloads."apple-com-apple-mail-managed".work = {
        enable = true;
        EmailAddress = "jane@work.example";
      };
      payloads."apple-com-apple-loginwindow".default = {
        enable = true;
        SHOWFULLNAME = false;
      };
      payloads."apple-com-apple-dock".default = {
        enable = true;
        tilesize = 48;
      };
    };
  };

  # Assert something about the generated profile with a Python snippet.
  # `body` receives `profile` (the parsed plist) and `payloads`
  # (profile["PayloadContent"]), and should raise on failure.
  plistTest = name: extraModules: body:
    plistTestScope "User" name extraModules body;

  plistTestScope = scope: name: extraModules: body:
    pkgs.runCommand "check-${name}"
      {
        nativeBuildInputs = [ pkgs.python3 ];
        profile = mkProfileScope scope extraModules;
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
      count = builtins.length (builtins.attrNames eval.options.programs.macprofile.payloads);
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
      programs.macprofile = {
        enable = true;
        organizationIdentifier = "com.example.test";
        bridges.email.enable = false;
        bridges.calendar.enable = false;
        bridges.contact.enable = false;
        payloads."apple-com-apple-mail-managed" = {
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
        payloads."apple-com-apple-dock".default = {
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
      programs.macprofile = {
        enable = true;
        organizationIdentifier = "com.example.test";
        payloads."apple-com-apple-dock".default = {
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
      programs.macprofile = {
        enable = true;
        organizationIdentifier = "com.example.test";
        payloads."apple-com-apple-dock".default.enable = true;
      };
    }]
    ''
      assert len(payloads) == 1, payloads
      assert payloads[0]["PayloadType"] == "com.apple.dock", payloads[0]
    '';

  # accounts.email is mapped automatically, one payload per IMAP account.
  bridge-email = plistTest "bridge-email"
    [{
      programs.macprofile = {
        enable = true;
        organizationIdentifier = "com.example.test";
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

  # accounts.email.accounts.<n>.macprofile-style overrides go through the
  # normal typed payload path and win over the bridge's mkDefault values.
  bridge-email-override = plistTest "bridge-email-override"
    [{
      programs.macprofile = {
        enable = true;
        organizationIdentifier = "com.example.test";
        payloads."apple-com-apple-mail-managed".work = {
          PreventMove = true;
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
      assert mail[0]["PreventMove"] is True, mail[0]
      assert mail[0]["EmailAccountDescription"] == "Overridden", mail[0]
      # Non-overridden bridge values survive.
      assert mail[0]["IncomingMailServerHostName"] == "imap.work.example", mail[0]
    '';

  # accounts.calendar / accounts.contact are split into host/port/path.
  bridge-calendar-contacts = plistTest "bridge-calendar-contacts"
    [{
      programs.macprofile = {
        enable = true;
        organizationIdentifier = "com.example.test";
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
      assert card[0]["CardDAVPrincipalURL"] == "/addressbooks/jane/", card[0]
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
      paths = hm.config.programs.macprofile.outputPaths;
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
        programs.macprofile = {
          enable = true;
          organizationIdentifier = "com.example.test";
          payloads."apple-com-apple-loginwindow".default = {
            enable = true;
            SHOWFULLNAME = false;
          };
        };
      }];
      scopes = lib.attrNames hm.config.programs.macprofile.outputPaths;
    in
    pkgs.runCommand "check-scope-single-file" { } ''
      test "${lib.concatStringsSep "," scopes}" = "System"
      echo "only the System profile was generated"
      touch "$out"
    '';

  # _scope forces a payload into a scope its manifest does not advertise.
  scope-override = plistTestScope "System" "scope-override"
    [{
      programs.macprofile = {
        enable = true;
        organizationIdentifier = "com.example.test";
        payloads."apple-com-apple-mail-managed".work = {
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

  # openOnChange wires an onChange hook onto every generated profile.
  open-on-change =
    let
      mk = enabled:
        let
          hm = mkHm [{
            programs.macprofile = {
              enable = true;
              organizationIdentifier = "com.example.test";
              openOnChange = enabled;
              payloads."apple-com-apple-loginwindow".default = {
                enable = true;
                SHOWFULLNAME = false;
              };
            };
          }];
          path = hm.config.programs.macprofile.outputPaths.System;
        in
        hm.config.home.file.${path}.onChange;
    in
    pkgs.runCommand "check-open-on-change" { } ''
      ${lib.optionalString (!(lib.hasInfix "/usr/bin/open" (mk true))) ''
        echo "openOnChange = true did not install an open hook" >&2; exit 1
      ''}
      ${lib.optionalString ((mk false) != "") ''
        echo "openOnChange = false should leave onChange empty" >&2; exit 1
      ''}
      echo "onChange hook is gated on openOnChange"
      touch "$out"
    '';

  # The NanoMDM package still builds. Only the finite `outPath` string is
  # forced (never deepSeq a derivation), and the binary is deliberately not
  # executed: the check has to work on both darwin and linux.
  mdm-package-builds =
    let
      nanomdm = pkgs.callPackage ./../mdm/packages/nanomdm.nix { };
    in
    pkgs.runCommand "check-mdm-package-builds" { } ''
      test -x "${nanomdm}/bin/nanomdm"
      echo "nanomdm builds"
      touch "$out"
    '';

  # The generated NanoMDM wrapper and Caddyfile are store paths, so their
  # contents can be asserted on directly. They are also platform-independent,
  # unlike `launchd.agents`, which only exists on darwin.
  mdm-wrapper-and-caddyfile =
    let
      # A state directory containing a space: every path the wrapper passes to
      # NanoMDM has to survive it. Unquoted, `-ca /tmp/test user/...` would
      # reach NanoMDM as two argv elements, it would fatal on the stray one,
      # and `KeepAlive = true` would turn that into a restart loop.
      stateDir = "/tmp/test user/state";
      hm = mkHm [{
        programs.macprofile = {
          enable = true;
          organizationIdentifier = "com.example.test";
          payloads."apple-com-apple-loginwindow".default = {
            enable = true;
            SHOWFULLNAME = false;
          };
          mdm = {
            enable = true;
            inherit stateDir;
            apiKeyFile = "/tmp/fake.key";
            listen = "127.0.0.1:9000";
          };
        };
      }];
    in
    pkgs.runCommand "check-mdm-wrapper-and-caddyfile"
      {
        wrapper = hm.config.programs.macprofile.mdm._wrapperScript;
        caddyfile = hm.config.programs.macprofile.mdm._caddyfile;
      } ''
      grep -q -F -- '-storage filekv' "$wrapper"
      grep -q -F -- '-checkin' "$wrapper"

      # Every interpolated path must survive a space. The needles below are
      # written out literally rather than via `escapeShellArg` (which would
      # make the check tautological): a `stateDir` containing a space has to
      # reach NanoMDM as a single argv element. See the API key leak check
      # below for the argv/plist side of the key handling.
      ${lib.concatMapStringsSep "\n"
        (needle: "grep -q -F -- ${lib.escapeShellArg needle} \"$wrapper\"")
        [
          "-listen 127.0.0.1:9000"
          "-ca '${stateDir}/ca/ca.pem'"
          "-storage-dsn '${stateDir}/db'"
          "mkdir -p '${stateDir}/db' '${stateDir}/log'"
        ]}

      grep -q -F -- 'reverse_proxy' "$caddyfile"
      # No sudo prompt on start; the root is shipped in the enrollment profile.
      grep -q -F -- 'skip_install_trust' "$caddyfile"
      grep -q -F -- 'local_certs' "$caddyfile"
      # No local control socket that could reconfigure the server.
      grep -q -F -- 'admin off' "$caddyfile"
      # Caddy keeps its internal PKI inside storage, so this root is what puts
      # the CA certificate at `caRootPath`. It is also the only mechanism
      # doing so: no XDG_DATA_HOME is set anywhere.
      grep -q -F -- 'root "${stateDir}/caddy"' "$caddyfile"

      echo "wrapper and Caddyfile contents are as expected"
      touch "$out"
    '';

  # The Caddyfile's storage root is the single source of truth for where the
  # internal CA lands, and `caRootPath` — what the CLI passes as `--cacert` —
  # has to agree with it. Caddy stores PKI assets at
  # `<storage root>/pki/authorities/<ca id>/root.crt`.
  mdm-caddy-root-path =
    let
      stateDir = "/tmp/mdm-state";
      hm = mkHm [{
        programs.macprofile = {
          enable = true;
          organizationIdentifier = "com.example.test";
          payloads."apple-com-apple-loginwindow".default = {
            enable = true;
            SHOWFULLNAME = false;
          };
          mdm = {
            enable = true;
            inherit stateDir;
          };
        };
      }];
      mdm = hm.config.programs.macprofile.mdm;
    in
    pkgs.runCommand "check-mdm-caddy-root-path"
      { caddyfile = mdm._caddyfile; } ''
      storageRoot=${lib.escapeShellArg "${stateDir}/caddy"}
      grep -q -F -- "root \"$storageRoot\"" "$caddyfile"

      test ${lib.escapeShellArg mdm.caRootPath} = \
        "$storageRoot/pki/authorities/local/root.crt"

      # XDG_DATA_HOME only selects Caddy's *default* storage location, which
      # the explicit `storage file` block replaces. Setting both would put the
      # data dir at <storageRoot>/caddy and contradict caRootPath.
      if grep -q -F -- 'XDG_DATA_HOME' "$caddyfile"; then
        echo "the Caddyfile still mentions XDG_DATA_HOME" >&2
        exit 1
      fi

      echo "caRootPath matches the Caddyfile storage root"
      touch "$out"
    '';

  # The API key must never reach ~/Library/LaunchAgents. Home Manager renders
  # `launchd.agents.<name>.config` into a plist there with world-readable
  # permissions, so a `NANOMDM_API` entry in `EnvironmentVariables` would hand
  # the key to every local user — the same reason it is not passed in argv,
  # which `ps` exposes. The wrapper reads the key file at start time instead.
  #
  # On Linux `launchd.agents` stays empty (mdm.nix only defines it under
  # `isDarwin`), so the plist assertions are gated on the platform and the
  # wrapper half of the check carries the weight there.
  mdm-api-key-not-in-launchd-plist =
    let
      apiKeyFile = "/tmp/nixmagic-test-secrets/api-key";
      hm = mkHm [{
        programs.macprofile = {
          enable = true;
          organizationIdentifier = "com.example.test";
          payloads."apple-com-apple-loginwindow".default = {
            enable = true;
            SHOWFULLNAME = false;
          };
          mdm = {
            enable = true;
            inherit apiKeyFile;
          };
        };
      }];
      agents = hm.config.launchd.agents or { };
      isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
      # Exactly what Home Manager writes into ~/Library/LaunchAgents: same
      # generator, same options.
      renderedAgents = lib.concatStringsSep "\n"
        (lib.mapAttrsToList
          (_: agent: lib.generators.toPlist { escape = true; } agent.config)
          agents);
    in
    pkgs.runCommand "check-mdm-api-key-not-in-launchd-plist"
      {
        rendered = renderedAgents;
        passAsFile = [ "rendered" ];
        wrapper = hm.config.programs.macprofile.mdm._wrapperScript;
      } ''
      ${lib.optionalString isDarwin (
        (lib.optionalString (!(agents ? nanomdm)) ''
          echo "no nanomdm agent on darwin: this check would be vacuous" >&2
          exit 1
        '')
        + (lib.optionalString (agents.nanomdm.config.EnvironmentVariables != null) ''
          echo "the nanomdm agent sets EnvironmentVariables, which land in a world-readable plist" >&2
          exit 1
        '')
      )}

      for needle in NANOMDM_API ${lib.escapeShellArg apiKeyFile}; do
        if grep -q -F -- "$needle" "$renderedPath"; then
          echo "the launchd agent plist leaks $needle" >&2
          exit 1
        fi
      done

      # ... and the key really is obtained from the file at start time.
      grep -q -F -- 'NANOMDM_API="$(cat "$apiKeyFile")"' "$wrapper"
      grep -q -F -- ${lib.escapeShellArg apiKeyFile} "$wrapper"

      echo "no key material in the launchd agent configuration"
      touch "$out"
    '';

  # An enabled MDM pushes the System profile on change, and pushOnChange = false
  # removes the hook again.
  mdm-push-on-change =
    let
      enrollmentId = "AAAABBBB-1111-2222-3333-444455556666";
      mk = push:
        let
          hm = mkHm [{
            programs.macprofile = {
              enable = true;
              organizationIdentifier = "com.example.test";
              payloads."apple-com-apple-loginwindow".default = {
                enable = true;
                SHOWFULLNAME = false;
              };
              mdm = {
                enable = true;
                apiKeyFile = "/tmp/fake.key";
                inherit enrollmentId;
                pushOnChange = push;
              };
            };
          }];
          path = hm.config.programs.macprofile.outputPaths.System;
        in
        hm.config.home.file.${path}.onChange;
      hook = mk true;
    in
    pkgs.runCommand "check-mdm-push-on-change" { } ''
      ${lib.concatMapStringsSep "\n"
        (needle: lib.optionalString (!(lib.hasInfix needle hook)) ''
          echo "push hook is missing ${needle}" >&2; exit 1
        '')
        [ "nixmagic-mdm" "push" "--scope system" enrollmentId ]}
      ${lib.optionalString (lib.hasInfix "nixmagic-mdm" (mk false)) ''
        echo "pushOnChange = false should not install a push hook" >&2; exit 1
      ''}
      echo "the push hook is gated on pushOnChange"
      touch "$out"
    '';

  # User-scope profiles can only be installed over a user-channel enrollment.
  # With userEnrollmentId = null there is nothing to push to, so the hook must
  # be omitted entirely rather than emitting a command that would fail on every
  # activation.
  mdm-push-user-scope-skipped =
    let
      hm = mkHm [{
        programs.macprofile = {
          enable = true;
          organizationIdentifier = "com.example.test";
          payloads."apple-com-apple-mail-managed".work = {
            enable = true;
            EmailAddress = "jane@work.example";
          };
          mdm = {
            enable = true;
            apiKeyFile = "/tmp/fake.key";
            userEnrollmentId = null;
          };
        };
      }];
      path = hm.config.programs.macprofile.outputPaths.User;
      hook = hm.config.home.file.${path}.onChange;
    in
    pkgs.runCommand "check-mdm-push-user-scope-skipped" { } ''
      ${lib.optionalString (lib.hasInfix "nixmagic-mdm" hook) ''
        echo "User profile got a push hook without a user-channel enrollment" >&2
        exit 1
      ''}
      echo "the User profile is not pushed without userEnrollmentId"
      touch "$out"
    '';

  # Regression test for the onChangeFor merge: openOnChange and the MDM push
  # are independent and must both survive.
  mdm-open-and-push-coexist =
    let
      hm = mkHm [{
        programs.macprofile = {
          enable = true;
          organizationIdentifier = "com.example.test";
          openOnChange = true;
          payloads."apple-com-apple-loginwindow".default = {
            enable = true;
            SHOWFULLNAME = false;
          };
          mdm = {
            enable = true;
            apiKeyFile = "/tmp/fake.key";
            enrollmentId = "AAAABBBB-1111-2222-3333-444455556666";
          };
        };
      }];
      path = hm.config.programs.macprofile.outputPaths.System;
      hook = hm.config.home.file.${path}.onChange;
    in
    pkgs.runCommand "check-mdm-open-and-push-coexist" { } ''
      ${lib.concatMapStringsSep "\n"
        (needle: lib.optionalString (!(lib.hasInfix needle hook)) ''
          echo "merged onChange hook is missing ${needle}" >&2; exit 1
        '')
        [ "/usr/bin/open" "nixmagic-mdm" ]}
      echo "openOnChange and the MDM push coexist"
      touch "$out"
    '';

  # The module must be genuinely inert when it is not configured, which is what
  # justifies shipping it in homeModules.default. `launchd.agents` is only
  # defined on darwin, so the selection falls back to an empty set on linux.
  mdm-disabled-by-default =
    let
      hm = mkHm [{
        programs.macprofile = {
          enable = true;
          organizationIdentifier = "com.example.test";
          payloads."apple-com-apple-loginwindow".default = {
            enable = true;
            SHOWFULLNAME = false;
          };
        };
      }];
      path = hm.config.programs.macprofile.outputPaths.System;
      hook = hm.config.home.file.${path}.onChange;
      agents = hm.config.launchd.agents or { };
    in
    pkgs.runCommand "check-mdm-disabled-by-default" { } ''
      ${lib.optionalString (lib.hasInfix "nixmagic-mdm" hook) ''
        echo "an unconfigured MDM module installed a push hook" >&2; exit 1
      ''}
      ${lib.optionalString (agents ? nanomdm) ''
        echo "an unconfigured MDM module defined a nanomdm agent" >&2; exit 1
      ''}
      echo "the MDM module is inert when unused"
      touch "$out"
    '';

  # Enabling two instances of a pfm_unique payload must fail evaluation.
  unique-assertion = evalFailureTest "unique-assertion" "two instances of a pfm_unique payload"
    [{
      programs.macprofile = {
        enable = true;
        organizationIdentifier = "com.example.test";
        payloads."apple-com-apple-dock" = {
          one = { enable = true; tilesize = 32; };
          two = { enable = true; tilesize = 64; };
        };
      };
    }];

  # Legacy flat syntax with an attrset value is caught by the migration
  # assertion rather than producing a bogus payload.
  legacy-syntax-assertion = evalFailureTest "legacy-syntax-assertion" "legacy flat payload syntax"
    [{
      programs.macprofile = {
        enable = true;
        organizationIdentifier = "com.example.test";
        payloads."apple-com-apple-dnsSettings-managed".DNSSettings = {
          enable = true;
        };
      };
    }];

  # Replaces the old "mdm.enable without apiKeyFile is rejected" check: the
  # option now always has a value, so that assertion could no longer fire and
  # was removed. What matters instead is that the default agrees with the path
  # the CLI generates and reads the key at (`<state-dir>/api.key`), and that a
  # non-default value is actually handed to the CLI rather than silently
  # diverging from it.
  mdm-api-key-file-default =
    let
      stateDir = "/tmp/mdm-state";
      mk = extraMdm: mkHm [{
        programs.macprofile = {
          enable = true;
          organizationIdentifier = "com.example.test";
          payloads."apple-com-apple-loginwindow".default = {
            enable = true;
            SHOWFULLNAME = false;
          };
          mdm = {
            enable = true;
            inherit stateDir;
            enrollmentId = "AAAABBBB-1111-2222-3333-444455556666";
          } // extraMdm;
        };
      }];
      defaulted = (mk { }).config.programs.macprofile.mdm.apiKeyFile;
      overridden = "/tmp/elsewhere/api-key";
      hookWithOverride =
        let hm = mk { apiKeyFile = overridden; };
        in hm.config.home.file.${hm.config.programs.macprofile.outputPaths.System}.onChange;
    in
    pkgs.runCommand "check-mdm-api-key-file-default" { } ''
      test ${lib.escapeShellArg defaulted} = ${lib.escapeShellArg "${stateDir}/api.key"}
      ${lib.optionalString
        (!(lib.hasInfix "--api-key-file ${overridden}" hookWithOverride)) ''
        echo "the push hook does not pass the configured --api-key-file" >&2
        exit 1
      ''}
      echo "apiKeyFile defaults to the CLI's key path and is passed through"
      touch "$out"
    '';

  # `outputPath` is user-supplied and is interpolated into shell snippets. It
  # must be escaped, not dropped into a double-quoted string, or a path
  # containing a command substitution would execute at activation time.
  profile-path-shell-injection =
    let
      hm = mkHm [{
        programs.macprofile = {
          enable = true;
          organizationIdentifier = "com.example.test";
          openOnChange = true;
          outputPath = ''Library/x$(touch /tmp/pwned)`id`.mobileconfig'';
          payloads."apple-com-apple-loginwindow".default = {
            enable = true;
            SHOWFULLNAME = false;
          };
          mdm = {
            enable = true;
            enrollmentId = "AAAABBBB-1111-2222-3333-444455556666";
          };
        };
      }];
      path = hm.config.programs.macprofile.outputPaths.System;
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
      # Nothing may have run at evaluation time either.
      test ! -e /tmp/pwned
      echo "outputPath is shell-escaped everywhere it is interpolated"
      touch "$out"
    '';

  # The MDM server only exists to install generated profiles, so enabling it
  # without profile generation is rejected.
  mdm-assertion-macprofile-disabled =
    evalFailureTest "mdm-assertion-macprofile-disabled" "mdm.enable without macprofile.enable"
      [{
        programs.macprofile = {
          enable = false;
          mdm = {
            enable = true;
            apiKeyFile = "/tmp/fake.key";
          };
        };
      }];
}
