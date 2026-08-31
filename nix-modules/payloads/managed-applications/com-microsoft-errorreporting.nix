# Auto-generated from ProfileManifests: com.microsoft.errorreporting.plist
# Domain: com.microsoft.errorreporting
# Title: Microsoft Error Reporting
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Microsoft Error Reporting";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.microsoft.errorreporting";
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
        default = [ "IsAttachedEnabled" "IsStoreLastCrashEnabled" "SendCrashReportsEvenWithTelemetryDisabled" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      IsAttachedEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disable attaching the file that caused the crash in the crash report. If you are working in a sensitive business it is recommended to set this to false.";
      };

      IsStoreLastCrashEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Will store the last crash report in the following path: ~/Library/Group Containers/UBF8T346G9.ms/MerpTempItems";
      };

      SendCrashReportsEvenWithTelemetryDisabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disable upload of telemetry data in Crash Reports.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-errorreporting" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Microsoft Error Reporting (com.microsoft.errorreporting) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}