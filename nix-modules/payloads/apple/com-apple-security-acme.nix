# Auto-generated from ProfileManifests: com.apple.security.acme.plist
# Domain: com.apple.security.acme
# Title: ACME Certificate
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-security-acme" = {
    enable = lib.mkEnableOption "ACME Certificate";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.security.acme";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    DirectoryURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The directory URL of the ACME server. The URL must use the https scheme.";
    };

    ClientIdentifier = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A unique string identifying a specific device. The server may use this as an anti-replay code to prevent issuing multiple certificates. This identifier also indicates to the ACME server that the device has access to a valid client identifier issued by the enterprise infrastructure. This can help the ACME server determine whether to trust the device. Though this is a relatively weak indication because of the risk that an attacker can intercept the client identifier.";
    };

    KeySize = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The valid values for 'KeySize' depend on the values of 'KeyType' and 'HardwareBound'. See those keys for specific requirements.";
    };

    KeyType = lib.mkOption {
      type = types.nullOr (types.enum [ "RSA" "ECSECPrimeRandom" ]);
      default = null;
      description = "The type of key pair to generate. Allowed values:\n\n- 'RSA': Specifies an RSA key pair. RSA key pairs need to have a 'KeySize' that's a multiple of 8 in the range of 1024 through 4096 (inclusive), and 'HardwareBound' needs to be 'false'.\n- 'ECSECPrimeRandom': Specifies a key pair on the P-192, P-256, P-384, or P-521 curves as defined in FIPS Pub 186-4. 'KeySize' defines the particular curve, which needs to be '192', '256', '384', or '521'. Hardware bound keys only support values of '256' and '384'.\n\nNote:\nThe key size is '521', not '512', even though the other key sizes are multiples of 64.";
    };

    HardwareBound = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the private key isn't bound to the device.\n\nIf 'true', the private key is bound to the device. The Secure Enclave generates the key pair, and the private key is cryptographically entangled with a system key. This prevents the system from exporting the private key.\n\nIf 'true', 'KeyType' must be 'ECSECPrimeRandom' and 'KeySize' must be 256 or 384.\n\nSetting this key to 'true' is supported as of macOS 14 on Apple Silicon and Intel devices that have a T2 chip. Older macOS versions or other Mac devices require this key but it must have a value of 'false'.";
    };

    Subject = lib.mkOption {
      type = types.nullOr (types.listOf (types.listOf (types.listOf (types.str))));
      default = null;
      description = "The device requests this subject for the certificate that the ACME server issues. The ACME server may override or ignore this field in the certificate it issues.\n\nThe representation of a X.500 name represented as an array of OID and value. For example, '/C=US/O=Apple Inc./CN=foo/1.2.5.3=bar' corresponds to:\n\n'[ [ [\"C\", \"US\"] ], [ [\"O\", \"Apple Inc.\"] ], ..., [ [ \"1.2.5.3\", \"bar\" ] ] ]'\n\nDotted numbers can represent OIDs , with shortcuts for country (C), locality (L), state (ST), organization (O), organizational unit (OU), and common name (CN).";
    };

    SubjectAltName = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          rfc822Name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The RFC 822 (email address) string.";
          };
          dNSName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The DNS name.";
          };
          uniformResourceIdentifier = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The Uniform Resource Identifier.";
          };
          ntPrincipalName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The NT principal name. Use an other name OID set to '1.3.6.1.4.1.311.20.2.3'.";
          };
        };
      });
      default = null;
      description = "The Subject Alt Name that the device requests for the certificate that the ACME server issues. The ACME server may override or ignore this field in the certificate it issues.";
    };

    UsageFlags = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "This value is a bit field.\n\n- Bit '0x01' indicates digital signature.\n- Bit '0x04' indicates encryption.\n\nThe device requests this key for the certificate that the ACME server issues. The ACME server may override or ignore this field in the certificate it issues.";
    };

    ExtendedKeyUsage = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The value is an array of strings. Each string is an OID in dotted notation. For instance, '[\"1.3.6.1.5.5.7.3.2\", \"1.3.6.1.5.5.7.3.4\"]' indicates client authentication and email protection.\n\nThe device requests this field for the certificate that the ACME server issues. The ACME server may override or ignore this field in the certificate it issues.";
    };

    Attest = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the device provides attestations that describe the device and the generated key to the ACME server. The server can use the attestations as strong evidence that the key is bound to the device, and that the device has properties listed in the attestation. The server can use that as part of a trust score to decide whether to issue the requested certificate.\n\nWhen 'Attest' is 'true', 'HardwareBound' also needs to be 'true'.\n\nSetting this key to 'true' is supported as of macOS 14. Older macOS versions require this key but it must have a value of 'false'. See below for hardware requirements.";
    };

    KeyIsExtractable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'true', the private key of the identity obtained through Automated Certificate Management Environment (ACME) needs to be tagged as \"non-extractable\" in the keychain.";
    };

    AllowAllAppsAccess = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', all apps have access to the private key.";
    };

  };
}