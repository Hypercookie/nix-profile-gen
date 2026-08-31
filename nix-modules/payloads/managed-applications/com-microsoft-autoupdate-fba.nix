# Auto-generated from ProfileManifests: com.microsoft.autoupdate.fba.plist
# Domain: com.microsoft.autoupdate.fba
# Title: Microsoft AutoUpdate FBA
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Microsoft AutoUpdate FBA";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.microsoft.autoupdate.fba";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
        description = "Whether macOS allows only one instance of this payload per profile.";
      };

      _displayName = lib.mkOption {
        internal = true;
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "PayloadDisplayName for this instance. Defaults to the domain.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "SendAllTelemetryEnabled" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      SendAllTelemetryEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls wether diagnostic data transmission is on or off.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-autoupdate-fba" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Microsoft AutoUpdate FBA (com.microsoft.autoupdate.fba) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}