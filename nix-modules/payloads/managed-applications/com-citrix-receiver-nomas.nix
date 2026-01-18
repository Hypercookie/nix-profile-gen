# Auto-generated from ProfileManifests: com.citrix.receiver.nomas.plist
# Domain: com.citrix.receiver.nomas
# Title: Citrix Receiver
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-citrix-receiver-nomas" = {
    enable = lib.mkEnableOption "Citrix Receiver";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.citrix.receiver.nomas";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AutoUpdateState = lib.mkOption {
      type = types.nullOr (types.enum [ "Auto" "Manual" "FollowSF" "Disabled" ]);
      default = null;
      description = "Used to configure Citrix Receiver Updates state.";
    };

    AutoUpdateRollOutBucketIndex = lib.mkOption {
      type = types.nullOr (types.enum [ 0 4 9 ]);
      default = null;
      description = "Used to configure the Updates rollout period.";
    };

    PreferH264HardwareDecoder = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    PreferFFMPEGDecoder = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    MenuBarAutoShowDelayEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    MenuBarAutoShowDelay = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
    };

    UDPStackParameters = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    HockeySDKAutomaticallySendCrashReports = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    HockeySDKCrashReportActivated = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    TraceOn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    DisplaySplashScreen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    BITApplicationWasLaunched = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    CEIPEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    PreferMetalRendering = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    HDXOverUDPAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disables Enlightened Data Transport (EDT).";
    };

    LegacyPublishedContentEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allows the use of non-HTTP(S) URLs";
    };

    NetDisruptBrightness = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Configures the greyscale brightness used for an inactive session. 100 = transparent, 0 = black";
    };

    SecurityComplianceMode = lib.mkOption {
      type = types.nullOr (types.enum [ "None" "FIPS" "SP800-52" ]);
      default = null;
      description = "Sets the security compliance mode for the policy. If you don't configure SecurityComplianceMode, FIPS is used as the default value.";
    };

    SecurityAllowedTLSVersions = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "TLS10" "TLS11" "TLS12" ]));
      default = null;
      description = "This setting specifies the TLS protocol versions that should be accepted during protocol negotiation. This information is represented as an array and any combination of the possible values is supported. When this setting is not configured, the values TLS10, TLS11 and TLS12 are used as the default values. ";
    };

    SSLCertificateRevocationCheckPolicy = lib.mkOption {
      type = types.nullOr (types.enum [ "NoCheck" "CheckWithNoNetworkAccess" "FullAccessCheck" "FullAccessCheckAndCRLRequired" "FullAccessCheckAndCRLRequiredAll" ]);
      default = null;
      description = "This setting governs how a given trusted root certificate authority is treated during an attempt to open a remote session through SSL. When you enable this setting, the client checks whether or not the server's certificate is revoked.";
    };

  };
}