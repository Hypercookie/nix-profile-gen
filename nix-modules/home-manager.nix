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
#   autoInstall = true   (default on macOS) written to HOME and handed to
#                        System Settings with /usr/bin/open when it changes.
#   upload = true        sent to `programs.appleProfile.upload` (e.g. a Fleet
#                        server, which then installs it on enrolled devices)
#                        whenever it changes. Replaces autoInstall.
#   neither              built only. Copied to `outputPath` as a regular file
#                        when that is set; `package` is always available.
#
# This file adds only what is specific to Home Manager: home.file, the copies,
# the install hooks, the uploads, the activation message and assertion
# forwarding.
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
        default = config.platform == "macOS" && !config.upload;
        defaultText = lib.literalExpression ''platform == "macOS" && !upload'';
        description = ''
          Install this profile on this Mac whenever it changes: it is opened
          with `/usr/bin/open`, which hands it to System Settings for approval.

          Only valid for macOS profiles. The profile is written to `outputPath`,
          which defaults to `${defaultDir}/<name>.mobileconfig` here.
        '';
      };

      upload = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Send this profile to `programs.appleProfile.upload` whenever it
          changes, for a device management server that installs it on its
          devices (see `programs.appleProfile.upload.fleet`). Works for every
          platform. On macOS each scope (`-user`, `-system`) is sent as its own
          profile.

          An uploaded profile is not also opened here (`autoInstall` defaults
          to false): the server installs it, on this Mac too if it is enrolled.
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

  # Every installed profile file, with its scope, for the activation message.
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

  openHook = path: ''
    if [[ "$OSTYPE" == "darwin"* ]]; then
      /usr/bin/open ${profileArg path}
    fi
  '';

  # Auto-installed profiles are linked through home.file, whose onChange is
  # what triggers the install.
  filesOf = p: lib.optionalAttrs p.autoInstall
    (lib.mapAttrs'
      (scope: path: lib.nameValuePair path {
        source = p.packages.${scope};
        # Home Manager runs this after the new file has been linked, and only
        # when it differs from the previous generation, so an unchanged profile
        # is not opened again on every switch.
        onChange = openHook path;
      })
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

  # --- Uploads ---------------------------------------------------------------

  uploaded = lib.filterAttrs (_: p: p.upload) profiles;

  fleetUploader = pkgs.callPackage ./uploaders/fleet.nix { };

  # The configured upload command with the Fleet settings baked in. Both are
  # paths or URLs, never the token itself, so this script may live in the store.
  fleetCommand = pkgs.writeShellScript "nix-profile-gen-upload-fleet" ''
    exec ${fleetUploader}/bin/nix-profile-gen-fleet \
      ${lib.escapeShellArg (toString cfg.upload.fleet.url)} \
      ${lib.escapeShellArg (toString cfg.upload.fleet.tokenFile)} "$@"
  '';

  uploadCommand =
    if cfg.upload.command != null then cfg.upload.command
    else if cfg.upload.fleet.url != null then "${fleetCommand}"
    else null;

  # Every file to upload. On macOS a profile can be two files (User, System);
  # each is uploaded on its own, under its own PayloadIdentifier.
  uploadFiles = lib.concatLists (lib.mapAttrsToList
    (_: p: lib.attrValues p.packages)
    uploaded);

  python = "${pkgs.python3}/bin/python3";

  # Uploads are recorded as `<sha256> <PayloadIdentifier>` lines. A profile is
  # sent only when its content differs from the last successful upload, and a
  # recorded identifier that is no longer wanted is removed from the server.
  # A failed upload or removal never fails the activation (the server may be
  # unreachable, the token file not there yet): the old record is kept, so the
  # next switch tries again.
  uploadScript = ''
    state="''${XDG_STATE_HOME:-$HOME/.local/state}/nix-profile-gen/uploads"
    declare -A uploadedHash=() wantedId=()
    if [[ -f "$state" ]]; then
      while IFS= read -r line; do
        [[ -n "$line" ]] && uploadedHash["''${line#* }"]="''${line%% *}"
      done < "$state"
    fi
    newUploadState=""

    uploadProfile() {
      local src="$1" id want
      id="$(${python} -I -c 'import plistlib, sys; print(plistlib.load(open(sys.argv[1], "rb"))["PayloadIdentifier"])' "$src")"
      want="$(${coreutils}/sha256sum "$src" | ${coreutils}/cut -d' ' -f1)"
      wantedId["$id"]=1
      local have="''${uploadedHash["$id"]:-}"
      if [[ "$have" == "$want" ]]; then
        newUploadState+="$want $id"$'\n'
      elif [[ -n "''${DRY_RUN:-}" ]]; then
        echo "nix-profile-gen: would upload $id"
        [[ -n "$have" ]] && newUploadState+="$have $id"$'\n'
      elif ${uploadCommand} upload "$src"; then
        newUploadState+="$want $id"$'\n'
      else
        echo "nix-profile-gen: uploading $id failed; trying again on the next switch" >&2
        [[ -n "$have" ]] && newUploadState+="$have $id"$'\n'
      fi
      return 0
    }

    ${lib.concatMapStringsSep "\n" (f: "uploadProfile ${f}") uploadFiles}

    for id in "''${!uploadedHash[@]}"; do
      [[ -n "''${wantedId["$id"]:-}" ]] && continue
      if [[ -n "''${DRY_RUN:-}" ]]; then
        echo "nix-profile-gen: would remove $id"
        newUploadState+="''${uploadedHash["$id"]} $id"$'\n'
      elif ${uploadCommand} remove "$id"; then
        :
      else
        echo "nix-profile-gen: removing $id failed; trying again on the next switch" >&2
        newUploadState+="''${uploadedHash["$id"]} $id"$'\n'
      fi
    done

    if [[ -z "''${DRY_RUN:-}" && ( -n "$newUploadState" || -f "$state" ) ]]; then
      ${coreutils}/mkdir -p "$(${coreutils}/dirname "$state")"
      printf '%s' "$newUploadState" > "$state"
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
      openOnChange.
    '')
    (lib.mkRemovedOptionModule [ "programs" "appleProfile" "mdm" ] ''
      The local MDM server was removed. To have profiles installed without a
      click, enroll the devices in a device management server and set
      programs.appleProfile.profiles.<name>.upload = true together with
      programs.appleProfile.upload (for example upload.fleet).
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

    upload = {
      command = mkOption {
        type = types.nullOr types.str;
        default = null;
        example = lib.literalExpression ''"''${myUploader}/bin/upload-profile"'';
        description = ''
          Executable that sends profiles with `upload = true` to a device
          management server. It is called on activation as

              <command> upload <profile.mobileconfig>
              <command> remove <PayloadIdentifier>

          `upload` runs when a profile's content changed since its last
          successful upload, `remove` when an uploaded profile is no longer
          declared. A non-zero exit is reported and retried on the next switch;
          it never fails the activation. Takes precedence over `fleet`.
        '';
      };

      fleet = {
        url = mkOption {
          type = types.nullOr types.str;
          default = null;
          example = "https://fleet.example.com";
          description = ''
            Fleet server to upload to. Fleet installs every uploaded profile on
            all of its enrolled Apple devices (Fleet Free cannot target a
            platform or label). Each upload replaces the profile with the same
            PayloadIdentifier, which Fleet does by removing and reinstalling it.
          '';
        };

        tokenFile = mkOption {
          type = types.nullOr types.str;
          default = null;
          example = "/usr/local/var/opnix/user/fleet-token";
          description = ''
            File holding a Fleet API token, read at activation time. Never put
            the token itself in the configuration: it would land in the
            world-readable Nix store. An API-only user with the maintainer
            role is enough.
          '';
        };
      };
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
      ++ lib.concatLists (lib.mapAttrsToList
      (_: p: [
        {
          assertion = !(p.upload && p.autoInstall);
          message = ''
            ${p._label} sets both upload and autoInstall. The server installs an
            uploaded profile; opening it here as well would install it twice.
          '';
        }
        {
          assertion = !p.upload || uploadCommand != null;
          message = ''
            ${p._label}.upload is set, but there is nowhere to upload to. Set
            programs.appleProfile.upload.fleet.url (and tokenFile) or
            programs.appleProfile.upload.command.
          '';
        }
      ])
      profiles)
      ++ lib.optional (cfg.upload.fleet.url != null && cfg.upload.command == null) {
      assertion = cfg.upload.fleet.tokenFile != null;
      message = ''
        programs.appleProfile.upload.fleet.url is set without tokenFile.
      '';
    }
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

    # After the copies, so a failed upload cannot keep profiles off the disk.
    # Without an uploader nothing is configured to receive profiles, so there
    # is nothing to send or remove.
    home.activation.uploadAppleProfiles = lib.mkIf (uploadCommand != null)
      (lib.hm.dag.entryAfter [ "copyAppleProfiles" ] uploadScript);

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
