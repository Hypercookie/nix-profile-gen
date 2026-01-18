# Auto-generated from ProfileManifests: com.microsoft.errorreporting.plist
# Domain: com.microsoft.errorreporting
# Title: Microsoft Error Reporting
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-errorreporting" = {
    enable = lib.mkEnableOption "Microsoft Error Reporting";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.microsoft.errorreporting";
      description = "The payload domain (PayloadType) for this manifest.";
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
}