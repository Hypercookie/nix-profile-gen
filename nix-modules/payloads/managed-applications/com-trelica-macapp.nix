# Auto-generated from ProfileManifests: com.trelica.macapp.plist
# Domain: com.trelica.macapp
# Title: Trelica Browser Helper
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Trelica Browser Helper";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.trelica.macapp";
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
        default = [ "OrgId" "Domain" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      OrgId = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The unique identifier for your organization in Trelica.";
      };

      Domain = lib.mkOption {
        type = types.nullOr (types.enum [ "app.trelica.com" "eu.trelica.com" ]);
        default = null;
        description = "The domain your organization uses for Trelica. Use app.trelica.com for US-hosted organizations or eu.trelica.com for EU-hosted organizations.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-trelica-macapp" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Trelica Browser Helper (com.trelica.macapp) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}