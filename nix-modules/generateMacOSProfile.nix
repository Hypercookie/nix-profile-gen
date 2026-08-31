# nix-modules/generateMacOSProfile.nix
# Home Manager module for macOS configuration profiles
{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.macprofile;

  # Recursively drop null values, and drop attribute sets that become empty as
  # a result. Always returns an attrset (never null) for attrset input, so
  # `{ ... } // prune x` is safe even when every key was null.
  prune = value:
    if value == null then
      null
    else if builtins.isList value then
      map prune (lib.filter (x: x != null) value)
    else if builtins.isAttrs value then
      lib.filterAttrs (_: x: x != null && x != { })
        (lib.mapAttrs (_: prune) value)
    else
      value;

  # Keys that are module plumbing rather than payload content.
  internalKeys = [
    "enable"
    "_domain"
    "_unique"
    "_displayName"
    "_keyNames"
    "_targets"
    "_scope"
  ];

  scopes = [ "User" "System" ];

  # Which profile a payload instance belongs in.
  #
  # Manifests declare pfm_targets: 95 payloads are system-only, 12 are
  # user-only, and the rest accept either. Payloads that accept either follow
  # the top-level `scope` preference. An explicit `_scope` always wins, so a
  # manifest with missing or wrong metadata can still be placed by hand.
  autoScope = icfg:
    let
      canUser = lib.elem "user" icfg._targets;
      canSystem = lib.elem "system" icfg._targets;
    in
    if canUser && canSystem then cfg.scope
    else if canUser then "User"
    else if canSystem then "System"
    else cfg.scope;

  scopeOf = icfg: if icfg._scope != null then icfg._scope else autoScope icfg;

  # Payloads are declared by the imported modules as
  #   programs.macprofile.payloads.<manifest>.<instance>
  payloadsConfig = cfg.payloads or { };
  manifestNames = lib.attrNames payloadsConfig;

  enabledInstanceNames = manifestName:
    lib.attrNames (lib.filterAttrs (_: i: i.enable) payloadsConfig.${manifestName});

  # Convert one payload instance into its plist representation.
  instanceToAttrs = manifestName: instanceName: icfg:
    let
      domain = icfg._domain;
      # The conventional "default" instance gets no suffix, so single-instance
      # configurations keep stable PayloadIdentifiers and UUIDs.
      ident = "${cfg.organizationIdentifier}.${domain}"
        + lib.optionalString (instanceName != "default") ".${instanceName}";
      cleaned = prune (removeAttrs icfg internalKeys);
    in
    if !icfg.enable then
      null
    else
      {
        PayloadType = domain;
        PayloadIdentifier = ident;
        PayloadUUID = builtins.hashString "sha256" ident;
        PayloadDisplayName =
          if icfg._displayName != null then icfg._displayName else domain;
        PayloadVersion = 1;
      } // cleaned;

  # Flatten <manifest>.<instance> into the PayloadContent list for one scope.
  payloadsForScope = scope: lib.concatMap
    (manifestName:
      lib.filter (x: x != null)
        (lib.mapAttrsToList
          (instanceName: icfg:
            if scopeOf icfg != scope then
              null
            else
              instanceToAttrs manifestName instanceName icfg)
          payloadsConfig.${manifestName}))
    manifestNames;

  payloadsByScope = lib.genAttrs scopes payloadsForScope;

  activeScopes = lib.filter (s: payloadsByScope.${s} != [ ]) scopes;

  # Derive a per-scope output path, e.g.
  #   .../profile.mobileconfig -> .../profile-user.mobileconfig
  outputPathFor = scope:
    let
      suffix = lib.toLower scope;
      match = builtins.match "^(.*)\\.mobileconfig$" cfg.outputPath;
    in
    if match == null then
      "${cfg.outputPath}-${suffix}"
    else
      "${builtins.head match}-${suffix}.mobileconfig";

  # macOS rejects profiles containing more than one instance of a payload whose
  # manifest declares pfm_unique.
  uniqueAssertions = map
    (manifestName:
      let
        instances = payloadsConfig.${manifestName};
        enabled = enabledInstanceNames manifestName;
        isUnique = lib.any (i: i._unique) (lib.attrValues instances);
      in
      {
        assertion = !(isUnique && lib.length enabled > 1);
        message = ''
          programs.macprofile.payloads."${manifestName}" is marked pfm_unique in
          its manifest: macOS accepts only one instance of this payload per
          profile, but ${toString (lib.length enabled)} are enabled:
          ${lib.concatStringsSep ", " enabled}
        '';
      })
    manifestNames;

  # Best-effort detection of the pre-instance (flat) configuration syntax, e.g.
  #   payloads."apple-com-apple-dnsSettings-managed".DNSSettings = { ... };
  # instead of
  #   payloads."apple-com-apple-dnsSettings-managed".default.DNSSettings = { ... };
  #
  # This only fires when the legacy value happened to be an attribute set, since
  # scalar values fail submodule coercion before assertions are ever evaluated.
  legacyAssertions = lib.concatMap
    (manifestName:
      lib.mapAttrsToList
        (instanceName: icfg: {
          assertion = !(lib.elem instanceName icfg._keyNames);
          message = ''
            programs.macprofile.payloads."${manifestName}"."${instanceName}" looks
            like the old flat payload syntax: "${instanceName}" is a payload key of
            this manifest, not an instance name.

            Payloads are now keyed by instance name so a profile can contain
            several instances of the same payload type. Rewrite as:

              payloads."${manifestName}".default.${instanceName} = ...;
          '';
        })
        payloadsConfig.${manifestName})
    manifestNames;

  # Forcing an instance into a scope its manifest does not advertise is
  # allowed (upstream metadata is sometimes missing or wrong) but noisy.
  scopeWarnings = lib.concatMap
    (manifestName:
      lib.filter (x: x != null)
        (lib.mapAttrsToList
          (instanceName: icfg:
            if icfg.enable
              && icfg._scope != null
              && !(lib.elem (lib.toLower icfg._scope) icfg._targets)
            then ''
              programs.macprofile.payloads."${manifestName}"."${instanceName}" is
              forced into the ${icfg._scope} profile via _scope, but its manifest
              declares pfm_targets = [ ${lib.concatStringsSep " " icfg._targets} ].
              macOS may reject or ignore the payload.
            ''
            else null)
          payloadsConfig.${manifestName}))
    manifestNames;

  # Generate the complete mobileconfig profile structure for one scope.
  #
  # The profile matching the top-level `scope` preference keeps the bare
  # organizationIdentifier, so single-scope configurations keep stable
  # identifiers and UUIDs; the other profile is suffixed.
  profileContentFor = scope:
    let
      ident = cfg.organizationIdentifier
        + lib.optionalString (scope != cfg.scope) ".${lib.toLower scope}";
    in
    {
    PayloadContent = payloadsByScope.${scope};
    PayloadDisplayName =
      if scope == cfg.scope
      then cfg.profileName
      else "${cfg.profileName} (${scope})";
    PayloadIdentifier = ident;
    PayloadOrganization = cfg.organization;
    PayloadType = "Configuration";
    PayloadUUID = builtins.hashString "sha256" ident;
    PayloadVersion = 1;
    PayloadScope = scope;
  } // lib.optionalAttrs (cfg.description != null) {
    PayloadDescription = cfg.description;
  } // lib.optionalAttrs (cfg.consentText != null) {
    ConsentText = { default = cfg.consentText; };
  } // lib.optionalAttrs cfg.removalDisallowed {
    PayloadRemovalDisallowed = true;
  };

  # Convert to plist using a derivation
  generateMobileconfig = scope: pkgs.runCommand
    "profile-${lib.toLower scope}.mobileconfig"
    {
      nativeBuildInputs = [ pkgs.python3 ];
      profileJson = builtins.toJSON (profileContentFor scope);
      passAsFile = [ "profileJson" ];
    } ''
    ${pkgs.python3}/bin/python3 << 'EOF'
import json
import plistlib
import os

with open(os.environ['profileJsonPath'], 'r') as f:
    profile = json.load(f)

# Remove None/null values recursively
def remove_nulls(obj):
    if isinstance(obj, dict):
        return {k: remove_nulls(v) for k, v in obj.items() if v is not None}
    elif isinstance(obj, list):
        return [remove_nulls(item) for item in obj if item is not None]
    else:
        return obj

# Generate proper UUIDs from the hash strings (take first 32 chars and format as UUID)
def format_uuid(hash_str):
    h = hash_str[:32]
    return f"{h[:8]}-{h[8:12]}-{h[12:16]}-{h[16:20]}-{h[20:32]}".upper()

def fix_uuids(obj):
    if isinstance(obj, dict):
        for k, v in obj.items():
            if k == 'PayloadUUID' and isinstance(v, str) and len(v) == 64:
                obj[k] = format_uuid(v)
            else:
                fix_uuids(v)
    elif isinstance(obj, list):
        for item in obj:
            fix_uuids(item)

# Remove nulls first, then fix UUIDs
profile = remove_nulls(profile)
fix_uuids(profile)

with open(os.environ['out'], 'wb') as f:
    plistlib.dump(profile, f)
EOF
  '';

in
{
  imports = [
    ./payloads/all-payloads.nix
  ];

  options.programs.macprofile = {
    enable = mkEnableOption "macOS configuration profile generation";

    profileName = mkOption {
      type = types.str;
      default = "Home Manager Profile";
      description = "The display name of the configuration profile.";
    };

    description = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = "A description of the configuration profile.";
    };

    organization = mkOption {
      type = types.str;
      default = "Home Manager";
      description = "The organization name for the profile.";
    };

    organizationIdentifier = mkOption {
      type = types.str;
      default = "org.nixos.home-manager";
      example = "com.example.myorg";
      description = "The reverse-DNS style identifier for the profile.";
    };

    scope = mkOption {
      type = types.enum [ "User" "System" ];
      default = "User";
      description = ''
        Preferred scope for payloads whose manifest accepts either.

        Payloads are routed into a User profile or a System profile according
        to their manifest's `pfm_targets`; some payloads (Mail, CalDAV,
        CardDAV) are user-only and others (Login Window, FileVault) are
        system-only, so up to two profiles may be produced. This option only
        decides where the payloads that accept *both* end up.

        Override an individual payload with
        `payloads.<manifest>.<instance>._scope`.
      '';
    };

    removalDisallowed = mkOption {
      type = types.bool;
      default = false;
      description = "If true, the profile cannot be removed by the user (requires MDM).";
    };

    consentText = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = "Consent text shown to the user during profile installation.";
    };

    outputPath = mkOption {
      type = types.str;
      default = "Library/Application Support/HomeManager/profile.mobileconfig";
      description = ''
        Base path, relative to HOME, for the generated profiles.

        The scope is appended to the file name, so the default produces
        `profile-user.mobileconfig` and `profile-system.mobileconfig`. Only
        the profiles that actually contain payloads are written.
      '';
    };

    outputPaths = mkOption {
      type = types.attrsOf types.str;
      readOnly = true;
      default = lib.genAttrs activeScopes outputPathFor;
      defaultText = literalExpression ''{ User = "..."; System = "..."; }'';
      description = "Resolved output path of each profile that is generated, keyed by scope.";
    };

    # Payloads are declared by the imported modules as
    #   programs.macprofile.payloads.<manifest>.<instance>
    # Each manifest is a `types.attrsOf (types.submodule ...)`, so multiple
    # instances of the same payload type are supported. Use the instance name
    # "default" when a single instance is all you need.
  };

  config = mkIf cfg.enable {
    assertions = uniqueAssertions ++ legacyAssertions;
    warnings = scopeWarnings;

    # One file per scope that actually has payloads.
    home.file = lib.listToAttrs (map
      (scope: lib.nameValuePair (outputPathFor scope) {
        source = generateMobileconfig scope;
      })
      activeScopes);

    # Provide an activation script to optionally install the profiles
    home.activation.installMacProfile = mkIf (activeScopes != [ ]) (
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        if [[ "$OSTYPE" == "darwin"* ]]; then
          for PROFILE_PATH in ${
            lib.concatMapStringsSep " "
              (scope: ''"$HOME/${outputPathFor scope}"'')
              activeScopes
          }; do
            if [[ -f "$PROFILE_PATH" ]]; then
              $DRY_RUN_CMD echo "macOS profile generated at: $PROFILE_PATH"
              $DRY_RUN_CMD echo "To install, run: open \"$PROFILE_PATH\""
            fi
          done
          $DRY_RUN_CMD echo "Or install via System Settings > Privacy & Security > Profiles"
        fi
      ''
    );
  };
}
