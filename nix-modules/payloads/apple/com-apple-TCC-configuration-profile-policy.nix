# Auto-generated from ProfileManifests: com.apple.TCC.configuration-profile-policy.plist
# Domain: com.apple.TCC.configuration-profile-policy
# Title: Privacy Preferences Policy Control
# Platforms: macOS
# Unique: no

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Privacy Preferences Policy Control";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.TCC.configuration-profile-policy";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = false;
        description = "Whether macOS allows only one instance of this payload per profile.";
      };

      _displayName = lib.mkOption {
        internal = true;
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "PayloadDisplayName for this instance. Defaults to the domain.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "Services" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
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
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
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
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
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
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Specifies the policies for the app sending restricted AppleEvents to another process.";
            };
            BluetoothAlways = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
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
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Specifies the policies for calendar information managed by the Calendar.app.";
            };
            Camera = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "A system camera. Access to the camera can't be given in a profile; it can only be denied.";
            };
            AddressBook = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Specifies the policies for contact information managed by the Contacts.app.";
            };
            FileProviderPresence = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Allows a File Provider application to know when the user is using files managed by the File Provider.";
            };
            ListenEvent = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Deny" "AllowStandardUserToSetSystemService" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Deny': Access is denied.\n'AllowStandardUserToSetSystemService': Allows a standard (non-admin) user to configure the permissions for the specified app in the Privacy preferences for services that otherwise require admin authorization.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Allows the application to use CoreGraphics and HID APIs to listen to (receive) CGEvents and HID events from all processes. Access to these events can't be given in a profile; it can only be denied.";
            };
            MediaLibrary = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Allows the application to access Apple Music, music and video activity, and the media library.";
            };
            Microphone = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "A system microphone. Access to the microphone can't be given in a profile; it can only be denied.";
            };
            Photos = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "The pictures managed by the Photos app in '~/Pictures/.photoslibrary'.";
            };
            PostEvent = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
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
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Specifies the policies for reminders information managed by the Reminders app.";
            };
            SystemPolicyAllFiles = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Allows the application access to all protected files, including system administration files.";
            };
            ScreenCapture = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Deny" "AllowStandardUserToSetSystemService" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Deny': Access is denied.\n'AllowStandardUserToSetSystemService': Allows a standard (non-admin) user to configure the permissions for the specified app in the Privacy preferences for services that otherwise require admin authorization.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Allows the application to capture (read) the contents of the system display. Access to the contents can't be given in a profile; it can only be denied.";
            };
            SpeechRecognition = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Allows the application to use the system Speech Recognition facility and to send speech data to Apple.";
            };
            SystemPolicyDesktopFolder = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Allows the application to access files in the user's Desktop folder.";
            };
            SystemPolicyDocumentsFolder = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Allows the application to access files in the user's Documents folder.";
            };
            SystemPolicyDownloadsFolder = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Allows the application to access files in the user's Downloads folder.";
            };
            SystemPolicyNetworkVolumes = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Allows the application to access files on network volumes.";
            };
            SystemPolicyRemovableVolumes = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Allows the application to access files on removable volumes.";
            };
            SystemPolicySysAdminFiles = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Allows the application access to some files used in system administration.";
            };
            SystemPolicyAppData = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Specifies the policies for the app to access the data of other apps.";
            };
            SystemPolicyAppBundles = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  Identifier = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The bundle ID or installation path of the binary.\nNote: This value is case-sensitive.";
                  };
                  IdentifierType = lib.mkOption {
                    type = types.nullOr (types.enum [ "bundleID" "path" ]);
                    default = null;
                    description = "The type of identifier value. Application bundles must be identified by bundle ID. Nonbundled binaries must be identified by installation path. Helper tools embedded within an application bundle automatically inherit the permissions of their enclosing app bundle.";
                  };
                  CodeRequirement = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' has one of the following possible values:\n'Allow': Access is granted.\n'Deny': Access is denied.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Allows the application to update or delete other apps. Available in macOS 13 and later.";
            };
            RemoteDesktop = lib.mkOption {
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
                    description = "Obtained via the command 'codesign -display -r -'.";
                  };
                  StaticCode = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "If 'true', statically validate the code requirement. Used only if the process invalidates its dynamic code signature.";
                  };
                  Authorization = lib.mkOption {
                    type = types.nullOr (types.enum [ "Allow" "Deny" ]);
                    default = null;
                    description = "The 'Authorization' key is an optional replacement for the 'Allowed' key, which has one of the following possible values:\n'Allow': Equivalent to a 'true' value for the 'Allowed' key\n'Deny': Equivalent to a 'false' value for the 'Allowed' key\nNote: Every payload needs to include either 'Authorization' or 'Allowed', but not both.\nAvailable in macOS 14.7 and later.";
                  };
                  Comment = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Not used.";
                  };
                };
              }));
              default = null;
              description = "Allows the application to control the computer remotely. Available in macOS 14.7 and later.";
            };
          };
        });
        default = null;
        description = "A dictionary whose keys are limited to the privacy policy control services.  In the case of conflicting specifications, the most restrictive setting (deny) is used.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-TCC-configuration-profile-policy" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Privacy Preferences Policy Control (com.apple.TCC.configuration-profile-policy) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}