# Auto-generated from ProfileManifests: com.hjuutilainen.MunkiAdmin.plist
# Domain: com.hjuutilainen.MunkiAdmin
# Title: MunkiAdmin
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-hjuutilainen-MunkiAdmin" = {
    enable = lib.mkEnableOption "MunkiAdmin";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.hjuutilainen.MunkiAdmin";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    startupWhatToDo = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Determines what MunkiAdmin's startup behavior is. Leave unspecified or set to integer 1 for the default behavior, which is \"Prompt to Select a Repository.\"";
    };

    UpdatePkginfosOnSave = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When saving, write changed pkginfo files to repository.";
    };

    UpdateManifestsOnSave = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When saving, write changed manifest files to repository.";
    };

    UpdateCatalogsOnSave = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When saving, write changed catalog files to repository.";
    };

    makecatalogsForceEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Adds --force option to makecatalogs command.";
    };

    makecatalogsSkipPkgCheck = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Adds --skip-pkg-check option to makecatalogs command.";
    };

    makecatalogsOnlyIfNeeded = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Only run makecatalogs if pkginfo files were changed";
    };

    MoveInstallerItemsWithPkginfos = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Move installer items when moving pkginfo files";
    };

    sidebarDirectoriesVisible = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Directories Visible in sidebar";
    };

    sidebarInstallerTypesVisible = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Installer Types Visible in Sidebar";
    };

    sidebarCategoriesVisible = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Categories Visible in Sidebar";
    };

    sidebarDevelopersVisible = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Developers Visible in Sidebar";
    };

    sidebarDeveloperMinimumNumberOfPackageNames = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The minimum number of package names a developer must have in order to be shown in the sidebar.";
    };

    makepkginfoPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The path to the makepkginfo binary.";
    };

    makecatalogsPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The path to the makecatalogs binary.";
    };

    sortManagedInstallsByTitle = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Keep managed installs sorted by name";
    };

    sortManagedUninstallsByTitle = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Keep managed uninstalls sorted by name";
    };

    sortManagedUpdatesByTitle = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Keep managed updates sorted by name";
    };

    sortOptionalInstallsByTitle = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Keep optional installs sorted by name";
    };

    sortFeaturedItemsByTitle = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Keep featured items sorted by name";
    };

    sortPkginfoCatalogsByTitle = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Keep catalogs sorted by name";
    };

    CopyPkgsToRepo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Copy package to repository upon import";
    };

    items_to_copyUseDefaults = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Override items_to_copy default values";
    };

    items_to_copyOwner = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Override items_to_copy default owner";
    };

    items_to_copyGroup = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Override items_to_copy default group";
    };

    items_to_copyMode = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Override items_to_copy default file mode";
    };

    assimilate_enabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate pkginfo properties on import";
    };

    assimilate_autoremove = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate autoremove on import";
    };

    assimilate_blocking_applications = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate blocking_applications on import";
    };

    assimilate_category = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate category on import";
    };

    assimilate_description = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate description on import";
    };

    assimilate_developer = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate developer on import";
    };

    assimilate_display_name = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate display_name on import";
    };

    assimilate_icon_hash = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate icon_hash on import";
    };

    assimilate_icon_name = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate icon_name on import";
    };

    assimilate_installable_condition = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate installable_condition on import";
    };

    assimilate_installcheck_script = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate installcheck_script on import";
    };

    assimilate_installer_choices_xml = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate installer_choices_xml on import";
    };

    assimilate_installs_items = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate installs_items on import";
    };

    assimilate_items_to_copy = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate items_to_copy on import";
    };

    assimilate_maximum_os_version = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate maximum_os_version on import";
    };

    assimilate_minimum_munki_version = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate minimum_munki_version on import";
    };

    assimilate_minimum_os_version = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate minimum_os_version on import";
    };

    assimilate_name = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate name on import";
    };

    assimilate_pre_scripts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate pre_scripts on import";
    };

    assimilate_preinstall_script = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate preinstall_script on import";
    };

    assimilate_postinstall_script = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate postinstall_script on import";
    };

    assimilate_preuninstall_script = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate preuninstall_script on import";
    };

    assimilate_postuninstall_script = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate postuninstall_script on import";
    };

    assimilate_post_scripts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate post_scripts on import";
    };

    assimilate_receipts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate receipts on import";
    };

    assimilate_requires = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate requires on import";
    };

    assimilate_supported_architectures = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate supported_architectures on import";
    };

    assimilate_unattended_install = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate unattended_install on import";
    };

    assimilate_unattended_uninstall = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate unattended_uninstall on import";
    };

    assimilate_uninstall_method = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate uninstall_method on import";
    };

    assimilate_uninstall_script = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate uninstall_script on import";
    };

    assimilate_uninstallable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate uninstallable on import";
    };

    assimilate_uninstallcheck_script = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate uninstallcheck_script on import";
    };

    assimilate_uninstaller_item_location = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate uninstaller_item_location on import";
    };

    assimilate_update_for = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Assimilate update_for on import";
    };

    logLevel = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 4 5 ]);
      default = null;
      description = "Log level";
    };

    logToFile = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Send log statements to a file in ~/Library/Logs/MunkiAdmin/";
    };

    logToSyslog = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Send log statements to Apple System Log, so they show up in Console.app.";
    };

  };
}