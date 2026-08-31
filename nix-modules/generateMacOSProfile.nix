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
  internalKeys = [ "enable" "_domain" "_unique" "_displayName" "_keyNames" ];

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

  # Flatten <manifest>.<instance> into the PayloadContent list.
  enabledPayloads = lib.concatMap
    (manifestName:
      lib.filter (x: x != null)
        (lib.mapAttrsToList (instanceToAttrs manifestName)
          payloadsConfig.${manifestName}))
    manifestNames;

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

  # Generate the complete mobileconfig profile structure
  profileContent = {
    PayloadContent = enabledPayloads;
    PayloadDisplayName = cfg.profileName;
    PayloadIdentifier = cfg.organizationIdentifier;
    PayloadOrganization = cfg.organization;
    PayloadType = "Configuration";
    PayloadUUID = builtins.hashString "sha256" cfg.organizationIdentifier;
    PayloadVersion = 1;
    PayloadScope = cfg.scope;
  } // lib.optionalAttrs (cfg.description != null) {
    PayloadDescription = cfg.description;
  } // lib.optionalAttrs (cfg.consentText != null) {
    ConsentText = { default = cfg.consentText; };
  } // lib.optionalAttrs cfg.removalDisallowed {
    PayloadRemovalDisallowed = true;
  };

  # Convert to plist using a derivation
  generateMobileconfig = pkgs.runCommand "profile.mobileconfig"
    {
      nativeBuildInputs = [ pkgs.python3 ];
      profileJson = builtins.toJSON profileContent;
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
      description = "Whether the profile applies to the user or the system.";
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
      description = "The path relative to HOME where the mobileconfig file will be written.";
    };

    # Payloads are declared by the imported modules as
    #   programs.macprofile.payloads.<manifest>.<instance>
    # Each manifest is a `types.attrsOf (types.submodule ...)`, so multiple
    # instances of the same payload type are supported. Use the instance name
    # "default" when a single instance is all you need.
  };

  config = mkIf cfg.enable {
    assertions = uniqueAssertions ++ legacyAssertions;

    # Only generate if there are enabled payloads
    home.file.${cfg.outputPath} = mkIf (enabledPayloads != [ ]) {
      source = generateMobileconfig;
    };

    # Provide an activation script to optionally install the profile
    home.activation.installMacProfile = mkIf (enabledPayloads != [ ]) (
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        if [[ "$OSTYPE" == "darwin"* ]]; then
          PROFILE_PATH="$HOME/${cfg.outputPath}"
          if [[ -f "$PROFILE_PATH" ]]; then
            $DRY_RUN_CMD echo "macOS profile generated at: $PROFILE_PATH"
            $DRY_RUN_CMD echo "To install, run: open \"$PROFILE_PATH\""
            $DRY_RUN_CMD echo "Or install via System Settings > Privacy & Security > Profiles"
          fi
        fi
      ''
    );
  };
}
