# Auto-generated from ProfileManifests: com.microsoft.rdc.macos.plist
# Domain: com.microsoft.rdc.macos
# Title: Windows App
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Windows App";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.microsoft.rdc.macos";
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

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "system" "user" ];
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
        default = [ "ClientSettings.FirstRunExperienceLaunchedVersion" "ClientSettings.DisableTelemetryUpload" "ClientSettings.EnforceCredSSPSupport" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-rdc-macos" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Windows App (com.microsoft.rdc.macos) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}