# Auto-generated from ProfileManifests: com.apple.MCX.FileVault2.plist
# Domain: com.apple.MCX.FileVault2
# Title: FDE FileVault
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-MCX-FileVault2" = {
    enable = lib.mkEnableOption "FDE FileVault";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.MCX.FileVault2";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Enable = lib.mkOption {
      type = types.nullOr (types.enum [ "On" "Off" ]);
      default = null;
      description = "Set to 'On' to enable FileVault and set to 'Off' to disable FileVault. Payloads set to 'On' sent through MDM need to either include full authentication information in the payload or have the 'Defer' option set to 'true'. When 'Defer' is 'true', the system prompts for the authentication information when the user enables FileVault.";
    };

    Defer = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system defers enabling FileVault until the designated user logs out. For details, see 'fdesetup(8)'. Only a local user or a mobile account user can enable FileVault.";
    };

    UserEntersMissingInfo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables a prompt for missing user name or password fields.";
    };

    UseRecoveryKey = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'true', the system creates a personal recovery key and displays it to the user.";
    };

    ShowRecoveryKey = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
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
      default = false;
      description = "If 'true' and you don't include certificate information in this payload, the system uses the keychain created at '/Library/Keychains/FileVaultMaster.keychain' when it adds the institutional recovery key.";
    };

    DeferForceAtUserLoginMaxBypassAttempts = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The maximum number of times users can bypass enabling FileVault before the system requires the user to enable it to log in. If the value is '0', the system requires the user to enable FileVault the next time they attempt to log in. Set this key to '-1' to disable this feature.";
    };

    DeferDontAskAtUserLogout = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system prevents requests to enable FileVault at user logout time.";
    };

    ForceEnableInSetupAssistant = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', and installation of this payload occurs after enrolling with MDM in Setup Assistant, the system requests Setup Assistant to enable FileVault at setup time.\n\nTo use this, enable the Await Device Configured DEP configuration option and send this profile with this key set, before sending the 'DeviceConfiguredCommand'.\n\nAn admin SecureToken user is required, otherwise the FileVault pane does not appear.";
    };

  };
}