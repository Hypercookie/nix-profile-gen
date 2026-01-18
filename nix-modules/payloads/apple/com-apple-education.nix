# Auto-generated from ProfileManifests: com.apple.education.plist
# Domain: com.apple.education
# Title: Education Configuration
# Platforms: iOS, macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-education" = {
    enable = lib.mkEnableOption "Education Configuration";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.education";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    OrganizationName = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The organization's display name. The system displays this name in the iOS login screen.";
    };

    OrganizationUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The organization's UUID identifier. This identifier can be any valid UUID. All teacher and student devices that need to communicate with one another must have the same organization UUID, particularly if they originated from different Device Enrollment Programs.";
    };

    Groups = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          BeaconID = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "An unsigned 16 bit integer specifying this group's unique beacon ID.";
          };
          Name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The display name of the group.";
          };
          Description = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The description of the group.";
          };
          ImageURL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Deprecated in iOS 9.3.1 and later. The URL of an image for the group.";
          };
          ConfigurationSource = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The source that provided this group, such as SIS, or MDM.";
          };
          LeaderIdentifiers = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "The user identifiers that are leaders of this group.";
          };
          MemberIdentifiers = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "The entries in the Users array that are members of the group.";
          };
          DeviceGroupIdentifiers = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "The identifiers that refer to entries in the 'DeviceGroups' array to which the instructor can assign users from this class.\n\nHas no effect on the configuration of the Shared iPad login screen.";
          };
        };
      }));
      default = null;
      description = "_For Shared iPad profiles:_ The array of dictionaries that defines which groups the user can select in the Login Window.\n\n_For leader/teacher profiles:_ The array of dictionaries that defines the groups that the user can control.\n\n_For member/student profiles:_ The array of dictionaries that defines the groups where the user is a member.";
    };

    Users = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Identifier = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The unique identifier for a user in the organization.";
          };
          Name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The name of the user.";
          };
          GivenName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The given name of the user.";
          };
          FamilyName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The family name of the user.";
          };
          PhoneticGivenName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The user's phonetic given name. The system uses this name to sort users in the Classroom app and the Shared iPad Login Screen.";
          };
          PhoneticFamilyName = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The user's phonetic family name. The system uses this name to sort users in the Classroom app and the Shared iPad login screen.";
          };
          ImageURL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "A string that contains a URL pointing to an image of the user. The system displays this image in the iOS login screen and in the Classroom app. The recommended resolution is 256 x 256 pixels (512 x 512 pixels on a 2x device). The recommended formats are JPEG, PNG, and TIFF. The system uses the 'ResourcePayloadCertificateUUID' identity certificate or the MDM client identity to perform authentication when fetching the image.";
          };
          FullScreenImageURL = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Deprecated in iOS 9.3.1 and later. The URL pointing to an image of the user. The system uses the  'ResourcePayloadCertificateUUID' identity certificate or the MDM client identity to perform authentication when fetching the specified resource.";
          };
          AppleID = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The Managed Apple Account for this user.\n\nNot required to configure Classroom, but if set the system uses it.\n\nRequired to configure the Shared iPad login screen.";
          };
          PasscodeType = lib.mkOption {
            type = types.nullOr (types.enum [ "complex" "four" "six" ]);
            default = null;
            description = "The type of passcode UI to show when the user is at the Login Window.";
          };
        };
      }));
      default = null;
      description = "For Shared iPad profiles: The array of dictionaries that define the users that the system displays in the iOS Login Window.\n\n_For leader/teacher profiles:_ The array of dictionaries that define users that are members of the teacher's groups.\n\n_For member/student profiles:_ The array of dictionaries that needs to contain the definition of the user specified in the 'UserIdentifier' key. With one-to-one member devices, this key should include only the device user and the teacher but not other class members.";
    };

    LeaderPayloadCertificateAnchorUUID = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The array of UUIDs referring to certificate payloads within the same profile that the system uses to authorize leader peer certificate identities. This array needs to contain all necessary certificates to validate the entire chain of trust. Leader certificates needs to have the common name prefix leader, which is case insensitive.\n\nThis property doesn't support identity payloads or PKCS12 certificates.\n\nRequired when configuring a student device for Classroom, and ignored when configuring an instructor device. Has no effect on the configuration of the Shared iPad login screen.";
    };

    MemberPayloadCertificateAnchorUUID = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "The array of UUIDs referring to certificate payloads within the same profile that the system uses to authorize group member peer certificate identities. This array must contain all certificates needed to validate the entire chain of trust. Member certificates must have the common name prefix member (case insensitive).\n\nThis property doesn't support identity payloads or PKCS12 certificates.\n\nRequired when configuring a student device for Classroom, and ignored when configuring an instructor device. Has no effect on the configuration of the Shared iPad login screen.";
    };

    ResourcePayloadCertificateUUID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The UUID of an identity certificate payload within the same profile that the system uses to perform client authentication when fetching additional resources, such as student images.\n\nIf set, the system uses this key to configure both Classroom and the Shared iPad login screen. If not set, the system uses MDM client identity.";
    };

    UserIdentifier = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The unique string that identifies the user of this device within the organization.\n\nDon't set this value in payloads intended to configure the Shared iPad login screen.";
    };

    Departments = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The display name of the department.";
          };
          GroupBeaconIDs = lib.mkOption {
            type = types.nullOr (types.listOf (types.int));
            default = null;
            description = "The group beacon identifiers that are members of this department.";
          };
        };
      }));
      default = null;
      description = "_For Shared iPad profiles:_ The array of dictionaries that defines which departments the system displays in the Shared iPad login screen. If set, the system uses this key to configure both Classroom and the Shared iPad login screen.";
    };

    DeviceGroups = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          Identifier = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The unique identifier for the device group in the organization.";
          };
          Name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The name of the device group, which must be unique in the organization.";
          };
          SerialNumbers = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "The serial numbers of the devices in the group.";
          };
        };
      }));
      default = null;
      description = "_For leader/teacher profiles:_ The array of dictionaries that defines which device groups the leader can assign devices to. Not included in member payloads.";
    };

    ScreenObservationPermissionModificationAllowed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system allows students enrolled in managed classes to modify their teacher's permissions for screen observation on their device.";
    };

  };
}