# Auto-generated from ProfileManifests: com.apple.finder.plist
# Domain: com.apple.finder
# Title: Finder
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-finder" = {
    enable = lib.mkEnableOption "Finder";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.finder";
      description = "The payload domain (PayloadType) for this manifest.";
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
      default = "file:///";
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
      default = true;
      description = "Prompts the user to confirm they wish to change the extension on files.";
    };

    WarnOnEmptyTrash = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Prompts the user to confirm they wish to empty their Trash.";
    };

    FXRemoveOldTrashItems = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
    };

    _FXSortFoldersFirst = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
    };

    _FXSortFoldersFirstOnDesktop = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
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
}