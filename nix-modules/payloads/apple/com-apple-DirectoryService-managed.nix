# Auto-generated from ProfileManifests: com.apple.DirectoryService.managed.plist
# Domain: com.apple.DirectoryService.managed
# Title: Active Directory
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-DirectoryService-managed" = {
    enable = lib.mkEnableOption "Active Directory";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.DirectoryService.managed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    HostName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The Active Directory domain to join.";
    };

    UserName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The user name of the account for the domain.";
    };

    Password = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The password of the account for the domain.";
    };

    ClientID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The client's identifier.";
    };

    ADOrganizationalUnit = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The organizational unit to add the joining computer object to.";
    };

    ADCreateMobileAccountAtLoginFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADCreateMobileAccountAtLogin' key.";
    };

    ADCreateMobileAccountAtLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system creates a mobile account at login.";
    };

    ADWarnUserBeforeCreatingMAFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADWarnUserBeforeCreatingMA' key.";
    };

    ADWarnUserBeforeCreatingMA = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the warning before creating the mobile account.";
    };

    ADForceHomeLocalFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADForceHomeLocal' key.";
    };

    ADForceHomeLocal = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system forces a local home directory.";
    };

    ADUseWindowsUNCPathFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADUseWindowsUNCPath' key.";
    };

    ADUseWindowsUNCPath = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system uses the UNC path from Active Directory to derive the network home location.";
    };

    ADMountStyle = lib.mkOption {
      type = types.nullOr (types.enum [ "afp" "smb" ]);
      default = null;
      description = "The network home protocol to use: 'afp' or 'smb'.";
    };

    ADDefaultUserShellFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADDefaultUserShell' key.";
    };

    ADDefaultUserShell = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The default user shell.";
    };

    ADMapUIDAttributeFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADMapUIDAttribute' key.";
    };

    ADMapUIDAttribute = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The map UID to attribute.";
    };

    ADMapGIDAttributeFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADMapGIDAttribute' key.";
    };

    ADMapGIDAttribute = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The map GID to attribute.";
    };

    ADMapGGIDAttributeFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADMapGGIDAttributeFlag' key.";
    };

    ADMapGGIDAttribute = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The map group GID to attribute.";
    };

    ADPreferredDCServerFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADPreferredDCServer' key.";
    };

    ADPreferredDCServer = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The preferred domain server.";
    };

    ADDomainAdminGroupListFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADDomainAdminGroupList' key.";
    };

    ADDomainAdminGroupList = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The list of Active Directory groups with admin access.";
    };

    ADAllowMultiDomainAuthFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADAllowMultiDomainAuth' key.";
    };

    ADAllowMultiDomainAuth = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system allows authentication from any domain in the namespace.";
    };

    ADNamespaceFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADNamespace' key.";
    };

    ADNamespace = lib.mkOption {
      type = types.nullOr (types.enum [ "domain" "forest" ]);
      default = null;
      description = "The primary user account naming convention; either 'forest' or 'domain'.";
    };

    ADPacketSignFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADPacketSign' key.";
    };

    ADPacketSign = lib.mkOption {
      type = types.nullOr (types.enum [ "allow" "disable" "require" ]);
      default = null;
      description = "The packet signing policy.";
    };

    ADPacketEncryptFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADPacketEncrypt' key.";
    };

    ADPacketEncrypt = lib.mkOption {
      type = types.nullOr (types.enum [ "allow" "disable" "require" "ssl" ]);
      default = null;
      description = "The packet encryption policy.";
    };

    ADRestrictDDNSFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADRestrictDDNS' key.";
    };

    ADRestrictDDNS = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of strings that represent the interfaces allowed for dynamic DNS updates, such as en0 and en1.";
    };

    ADTrustChangePassIntervalDaysFlag = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the 'ADTrustChangePassIntervalDays' key.";
    };

    ADTrustChangePassIntervalDays = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The number of days before requiring a change of the computer trust account password. Set to '0' to disable the feature.";
    };

    Description = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The directory service description.";
    };

  };
}