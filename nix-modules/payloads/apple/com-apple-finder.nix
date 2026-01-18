# Auto-generated from ProfileManifests: com.apple.finder.plist
# Domain: com.apple.finder
# Title: Finder
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-finder" = {
    enable = lib.mkEnableOption "Finder";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.finder";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    InterfaceLevel = lib.mkOption {
      type = types.nullOr (types.enum [ "Simple" "Full" ]);
      default = "Full";
      description = "Specifies whether Finder should operate in Simple or Full mode.";
    };

    WarnOnEmptyTrash = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system doesn't warn the user before emptying the trash.";
    };

    ProhibitConnectTo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system disables Connect to Server.";
    };

    ProhibitEject = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system disables Eject.";
    };

    ProhibitBurn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system disables the Finder's burn support.";
    };

    ProhibitGoToFolder = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system disables Go to Folder.";
    };

    ShowHardDrivesOnDesktop = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'false', the system doesn't show internal hard drives on the Desktop.";
    };

    ShowExternalHardDrivesOnDesktop = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system doesn't show external hard drives on the Desktop.";
    };

    ShowRemovableMediaOnDesktop = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system doesn't show removable media items on the Desktop.";
    };

    ShowMountedServersOnDesktop = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'false', the system doesn't show mounted file servers on the Desktop.";
    };

    ShowRecentTags = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Show the Recent Tags section in the Finder sidebar";
    };

    FXRemoveOldTrashItems = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Remove items from the Trash after 30 days";
    };

  };
}