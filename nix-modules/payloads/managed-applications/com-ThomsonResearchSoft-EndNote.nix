# Auto-generated from ProfileManifests: com.ThomsonResearchSoft.EndNote.plist
# Domain: com.ThomsonResearchSoft.EndNote
# Title: EndNote
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-ThomsonResearchSoft-EndNote" = {
    enable = lib.mkEnableOption "EndNote";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.ThomsonResearchSoft.EndNote";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AcceptedENX7_2EULA = lib.mkOption {
      type = types.nullOr (types.enum [ "1" "0" ]);
      default = "0";
      description = "Set to 1 to accept EndNote X7.2 and X8 EULA and hide the dialog from users.";
    };

    AcceptedENX9EULA = lib.mkOption {
      type = types.nullOr (types.enum [ "1" "0" ]);
      default = "0";
      description = "Set to 1 to accept EndNote X9 EULA and hide the dialog from users.";
    };

    ShowGettingStartedX9 = lib.mkOption {
      type = types.nullOr (types.enum [ "0" "1" ]);
      default = "1";
      description = "Set to 0 to disable EndNote Getting Started prompts.";
    };

    IgnoredVersions = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Suppress \"Important Update\" messaging at first run. Correct value is the whole version number, e.g. 2019.7.24.0. Mulitple versions can be specified.";
    };

  };
}