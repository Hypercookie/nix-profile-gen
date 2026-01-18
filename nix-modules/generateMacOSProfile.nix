# nix-modules/default.nix
# Home Manager module for macOS configuration profiles
{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.macprofile;

  # Filter out null values recursively from an attribute set and lists
  filterNulls = value:
    if value == null then
      null
    else if builtins.isAttrs value then
      # Filter null values from attribute sets
      let
        filtered = lib.filterAttrs (name: val: val != null) value;
        # Recursively filter nested structures
        result = lib.mapAttrs (name: val: filterNulls val) filtered;
      in
      # Only return non-empty attribute sets
      if result == { } then null else result
    else if builtins.isList value then
      # Filter null values from lists and recursively filter elements
      let
        filtered = lib.filter (x: x != null) (map filterNulls value);
      in
      # Return null for empty lists (or keep them? Let's keep empty lists)
      filtered
    else
      value;

  # Convert a payload config to the plist-ready format
  # manifestName is the key (e.g., "com-apple-MCX-TimeServer")
  # payloadCfg contains the config including _domain (the actual domain like "com.apple.MCX")
  payloadToAttrs = manifestName: payloadCfg:
    let
      # Extract the domain from the config (stored as _domain)
      domain = payloadCfg._domain or manifestName;
      # Remove internal keys and filter nulls
      cleanedCfg = filterNulls (removeAttrs payloadCfg [ "enable" "_domain" ]);
    in
    if payloadCfg.enable && cleanedCfg != { }
    then {
      PayloadType = domain;
      PayloadIdentifier = "${cfg.organizationIdentifier}.${domain}";
      PayloadUUID = builtins.hashString "sha256" "${cfg.organizationIdentifier}.${domain}";
      PayloadDisplayName = domain;
      PayloadVersion = 1;
    } // cleanedCfg
    else null;

  # Collect all enabled payloads
  # Access payloads directly from config (they're defined by imported modules)
  payloadsConfig = config.programs.macprofile.payloads or { };
  enabledPayloads = lib.filterAttrs (name: value: value != null)
    (lib.mapAttrs payloadToAttrs payloadsConfig);

  # Generate the complete mobileconfig profile structure
  profileContent = {
    PayloadContent = lib.attrValues enabledPayloads;
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

  # Convert to plist XML using a derivation
  generateMobileconfig = pkgs.runCommand "profile.mobileconfig" {
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

    # Payloads are defined by the imported modules - no need to declare here
    # Each imported payload module defines options.programs.macprofile.payloads."domain"
    # Use list-macprofile-options.py to discover available payloads and their options
  };

  config = mkIf cfg.enable {
    # Only generate if there are enabled payloads
    home.file.${cfg.outputPath} = mkIf (enabledPayloads != { }) {
      source = generateMobileconfig;
    };

    # Provide an activation script to optionally install the profile
    home.activation.installMacProfile = mkIf (enabledPayloads != { }) (
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
