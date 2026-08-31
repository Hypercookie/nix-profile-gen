# Auto-generated from ProfileManifests: com.microsoft.Office365ServiceV2.plist
# Domain: com.microsoft.Office365ServiceV2
# Title: Microsoft Office 365 Service
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Microsoft Office 365 Service";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.microsoft.Office365ServiceV2";
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
        description = "Set to false to send minimal heartbeat data, no application usage, and no environment details.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-Office365ServiceV2" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Microsoft Office 365 Service (com.microsoft.Office365ServiceV2) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}