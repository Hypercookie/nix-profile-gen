# Auto-generated from ProfileManifests: com.jelockwood.pinpoint.plist
# Domain: com.jelockwood.pinpoint
# Title: Pinpoint
# Platforms: macOS
# Unique: no
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Pinpoint";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.jelockwood.pinpoint";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
        description = "Whether macOS allows only one instance of this payload per profile.";
      };

      _displayName = lib.mkOption {
        internal = true;
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "PayloadDisplayName for this instance. Defaults to the domain.";
      };

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "system" ];
        description = "Profile scopes this payload may be installed into (pfm_targets).";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "YOUR_API_KEY" "USE_GEOCODE" "USE_ALTITUDE" "OPTIMISE" "DEBUG" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      YOUR_API_KEY = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "API key for using the Google location service API.";
      };

      USE_GEOCODE = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true then pinpoint will also use the Google Geocode API to look up the street address for the location, if set to false it skips this and records the location as an empty string but saves on an additional API call thereby either preventing you exceeding your quota or reducing the cost.";
      };

      USE_ALTITUDE = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If set to true then pinpoint will also use the Google Elevation API to determine the altitude, if set to false it skips this and records the altitude as zero but saves on an additional API call thereby either preventing you exceeding your quota or reducing the cost.";
      };

      OPTIMISE = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Optional feature designed to reduce i.e. 'optimise' the use of the Google APIs and therefore reduce the potential bill use of these APIs might result in.";
      };

      DEBUG = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If enabled logs to /var/log/pinpoint.log";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-jelockwood-pinpoint" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Pinpoint (com.jelockwood.pinpoint) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}