# Auto-generated from ProfileManifests: com.granola.app.plist
# Domain: com.granola.app
# Title: Granola
# Platforms: macOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Granola";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.granola.app";
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
        default = [ "DisableOAuth" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      DisableOAuth = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If true, removes the personal Google and Microsoft account sign-in options and requires people to sign in with SSO. Make sure SSO is configured for your workspace before enabling this setting. This setting changes the sign-in options shown in the app; it does not configure SSO or sign out people who are already signed in. Deploy to the device channel.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-granola-app" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Granola (com.granola.app) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}