# Auto-generated from ProfileManifests: com.apple.ews.account.plist
# Domain: com.apple.ews.account
# Title: Exchange Web Services
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-ews-account" = {
    enable = lib.mkEnableOption "Exchange Web Services";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.ews.account";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    UserName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user name for this Exchange account. Required for noninteractive installation, such as through MDM. If missing, the system prompts the user for it during interactive profile installation.";
    };

    EmailAddress = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The full email address for the account. If the email address string isn't present in the payload, the device prompts for it during profile installation.";
    };

    Password = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The password of the account. Use only with encrypted profiles.";
    };

    IdentificationUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The UUID of the Identification Payload to use as the source for user values.";
    };

    Host = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Exchange server host name or IP address. Ignored if using OAuth.";
    };

    Port = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The server port number.";
    };

    Path = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The server path.";
    };

    SSL = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'true', the system enables SSL.";
    };

    ExternalHost = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The external server address.";
    };

    ExternalPort = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The external server port number.";
    };

    ExternalPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The external server path.";
    };

    ExternalSSL = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'true', the system enables SSL for connections to the external server.";
    };

    OAuth = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables OAuth for authentication. Don't specify a password if 'OAuth' is 'true'. Available in macOS 10.14 and later";
    };

    OAuthSignInURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The URL to load into a web view for authentication through OAuth when autodiscovery isn't used. This setting requires a 'Host' value.";
    };

    AuthenticationCertificateUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The UUID of the certificate payload within the same profile to use for the identity credential. Supported on macOS 10.11 or later. On macOS 10.12 or later use the PayloadCertificateUUID.";
    };

    allowMailDrop = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables Mail Drop.";
    };

  };
}