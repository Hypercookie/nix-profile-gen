# nix-modules/profile/default.nix
#
# One Apple configuration profile, as a self-contained module.
#
# This module knows nothing about Home Manager. It is evaluated as:
#   * each `programs.appleProfile.profiles.<name>`  (nix-modules/home-manager.nix)
#   * the body of `lib.mkProfile`                   (plain `lib.evalModules`)
#
# Required special arguments:
#   pkgs      used to build the .mobileconfig
#   hmConfig  an evaluated Home Manager `config` (or `{ }`); only the bridges
#             read it, for `accounts.*`
#
# It produces the plist derivations (`packages`, `package`) plus its own
# `assertions` and `warnings`. Whoever evaluates it is responsible for
# enforcing those: the Home Manager module forwards them, `lib.mkProfile`
# throws on them.
{ config, lib, pkgs, ... }:

let
  inherit (lib) mkOption types;

  cfg = config;
  isMac = cfg.platform == "macOS";

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

  # Options every generated payload instance carries that are module plumbing
  # rather than payload content. Must match nix_o_s_module_generator.py.
  internalKeys = [
    "enable"
    "_domain"
    "_unique"
    "_displayName"
    "_keyNames"
    "_targets"
    "_platforms"
    "_keyPlatforms"
    "_allowUnsupportedPlatform"
    "_scope"
  ];

  # Only macOS distinguishes User and System profiles.
  scopes = if isMac then [ "User" "System" ] else [ "System" ];

  # Which profile a payload instance belongs in. Payloads that accept either
  # scope follow `scope`. An explicit `_scope` always wins, so a manifest with
  # missing or wrong pfm_targets can still be placed by hand.
  autoScope = icfg:
    let
      canUser = lib.elem "user" icfg._targets;
      canSystem = lib.elem "system" icfg._targets;
    in
    if !isMac then "System"
    else if canUser && canSystem then cfg.scope
    else if canUser then "User"
    else if canSystem then "System"
    else cfg.scope;

  scopeOf = icfg: if icfg._scope != null then icfg._scope else autoScope icfg;

  payloadsConfig = cfg.payloads;
  manifestNames = lib.attrNames payloadsConfig;

  # Map over every <manifest>.<instance>.
  forEachInstance = f: lib.concatMap
    (manifestName:
      lib.mapAttrsToList (f manifestName) payloadsConfig.${manifestName})
    manifestNames;

  instancePath = manifestName: instanceName:
    ''${cfg._label}.payloads."${manifestName}"."${instanceName}"'';

  contentOf = icfg: prune (removeAttrs icfg internalKeys);

  # Convert one payload instance into its plist representation.
  instanceToAttrs = instanceName: icfg:
    let
      domain = icfg._domain;
      # The conventional "default" instance gets no suffix, so single-instance
      # configurations keep stable PayloadIdentifiers and UUIDs.
      ident = "${cfg.organizationIdentifier}.${domain}"
        + lib.optionalString (instanceName != "default") ".${instanceName}";
    in
    {
      PayloadType = domain;
      PayloadIdentifier = ident;
      PayloadUUID = builtins.hashString "sha256" ident;
      PayloadDisplayName =
        if icfg._displayName != null then icfg._displayName else domain;
      PayloadVersion = 1;
    } // contentOf icfg;

  payloadsForScope = scope: lib.filter (x: x != null) (forEachInstance
    (_: instanceName: icfg:
      if icfg.enable && scopeOf icfg == scope
      then instanceToAttrs instanceName icfg
      else null));

  payloadsByScope = lib.genAttrs scopes payloadsForScope;

  activeScopes = lib.filter (s: payloadsByScope.${s} != [ ]) scopes;

  # On macOS the scope is always appended, so a path stays stable when a
  # second scope appears later:
  #   .../profile.mobileconfig -> .../profile-user.mobileconfig
  # Other platforms only ever produce one profile, so the path is used as is.
  outputPathFor = scope:
    let
      suffix = lib.toLower scope;
      match = builtins.match "^(.*)\\.mobileconfig$" cfg.outputPath;
    in
    if !isMac then
      cfg.outputPath
    else if match == null then
      "${cfg.outputPath}-${suffix}"
    else
      "${builtins.head match}-${suffix}.mobileconfig";

  # --- Platform validation -------------------------------------------------

  # Every value found at `path` inside `value`, descending through lists, so
  # a key inside an array of dictionaries is found in any element.
  valuesAt = value: path:
    if path == [ ] then [ value ]
    else if builtins.isList value then
      lib.concatMap (v: valuesAt v path) value
    else if builtins.isAttrs value && value ? ${builtins.head path} then
      valuesAt value.${builtins.head path} (builtins.tail path)
    else [ ];

  payloadUnsupported = icfg:
    icfg._platforms != [ ] && !(lib.elem cfg.platform icfg._platforms);

  # Keys that are set (non-null after pruning) but not available on
  # `platform` according to their own pfm_platforms.
  unsupportedKeys = icfg:
    let content = contentOf icfg; in
    lib.filter
      (k: !(lib.elem cfg.platform k.platforms) && valuesAt content k.path != [ ])
      icfg._keyPlatforms;

  platformProblems = manifestName: instanceName: icfg:
    let
      where = instancePath manifestName instanceName;
      keys = unsupportedKeys icfg;
    in
    lib.optional (payloadUnsupported icfg) ''
      ${where}
      is not available on platform "${cfg.platform}". Its manifest supports:
      ${lib.concatStringsSep ", " icfg._platforms}
    ''
    ++ map
      (k: ''
        ${where}.${lib.concatStringsSep "." k.path}
        is not available on platform "${cfg.platform}". The key supports:
        ${lib.concatStringsSep ", " k.platforms}
      '')
      keys;

  platformAssertions = forEachInstance (manifestName: instanceName: icfg:
    let problems = platformProblems manifestName instanceName icfg; in
    {
      assertion = !icfg.enable || icfg._allowUnsupportedPlatform || problems == [ ];
      message = lib.concatStringsSep "\n" problems + ''

        Remove it, or set `_allowUnsupportedPlatform = true` on the instance if
        the upstream ProfileManifests metadata is wrong.
      '';
    });

  platformWarnings = lib.concatLists (forEachInstance (manifestName: instanceName: icfg:
    lib.optionals (icfg.enable && icfg._allowUnsupportedPlatform)
      (map (p: "Emitted despite _allowUnsupportedPlatform: ${p}")
        (platformProblems manifestName instanceName icfg))));

  singleScopeAssertions = lib.optionals (!isMac) ([
    {
      assertion = cfg.scope == "System";
      message = ''
        ${cfg._label}.scope = "${cfg.scope}", but ${cfg.platform} profiles only
        have a System scope.
      '';
    }
  ] ++ forEachInstance (manifestName: instanceName: icfg: {
    assertion = !icfg.enable || icfg._scope != "User";
    message = ''
      ${instancePath manifestName instanceName} is forced into
      the User scope, which does not exist on ${cfg.platform}.
    '';
  }));

  # --- Pre-existing structural checks ---------------------------------------

  # Apple rejects profiles containing more than one instance of a payload whose
  # manifest declares pfm_unique.
  uniqueAssertions = map
    (manifestName:
      let
        instances = payloadsConfig.${manifestName};
        enabled = lib.attrNames (lib.filterAttrs (_: i: i.enable) instances);
        isUnique = lib.any (i: i._unique) (lib.attrValues instances);
      in
      {
        assertion = !(isUnique && lib.length enabled > 1);
        message = ''
          ${cfg._label}.payloads."${manifestName}" is marked pfm_unique in its
          manifest: only one instance of this payload is accepted per profile,
          but ${toString (lib.length enabled)} are enabled:
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
  legacyAssertions = forEachInstance (manifestName: instanceName: icfg: {
    assertion = !(lib.elem instanceName icfg._keyNames);
    message = ''
      ${instancePath manifestName instanceName} looks like the
      old flat payload syntax: "${instanceName}" is a payload key of this
      manifest, not an instance name. Rewrite as:

        payloads."${manifestName}".default.${instanceName} = ...;
    '';
  });

  # Forcing an instance into a scope its manifest does not advertise is
  # allowed (upstream metadata is sometimes missing or wrong) but noisy.
  scopeWarnings = lib.filter (x: x != null) (forEachInstance (manifestName: instanceName: icfg:
    if isMac
      && icfg.enable
      && icfg._scope != null
      && !(lib.elem (lib.toLower icfg._scope) icfg._targets)
    then ''
      ${instancePath manifestName instanceName} is forced into
      the ${icfg._scope} profile via _scope, but its manifest declares
      pfm_targets = [ ${lib.concatStringsSep " " icfg._targets} ]. The device may
      reject or ignore the payload.
    ''
    else null));

  # --- Plist generation -----------------------------------------------------

  # The profile matching the `scope` preference keeps the bare
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
    } // lib.optionalAttrs isMac {
      # PayloadScope is a macOS-only key.
      PayloadScope = scope;
    } // lib.optionalAttrs (cfg.description != null) {
      PayloadDescription = cfg.description;
    } // lib.optionalAttrs (cfg.consentText != null) {
      ConsentText = { default = cfg.consentText; };
    } // lib.optionalAttrs cfg.removalDisallowed {
      PayloadRemovalDisallowed = true;
    };

  generateMobileconfig = scope: pkgs.runCommand
    "${lib.strings.sanitizeDerivationName cfg._name}-${lib.toLower scope}.mobileconfig"
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
    ../payloads/all-payloads.nix
    ../bridges/profile.nix
  ];

  options = {
    _label = mkOption {
      type = types.str;
      internal = true;
      default = "profile";
      description = "Option path of this profile, used in assertion messages.";
    };

    _name = mkOption {
      type = types.str;
      internal = true;
      default = "profile";
      description = "Base of the derivation name. Sanitized before use.";
    };

    platform = mkOption {
      type = types.enum [ "macOS" "iOS" "tvOS" ];
      default = "macOS";
      description = ''
        Target Apple platform. Every enabled payload, and every key set on it,
        is checked against the ProfileManifests `pfm_platforms` metadata;
        anything unavailable on this platform fails evaluation.

        Only macOS has User-scope profiles. On every other platform all
        payloads go into a single System profile.
      '';
    };

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
      default = if isMac then "User" else "System";
      defaultText = lib.literalExpression ''if platform == "macOS" then "User" else "System"'';
      description = ''
        Preferred scope for payloads whose manifest accepts either (macOS only).

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
      description = "If true, the profile cannot be removed by the user (requires a supervised device).";
    };

    consentText = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = "Consent text shown to the user during profile installation.";
    };

    outputPath = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "Profiles/iphone.mobileconfig";
      description = ''
        Path, relative to HOME, the profile is written to via `home.file`.
        `null` writes nothing; use `package` to place the file yourself.

        On macOS this is a base name: the scope is appended, so
        `profile.mobileconfig` becomes `profile-user.mobileconfig` and
        `profile-system.mobileconfig`. On other platforms it is used as is.
      '';
    };

    outputPaths = mkOption {
      type = types.attrsOf types.str;
      readOnly = true;
      default =
        if cfg.outputPath == null then { }
        else lib.genAttrs activeScopes outputPathFor;
      defaultText = lib.literalExpression ''{ User = "..."; System = "..."; }'';
      description = ''
        Resolved `home.file` path of each profile that is generated, keyed by
        scope. Empty when `outputPath` is null.
      '';
    };

    packages = mkOption {
      type = types.attrsOf types.package;
      readOnly = true;
      default = lib.genAttrs activeScopes generateMobileconfig;
      defaultText = lib.literalExpression "{ User = <drv>; System = <drv>; }";
      description = "The generated `.mobileconfig` of each scope that has payloads.";
    };

    package = mkOption {
      type = types.package;
      readOnly = true;
      default =
        if activeScopes == [ ] then
          throw "${cfg._label}: no payloads are enabled, so there is no profile to build."
        else if lib.length activeScopes > 1 then
          throw ''
            ${cfg._label} produces both a User and a System profile; use
            `packages.User` and `packages.System` instead of `package`.
          ''
        else
          generateMobileconfig (builtins.head activeScopes);
      defaultText = lib.literalExpression "<drv>";
      description = ''
        The generated `.mobileconfig`, for use as e.g.
        `home.file."x.mobileconfig".source`. Throws if the profile is empty, or
        on macOS if payloads landed in both scopes (use `packages` then).
      '';
    };

    assertions = mkOption {
      type = types.listOf types.unspecified;
      internal = true;
      default = [ ];
      description = "Assertions for this profile, enforced by whoever evaluates it.";
    };

    warnings = mkOption {
      type = types.listOf types.str;
      internal = true;
      default = [ ];
      description = "Warnings for this profile, surfaced by whoever evaluates it.";
    };

    # Payloads are declared by the imported generated modules as
    #   payloads.<manifest>.<instance>
    # Each manifest is a `types.attrsOf (types.submodule ...)`, so multiple
    # instances of the same payload type are supported. Use the instance name
    # "default" when a single instance is all you need.
  };

  config = {
    assertions =
      uniqueAssertions
      ++ legacyAssertions
      ++ platformAssertions
      ++ singleScopeAssertions;

    warnings = scopeWarnings ++ platformWarnings;
  };
}
