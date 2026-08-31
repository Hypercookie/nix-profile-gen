# Auto-generated from ProfileManifests: com.apple.screensaver.plist
# Domain: com.apple.screensaver
# Title: Screensaver
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Screensaver";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.screensaver";
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
        default = [ "askForPassword" "askForPasswordDelay" "loginWindowModulePath" "idleTime" "moduleName" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      askForPassword = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the user is prompted for a password when the screen saver is unlocked or stopped. When you use this prompt, you must also provide 'askForPasswordDelay'. Available in macOS 10.13 and later.";
      };

      askForPasswordDelay = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The number of seconds to delay before the password will be required to unlock or stop the screen saver (the grace period). A value of '2147483647' (for example, '0x7FFFFFFF') disables this requirement. To use this option, you must set 'askForPassword' to 'true'. Available in macOS 10.13 and later.";
      };

      loginWindowModulePath = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The full path to the screen-saver module to use.";
      };

      idleTime = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The number of seconds of inactivity before the screen saver activates (0 = Never activate).";
      };

      moduleName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The name of the screen saver module.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-screensaver" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Screensaver (com.apple.screensaver) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}