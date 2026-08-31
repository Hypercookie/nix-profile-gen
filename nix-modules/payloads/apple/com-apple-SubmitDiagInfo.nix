# Auto-generated from ProfileManifests: com.apple.SubmitDiagInfo.plist
# Domain: com.apple.SubmitDiagInfo
# Title: Submit Diagnostic Information
# Platforms: macOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Submit Diagnostic Information";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.SubmitDiagInfo";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "AutoSubmit" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      AutoSubmit = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Configures the automatic submission of diagnostic information to Apple.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-SubmitDiagInfo" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Submit Diagnostic Information (com.apple.SubmitDiagInfo) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}