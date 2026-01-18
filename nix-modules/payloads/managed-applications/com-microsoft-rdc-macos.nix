# Auto-generated from ProfileManifests: com.microsoft.rdc.macos.plist
# Domain: com.microsoft.rdc.macos
# Title: Windows App
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-rdc-macos" = {
    enable = lib.mkEnableOption "Windows App";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.microsoft.rdc.macos";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    "ClientSettings.FirstRunExperienceLaunchedVersion" = lib.mkOption {
      type = types.nullOr (types.enum [ "1" ]);
      default = null;
      description = "Disable the first run dialog \"Help us make your experience better\".";
    };

    "ClientSettings.DisableTelemetryUpload" = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable upload of telemetry data.";
    };

    "ClientSettings.EnforceCredSSPSupport" = lib.mkOption {
      type = types.nullOr (types.enum [ "0" ]);
      default = null;
      description = "Support for all possible values of the \"EnableCredSspSupport\" and \"Authentication Level\" RDP file settings if this key is set to 0.";
    };

  };
}