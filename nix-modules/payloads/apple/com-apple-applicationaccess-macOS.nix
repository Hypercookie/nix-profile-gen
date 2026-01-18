# Auto-generated from ProfileManifests: com.apple.applicationaccess-macOS.plist
# Domain: com.apple.applicationaccess
# Title: Restrictions (macOS)
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-applicationaccess-macOS" = {
    enable = lib.mkEnableOption "Restrictions (macOS)";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.applicationaccess";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    allowAirDrop = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables AirDrop.";
    };

    allowAirPlayIncomingRequests = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables incoming AirPlay requests.";
    };

    allowPasswordAutoFill = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables:\n\n- The AutoFill Passwords feature in iOS, with Keychain and third-party password managers\n- Prompting the user to use a saved password in Safari or in apps\n- Automatic strong passwords\n- Suggesting strong passwords to users\n\nHowever, if 'false', the system doesn't prevent AutoFill for contact info and credit cards in Safari.";
    };

    allowAutoUnlock = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disallows auto unlock. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowCamera = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables the camera and removes its icon from the Home Screen, and users are unable to take photographs. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowContentCaching = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables content caching. This restriction is not supported on the user channel.";
    };

    forceOnDeviceOnlyTranslation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Force on-device only translation";
    };

    allowApplePersonalizedAdvertising = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system limits Apple personalized advertising.";
    };

    allowMailPrivacyProtection = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow mail privacy protection";
    };

    allowPrinterSharingModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents modifying Printer Sharing settings in System Settings.";
    };

    allowUniversalControl = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables Universal Control.";
    };

    allowiTunesFileSharing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables iTunes file sharing services.";
    };

    allowAccountModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables modification of accounts, such as Apple Accounts, and internet-based accounts, such as Mail, Contacts, and Calendar.";
    };

    allowActivityContinuation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables activity continuation. Support for this restriction on unsupervised devices and with Managed Apple Accounts is deprecated. In a future release, this restriction will begin requiring supervision and will apply to personal Apple Accounts only.";
    };

    allowDiagnosticSubmission = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents the device from automatically submitting diagnostic reports to Apple.";
    };

    allowMusicService = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables the Music service, and the Music app reverts to classic mode.";
    };

    allowRemoteAppleEventsModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents modifying Remote Apple Events Sharing settings in System Settings.";
    };

    allowCloudBTMM = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    allowCloudBookmarks = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables iCloud Bookmark sync.";
    };

    allowCloudCalendar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables iCloud Calendar services.";
    };

    allowCloudAddressBook = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables iCloud Contacts services.";
    };

    allowCloudDocumentSync = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables document and key-value syncing to iCloud. Requires a supervised device in iOS 13 and later, and Shared iPad doesn't support it. Support for this restriction on unsupervised devices and with Managed Apple Accounts is deprecated.";
    };

    allowCloudDesktopAndDocuments = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables iCloud Desktop and Document services.";
    };

    allowCloudFMM = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    allowCloudFreeform = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disallows iCloud Freeform services.";
    };

    allowCloudKeychainSync = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables iCloud Keychain synchronization. Support for this restriction on unsupervised devices and with Managed Apple Accounts is deprecated.";
    };

    allowCloudMail = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables iCloud Mail services.";
    };

    allowCloudNotes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables iCloud Notes services.";
    };

    allowCloudPhotoLibrary = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables iCloud Photo Library. The system removes any photos from local storage that aren't fully downloaded from iCloud Photo Library to the device. Support for this restriction on unsupervised devices and with Managed Apple Accounts is deprecated.";
    };

    allowCloudReminders = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables iCloud Reminder services.";
    };

    allowCloudPrivateRelay = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables iCloud Private Relay. Support for this restriction on unsupervised devices and with Managed Apple Accounts is deprecated.";
    };

    allowSpotlightInternetResults = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables Spotlight Internet search results in Siri Suggestions. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowEraseContentAndSettings = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables the Erase All Content and Settings option in the Reset UI.";
    };

    allowFileSharingModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents modifying File Sharing setting in System Settings.";
    };

    allowFingerprintForUnlock = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents Touch ID, Face ID, or Optic ID from unlocking a device. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowFingerprintModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents the user from modifying Touch ID or Face ID.";
    };

    allowDefinitionLookup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables definition lookup.";
    };

    allowDeprecatedWebKitTLS = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow websites that use TLS 1.0 and TLS 1.1 to be accessed using Safari.";
    };

    allowDeviceNameModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents the user from changing the device name.";
    };

    allowGameCenter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables Game Center, and the system removes its icon from the Home Screen.";
    };

    allowMultiplayerGaming = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prohibits multiplayer gaming.";
    };

    allowInternetSharingModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents modifying the Internet Sharing setting in System Settings.";
    };

    allowLocalUserCreation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents creating users in System Settings.";
    };

    allowAddingGameCenterFriends = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prohibits adding friends to Game Center. Requires a supervised device in iOS 13 and later.";
    };

    ratingRegion = lib.mkOption {
      type = types.nullOr (types.enum [ "us" "au" "ca" "de" "fr" "ie" "jp" "nz" "gb" ]);
      default = null;
      description = "The two-letter key that profile tools use to display the proper ratings for the given region. The client doesn't recognize or report this data.";
    };

    ratingApps = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The maximum level of app content allowed on the device. Preinstalled (first-party) apps ignore this restriction.\n\nPossible values, with the U.S. description of the rating level:\n\n- '1000': All\n- '600': 17+\n- '300': 12+\n- '200': 9+\n- '100': 4+\n- '0': None\n\nAge bands and the number of discrete age values vary by region, but the values are consistent across regions. For example, in a region that defines rating level 14+, its value is guaranteed to be larger than 300 (12+) and smaller than 600 (17+). Also, the value of rating level 15+ is guaranteed to be larger than the assigned value of rating level 14+. For more information about age ratings, see [Age ratings values and definitions](https://developer.apple.com/help/app-store-connect/reference/age-ratings-values-and-definitions).\n\nExamples of values in other regions include:\n\n- '1000': All\n- '621': 21+\n- '620': 20+\n- '619': 19+\n- '618': 18+\n- '600': 17+\n- '416': 16+\n- '415': 15+\n- '314': 14+\n- '313': 13+\n- '300': 12+\n- '211': 11+\n- '210': 10+\n- '200': 9+\n- '108': 8+\n- '107': 7+\n- '106': 6+\n- '105': 5+\n- '100': 4+\n- '3': 3+\n- '2': 2+\n- '1': 1+\n- '0': None\n\nThis restriction will require supervision in a future release.";
    };

    ratingMovies = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The maximum level of movie content allowed on the device. Support for this restriction on unsupervised devices is deprecated.\n\nPossible values, with the U.S. description of the rating level:\n\n- '1000': All\n- '500': NC-17\n- '400': R\n- '300': PG-13\n- '200': PG\n- '100': G\n- '0': None";
    };

    ratingTVShows = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The maximum level of TV content allowed on the device. Support for this restriction on unsupervised devices is deprecated.\n\nPossible values, with the U.S. description of the rating level:\n\n- '1000': All\n- '600': TV-MA\n- '500': TV-14\n- '400': TV-PG\n- '300': TV-G\n- '200': TV-Y7\n- '100': TV-Y\n- '0': None";
    };

    allowExplicitContent = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system hides explicit music or video content purchased from the iTunes Store. The system marks explicit content as such by content providers, such as record labels, when sold through the iTunes Store. Explicit content in the News and Podcast apps is also hidden.\n\nRequires a supervised device in iOS 13 and later. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowBookstore = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system removes the Book Store tab from the Books app.";
    };

    allowBookstoreErotica = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents the user from downloading Apple Books media that's tagged as erotica. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowARDRemoteManagementModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents modifying the Remote Management Sharing setting in System Settings.";
    };

    allowBluetoothSharingModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents modifying Bluetooth settings in System Settings.";
    };

    allowPasswordSharing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables sharing passwords with the AirDrop passwords feature, or with the Passwords app.";
    };

    allowAirPrintiBeaconDiscovery = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    forceAirPrintTrustedTLSRequirement = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
    };

    allowScreenShot = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables saving a screenshot of the display and capturing a screen recording. It also disables the Classroom app from observing remote screens.";
    };

    allowStartupDiskModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents modification of Startup Disk settings in System Settings.";
    };

    allowTimeMachineBackup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents modification of Time Machine settings in System Settings. This restriction is not supported on the user channel.";
    };

    allowUIConfigurationProfileInstallation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prohibits the user from installing configuration profiles and certificates interactively.";
    };

    allowRemoteScreenObservation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables remote screen observation by the Classroom app. Nest this key beneath 'allowScreenShot' as a subrestriction. If 'allowScreenShot' is 'false', the Classroom app doesn't observe remote screens. Requires a supervised device until iOS 13 and macOS 10.15. Allowed for user enrollments in macOS 12 and later.";
    };

    forceClassroomUnpromptedScreenObservation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true' and 'ScreenObservationPermissionModificationAllowed' is also 'true' in the Education payload, a student enrolled in a managed course through the Classroom app automatically gives permission to that course teacher's requests to observe the student's screen without prompting the student.";
    };

    forceClassroomUnpromptedAppAndDeviceLock = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system allows the teacher to lock apps or the device without prompting the student.";
    };

    forceClassroomAutomaticallyJoinClasses = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system automatically gives permission to the teacher's requests without prompting the student.";
    };

    forceClassroomRequestPermissionToLeaveClasses = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', a student enrolled in an unmanaged course through Classroom needs to request permission from the teacher to leave the course.";
    };

    allowBluetoothModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents modification of Bluetooth settings.";
    };

    allowPasswordProximityRequests = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables requesting passwords from nearby devices.";
    };

    allowPasscodeModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents adding, changing, or removing the passcode. The system ignores this restriction on Shared iPad.";
    };

    allowWallpaperModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents changing the wallpaper.";
    };

    allowUSBRestrictedMode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system allows iOS devices to always connect to USB accessories while locked. In macOS, allows new USB and Thunderbolt accessories, and SD cards to connect without authorization. If the system has Lockdown mode enabled, it ignores this value. This restriction is not supported on the user channel.";
    };

    allowAssistant = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables Siri.";
    };

    forceAssistantProfanityFilter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system forces the use of the profanity filter for Siri and dictation. Requires a supervised device in iOS.";
    };

    forceDelayedSoftwareUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system delays user visibility of software updates. In macOS, the system allows seed build updates without delay. The delay is 30 days unless you set 'enforcedSoftwareUpdateDelay' to another value.";
    };

    allowRapidSecurityResponseInstallation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prohibits installation of Background Security Improvements.";
    };

    allowRapidSecurityResponseRemoval = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prohibits removal of Background Security Improvements.";
    };

    enforcedSoftwareUpdateMinorOSDeferredInstallDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "This restriction allows the administrator to set the number of days to delay a minor OS software update on the device. When this restriction is in place, the user sees a software update only after the specified delay after the release of the software update. This value controls the delay for 'forceDelayedSoftwareUpdates'.";
    };

    forceDelayedAppSoftwareUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system delays user visibility of non-OS software updates. Control visibility of operating system updates through 'forceDelayedSoftwareUpdates'. The delay is 30 days unless you set 'enforcedSoftwareUpdateDelay' to another value.";
    };

    enforcedSoftwareUpdateDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "How many days to delay a software update on the device. With this restriction in place, the user doesn't see a software update until the specified number of days after the software update release date. The restrictions 'forceDelayedAppSoftwareUpdates' and 'forceDelayedSoftwareUpdates' use this value.";
    };

    enforcedSoftwareUpdateNonOSDeferredInstallDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "This restriction allows the administrator to set the number of days to delay an app software update on the device. When this restriction is in place, the user sees a non-OS software update only after the specified delay after the release of the software. This value controls the delay for 'forceDelayedAppSoftwareUpdates'.";
    };

    forceDelayedMajorSoftwareUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system delays user visibility of major OS updates.";
    };

    enforcedSoftwareUpdateMajorOSDeferredInstallDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "This restriction allows the administrator to set the number of days to delay a major software upgrade on the device. When this restriction is in place, the user sees a software upgrade only after the specified delay after the release of the software upgrade. This value controls the delay for 'forceDelayedMajorSoftwareUpdates'.";
    };

    enforcedFingerprintTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The value, in seconds, after which the fingerprint unlock requires a password to authenticate. The default value is 48 hours.";
    };

    allowDictation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disallows dictation input.";
    };

    forceOnDeviceOnlyDictation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system disables connections to Siri servers for the purposes of dictation.";
    };

    safariAllowAutoFill = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables Safari AutoFill for passwords, contact info, and credit cards, and also prevents using the Keychain for AutoFill. Requires a supervised device in iOS 13 and later.\n\nNote:\nThe system still allows third-party password managers, and apps can use AutoFill.";
    };

    allowFindMyDevice = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables Find My Device in the Find My app.";
    };

    allowFindMyFriends = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables Find My Friends in the Find My app.";
    };

    allowGenmoji = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', prohibits creating new Genmoji.";
    };

    allowImagePlayground = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', prohibits the use of image generation.";
    };

    allowiPhoneMirroring = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', prohibits the use of iPhone Mirroring. In macOS, this prevents the Mac from mirroring any iPhone. In iOS, this prevents the iPhone from mirroring to any Mac.";
    };

    allowWritingTools = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', disables Apple Intelligence writing tools.";
    };

    allowMailSummary = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', disables the ability to create summaries of email messages manually. This doesn't affect automatic summary generation.";
    };

    allowMailSmartReplies = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', disables smart replies in Mail.";
    };

    allowMediaSharingModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', prevents modification of Media Sharing settings.";
    };

    forceBypassScreenCaptureAlert = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', then the system bypasses the presentation of a screen capture alert.";
    };

    allowExternalIntelligenceIntegrations = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', disables the use of external, cloud-based intelligence services with Siri. In iOS, this restriction is temporarily allowed on unsupervised and user enrollments. In a future release, this restriction will require supervision, and will be ignored on unsupervised devices.";
    };

    allowExternalIntelligenceIntegrationsSignIn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', forces external intelligence providers into anonymous mode. If a user is already signed in to an external intelligence provider, applying this restriction signs them out when attempting the next request.";
    };

    allowedExternalIntelligenceWorkspaceIDs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of strings, but currently restricted to a single element. If present, Apple Intelligence allows use of only the given external integration workspace ID, and requires a sign-in to make requests. The user is required to sign in to integrations that support signing in. Multiple payloads combine using an intersect operation. This means the allowed set of workspace IDs can become the empty set if multiple payloads specify conflicting values.";
    };

    allowNotesTranscriptionSummary = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', disables transcription summarization in Notes.";
    };

    allowNotesTranscription = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', disables transcription in Notes.";
    };

    allowAppleIntelligenceReport = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables Apple Intelligence reports.";
    };

    allowSafariSummary = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables the ability to summarize content in Safari.";
    };

    allowSafariHistoryClearing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables the ability to clear browsing history in Safari.";
    };

    allowSafariPrivateBrowsing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables the ability to use private browsing in Safari.";
    };

    allowCallRecording = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', disables call recording.";
    };

    allowLiveVoicemail = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables live voicemail on the device.";
    };

  };
}