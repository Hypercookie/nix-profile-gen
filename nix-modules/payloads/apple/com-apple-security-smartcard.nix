# Auto-generated from ProfileManifests: com.apple.security.smartcard.plist
# Domain: com.apple.security.smartcard
# Title: SmartCard
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-security-smartcard" = {
    enable = lib.mkEnableOption "SmartCard";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.security.smartcard";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    allowSmartCard = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables smart cards for logins, authorizations, and screen saver unlocking. It is still allowed for other functions, such as signing emails and accessing the web. A restart is required for a setting change to take effect.";
    };

    allowUnmappedUsers = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 ]);
      default = null;
      description = "If set to integer 1, allows users who aren't paired with a smart card to log in with password.";
    };

    UserPairing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', users don't get the pairing dialog, although existing pairings still work.";
    };

    oneCardPerUser = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', a user can pair with only one smart card, although existing pairings are allowed if already set up.";
    };

    checkCertificateTrust = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 ]);
      default = null;
      description = "Configures the certificate trust check and has one of the following possible values:\n\n- '0': Turns off certificate trust check.\n- '1': Turns on certificate trust check. A standard validity check is performed but doesn't include additional revocation checks.\n- '2': Turns on certificate trust check. A soft revocation check is also performed. Until the certificate is explicitly rejected by CRL/OCSP, it's considered valid. This setting means that unavailable or unreachable CRL/OCSP allow this check to succeed.\n- '3': Turns on certificate trust check. A hard revocation check is also performed. Unless CRL/OCSP explicitly says \"This certificate is OK,\" it's considered invalid. This option is the most secure.";
    };

    enforceSmartCard = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', a user can only log in or authenticate with a smart card. Available in macOS 10.13.2 and later.";
    };

    tokenRemovalAction = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 ]);
      default = null;
      description = "If '1', the system enables the screen saver when the smart card is removed. Available in macOS 10.13.4 and later.";
    };

  };
}