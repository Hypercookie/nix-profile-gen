# Auto-generated from ProfileManifests: net.glencode.Particulars.Widget.plist
# Domain: net.glencode.Particulars.Widget
# Title: Particulars Today Extension (Widget)
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-net-glencode-Particulars-Widget" = {
    enable = lib.mkEnableOption "Particulars Today Extension (Widget)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "net.glencode.Particulars.Widget";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    labMode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Lab Mode eases deployment of Particulars in a computer lab or data center.";
    };

    detailLevel = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Adjust detail level options. See documentation URL for instructions.";
    };

    labelCase = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = 1;
      description = "Sets the letter case of the labels. Each case option has a corresponding number.";
    };

    dhcpLeaseRemaining = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Particulars shows the DHCP server address and the length of the DHCP lease. Setting this preference will also show the remaining lease time.";
    };

    macAddressFormat = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 ]);
      default = 1;
      description = "By default, MAC (Media Access Control) addresses are formatted with colon separators and in lowercase. Use this preference to select another MAC address format.";
    };

    networkDetailLevel = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "By default, all network information is displayed. It is possible to construct a custom set of network information. Use this preference to create a custom network detail level. See documentation URL for instructions.";
    };

    subnetMaskCIDRNotation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use this preference to have Particulars display subnet masks in the short CIDR (Classless Inter-domain Routing) notation. For example, 255.255.254.0 will show as /23.";
    };

    coreCount = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Adds a count of CPU cores to the CPU item. Changing this preference requires a restart of the application/widget to take effect.";
    };

    diskFreeSpace = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = 0;
      description = "Free/available disk space can be displayed in multiple ways. See documentation URL for options.";
    };

  };
}