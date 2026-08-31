# Auto-generated from ProfileManifests: com.parallels.desktop.managedprefs.plist
# Domain: com.parallels.desktop.managedprefs
# Title: Parallels Desktop for Mac
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Parallels Desktop for Mac";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.parallels.desktop.managedprefs";
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
        default = [ "ActivationExperience" "LicenseKey" "SsoEmailDialogHeaderText" "SsoEmailDialogDescriptionText" "SsoEmailDialogLabelText" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      ActivationExperience = lib.mkOption {
        type = types.nullOr (types.enum [ "License Key" "SSO" ]);
        default = null;
        description = "Select a method for activating Parallels Desktop for Mac";
      };

      LicenseKey = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Enter your 30-character license key:";
      };

      SsoEmailDialogHeaderText = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Enter SSO dialogue header text:";
      };

      SsoEmailDialogDescriptionText = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Enter SSO dialogue description text:";
      };

      SsoEmailDialogLabelText = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Enter SSO dialogue label text:";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-parallels-desktop-managedprefs" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Parallels Desktop for Mac (com.parallels.desktop.managedprefs) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}