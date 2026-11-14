# Uploader for a Fleet server (https://fleetdm.com), used by
# programs.appleProfile.upload.fleet. Fleet installs every uploaded profile on
# its enrolled Apple devices.
#
#   nix-profile-gen-fleet <server url> <token file> upload <profile.mobileconfig>
#   nix-profile-gen-fleet <server url> <token file> remove <PayloadIdentifier>
#
# Fleet has no endpoint that replaces a profile in place: a second upload with
# the same PayloadIdentifier is refused with 409. `upload` therefore deletes
# the existing profile first (Fleet sends RemoveProfile, then InstallProfile).
#
# The API token is read from the file at run time. It never enters the Nix
# store or argv: the Authorization header reaches curl through a process
# substitution written by the `printf` builtin.
{ writeShellApplication, curl, python3 }:

writeShellApplication {
  name = "nix-profile-gen-fleet";
  runtimeInputs = [ curl python3 ];
  text = ''
    if [[ $# -ne 4 ]]; then
      echo "usage: nix-profile-gen-fleet <url> <token file> upload <file> | remove <identifier>" >&2
      exit 2
    fi
    url="''${1%/}" tokenFile="$2" action="$3" arg="$4"
    api="$url/api/latest/fleet/configuration_profiles"

    if [[ ! -r "$tokenFile" ]]; then
      echo "nix-profile-gen-fleet: token file $tokenFile is missing or unreadable" >&2
      exit 1
    fi

    authHeader() { printf 'Authorization: Bearer %s\n' "$(<"$tokenFile")"; }
    fleet() {
      curl --silent --show-error --fail-with-body --max-time 60 \
        --header @<(authHeader) "$@"
    }

    # profile_uuid of the profile with this PayloadIdentifier, or nothing.
    uuidOf() {
      fleet "$api?per_page=10000" | python3 -I -c '
    import json, re, sys
    for p in json.load(sys.stdin).get("profiles") or []:
        if p.get("identifier") == sys.argv[1] and re.fullmatch(r"[A-Za-z0-9-]+", p["profile_uuid"]):
            print(p["profile_uuid"])
            break
    ' "$1"
    }

    removeProfile() {
      local uuid
      uuid="$(uuidOf "$1")"
      if [[ -n "$uuid" ]]; then
        fleet --request DELETE "$api/$uuid" >/dev/null
      fi
    }

    case "$action" in
      upload)
        identifier="$(python3 -I -c '
    import plistlib, sys
    with open(sys.argv[1], "rb") as f:
        print(plistlib.load(f)["PayloadIdentifier"])
    ' "$arg")"
        removeProfile "$identifier"
        fleet --request POST \
          --form "profile=@$arg;type=application/x-apple-aspen-config" \
          "$api" >/dev/null
        echo "nix-profile-gen-fleet: uploaded $identifier to $url"
        ;;
      remove)
        removeProfile "$arg"
        echo "nix-profile-gen-fleet: removed $arg from $url"
        ;;
      *)
        echo "nix-profile-gen-fleet: unknown action $action" >&2
        exit 2
        ;;
    esac
  '';
}
