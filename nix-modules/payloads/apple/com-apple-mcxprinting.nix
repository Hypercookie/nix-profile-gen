# Auto-generated from ProfileManifests: com.apple.mcxprinting.plist
# Domain: com.apple.mcxprinting
# Title: Printing
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-mcxprinting" = {
    enable = lib.mkEnableOption "Printing";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.mcxprinting";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    AllowLocalPrinters = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', allows printers that connect directly to a user's computer.";
    };

    DefaultPrinter = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          DisplayName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The printer display name. This should match one of the printers in the Printer List.";
          };
          DeviceURI = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The device URI. This should match one of the printers in the Printer List.";
          };
        };
      });
      default = null;
      description = "The default printer for the user. This information should match one of the printers in the Printer List.";
    };

    PrintFooter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', prints the page footer (including the user name and date).";
    };

    FooterFontName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The footer font name.";
    };

    FooterFontSize = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The footer font size.";
    };

    PrintMACAddress = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', includes the MAC address.";
    };

    RequireAdminToAddPrinters = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', requires an administrator password to add printers.";
    };

    RequireAdminToPrintLocally = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', requires an administrator password to print locally.";
    };

    ShowOnlyManagedPrinters = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', shows only managed printers.";
    };

    UserPrinterList = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Printer = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                DisplayName = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The printer display name.";
                };
                DeviceURI = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The device URI.";
                };
                Location = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The printer's location.";
                };
                Model = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The printer's model.";
                };
                PPDURL = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The printer's PPDURL.";
                };
                PrinterLocked = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If 'true', locks the printer.";
                };
              };
            });
            default = null;
            description = "A printer item in the printer list";
          };
        };
      });
      default = null;
      description = "The printers available to a user.";
    };

  };
}