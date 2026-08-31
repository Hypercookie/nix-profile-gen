# Auto-generated from ProfileManifests: com.apple.security.pkcs12.plist
# Domain: com.apple.security.pkcs12
# Title: Certificate (PKCS #12)
# Platforms: iOS, macOS, tvOS
# Unique: no
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Certificate (PKCS #12)";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.security.pkcs12";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
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
        default = [ "Password" "AllowAllAppsAccess" "KeyIsExtractable" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Password = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The password to the identity.";
      };

      AllowAllAppsAccess = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system allows apps access to the private key. Available in macOS 10.10 and later.";
      };

      KeyIsExtractable = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'false', the system doesn't tag the private key data as extractable in the keychain.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-security-pkcs12" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Certificate (PKCS #12) (com.apple.security.pkcs12) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}