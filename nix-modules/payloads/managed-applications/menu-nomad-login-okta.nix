# Auto-generated from ProfileManifests: menu.nomad.login.okta.plist
# Domain: menu.nomad.login.okta
# Title: NoMAD Login+
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-menu-nomad-login-okta" = {
    enable = lib.mkEnableOption "NoMAD Login+";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "menu.nomad.login.okta";
      description = "The payload domain (PayloadType) for this manifest.";
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
      default = "nomadoauth://oauth-callback/okta";
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
}