# Auto-generated from ProfileManifests: com.apple.applicationaccess-iOS.plist
# Domain: com.apple.applicationaccess
# Title: Restrictions (iOS)
# Platforms: iOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-applicationaccess-iOS" = {
    enable = lib.mkEnableOption "Restrictions (iOS)";

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

    allowCamera = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the camera and removes its icon from the Home Screen, and users are unable to take photographs. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowedCameraRestrictionBundleIDs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "If present, the system exempts apps with bundle IDs in the array from the 'allowCamera' restriction. The system doesn't grant these apps access to the camera automatically; they're only exempted from the 'allowCamera' restriction. This key has no effect when the camera isn't restricted. Multiple payloads combine using an intersect operation. Requires a supervised device.";
    };

    allowVideoConferencing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system hides the FaceTime app. Requires a supervised device in iOS 13 and later.";
    };

    allowCloudBackup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables backing up the device to iCloud. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowCloudPhotoLibrary = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables iCloud Photo Library. The system removes any photos from local storage that aren't fully downloaded from iCloud Photo Library to the device. Support for this restriction on unsupervised devices and with Managed Apple Accounts is deprecated.";
    };

    allowPhotoStream = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables Photo Stream.";
    };

    allowSharedStream = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables Shared Photo Stream. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowPasswordAutoFill = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables:\n\n- The AutoFill Passwords feature in iOS, with Keychain and third-party password managers\n- Prompting the user to use a saved password in Safari or in apps\n- Automatic strong passwords\n- Suggesting strong passwords to users\n\nHowever, if 'false', the system doesn't prevent AutoFill for contact info and credit cards in Safari.";
    };

    allowAutoUnlock = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disallows auto unlock. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowFingerprintForUnlock = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents Touch ID, Face ID, or Optic ID from unlocking a device. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowBookstore = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system removes the Book Store tab from the Books app.";
    };

    allowChat = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the use of iMessage with supervised devices. If the device supports text messaging, the user can still send and receive text messages.";
    };

    allowiTunes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the iTunes Music Store and removes its icon from the Home Screen. Users can't preview, purchase, or download content. Requires a supervised device in iOS 13 and later.";
    };

    allowMusicService = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the Music service, and the Music app reverts to classic mode.";
    };

    allowNews = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables News.";
    };

    allowPodcasts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables podcasts.";
    };

    allowRadioService = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables Apple Music Radio.";
    };

    allowYouTube = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "This key is ignored on iOS 6 and later because the YouTube app is no longer built in.";
    };

    allowAppsToBeHidden = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables the ability for the user to hide apps. It doesn't affect the user's ability to leave it in the App Library, while removing it from the Home Screen.";
    };

    allowAppsToBeLocked = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables the ability for the user to lock apps. Because hiding apps also requires locking them, disallowing locking also disallows hiding.";
    };

    allowCloudDocumentSync = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables document and key-value syncing to iCloud. Requires a supervised device in iOS 13 and later, and Shared iPad doesn't support it. Support for this restriction on unsupervised devices and with Managed Apple Accounts is deprecated.";
    };

    allowCloudKeychainSync = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables iCloud Keychain synchronization. Support for this restriction on unsupervised devices and with Managed Apple Accounts is deprecated.";
    };

    allowDefinitionLookup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables definition lookup.";
    };

    allowDeprecatedWebKitTLS = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Allow websites that use TLS 1.0 and TLS 1.1 to be accessed using Safari.";
    };

    allowAirPrint = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables AirPrint.";
    };

    allowAirPrintiBeaconDiscovery = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables iBeacon discovery of AirPrint printers, which prevents spurious AirPrint Bluetooth beacons from phishing for network traffic.";
    };

    forceAirPrintTrustedTLSRequirement = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system requires trusted certificates for TLS printing communication.";
    };

    allowScreenShot = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables saving a screenshot of the display and capturing a screen recording. It also disables the Classroom app from observing remote screens.";
    };

    allowRemoteScreenObservation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables remote screen observation by the Classroom app. Nest this key beneath 'allowScreenShot' as a subrestriction. If 'allowScreenShot' is 'false', the Classroom app doesn't observe remote screens. Requires a supervised device until iOS 13 and macOS 10.15. Allowed for user enrollments in macOS 12 and later.";
    };

    forceClassroomUnpromptedScreenObservation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true' and 'ScreenObservationPermissionModificationAllowed' is also 'true' in the Education payload, a student enrolled in a managed course through the Classroom app automatically gives permission to that course teacher's requests to observe the student's screen without prompting the student.";
    };

    forceUnpromptedManagedClassroomScreenObservation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Deprecated in iOS 11. Use forceClassroomUnpromptedScreenObservation instead.";
    };

    allowVoiceDialing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables voice dialing if the device is locked with a passcode.";
    };

    allowAssistant = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables Siri.";
    };

    allowAssistantWhileLocked = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables Siri when the device is locked. The system ignores this restriction if the device doesn't have a passcode set.";
    };

    forceAssistantProfanityFilter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system forces the use of the profanity filter for Siri and dictation. Requires a supervised device in iOS.";
    };

    allowAssistantUserGeneratedContent = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents Siri from querying user-generated content from the web.";
    };

    allowSiriServerLogging = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allow server-side logging of Siri commands";
    };

    allowSpotlightInternetResults = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables Spotlight Internet search results in Siri Suggestions. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowAppInstallation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the App Store and removes its icon from the Home Screen. Users are unable to install or update their apps. This applies to App Store apps, marketplace apps, and locally installed apps (using Configurator, Xcode, and so forth).\n\nIn iOS 10 and later, MDM commands can override this restriction. Requires a supervised device in iOS 13 and later.";
    };

    allowUIAppInstallation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the App Store and removes its icon from the Home Screen. However, users can continue to install or update their apps either locally (via Configurator, Xcode, and so forth), or using alternative marketplace apps.\n\nIn iOS 10 and later, MDM commands can override this restriction.";
    };

    allowAutomaticAppDownloads = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents automatic downloading of apps purchased on other devices. This setting doesn't affect updates to existing apps.";
    };

    allowMarketplaceAppInstallation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents installation of alternative marketplace apps from the web and prevents any installed alternative marketplace apps from installing apps.";
    };

    allowWebDistributionAppInstallation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the device prevents installation of apps directly from the web.";
    };

    allowAppRemoval = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables removal of apps from an iOS device. This applies to App Store apps, marketplace apps, and locally installed apps (using Configurator, Xcode, and so forth).";
    };

    allowAppClips = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents a user from adding any App Clips, and removes any existing App Clips on the device.";
    };

    allowSystemAppRemoval = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the removal of system apps from the device.";
    };

    allowInAppPurchases = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prohibits in-app purchasing. Support for this restriction on unsupervised devices is deprecated.";
    };

    forceITunesStorePasswordEntry = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system forces the user to enter their iTunes password for each transaction.";
    };

    allowManagedAppsCloudSync = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents managed apps from using iCloud sync.";
    };

    allowEnterpriseBookBackup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables backup of Enterprise books.";
    };

    allowEnterpriseBookMetadataSync = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables sync of Enterprise books, notes, and highlights.";
    };

    allowCloudPrivateRelay = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables iCloud Private Relay. Support for this restriction on unsupervised devices and with Managed Apple Accounts is deprecated.";
    };

    allowGlobalBackgroundFetchWhenRoaming = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables global background fetch activity when an iOS phone is roaming. Support for this restriction on unsupervised devices is deprecated.";
    };

    forceEncryptedBackup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system encrypts all backups.";
    };

    allowEraseContentAndSettings = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the Erase All Content and Settings option in the Reset UI.";
    };

    forcePreserveESIMOnErase = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system preserves eSIM when it erases the device due to too many failed password attempts or the Erase All Content and Settings option in Settings > General > Reset.\n\nNote:\nThe system doesn't preserve eSIM if Find My initiates erasing the device.";
    };

    allowUntrustedTLSPrompt = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system automatically rejects untrusted HTTPS certificates without prompting the user.";
    };

    allowEnterpriseAppTrust = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system removes the Trust Enterprise Developer button in Settings > General > VPN & Device Management, which prevents provisioning apps by universal provisioning profiles. This restriction applies to free developer accounts and enterprise app developers that aren't implicitly trusted by apps that install through MDM. This restriction doesn't revoke previously granted trust.";
    };

    allowOTAPKIUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables over-the-air PKI updates. Setting this restriction to 'false' doesn't disable CRL and OCSP checks.";
    };

    allowUIConfigurationProfileInstallation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prohibits the user from installing configuration profiles and certificates interactively.";
    };

    allowVPNCreation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system allows only managed apps to create VPN configurations. Prior to iOS 18, the system also allows unmanaged apps to create VPN configurations.";
    };

    forceAutomaticDateAndTime = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables the Set Automatically feature in Date & Time and the user can't disable it. The system updates the device's time zone only when the device can determine its location using a cellular connection or Wi-Fi with location services enabled.";
    };

    forceClassroomUnpromptedAppAndDeviceLock = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system allows the teacher to lock apps or the device without prompting the student.";
    };

    forceClassroomAutomaticallyJoinClasses = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system automatically gives permission to the teacher's requests without prompting the student.";
    };

    forceClassroomRequestPermissionToLeaveClasses = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', a student enrolled in an unmanaged course through Classroom needs to request permission from the teacher to leave the course.";
    };

    allowAccountModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables modification of accounts, such as Apple Accounts, and internet-based accounts, such as Mail, Contacts, and Calendar.";
    };

    allowBluetoothModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents modification of Bluetooth settings.";
    };

    allowAppCellularDataModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables changing settings for cellular data usage for apps.";
    };

    allowCellularPlanModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents users from changing settings related to their cellular plan (available only on select carriers).";
    };

    allowESIMModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables modifications of eSIMs.";
    };

    allowFindMyFriendsModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables changes to Find My Friends.";
    };

    allowNotificationsModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables modification of notification settings.";
    };

    allowNFC = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables NFC.";
    };

    allowPasscodeModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents adding, changing, or removing the passcode. The system ignores this restriction on Shared iPad.";
    };

    allowFingerprintModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents the user from modifying Touch ID or Face ID.";
    };

    allowEnablingRestrictions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the Enable Restrictions option in the Restrictions UI in Settings. If 'false' in iOS 12 and later, the system disables the Enable ScreenTime option in the ScreenTime UI in Settings and disables ScreenTime if already enabled.";
    };

    allowWallpaperModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents changing the wallpaper.";
    };

    allowUSBRestrictedMode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system allows iOS devices to always connect to USB accessories while locked. In macOS, allows new USB and Thunderbolt accessories, and SD cards to connect without authorization. If the system has Lockdown mode enabled, it ignores this value. This restriction is not supported on the user channel.";
    };

    allowHostPairing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables host pairing with the exception of the supervision host. If there's no configured supervision host certificate, the system disables all pairing. Host pairing lets the administrator control whether an iOS device can pair with a host Mac or PC.";
    };

    allowiPhoneWidgetsOnMac = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disallows iPhone widgets on a Mac that signs in with the same Apple Account for iCloud.";
    };

    allowUnpairedExternalBootToRecovery = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system allows unpaired devices to boot devices into recovery.";
    };

    allowOpenFromManagedToUnmanaged = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', documents in managed apps and accounts open only in other managed apps and accounts.";
    };

    allowOpenFromUnmanagedToManaged = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', documents in unmanaged apps and accounts open only in other unmanaged apps and accounts.";
    };

    allowUnmanagedToReadManagedContacts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system allows unmanaged apps to read from managed contacts accounts. If 'allowOpenFromManagedToUnmanaged' is 'true', this restriction has no effect.\n\nImportant:\nUse MDM to install profiles that contain this restriction.";
    };

    allowManagedToWriteUnmanagedContacts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system allows managed apps to write contacts to unmanaged accounts. If 'allowOpenFromManagedToUnmanaged' is 'true', this restriction has no effect.\n\nImportant:\nUse MDM to install profiles that contain this restriction.";
    };

    requireManagedPasteboard = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', copy-and-paste functionality is limited by the 'allowOpenFromManagedToUnmanaged' and 'allowOpenFromUnmanagedToManaged' restrictions.";
    };

    allowAirDrop = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables AirDrop.";
    };

    forceAirDropUnmanaged = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system considers AirDrop to be an unmanaged drop target.";
    };

    allowActivityContinuation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables activity continuation. Support for this restriction on unsupervised devices and with Managed Apple Accounts is deprecated. In a future release, this restriction will begin requiring supervision and will apply to personal Apple Accounts only.";
    };

    allowDiagnosticSubmission = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents the device from automatically submitting diagnostic reports to Apple.";
    };

    allowDiagnosticSubmissionModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables changing the diagnostic submission and app analytics settings in the Diagnostics & Usage UI in Settings.";
    };

    forceAuthenticationBeforeAutoFill = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the user needs to authenticate before the system can autofill passwords or credit card information in Safari and apps. If this restriction isn't enforced, the user can toggle this feature in Settings. Only supported on devices with Face ID or Touch ID.";
    };

    allowPairedWatch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables pairing with an Apple Watch, and the system unpairs any currently paired Apple Watch and erases its content.";
    };

    forceWatchWristDetection = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system forces a paired Apple Watch to use Wrist Detection.";
    };

    forceWiFiPowerOn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system prevents turning off Wi-Fi in Settings or Control Center, even by entering or leaving Airplane Mode. It doesn't prevent selecting which Wi-Fi network to use. and later.";
    };

    forceWiFiToAllowedNetworksOnly = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system limits the device to only join Wi-Fi networks set up through a configuration profile.";
    };

    forceWiFiWhitelisting = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Use 'forceWiFiToAllowedNetworksOnly' instead.";
    };

    allowProximitySetupToNewDevice = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables the prompt to set up new devices that are nearby.";
    };

    allowPredictiveKeyboard = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables predictive keyboards.";
    };

    allowKeyboardShortcuts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables keyboard shortcuts.";
    };

    allowAutoCorrection = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables keyboard autocorrection.";
    };

    allowContinuousPathKeyboard = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables QuickPath keyboard.";
    };

    allowSpellCheck = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the keyboard spell checker.";
    };

    allowSharedDeviceTemporarySession = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system makes temporary sessions unavailable on Shared iPad.";
    };

    allowDictation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disallows dictation input.";
    };

    forceOnDeviceOnlyDictation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system disables connections to Siri servers for the purposes of dictation.";
    };

    forceOnDeviceOnlyTranslation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the device can't connect to Siri servers for the purposes of translation.";
    };

    allowPassbookWhileLocked = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system hides Passbook notifications from the Lock Screen.";
    };

    allowPersonalHotspotModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables modifications of the personal hotspot setting.";
    };

    allowLiveVoicemail = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables live voicemail on the device.";
    };

    allowLockScreenControlCenter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents Control Center from appearing on the Lock Screen.";
    };

    allowLockScreenNotificationsView = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the Notifications history view on the Lock Screen, so users can't view past notifications. However, they can still see notifications when they arrive.";
    };

    allowLockScreenTodayView = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the Today view in Notification Center on the Lock Screen.";
    };

    forceAirPlayOutgoingRequestsPairingPassword = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system forces all devices receiving AirPlay requests from this device to use a pairing password.";
    };

    allowAirPrintCredentialsStorage = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables Keychain storage of user name and password for AirPrint.";
    };

    forceLimitAdTracking = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system limits ad tracking. Additionally, it disables app tracking and the Allow Apps to Request to Track setting.";
    };

    allowApplePersonalizedAdvertising = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system limits Apple personalized advertising.";
    };

    allowMailPrivacyProtection = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables Mail Privacy Protection on the device.";
    };

    allowAutoDim = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables auto dim on iPads with OLED displays.";
    };

    allowGameCenter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables Game Center, and the system removes its icon from the Home Screen.";
    };

    allowAddingGameCenterFriends = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prohibits adding friends to Game Center. Requires a supervised device in iOS 13 and later.";
    };

    allowMultiplayerGaming = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prohibits multiplayer gaming.";
    };

    allowSafari = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the Safari web browser app, and the system removes its icon from the Home Screen. This setting also prevents users from opening web clips. Requires a supervised device in iOS 13 and later.";
    };

    safariAllowAutoFill = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables Safari AutoFill for passwords, contact info, and credit cards, and also prevents using the Keychain for AutoFill. Requires a supervised device in iOS 13 and later.\n\nNote:\nThe system still allows third-party password managers, and apps can use AutoFill.";
    };

    safariForceFraudWarning = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables Safari fraud warning.";
    };

    safariAllowJavaScript = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', Safari doesn't execute JavaScript. This restriction will require supervision in a future release.";
    };

    safariAllowPopups = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', Safari doesn't allow pop-up windows. Support for this restriction on unsupervised devices is deprecated.";
    };

    safariAcceptCookies = lib.mkOption {
      type = types.nullOr (types.float);
      default = 2.0;
      description = "Defines the conditions under which the device accepts cookies. The user-facing settings changed in iOS 11, although the possible values remain the same. Support for this restriction on unsupervised devices is deprecated. Allowed values:\n\n- '0': Enables Prevent Cross-Site Tracking and Block All Cookies, and the user canʼt disable either setting.\n- '1' or '1.5': Enables Prevent Cross-Site Tracking, and the user canʼt disable it. Doesn't enable Block All Cookies, but the user can enable it.\n- '2': Enables Prevent Cross-Site Tracking, but doesn't enable Block All Cookies. The user can toggle either setting.";
    };

    allowDeviceNameModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents the user from changing the device name.";
    };

    blockedAppBundleIDs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "If present, the system prevents showing or launching apps with bundle IDs in the array. Include the value 'com.apple.webapp' to restrict all webclips. This applies to App Store apps, marketplace apps, and locally installed apps (using Configurator, Xcode, and so forth).\n\nNote:\nDenying system apps may disable other functionality. For example, denying the App Store app may prevent users from accepting the terms and conditions for the user-based Volume Purchase Program (VPP).";
    };

    blacklistedAppBundleIDs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Use 'blockedAppBundleIDs' instead.";
    };

    allowListedAppBundleIDs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "If present, the system only shows or can launch apps with bundle IDs in the array. Include the value 'com.apple.webapp' to allow all webclips. This applies to App Store apps, marketplace apps, and locally installed apps (using Configurator, Xcode, and so forth).";
    };

    whitelistedAppBundleIDs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Use 'allowListedAppBundleIDs' instead.";
    };

    autonomousSingleAppModePermittedAppIDs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "If present, the system allows apps identified by the bundle IDs listed in the array to autonomously enter Single App Mode.";
    };

    ratingRegion = lib.mkOption {
      type = types.nullOr (types.enum [ "us" "au" "ca" "de" "fr" "ie" "jp" "nz" "gb" ]);
      default = "us";
      description = "The two-letter key that profile tools use to display the proper ratings for the given region. The client doesn't recognize or report this data.";
    };

    ratingApps = lib.mkOption {
      type = types.nullOr (types.enum [ 1000 900 800 700 600 500 400 300 200 100 0 ]);
      default = 1000;
      description = "The maximum level of app content allowed on the device. Preinstalled (first-party) apps ignore this restriction.\n\nPossible values, with the U.S. description of the rating level:\n\n- '1000': All\n- '600': 17+\n- '300': 12+\n- '200': 9+\n- '100': 4+\n- '0': None\n\nAge bands and the number of discrete age values vary by region, but the values are consistent across regions. For example, in a region that defines rating level 14+, its value is guaranteed to be larger than 300 (12+) and smaller than 600 (17+). Also, the value of rating level 15+ is guaranteed to be larger than the assigned value of rating level 14+. For more information about age ratings, see [Age ratings values and definitions](https://developer.apple.com/help/app-store-connect/reference/age-ratings-values-and-definitions).\n\nExamples of values in other regions include:\n\n- '1000': All\n- '621': 21+\n- '620': 20+\n- '619': 19+\n- '618': 18+\n- '600': 17+\n- '416': 16+\n- '415': 15+\n- '314': 14+\n- '313': 13+\n- '300': 12+\n- '211': 11+\n- '210': 10+\n- '200': 9+\n- '108': 8+\n- '107': 7+\n- '106': 6+\n- '105': 5+\n- '100': 4+\n- '3': 3+\n- '2': 2+\n- '1': 1+\n- '0': None\n\nThis restriction will require supervision in a future release.";
    };

    ratingMovies = lib.mkOption {
      type = types.nullOr (types.enum [ 1000 900 800 700 600 500 400 300 200 100 0 ]);
      default = 1000;
      description = "The maximum level of movie content allowed on the device. Support for this restriction on unsupervised devices is deprecated.\n\nPossible values, with the U.S. description of the rating level:\n\n- '1000': All\n- '500': NC-17\n- '400': R\n- '300': PG-13\n- '200': PG\n- '100': G\n- '0': None";
    };

    ratingTVShows = lib.mkOption {
      type = types.nullOr (types.enum [ 1000 900 800 700 600 500 400 300 200 100 0 ]);
      default = 1000;
      description = "The maximum level of TV content allowed on the device. Support for this restriction on unsupervised devices is deprecated.\n\nPossible values, with the U.S. description of the rating level:\n\n- '1000': All\n- '600': TV-MA\n- '500': TV-14\n- '400': TV-PG\n- '300': TV-G\n- '200': TV-Y7\n- '100': TV-Y\n- '0': None";
    };

    allowExplicitContent = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system hides explicit music or video content purchased from the iTunes Store. The system marks explicit content as such by content providers, such as record labels, when sold through the iTunes Store. Explicit content in the News and Podcast apps is also hidden.\n\nRequires a supervised device in iOS 13 and later. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowFilesUSBDriveAccess = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents connecting to any connected USB devices in the Files app.";
    };

    allowBookstoreErotica = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents the user from downloading Apple Books media that's tagged as erotica. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowPasswordSharing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables sharing passwords with the AirDrop passwords feature, or with the Passwords app.";
    };

    allowPasswordProximityRequests = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables requesting passwords from nearby devices.";
    };

    forceDelayedSoftwareUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system delays user visibility of software updates. In macOS, the system allows seed build updates without delay. The delay is 30 days unless you set 'enforcedSoftwareUpdateDelay' to another value.";
    };

    enforcedSoftwareUpdateDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = 30;
      description = "How many days to delay a software update on the device. With this restriction in place, the user doesn't see a software update until the specified number of days after the software update release date. The restrictions 'forceDelayedAppSoftwareUpdates' and 'forceDelayedSoftwareUpdates' use this value.";
    };

    allowRapidSecurityResponseInstallation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prohibits installation of Background Security Improvements.";
    };

    allowRapidSecurityResponseRemoval = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prohibits removal of Background Security Improvements.";
    };

    allowFindMyDevice = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables Find My Device in the Find My app.";
    };

    allowFindMyFriends = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables Find My Friends in the Find My app.";
    };

    allowFilesNetworkDriveAccess = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prevents connecting to network drives in the Files app.";
    };

    allowESIMOutgoingTransfers = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', prevents the transfer of an eSIM from the device on which the restriction is installed to a different device.";
    };

    allowGenmoji = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', prohibits creating new Genmoji.";
    };

    allowImagePlayground = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', prohibits the use of image generation.";
    };

    allowImageWand = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', prohibits the use of Image Wand.";
    };

    allowiPhoneMirroring = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', prohibits the use of iPhone Mirroring. In macOS, this prevents the Mac from mirroring any iPhone. In iOS, this prevents the iPhone from mirroring to any Mac.";
    };

    allowPersonalizedHandwritingResults = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If false, prevents the system from generating text in the user's handwriting.";
    };

    allowWritingTools = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables Apple Intelligence writing tools.";
    };

    allowCallRecording = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables call recording.";
    };

    allowMailSummary = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables the ability to create summaries of email messages manually. This doesn't affect automatic summary generation.";
    };

    allowMailSmartReplies = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables smart replies in Mail.";
    };

    allowRCSMessaging = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', prevents the use of RCS messaging.";
    };

    allowDefaultBrowserModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables default browser preference modification. The MDM Settings command to set the default browser preference still works when applying this.";
    };

    allowDefaultCallingAppModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables default calling app preference modification. The MDM Settings command to set the default calling app preference still works when applying this.";
    };

    allowDefaultMessagingAppModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables default messaging app preference modification. The MDM Settings command to set the default messaging app preference still works when applying this.";
    };

    allowExternalIntelligenceIntegrations = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables the use of external, cloud-based intelligence services with Siri. In iOS, this restriction is temporarily allowed on unsupervised and user enrollments. In a future release, this restriction will require supervision, and will be ignored on unsupervised devices.";
    };

    allowExternalIntelligenceIntegrationsSignIn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', forces external intelligence providers into anonymous mode. If a user is already signed in to an external intelligence provider, applying this restriction signs them out when attempting the next request.";
    };

    allowedExternalIntelligenceWorkspaceIDs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of strings, but currently restricted to a single element. If present, Apple Intelligence allows use of only the given external integration workspace ID, and requires a sign-in to make requests. The user is required to sign in to integrations that support signing in. Multiple payloads combine using an intersect operation. This means the allowed set of workspace IDs can become the empty set if multiple payloads specify conflicting values.";
    };

    allowNotesTranscriptionSummary = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables transcription summarization in Notes.";
    };

    allowNotesTranscription = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables transcription in Notes.";
    };

    allowVisualIntelligenceSummary = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables visual intelligence summarization.";
    };

    allowSatelliteConnection = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system prohibits the connection to and use of satellite services.";
    };

    allowAppleIntelligenceReport = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables Apple Intelligence reports.";
    };

    allowSafariSummary = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the ability to summarize content in Safari.";
    };

    allowVideoConferencingRemoteControl = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', disables the ability for a remote FaceTime session to request control of the device.";
    };

    allowSafariHistoryClearing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the ability to clear browsing history in Safari.";
    };

    allowSafariPrivateBrowsing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If 'false', the system disables the ability to use private browsing in Safari.";
    };

    deniedICCIDsForiMessageFaceTime = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of strings representing ICCIDs of cellular plans. The device prevents use of any matching cellular networks in iMessage and FaceTime. The array must contain no more than 4 ICCID strings.";
    };

    deniedICCIDsForRCS = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "An array of strings representing ICCIDs of cellular plans. The device prevents use of any matching cellular networks with RCS messaging. The array must contain no more than 4 ICCID strings.";
    };

    ratingAppsExemptedBundleIDs = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "If present, the system exempts apps with bundle IDs in the array from age-based rating restrictions. The system uses intersection combine rules to combine multiple payloads and any exceptions that parental control apps provide, including ScreenTime.";
    };

  };
}