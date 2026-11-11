# Auto-generated from ProfileManifests: com.keepersecurity.passwordmanager.plist
# Domain: com.keepersecurity.passwordmanager
# Title: Keeper Security Password Manager
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Keeper Security Password Manager";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.keepersecurity.passwordmanager";
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
        default = [ "DomainName" "Region" "HideCreateAccount" "UseDefaultBrowserForSSO" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      DomainName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Enterprise SSO Domain to pre-populate on app launch.";
      };

      Region = lib.mkOption {
        type = types.nullOr (types.enum [ "us" "eu" "au" "usg" ]);
        default = null;
        description = "Region identifier where your Keeper tenant is hosted.";
      };

      HideCreateAccount = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Hides the Create Account button from the start page";
      };

      UseDefaultBrowserForSSO = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Routes the user to their default web browser for SSO authentication instead of using a popup window.";
      };

    };
  };
in
{
  options.payloads."managed-applications-com-keepersecurity-passwordmanager" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Keeper Security Password Manager (com.keepersecurity.passwordmanager) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}