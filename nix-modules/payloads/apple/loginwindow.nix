# Auto-generated from ProfileManifests: loginwindow.plist
# Domain: loginwindow
# Title: Login Window: Login Items
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Login Window: Login Items";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "loginwindow";
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
        default = [ "DisableLoginItemsSuppression" "AutoLaunchedApplicationDictionary_managed" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      DisableLoginItemsSuppression = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', the system prevents the user from disabling login item launches by using the Shift key.";
      };

      AutoLaunchedApplicationDictionary_managed = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            Hide = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Hide application at launch.";
            };
            AuthenticateAsLoginUserShortName = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Authenticate to the URL with the current users short name. Required if URL is specified, but not for Path";
            };
            MCX_NetworkHomeDirectoryItem = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Mount network home.";
            };
          };
        }));
        default = null;
        description = "Automatically launch the users network home share point when logging in.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-loginwindow" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Login Window: Login Items (loginwindow) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}