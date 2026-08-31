# Auto-generated from ProfileManifests: com.apple.MCX.FileVault2.plist
# Domain: com.apple.MCX.FileVault2
# Title: FDE FileVault
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "FDE FileVault";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.MCX.FileVault2";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
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
        default = [ "system" ];
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
        default = [ "Enable" "Defer" "UserEntersMissingInfo" "UseRecoveryKey" "ShowRecoveryKey" "OutputPath" "Certificate" "Username" "Password" "UseKeychain" "DeferForceAtUserLoginMaxBypassAttempts" "DeferDontAskAtUserLogout" "ForceEnableInSetupAssistant" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      Enable = lib.mkOption {
        type = types.nullOr (types.enum [ "On" "Off" ]);
        default = null;
        description = "Set to 'On' to enable FileVault and set to 'Off' to disable FileVault. Payloads set to 'On' sent through MDM need to either include full authentication information in the payload or have the 'Defer' option set to 'true'. When 'Defer' is 'true', the system prompts for the authentication information when the user enables FileVault.";
      };

      Defer = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system defers enabling FileVault until the designated user logs out. For details, see 'fdesetup(8)'. Only a local user or a mobile account user can enable FileVault.";
      };

      UserEntersMissingInfo = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system enables a prompt for missing user name or password fields.";
      };

      UseRecoveryKey = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system creates a personal recovery key and displays it to the user.";
      };

      ShowRecoveryKey = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'false', the system prevents display of the personal recovery key to the user after the system enables FileVault.";
      };

      OutputPath = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The path to the location of the recovery key and computer information property list.";
      };

      Certificate = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The DER-encoded certificate data if the system creates an institutional recovery key. This key isn't supported on a Mac with Apple silicon.";
      };

      Username = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The user name of the Open Directory user to add to FileVault.";
      };

      Password = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The password of the Open Directory user to add to FileVault. Use the 'UserEntersMissingInfo' key to prompt for this information.";
      };

      UseKeychain = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true' and you don't include certificate information in this payload, the system uses the keychain created at '/Library/Keychains/FileVaultMaster.keychain' when it adds the institutional recovery key.";
      };

      DeferForceAtUserLoginMaxBypassAttempts = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The maximum number of times users can bypass enabling FileVault before the system requires the user to enable it to log in. If the value is '0', the system requires the user to enable FileVault the next time they attempt to log in. Set this key to '-1' to disable this feature.";
      };

      DeferDontAskAtUserLogout = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system prevents requests to enable FileVault at user logout time.";
      };

      ForceEnableInSetupAssistant = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', and installation of this payload occurs after enrolling with MDM in Setup Assistant, the system requests Setup Assistant to enable FileVault at setup time.\nTo use this, enable the Await Device Configured DEP configuration option and send this profile with this key set, before sending the 'DeviceConfiguredCommand'.\nAn admin SecureToken user is required, otherwise the FileVault pane does not appear.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-MCX-FileVault2" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "FDE FileVault (com.apple.MCX.FileVault2) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}