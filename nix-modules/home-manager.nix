# nix-modules/home-manager.nix
#
# Home Manager module behind `homeModules.profiles`.
#
#   programs.appleProfile.profiles.<name>   one Apple configuration profile
#
# Every profile is the same module (./profile): payloads, bridges, platform
# checks and `imports` behave identically. What happens to the result is
# decided per profile:
#
#   autoInstall = true   (default on macOS) written to HOME and installed on
#                        this Mac when it changes: pushed over MDM if
#                        programs.appleProfile.mdm is on, otherwise handed to
#                        System Settings with /usr/bin/open.
#   autoInstall = false  built only. Copied to `outputPath` as a regular file
#                        when that is set; `package` is always available.
#
# This file adds only what is specific to Home Manager: home.file, the copies,
# the install hooks, the activation message and assertion forwarding.
{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;

  cfg = config.programs.appleProfile;

  # `hmConfig` is how the bridges reach `accounts.*`.
  specialArgs = {
    inherit pkgs;
    hmConfig = config;
  };

  defaultDir = "Library/Application Support/HomeManager";

  # Home Manager specific options of each profile.
  hmProfileModule = { config, name, ... }: {
    options = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to build this profile.";
      };

      autoInstall = mkOption {
        type = types.bool;
        default = config.platform == "macOS";
        defaultText = lib.literalExpression ''platform == "macOS"'';
        description = ''
          Install this profile on this Mac whenever it changes. With
          `programs.appleProfile.mdm.enable` it is pushed over the local MDM
          server and installs silently; otherwise it is opened with
          `/usr/bin/open`, which hands it to System Settings for approval.

          Only valid for macOS profiles. The profile is written to `outputPath`,
          which defaults to `${defaultDir}/<name>.mobileconfig` here.
        '';
      };
    };

    config = {
      _label = ''programs.appleProfile.profiles."${name}"'';
      _name = name;
      profileName = lib.mkDefault name;
      organization = lib.mkDefault cfg.organization;
      organizationIdentifier = lib.mkDefault "${cfg.organizationIdentifier}.${name}";
      outputPath = lib.mkIf config.autoInstall
        (lib.mkDefault "${defaultDir}/${name}.mobileconfig");
    };
  };

  profiles = lib.filterAttrs (_: p: p.enable) cfg.profiles;
  installed = lib.filterAttrs (_: p: p.autoInstall) profiles;

  # Every installed profile file, with its scope. Shared by the activation
  # message and the manifest the MDM CLI reads for a manual `push`.
  installedFiles = lib.concatLists (lib.mapAttrsToList
    (_: p: lib.mapAttrsToList (scope: path: { inherit scope path; }) p.outputPaths)
    installed);

  # `outputPath` is user-supplied and ends up inside shell snippets (the
  # onChange hooks and the activation script), so it must never be
  # interpolated into a double-quoted string: a path containing `$(...)` or
  # backticks would then execute at activation time. `$HOME` still has to be
  # expanded by the shell, so only the relative part is escaped and the two
  # are concatenated into one word.
  profileArg = path: ''"$HOME"/${lib.escapeShellArg path}'';

  # The MDM options are declared by a separate module (mdm/nix-modules/mdm.nix)
  # which a user may not have imported, so every access has to be guarded.
  mdmPushing = (cfg ? mdm) && cfg.mdm.enable && cfg.mdm.pushOnChange;

  # Push a freshly written profile to the local MDM server so macOS installs
  # it without the user clicking anything.
  #
  # Scope decides the channel: System profiles go to the device-channel
  # enrollment, User profiles need a user-channel enrollment ID (`UUID:UUID`).
  # When the latter is missing there is nothing to push to, so the hook is
  # omitted entirely rather than emitting a command that would fail on every
  # activation. mdm.nix warns about that case separately.
  mdmPushHook = scope: path:
    let
      explicitId =
        if scope == "User" then cfg.mdm.userEnrollmentId else cfg.mdm.enrollmentId;
      idFile = if scope == "User" then null else cfg.mdm.enrollmentIdFile;
    in
    if scope == "User" && explicitId == null then
      ""
    else ''
      if [[ "$OSTYPE" == "darwin"* ]]; then
        ${lib.optionalString (idFile != null) ''
          MDM_ENROLLMENT_ID="$(cat ${lib.escapeShellArg idFile} 2>/dev/null || true)"
        ''}
        # A failed push must not fail the activation: the profile is already on
        # disk and can be installed by hand or pushed later with
        # `nixmagic-mdm push`.
        ${cfg.mdm.cliPackage}/bin/nixmagic-mdm \
          --state-dir ${lib.escapeShellArg cfg.mdm.stateDir} \
          --server-url ${lib.escapeShellArg cfg.mdm.serverUrl} \
          --api-key-file ${lib.escapeShellArg cfg.mdm.apiKeyFile} \
          push \
          --scope ${lib.toLower scope} \
          --profile ${profileArg path} \
          ${lib.optionalString (explicitId != null)
            "--enrollment-id ${lib.escapeShellArg explicitId}"} \
          ${lib.optionalString (idFile != null)
            ''''${MDM_ENROLLMENT_ID:+--enrollment-id "$MDM_ENROLLMENT_ID"}''} \
          || echo "nixmagic-mdm push failed; the profile is still at "${profileArg path} >&2
      fi
    '';

  openHook = path: ''
    if [[ "$OSTYPE" == "darwin"* ]]; then
      /usr/bin/open ${profileArg path}
    fi
  '';

  # How an installed profile gets onto this Mac. MDM replaces the open dialog
  # rather than adding to it: a pushed profile needs no approval.
  #
  # With MDM on but pushOnChange off, nothing runs; the user drives
  # `nixmagic-mdm push` by hand.
  installHook = scope: path:
    if (cfg ? mdm) && cfg.mdm.enable then
      lib.optionalString mdmPushing (mdmPushHook scope path)
    else
      openHook path;

  # Auto-installed profiles are linked through home.file, whose onChange is
  # what triggers the install.
  filesOf = p: lib.optionalAttrs p.autoInstall (lib.mapAttrs'
    (scope: path: lib.nameValuePair path ({
      source = p.packages.${scope};
    } // lib.optionalAttrs (p.autoInstall && installHook scope path != "") {
      # Home Manager runs this after the new file has been linked, and only
      # when it differs from the previous generation. That "only on change"
      # property is what makes the MDM push idempotent: re-running
      # `home-manager switch` with unchanged payloads enqueues nothing.
      onChange = installHook scope path;
    }))
    p.outputPaths);

  # Every other profile with an outputPath is copied as a regular file
  # instead. A home.file entry would be a symlink into the root-owned Nix
  # store, and AirDrop refuses to send that ("AirDrop failed"), which is the
  # main way these profiles reach another device.
  copies = lib.concatLists (lib.mapAttrsToList
    (_: p: lib.optionals (!p.autoInstall)
      (lib.mapAttrsToList
        (scope: path: { inherit path; source = p.packages.${scope}; })
        p.outputPaths))
    profiles);

  coreutils = "${pkgs.coreutils}/bin";

  # Copies are recorded as `<sha256> <path>` lines. That record is what makes
  # the copy safe to manage without owning the file the way home.file does:
  #   * a file is only overwritten if it is missing, a leftover store symlink
  #     from an older generation, or still exactly what was copied last time;
  #   * a copy whose profile is gone is deleted only under the same condition.
  # Anything the user changed or put there by hand is left alone, with a
  # message.
  copyScript = ''
    state="''${XDG_STATE_HOME:-$HOME/.local/state}/nix-profile-gen/copies"
    declare -A recorded=() wanted=()
    if [[ -f "$state" ]]; then
      while IFS= read -r line; do
        recorded["''${line#* }"]="''${line%% *}"
      done < "$state"
    fi
    newState=""

    hashOf() { ${coreutils}/sha256sum "$1" | ${coreutils}/cut -d' ' -f1; }

    copyProfile() {
      local src="$1" dst="$2" want
      want="$(hashOf "$src")"
      wanted["$dst"]=1
      if [[ -L "$dst" ]]; then
        if [[ "$(${coreutils}/readlink "$dst")" != /nix/store/* ]]; then
          echo "nix-profile-gen: not replacing symlink $dst" >&2
          return 0
        fi
        run ${coreutils}/rm "$dst"
      elif [[ -e "$dst" ]]; then
        local have
        have="$(hashOf "$dst")"
        if [[ "$have" != "$want" && "$have" != "''${recorded["$dst"]:-}" ]]; then
          echo "nix-profile-gen: not overwriting $dst, which was changed or not written by nix-profile-gen" >&2
          return 0
        fi
      fi
      run ${coreutils}/mkdir -p "$(${coreutils}/dirname "$dst")"
      run ${coreutils}/install -m 0644 "$src" "$dst"
      newState+="$want $dst"$'\n'
    }

    ${lib.concatMapStringsSep "\n" (c: "copyProfile ${c.source} ${profileArg c.path}") copies}

    for dst in "''${!recorded[@]}"; do
      if [[ -z "''${wanted["$dst"]:-}" && -f "$dst" && ! -L "$dst" \
            && "$(hashOf "$dst")" == "''${recorded["$dst"]}" ]]; then
        run ${coreutils}/rm "$dst"
      fi
    done

    if [[ -n "$newState" || -f "$state" ]]; then
      run ${coreutils}/mkdir -p "$(${coreutils}/dirname "$state")"
      if [[ -z "''${DRY_RUN:-}" ]]; then
        printf '%s' "$newState" > "$state"
      fi
    fi
  '';

  # Two profiles writing to the same home.file path would otherwise surface as
  # an opaque `source` merge conflict in Home Manager.
  writtenPaths = lib.concatLists (lib.mapAttrsToList
    (_: p: map (path: { inherit path; label = p._label; }) (lib.attrValues p.outputPaths))
    profiles);

  duplicates = key: xs: lib.filterAttrs (_: owners: lib.length owners > 1)
    (lib.groupBy' (acc: x: acc ++ [ x.label ]) [ ] key xs);

  # Two installed profiles with one identifier would replace each other on
  # the Mac instead of coexisting.
  installedIdentifiers = lib.mapAttrsToList
    (_: p: { label = p._label; id = p.organizationIdentifier; })
    installed;

in
{
  imports = [
    (lib.mkRemovedOptionModule [ "programs" "macprofile" ] ''
      Profiles are now declared individually under
      programs.appleProfile.profiles.<name>. Move the old settings, including
      payloads and bridges, into e.g. programs.appleProfile.profiles.mac;
      macOS profiles are installed automatically (autoInstall), which replaces
      openOnChange. mdm moved to programs.appleProfile.mdm.
    '')
  ];

  options.programs.appleProfile = {
    organization = mkOption {
      type = types.str;
      default = "Home Manager";
      description = "Default `organization` of every profile.";
    };

    organizationIdentifier = mkOption {
      type = types.str;
      default = "org.nixos.home-manager";
      example = "com.example";
      description = ''
        Base reverse-DNS identifier. Each profile defaults to
        `<organizationIdentifier>.<name>`, so profiles never share identifiers
        or UUIDs.
      '';
    };

    profiles = mkOption {
      type = types.attrsOf (types.submoduleWith {
        inherit specialArgs;
        modules = [ ./profile hmProfileModule ];
      });
      default = { };
      example = lib.literalExpression ''
        {
          mac = {
            # macOS, installed automatically
            bridges.email.enable = true;
            payloads."apple-com-apple-dock".default = { enable = true; autohide = true; };
          };
          iphone = {
            platform = "iOS";
            outputPath = "Profiles/iphone.mobileconfig";
            bridges.email.enable = true;
          };
        }
      '';
      description = ''
        Apple configuration profiles, keyed by name. The name is part of the
        default identifier, display name, file name and derivation name.

        See `autoInstall` for what happens to each one. Use
        `profiles.<name>.package` to place a profile anywhere else, e.g.
        `home.file."Desktop/x.mobileconfig".source`.
      '';
    };

    _installedFiles = mkOption {
      type = types.listOf types.attrs;
      internal = true;
      readOnly = true;
      default = installedFiles;
      description = ''
        `{ scope; path; }` of every auto-installed profile file, relative to
        HOME. Read by the MDM module.
      '';
    };
  };

  config = {
    assertions = lib.concatLists (lib.mapAttrsToList (_: p: p.assertions) profiles)
      ++ lib.concatLists (lib.mapAttrsToList
      (_: p: [
        {
          assertion = !p.autoInstall || p.platform == "macOS";
          message = ''
            ${p._label}.autoInstall is set, but the profile targets
            ${p.platform}. Only macOS profiles can be installed on this Mac; set
            autoInstall = false and use outputPath or package instead.
          '';
        }
        {
          assertion = !p.autoInstall || p.outputPath != null;
          message = ''
            ${p._label}.autoInstall needs an outputPath to install from.
          '';
        }
      ])
      profiles)
      ++ lib.mapAttrsToList
      (path: owners: {
        assertion = false;
        message = ''
          Several profiles write to ~/${path}:
          ${lib.concatStringsSep ", " owners}
        '';
      })
      (duplicates (x: x.path) writtenPaths)
      ++ lib.mapAttrsToList
      (id: owners: {
        assertion = false;
        message = ''
          Several auto-installed profiles use organizationIdentifier "${id}" and
          would replace each other on this Mac:
          ${lib.concatStringsSep ", " owners}
        '';
      })
      (duplicates (x: x.id) installedIdentifiers);

    warnings = lib.concatLists (lib.mapAttrsToList (_: p: p.warnings) profiles);

    home.file = lib.mkMerge (lib.mapAttrsToList (_: filesOf) profiles);

    # After linkGeneration, so a store symlink left by an older generation at
    # the same path has already been cleaned up by Home Manager.
    home.activation.copyAppleProfiles =
      lib.hm.dag.entryAfter [ "linkGeneration" ] copyScript;

    home.activation.installMacProfile = lib.mkIf (installedFiles != [ ]) (
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        if [[ "$OSTYPE" == "darwin"* ]]; then
          for PROFILE_PATH in ${
            lib.concatMapStringsSep " " (f: profileArg f.path) installedFiles
          }; do
            if [[ -f "$PROFILE_PATH" ]]; then
              $DRY_RUN_CMD echo "macOS profile generated at: $PROFILE_PATH"
            fi
          done
        fi
      ''
    );
  };
}
