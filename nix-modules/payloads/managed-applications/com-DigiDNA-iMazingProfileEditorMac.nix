# Auto-generated from ProfileManifests: com.DigiDNA.iMazingProfileEditorMac.plist
# Domain: com.DigiDNA.iMazingProfileEditorMac
# Title: iMazing Profile Editor
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "iMazing Profile Editor";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.DigiDNA.iMazingProfileEditorMac";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
        description = "Whether only one instance of this payload is allowed per profile.";
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

      _platforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "macOS" ];
        description = "Supported Apple platforms (pfm_platforms).";
      };

      _keyPlatforms = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.attrs;
        default = [ ];
        description = "Keys restricted to a subset of the manifest's platforms (key-level pfm_platforms).";
      };

      _allowUnsupportedPlatform = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Emit this instance even if its manifest says the target platform does not support it or some of its keys. Produces a warning instead of an error.";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "preferencesDefaultsOrganizationName" "identifierPrefix" "preferencesDefaultsConsentText" "preferencesDefaultsSigningIdentity" "defaultSigningIdentity" "preferencesDefaultsAutomaticallyUpdate" "preferencesDefaultsUnsetDefaultBooleans" "manifestRepositoryType" "onlineManifestRepositoryAddress" "onlineManifestRepositoryBranchName" "maximizeNonStandardManifestCompatibility" "DevKitAutoUpdate" "DevKitAllowTracking" "noticeSuppressOnlineManifestsUpdated" "noticeSuppressIOS15SilentInstallationIncompatibility" "noticeSuppressProfileInvalid" "noticeSuppressSavedToIMazingLibrary" "hideSidebarTASShortcut" "attemptDismissingProfileInstallationNotice" "defaultPayloadContainer" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      preferencesDefaultsOrganizationName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The name of the organization that will be pre-filled by default in the Payload Organization property of the General settings section on newly created profiles.";
      };

      identifierPrefix = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The prefix of the UUID-style identifier that will be pre-filled by default in the Payload Identifier property of the General settings section on newly created profiles.";
      };

      preferencesDefaultsConsentText = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The consent text that will be pre-filled by default in the Consent Message property of the General settings section on newly created profiles.";
      };

      preferencesDefaultsSigningIdentity = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The signing identity that will be used by default to sign the profile on save. Identity must be installed in the device Keychain. Leave empty to disable profile signing by default.";
      };

      defaultSigningIdentity = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            issuerDistinguishedNameNormalized = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The normalized DER-encoded issuer distinguished name of the signing certificate.";
            };
            serialNumber = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The serial number of the signing certificate.";
            };
          };
        });
        default = null;
        description = "The signing identity that will be used by default to sign the profile on save. Identity must be installed in the device Keychain. Leave empty to disable profile signing by default.";
      };

      preferencesDefaultsAutomaticallyUpdate = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'false', the editor disables updating the default organization name, identifier prefix, consent message, and signing identity for newly created profiles from saved profiles. By default, when saving a profile, its values are used to update the defaults for all profiles.";
      };

      preferencesDefaultsUnsetDefaultBooleans = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'false', the editor will keep values of boolean properties regardless of if they are toggled to the property's known default. By default, the editor unsets such values on toggle to reduce clutter in saved profiles.";
      };

      manifestRepositoryType = lib.mkOption {
        type = types.nullOr (types.enum [ "online" "local" ]);
        default = null;
        description = "The type of the manifest repository that will be used to display the configuration options in the editor. Set to Online to retrieve the latest online manifests, or to local to use the manifests bundled with the app.";
      };

      onlineManifestRepositoryAddress = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The URL of the GitHub repository from which the editor will retrieve and periodically update preference manifests. The repository must be structured similarly to ProfileManifests but does not have to have been forked from it.";
      };

      onlineManifestRepositoryBranchName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The name of the branch in the repository defined in Online GitHub repository address that will be used for retrieving manifests.";
      };

      maximizeNonStandardManifestCompatibility = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'false', the editor will not make any changes to online or custom local manifests to optimize their display.";
      };

      DevKitAutoUpdate = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true' the editor will periodically check for its own updates.";
      };

      DevKitAllowTracking = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the editor may collect anonymous analytics data.";
      };

      noticeSuppressOnlineManifestsUpdated = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the editor will not show users notices when preference manifest are updated.";
      };

      noticeSuppressIOS15SilentInstallationIncompatibility = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the editor will not show users notices when profiles that have an iOS 15 silent-installation incompatibility are loaded. ";
      };

      noticeSuppressProfileInvalid = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the editor will not show users notices on profile save when the profile has validation issues.";
      };

      noticeSuppressSavedToIMazingLibrary = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true' the editor will not show users notices when saving a profile to the iMazing profile library.";
      };

      hideSidebarTASShortcut = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true' the sidebar shortcut to Total App Setup is not displayed.";
      };

      attemptDismissingProfileInstallationNotice = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true' the editor will attempt to quickly dismiss the \"Profile Downloaded\" notice shown by the system when installing a profile.";
      };

      defaultPayloadContainer = lib.mkOption {
        type = types.nullOr (types.enum [ "General" "MCXForced" "MCXSetOnce" ]);
        default = null;
        description = "Sets the default payload container type for newly added non-official and third-party domains. For official system domains the default container is always a general payload.";
      };

    };
  };
in
{
  options.payloads."managed-applications-com-DigiDNA-iMazingProfileEditorMac" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "iMazing Profile Editor (com.DigiDNA.iMazingProfileEditorMac) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}