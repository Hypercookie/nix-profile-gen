# Auto-generated from ProfileManifests: com.apple.finder.plist
# Domain: com.apple.finder
# Title: Finder
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Finder";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.finder";
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
        default = [ "ShowExternalHardDrivesOnDesktop" "ShowHardDrivesOnDesktop" "ShowMountedServersOnDesktop" "ShowRemovableMediaOnDesktop" "NewWindowTarget" "NewWindowTargetPath" "FinderSpawnTab" "AppleShowAllFiles" "FXEnableExtensionChangeWarning" "WarnOnEmptyTrash" "FXRemoveOldTrashItems" "_FXSortFoldersFirst" "_FXSortFoldersFirstOnDesktop" "ShowSidebar" "FXDefaultSearchScope" "FXPreferredViewStyle" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      ShowExternalHardDrivesOnDesktop = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      ShowHardDrivesOnDesktop = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      ShowMountedServersOnDesktop = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      ShowRemovableMediaOnDesktop = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      NewWindowTarget = lib.mkOption {
        type = types.nullOr (types.enum [ "PfHm" "PfCm" "PfVo" "PfDe" "PfDo" "file:///System/Library/CoreServices/Finder.app/Contents/Resources/MyLibraries/myDocuments.cannedSearch" ]);
        default = null;
        description = "New Finder windows will open to the selected location.";
      };

      NewWindowTargetPath = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "ex. file:/// = Root of Boot Volume";
      };

      FinderSpawnTab = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      AppleShowAllFiles = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      FXEnableExtensionChangeWarning = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Prompts the user to confirm they wish to change the extension on files.";
      };

      WarnOnEmptyTrash = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Prompts the user to confirm they wish to empty their Trash.";
      };

      FXRemoveOldTrashItems = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      _FXSortFoldersFirst = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      _FXSortFoldersFirstOnDesktop = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      ShowSidebar = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
      };

      FXDefaultSearchScope = lib.mkOption {
        type = types.nullOr (types.enum [ "SCev" "SCcf" "SCsp" ]);
        default = null;
      };

      FXPreferredViewStyle = lib.mkOption {
        type = types.nullOr (types.enum [ "icnv" "Nlsv" "clmv" "glyv" ]);
        default = null;
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-finder" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Finder (com.apple.finder) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}