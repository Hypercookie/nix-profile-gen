# Auto-generated from ProfileManifests: com.apple.TCC.configuration-profile-policy.plist
# Domain: com.apple.TCC.configuration-profile-policy
# Title: Privacy Preferences Policy Control
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-TCC-configuration-profile-policy" = {
    enable = lib.mkEnableOption "Privacy Preferences Policy Control";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.TCC.configuration-profile-policy";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Services = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          Accessibility = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
            description = "Specifies the policies for the app via the Accessibility subsystem. The ability to grant access by this profile is deprecated as of macOS 26.2, and will be removed in macOS 27.0.";
          };
          AppleEvents = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                AEReceiverIdentifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The identifier of the process receiving an ApplEvent sent by the Identifier process.";
                };
                AEReceiverIdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of AEReceiverIdentifier value.";
                };
                AEReceiverCodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Code requirement for the receiving binary.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
            description = "AppleEvents";
          };
          BluetoothAlways = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Authorization = lib.mkOption {
                  type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                  default = null;
                  description = "The 'Authorization' key is an optional replacement for the 'Allowed' key. Every payload must specify either 'Authorization' or 'Allowed', but not both.\n'Allow': Equivalent to a 'true' value for the 'Allowed' key.\n'Deny': Equivalent to a 'false' value for the 'Allowed' key.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
            description = "Specifies the policies for the app to access Bluetooth devices.";
          };
          Calendar = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
            description = "Calendar";
          };
          Camera = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
            description = "Camera";
          };
          AddressBook = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
            description = "Contacts";
          };
          FileProviderPresence = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
          };
          ListenEvent = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
          };
          MediaLibrary = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
          };
          Microphone = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
            description = "Microphone";
          };
          Photos = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
            description = "Photos";
          };
          PostEvent = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
            description = "Specifies the policies for the application to use CoreGraphics APIs to send CGEvents to the system event stream.";
          };
          Reminders = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
            description = "Reminders";
          };
          SystemPolicyAllFiles = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
            description = "SystemPolicyAllFiles";
          };
          ScreenCapture = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
          };
          SpeechRecognition = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
          };
          SystemPolicyDesktopFolder = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
          };
          SystemPolicyDocumentsFolder = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
          };
          SystemPolicyDownloadsFolder = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
          };
          SystemPolicyNetworkVolumes = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
          };
          SystemPolicyRemovableVolumes = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
          };
          SystemPolicySysAdminFiles = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
            description = "System Policy Sys Admin Files";
          };
          SystemPolicyAppData = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Obtained via the command ''codesign -display -r -''.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If 'true', access is granted; otherwise, the process doesn't have access. The user isn't prompted and can't change this value.";
                };
                Authorization = lib.mkOption {
                  type = types.nullOr (types.enum [ "Allow" "Deny" "AllowStandardUserToSetSystemService" ]);
                  default = null;
                  description = "The 'Authorization' key is an optional replacement for the 'Allowed' key. Every payload must specify either 'Authorization' or 'Allowed', but not both.\n'Allow': Equivalent to a 'true' value for the 'Allowed' key.\n'Deny': Equivalent to a 'false' value for the 'Allowed' key.\n'AllowStandardUserToSetSystemService:' allows a standard (non-admin) user to configure the permissions for the specified app in the Privacy preferences for services that otherwise require admin authorization. 'AllowStandardUserToSetSystemService' is only valid for the 'ListenEvent' and 'ScreenCapture' services.\nAvailable in macOS 11 and later.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not used.";
                };
                AEReceiverIdentifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The identifier of the process receiving an AppleEvent sent by the Identifier process. This identifier is required for AppleEvents service; not valid for other services.";
                };
                AEReceiverIdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of AEReceiverIdentifier value, either 'bundleID' or 'path'. This setting is required for AppleEvents service; not valid for other services.";
                };
                AEReceiverCodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The code requirement for the receiving binary. This code requirement is required for AppleEvents service; not valid for other services.";
                };
              };
            }));
            default = null;
            description = "Allows the application to access data of other apps.";
          };
          SystemPolicyAppBundles = lib.mkOption {
            type = types.nullOr (types.listOf (types.submodule {
              options = {
                Identifier = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The bundle ID or installation path of the binary.";
                };
                IdentifierType = lib.mkOption {
                  type = types.nullOr (types.enum [ "bundleID" "path" ]);
                  default = null;
                  description = "The type of Identifier value.";
                };
                CodeRequirement = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "The designated requirement describing the code signature of this executable.";
                };
                StaticCode = lib.mkOption {
                  type = types.nullOr (types.bool);
                  default = null;
                  description = "If set to true, statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                };
                Allowed = lib.mkOption {
                  type = types.nullOr (types.enum [ false true ]);
                  default = null;
                  description = "If set to true, access is granted. Otherwise the process does not have access. The user is not prompted and cannot change this value.";
                };
                Comment = lib.mkOption {
                  type = types.nullOr (types.str);
                  default = null;
                  description = "Not Used";
                };
              };
            }));
            default = null;
            description = "App Management";
          };
        };
      });
      default = null;
      description = "A dictionary whose keys are limited to the privacy policy control services.  In the case of conflicting specifications, the most restrictive setting (deny) is used.";
    };

  };
}