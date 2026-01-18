# Auto-generated from ProfileManifests: com.github.salopensource.sal.plist
# Domain: com.github.salopensource.sal
# Title: Sal
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-github-salopensource-sal" = {
    enable = lib.mkEnableOption "Sal";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.github.salopensource.sal";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    ServerURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "URL of your Sal server.";
    };

    BasicAuth = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Whether to use basic authentication on your server.";
    };

    key = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The machine group's key.";
    };

    SyncScripts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Download the scripts needed to run for your plugins from the server.";
    };

    SkipFacts = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "It is possible to not upload all the data produced by Facter. You may have facts that are duplicates of other information Sal collects, or you don't wish to upload them for security reasons.";
    };

    GetGrains = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Collect Salt grains and upload them to Sal.";
    };

    GetOhai = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Collect Ohai attributes and upload them to Sal.";
    };

    CACert = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Path to your sal certificate. Curl on 10.13 requires this for self-signed certificates or uploading the report data will fail.";
    };

    SSLClientKey = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Full path to your sal SSL client key file for mutual TLS";
    };

    SSLClientCertificate = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Absolute path to the SSL client certificate to use with mutual TLS when connecting to the sal server in PEM format.";
    };

  };
}