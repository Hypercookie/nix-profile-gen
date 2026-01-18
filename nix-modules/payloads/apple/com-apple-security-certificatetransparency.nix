# Auto-generated from ProfileManifests: com.apple.security.certificatetransparency.plist
# Domain: com.apple.security.certificatetransparency
# Title: Certificate Transparency
# Platforms: macOS, iOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-security-certificatetransparency" = {
    enable = lib.mkEnableOption "Certificate Transparency";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.security.certificatetransparency";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    DisabledForDomains = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of strings that represent the domains to exclude from certificate transparency enforcement. The system supports using a leading period ('.') to signify subdomains. However, the system doesn't support wildcards. If you include a leading period, the domain can't be a top-level domain, such as '.com' and '.co.uk'.";
    };

    DisabledForCerts = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Algorithm = lib.mkOption {
            type = types.nullOr (types.enum [ "sha256" ]);
            default = null;
            description = "The algorithm must be 'sha256'.";
          };
          Hash = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The hash of the DER-encoding of the certificate's 'subjectPublicKeyInfo'.\n\nThe hash field requires the data ('subjectPublicKeyInfo' hash) in a specific format: a Base64 encoded (binary) SHA-256 hash of the certificate's public key.";
          };
        };
      }));
      default = null;
      description = "An array of certificates for which certificate transparency is disabled. One of the following conditions needs to be met to disable certificate transparency enforcement when this policy is set:\n\n- The hash is of the server certificate's 'subjectPublicKeyInfo'.\n- The hash is of a 'subjectPublicKeyInfo' that appears in a CA certificate in the certificate chain; the CA certificate is constrained through the X.509v3 'nameConstraints' extension. One or more 'directoryName' 'nameConstraints' are present in the 'permittedSubtrees', and the 'directoryName' contains an 'organizationName' attribute.\n- The hash is of a 'subjectPublicKeyInfo' that appears in a CA certificate in the certificate chain. The CA certificate has one or more 'organizationName' attributes in the certificate 'Subject', and the server's certificate contains the same number of 'organizationName' attributes, in the same order, and with byte-for-byte identical values.";
    };

  };
}