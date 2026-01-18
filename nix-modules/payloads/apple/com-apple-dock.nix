# Auto-generated from ProfileManifests: com.apple.dock.plist
# Domain: com.apple.dock
# Title: Dock
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-dock" = {
    enable = lib.mkEnableOption "Dock";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.dock";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    static_apps = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          tile_type = lib.mkOption {
            type = types.nullOr (types.enum [ "file-tile" ]);
            default = "file-tile";
            description = "The type of tile.";
          };
          tile_data = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The label of the Dock item.";
                };
                file_label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Display name in the profile GUI of a dock item.";
                };
                file_type = lib.mkOption {
                  type = types.nullOr (types.enum [ 1 ]);
                  default = null;
                  description = "The type of tile.";
                };
                file_data = lib.mkOption {
                  type = types.nullOr (types.submodule {
                    options = {
                      _CFURLString = lib.mkOption {
                        type = types.nullOr (types.str);
                        default = null;
                        description = "Path to the application.";
                      };
                      _CFURLStringType = lib.mkOption {
                        type = types.nullOr (types.enum [ 0 15 ]);
                        default = null;
                        description = "Path type. 0 = /Path/to/item, 15 = file://Path/to/item";
                      };
                    };
                  });
                  default = null;
                  description = "The data in a file. For Apple use only.";
                };
                url = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The URL string.";
                };
              };
            });
            default = null;
            description = "The information about the Dock item.";
          };
        };
      }));
      default = null;
      description = "An array of items located on the Applications side of the Dock and cannot be removed from that location.";
    };

    static_others = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          tile_type = lib.mkOption {
            type = types.nullOr (types.enum [ "file-tile" "directory-tile" "url-tile" ]);
            default = "file-tile";
            description = "The type of tile.";
          };
          tile_data = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The label of the Dock item.";
                };
                file_label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Display name in the profile GUI of a dock item.";
                };
                url = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The URL string.";
                };
                file_type = lib.mkOption {
                  type = types.nullOr (types.enum [ 0 1 3 ]);
                  default = null;
                  description = "The type of tile:\n\n- '0': URL\n- '1': File\n- '3': Directory";
                };
                file_data = lib.mkOption {
                  type = types.nullOr (types.submodule {
                    options = {
                      _CFURLString = lib.mkOption {
                        type = types.nullOr (types.str);
                        default = null;
                        description = "Path to the file.";
                      };
                      _CFURLStringType = lib.mkOption {
                        type = types.nullOr (types.enum [ 0 15 ]);
                        default = null;
                        description = "Path type. 0 = /Path/to/item, 15 = file://Path/to/item";
                      };
                    };
                  });
                  default = null;
                  description = "The data in a file. For Apple use only.";
                };
                home_directory_relative = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Path to item relative to the current user's home directory.";
                };
                arrangement = lib.mkOption {
                  type = types.nullOr (types.enum [ 1 2 3 4 5 ]);
                  default = 1;
                  description = "Arrangement (sorting) of the directory contents.";
                };
                displayas = lib.mkOption {
                  type = types.nullOr (types.enum [ 1 2 ]);
                  default = 2;
                  description = "Display directory as either a Folder or a Stack.";
                };
                showas = lib.mkOption {
                  type = types.nullOr (types.enum [ 1 2 3 4 ]);
                  default = 4;
                  description = "How to show directory contents.";
                };
              };
            });
            default = null;
            description = "The information about the Dock item.";
          };
        };
      }));
      default = null;
      description = "An array of items located on the Documents side of the Dock and cannot be removed from that location.";
    };

    persistent_apps = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          tile_type = lib.mkOption {
            type = types.nullOr (types.enum [ "file-tile" ]);
            default = "file-tile";
            description = "The type of tile.";
          };
          tile_data = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The label of the Dock item.";
                };
                file_label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Display name in the profile GUI of a dock item.";
                };
                file_type = lib.mkOption {
                  type = types.nullOr (types.enum [ 1 ]);
                  default = null;
                  description = "The type of tile.";
                };
                file_data = lib.mkOption {
                  type = types.nullOr (types.submodule {
                    options = {
                      _CFURLString = lib.mkOption {
                        type = types.nullOr (types.str);
                        default = null;
                        description = "Path to the application.";
                      };
                      _CFURLStringType = lib.mkOption {
                        type = types.nullOr (types.enum [ 0 15 ]);
                        default = null;
                        description = "Path type. 0 = /Path/to/item, 15 = file://Path/to/item";
                      };
                    };
                  });
                  default = null;
                  description = "The data in a file. For Apple use only.";
                };
                url = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The URL string.";
                };
              };
            });
            default = null;
            description = "The information about the Dock item.";
          };
        };
      }));
      default = null;
      description = "An array of items located on the Applications side of the Dock that can be removed from the Dock.";
    };

    persistent_others = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          tile_type = lib.mkOption {
            type = types.nullOr (types.enum [ "file-tile" "directory-tile" "url-tile" ]);
            default = "file-tile";
            description = "The type of tile.";
          };
          tile_data = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The label of the Dock item.";
                };
                file_label = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Display name in the profile GUI of a dock item.";
                };
                url = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The URL string.";
                };
                file_type = lib.mkOption {
                  type = types.nullOr (types.enum [ 0 1 3 ]);
                  default = null;
                  description = "The type of tile:\n\n- '0': URL\n- '1': File\n- '3': Directory";
                };
                file_data = lib.mkOption {
                  type = types.nullOr (types.submodule {
                    options = {
                      _CFURLString = lib.mkOption {
                        type = types.nullOr (types.str);
                        default = null;
                        description = "Path to the file.";
                      };
                      _CFURLStringType = lib.mkOption {
                        type = types.nullOr (types.enum [ 0 15 ]);
                        default = null;
                        description = "Path type. 0 = /Path/to/item, 15 = file://Path/to/item";
                      };
                    };
                  });
                  default = null;
                  description = "The data in a file. For Apple use only.";
                };
                home_directory_relative = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Path to item relative to the current user's home directory.";
                };
                arrangement = lib.mkOption {
                  type = types.nullOr (types.enum [ 1 2 3 4 5 ]);
                  default = 1;
                  description = "Arrangement (sorting) of the directory contents.";
                };
                displayas = lib.mkOption {
                  type = types.nullOr (types.enum [ 1 2 ]);
                  default = 2;
                  description = "Display directory as either a Folder or a Stack.";
                };
                showas = lib.mkOption {
                  type = types.nullOr (types.enum [ 1 2 3 4 ]);
                  default = 4;
                  description = "How to show directory contents.";
                };
              };
            });
            default = null;
            description = "The information about the Dock item.";
          };
        };
      }));
      default = null;
      description = "An array of items located on the Documents side of the Dock that can be removed from the Dock.";
    };

    tilesize = lib.mkOption {
      type = types.nullOr (types.int);
      default = 64;
      description = "The tile size. Values must be in the range from 16 to 128.";
    };

    size_immutable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', locks the size slider.";
    };

    magnification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', enables magnification.";
    };

    magnify_immutable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', locks magnification.";
    };

    largesize = lib.mkOption {
      type = types.nullOr (types.int);
      default = 128;
      description = "The size of the largest magnification.";
    };

    magsize_immutable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', locks the magnification slider.";
    };

    orientation = lib.mkOption {
      type = types.nullOr (types.enum [ "bottom" "left" "right" ]);
      default = null;
      description = "The orientation of the Dock.";
    };

    position_immutable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', locks the position.";
    };

    mineffect = lib.mkOption {
      type = types.nullOr (types.enum [ "genie" "scale" ]);
      default = "genie";
      description = "The minimize effect.";
    };

    mineffect_immutable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', locks \"Minimize windows using.\"";
    };

    minimize_to_application = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', enables \"Minimize windows into application icon.\"";
    };

    minintoapp_immutable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', disables the \"Minimize windows into application icon\" checkbox.";
    };

    launchanim = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', enables \"Animate opening applications.\"";
    };

    launchanim_immutable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', locks \"Animate opening applications.\"";
    };

    autohide = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', enables \"Automatically hide and show the Dock.\"";
    };

    autohide_immutable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', locks \"Automatically hide.\"";
    };

    show_process_indicators = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If true, shows the process indicator.";
    };

    show_recents = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', enables \"Show recent items.\"";
    };

    show_recent_count = lib.mkOption {
      type = types.nullOr (types.int);
      default = 3;
      description = "Controls the number of items shown in the recent apps area of the dock.";
    };

    static_only = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', uses the 'static-apps' and 'static-others' dictionaries for the Dock and ignores any items in the 'persistent-apps' and 'persistent-others' dictionaries. If 'false', the contents are merged with the static items listed first.";
    };

    contents_immutable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', disables changes to the Dock.";
    };

    AllowDockFixupOverride = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', use the file in '/Library/Preferences/com.apple.dockfixup.plist' when a new user or migrated user logs in. This option has no effect for existing users. Available in macOS 10.12 and later. Only available on the device channel.";
    };

    MCXDockSpecialFolders = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ "AddDockMCXMyApplicationsFolder" "AddDockMCXDocumentsFolder" "AddDockMCXSharedFolder" "AddDockMCXOriginalNetworkHomeFolder" ]));
      default = null;
      description = "One or more special folders that may be created at user login time and placed in the Dock.\n\n\n\nThe \"My Applications\" item is only used for Simple Finder environments. The \"Original Network Home\" item is only used for mobile account users.";
    };

    wvous_tl_corner = lib.mkOption {
      type = types.nullOr (types.enum [ 5 6 2 3 4 7 12 11 14 10 13 0 ]);
      default = 0;
      description = "Action to be taken when the pointer enters the top left corner of the screen";
    };

    wvous_tl_modifier = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1048576 1572864 1835008 1966080 1703936 1310720 1441792 1179648 524288 786432 917504 655360 262144 393216 131072 ]);
      default = 0;
      description = "Modifier keys required to activate the top left hot corner";
    };

    wvous_tr_corner = lib.mkOption {
      type = types.nullOr (types.enum [ 5 6 2 3 4 7 12 11 14 10 13 0 ]);
      default = 0;
      description = "Action to be taken when the pointer enters the top right corner of the screen";
    };

    wvous_tr_modifier = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1048576 1572864 1835008 1966080 1703936 1310720 1441792 1179648 524288 786432 917504 655360 262144 393216 131072 ]);
      default = 0;
      description = "Modifier keys required to activate the top right hot corner";
    };

    wvous_bl_corner = lib.mkOption {
      type = types.nullOr (types.enum [ 5 6 2 3 4 7 12 11 14 10 13 0 ]);
      default = 0;
      description = "Action to be taken when the pointer enters the bottom left corner of the screen";
    };

    wvous_bl_modifier = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1048576 1572864 1835008 1966080 1703936 1310720 1441792 1179648 524288 786432 917504 655360 262144 393216 131072 ]);
      default = 0;
      description = "Modifier keys required to activate the bottom left hot corner";
    };

    wvous_br_corner = lib.mkOption {
      type = types.nullOr (types.enum [ 5 6 2 3 4 7 12 11 14 10 13 0 ]);
      default = 0;
      description = "Action to be taken when the pointer enters the bottom right corner of the screen";
    };

    wvous_br_modifier = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1048576 1572864 1835008 1966080 1703936 1310720 1441792 1179648 524288 786432 917504 655360 262144 393216 131072 ]);
      default = 0;
      description = "Modifier keys required to activate the bottom right hot corner";
    };

    windowtabbing = lib.mkOption {
      type = types.nullOr (types.enum [ "manual" "always" "fullscreen" ]);
      default = null;
      description = "Set the \"Prefer tabs when opening documents\" to the provided value.";
    };

    windowtabbing_immutable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', disables \"Prefer tabs when opening documents\" checkbox.";
    };

    dblclickbehavior = lib.mkOption {
      type = types.nullOr (types.enum [ "minimize" "maximize" "none" ]);
      default = null;
      description = "The behavior when the window's title bar is double-clicked.";
    };

    dblclickbehavior_immutable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', locks \"Double-click a window's title bar.\"";
    };

    showindicators_immutable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', locks \"Show indicators.\"";
    };

    showrecents_immutable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', disables \"Show recent applications\" checkbox.";
    };

  };
}