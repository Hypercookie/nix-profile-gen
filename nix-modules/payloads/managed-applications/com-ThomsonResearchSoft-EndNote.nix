# Auto-generated from ProfileManifests: com.ThomsonResearchSoft.EndNote.plist
# Domain: com.ThomsonResearchSoft.EndNote
# Title: EndNote
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "EndNote";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.ThomsonResearchSoft.EndNote";
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
        default = [ "AcceptedENX7.2EULA" "AcceptedENX9EULA" "ShowGettingStartedX9" "IgnoredVersions" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      "AcceptedENX7.2EULA" = lib.mkOption {
        type = types.nullOr (types.enum [ "1" "0" ]);
        default = null;
        description = "Set to 1 to accept EndNote X7.2 and X8 EULA and hide the dialog from users.";
      };

      AcceptedENX9EULA = lib.mkOption {
        type = types.nullOr (types.enum [ "1" "0" ]);
        default = null;
        description = "Set to 1 to accept EndNote X9 EULA and hide the dialog from users.";
      };

      ShowGettingStartedX9 = lib.mkOption {
        type = types.nullOr (types.enum [ "0" "1" ]);
        default = null;
        description = "Set to 0 to disable EndNote Getting Started prompts.";
      };

      IgnoredVersions = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Suppress \"Important Update\" messaging at first run. Correct value is the whole version number, e.g. 2019.7.24.0. Mulitple versions can be specified.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-ThomsonResearchSoft-EndNote" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "EndNote (com.ThomsonResearchSoft.EndNote) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}