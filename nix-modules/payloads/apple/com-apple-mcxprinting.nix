# Auto-generated from ProfileManifests: com.apple.mcxprinting.plist
# Domain: com.apple.mcxprinting
# Title: Printing
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Printing";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.mcxprinting";
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
        default = [ "AllowLocalPrinters" "DefaultPrinter" "PrintFooter" "FooterFontName" "FooterFontSize" "PrintMACAddress" "RequireAdminToAddPrinters" "RequireAdminToPrintLocally" "ShowOnlyManagedPrinters" "UserPrinterList" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
              description = "The display name.";
            };
            DeviceURI = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "The device URI.";
            };
          };
        });
        default = null;
        description = "The default printer for the user.";
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
                    description = "The display name.";
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
              description = "A dictionary of printer details.";
            };
          };
        });
        default = null;
        description = "The printers available to a user.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-mcxprinting" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Printing (com.apple.mcxprinting) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}