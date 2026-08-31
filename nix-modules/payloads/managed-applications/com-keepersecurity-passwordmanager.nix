# Auto-generated from ProfileManifests: com.keepersecurity.passwordmanager.plist
# Domain: com.keepersecurity.passwordmanager
# Title: Keeper Security Password Manager
# Platforms: macOS
# Unique: yes

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
        description = "Whether macOS allows only one instance of this payload per profile.";
      };

      _displayName = lib.mkOption {
        internal = true;
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "PayloadDisplayName for this instance. Defaults to the domain.";
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
  options.programs.macprofile.payloads."managed-applications-com-keepersecurity-passwordmanager" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Keeper Security Password Manager (com.keepersecurity.passwordmanager) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}