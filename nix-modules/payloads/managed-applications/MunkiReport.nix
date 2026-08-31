# Auto-generated from ProfileManifests: MunkiReport.plist
# Domain: MunkiReport
# Title: MunkiReport
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "MunkiReport";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "MunkiReport";
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
        default = [ "system" "user" ];
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
        default = [ "BaseUrl" "ReportItems" "Passphrase" "scriptTimeOut" "UseMunkiAdditionalHttpHeaders" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      BaseUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "BaseUrl tells MunkiReport where to find the MunkiReport server. It contains the full url to the server - and subdirectory - ending in a slash - /. Note: BaseUrl is set automatically when installing MunkiReport via the command line or a package.";
      };

      ReportItems = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
          };
        });
        default = null;
        description = "ReportItems contains a dictionary that tells MunkiReport where to look for the report files. The key is the name of the module, the value contains a path to the appropriate file. Note: ReportItems are set automatically when installing MunkiReport via the command line or a package.";
      };

      Passphrase = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "If you have the MunkiReport server configured to use passphrases, you need to set these on the client to allow it to report in.";
      };

      scriptTimeOut = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "By default, MunkiReport kills a script if it takes longer than 10 seconds to run. You can override this behavior by adding the scriptTimeOut preference key. The entry should consist of an integer containing the number of seconds that a script can run.";
      };

      UseMunkiAdditionalHttpHeaders = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If the munki repository and MunkiReport are served from the same server, it may be necessary to use the headers set in munki.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-MunkiReport" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "MunkiReport (MunkiReport) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}