# Auto-generated from ProfileManifests: com.apple.ADCertificate.managed.plist
# Domain: com.apple.ADCertificate.managed
# Title: Active Directory Certificate
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-ADCertificate-managed" = {
    enable = lib.mkEnableOption "Active Directory Certificate";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.ADCertificate.managed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Description = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A user-friendly description of the certification identity.";
    };

    CertServer = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The fully qualified host name of the CA.";
    };

    CertificateAuthority = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The name of the certificate authority (CA), which is determined from the common name (CN) of the Active Directory entry. Available in macOS 10.8 and later. Valid values:\n\n- CN=<your CA Name>\n- CN='Certification Authorities'\n- CN='Public Key Services'\n- CN='Services'\n- CN='Configuration'\n- CN=<your base Domain Name>";
    };

    CertTemplate = lib.mkOption {
      type = types.nullOr (types.str);
      default = "User";
      description = "The certificate template for your environment. The default user certificate value is \\'User\\'. The default computer certificate value is \\'Machine\\'.";
    };

    CertificateAcquisitionMechanism = lib.mkOption {
      type = types.nullOr (types.enum [ "RPC" "HTTP" ]);
      default = null;
      description = "This value is most commonly 'RPC'; if using web enrollment, use 'HTTP'. Available in macOS 10.8 and later.";
    };

    CertificateRenewalTimeInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = 14;
      description = "The number of days in advance of certificate expiration that the notification center notifies the user.";
    };

    Keysize = lib.mkOption {
      type = types.nullOr (types.int);
      default = 2048;
      description = "The RSA key size for the certificate signing request (CSR). Available in macOS 10.11 and later.";
    };

    PromptForCredentials = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system prompts the user for credentials when is installs the profile. This key applies only to user certificates with the Manual Download profile delivery method. Omit this key for computer certificates. Available in macOS 10.8 and later.";
    };

    UserName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user name with which to authenticate to the certificate server";
    };

    Password = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The password with which to authenticate to the certificate server";
    };

    AllowAllAppsAccess = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', gives apps access to the private key. Available in macOS 10.10 and later.";
    };

    KeyIsExtractable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system allows exporting the private key. Available in macOS 10.10 and later.";
    };

    EnableAutoRenewal = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the certificate obtained with this payload attempts auto-renewal. Auto-renewal can only be used with device Active Directory certificate payloads. Available in macOS 10.13.4 and later.";
    };

  };
}