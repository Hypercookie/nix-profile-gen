# Auto-generated from ProfileManifests: menu.nomad.login.okta.plist
# Domain: menu.nomad.login.okta
# Title: NoMAD Login+
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "NoMAD Login+";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "menu.nomad.login.okta";
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
        default = [ "PFC_SegmentedControl_0" "AuthServer" "DenyLocal" "DenyLocalExcluded" "LocalFallback" "Migrate" "MigrateUsersHide" "LoginLogo" "BackgroundImage" "HelpURL" "OIDCAccessClientID" "OIDCAdminClientID" "OIDCAuthServer" "OIDCRedirectURI" "OIDCSecondaryLoginClientID" "CreateAdminUser" "EnableFDE" "EnableFDERecoveryKey" "EnableFDERecoveryKeyPath" "LAPSUser" "ScriptPath" "ScriptArgs" "DemobilizeUsers" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      PFC_SegmentedControl_0 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      AuthServer = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      DenyLocal = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      DenyLocalExcluded = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
      };

      LocalFallback = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      Migrate = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      MigrateUsersHide = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
      };

      LoginLogo = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      BackgroundImage = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      HelpURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      OIDCAccessClientID = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      OIDCAdminClientID = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      OIDCAuthServer = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      OIDCRedirectURI = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      OIDCSecondaryLoginClientID = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      CreateAdminUser = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      EnableFDE = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      EnableFDERecoveryKey = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      EnableFDERecoveryKeyPath = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      LAPSUser = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      ScriptPath = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      ScriptArgs = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
      };

      DemobilizeUsers = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-menu-nomad-login-okta" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "NoMAD Login+ (menu.nomad.login.okta) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}