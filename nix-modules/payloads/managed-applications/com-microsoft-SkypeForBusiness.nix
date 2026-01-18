# Auto-generated from ProfileManifests: com.microsoft.SkypeForBusiness.plist
# Domain: com.microsoft.SkypeForBusiness
# Title: Skype for Business
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-SkypeForBusiness" = {
    enable = lib.mkEnableOption "Skype for Business";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.microsoft.SkypeForBusiness";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    userName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The UPN (UserName) used to sign-in to Skype for Business.";
    };

    sipAddress = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The SIP address (Email) used to sign-in to Skype for Business.";
    };

    userNameInAdvancedOnly = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Specify where the User Name field is displayed during sign-in.";
    };

    autoAcceptTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Auto-Accept timeout for users without Server-side Conversation History.";
    };

    warnWhenUnknownLocationForE911 = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Warns the user when dialing an emergency number from an unknown location.";
    };

    autoDetectAutoDicoveryURLs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Specify how Skype for Business identifies the transport and server to use during sign-in. (The misspelling of Discovery in the key is intentional.)";
    };

    internalAutoDiscoveryURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    externalAutoDiscoveryURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    httpProxyDomain = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    httpProxyUserName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    httpProxyPassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    trustedDomainList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "List of trusted domains for HTTP redirects.";
    };

  };
}