# Auto-generated from ProfileManifests: com.apple.coreservices.uiagent.plist
# Domain: com.apple.coreservices.uiagent
# Title: CoreServices UIAgent
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "CoreServices UIAgent";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.coreservices.uiagent";
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
        default = [ "CSUIDisable32BitWarnings" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      CSUIDisable32BitWarnings = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Hides the one-time alert shown when opening a 32-bit application.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-coreservices-uiagent" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "CoreServices UIAgent (com.apple.coreservices.uiagent) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}