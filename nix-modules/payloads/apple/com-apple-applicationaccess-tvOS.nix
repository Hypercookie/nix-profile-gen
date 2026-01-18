# Auto-generated from ProfileManifests: com.apple.applicationaccess-tvOS.plist
# Domain: com.apple.applicationaccess
# Title: Restrictions (tvOS)
# Platforms: tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-applicationaccess-tvOS" = {
    enable = lib.mkEnableOption "Restrictions (tvOS)";

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

    allowDeviceNameModification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents the user from changing the device name.";
    };

    forceAutomaticDateAndTime = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system enables the Set Automatically feature in Date & Time and the user can't disable it. The system updates the device's time zone only when the device can determine its location using a cellular connection or Wi-Fi with location services enabled.";
    };

    allowAutomaticScreenSaver = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables Apple TV's automatic screen saver.";
    };

    allowCamera = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables the camera and removes its icon from the Home Screen, and users are unable to take photographs. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowCloudPrivateRelay = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If set to false, prevents the use of iCloud Private Relay.";
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

    forceAssistantProfanityFilter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When true, forces the use of the profanity filter assistant.";
    };

    allowInAppPurchases = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When false, prohibits in-app purchasing.";
    };

    ratingRegion = lib.mkOption {
      type = types.nullOr (types.enum [ "us" "au" "ca" "de" "fr" "ie" "jp" "nz" "gb" ]);
      default = null;
      description = "The two-letter key that profile tools use to display the proper ratings for the given region. The client doesn't recognize or report this data.";
    };

    ratingApps = lib.mkOption {
      type = types.nullOr (types.enum [ 1000 900 800 700 600 500 400 300 200 100 0 ]);
      default = null;
      description = "The maximum level of app content allowed on the device. Preinstalled (first-party) apps ignore this restriction.\n\nPossible values, with the U.S. description of the rating level:\n\n- '1000': All\n- '600': 17+\n- '300': 12+\n- '200': 9+\n- '100': 4+\n- '0': None\n\nAge bands and the number of discrete age values vary by region, but the values are consistent across regions. For example, in a region that defines rating level 14+, its value is guaranteed to be larger than 300 (12+) and smaller than 600 (17+). Also, the value of rating level 15+ is guaranteed to be larger than the assigned value of rating level 14+. For more information about age ratings, see [Age ratings values and definitions](https://developer.apple.com/help/app-store-connect/reference/age-ratings-values-and-definitions).\n\nExamples of values in other regions include:\n\n- '1000': All\n- '621': 21+\n- '620': 20+\n- '619': 19+\n- '618': 18+\n- '600': 17+\n- '416': 16+\n- '415': 15+\n- '314': 14+\n- '313': 13+\n- '300': 12+\n- '211': 11+\n- '210': 10+\n- '200': 9+\n- '108': 8+\n- '107': 7+\n- '106': 6+\n- '105': 5+\n- '100': 4+\n- '3': 3+\n- '2': 2+\n- '1': 1+\n- '0': None\n\nThis restriction will require supervision in a future release.";
    };

    ratingMovies = lib.mkOption {
      type = types.nullOr (types.enum [ 1000 900 800 700 600 500 400 300 200 100 0 ]);
      default = null;
      description = "The maximum level of movie content allowed on the device. Support for this restriction on unsupervised devices is deprecated.\n\nPossible values, with the U.S. description of the rating level:\n\n- '1000': All\n- '500': NC-17\n- '400': R\n- '300': PG-13\n- '200': PG\n- '100': G\n- '0': None";
    };

    ratingTVShows = lib.mkOption {
      type = types.nullOr (types.enum [ 1000 900 800 700 600 500 400 300 200 100 0 ]);
      default = null;
      description = "The maximum level of TV content allowed on the device. Support for this restriction on unsupervised devices is deprecated.\n\nPossible values, with the U.S. description of the rating level:\n\n- '1000': All\n- '600': TV-MA\n- '500': TV-14\n- '400': TV-PG\n- '300': TV-G\n- '200': TV-Y7\n- '100': TV-Y\n- '0': None";
    };

    allowExplicitContent = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system hides explicit music or video content purchased from the iTunes Store. The system marks explicit content as such by content providers, such as record labels, when sold through the iTunes Store. Explicit content in the News and Podcast apps is also hidden.\n\nRequires a supervised device in iOS 13 and later. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowBookstoreErotica = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents the user from downloading Apple Books media that's tagged as erotica. Support for this restriction on unsupervised devices is deprecated.";
    };

    allowAirPlayIncomingRequests = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables incoming AirPlay requests.";
    };

    forceAirPlayIncomingRequestsPairingPassword = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system forces all devices sending AirPlay requests to this device to use a pairing password. This key isn't supported in tvOS 10.2 and later. Use the AirPlay Security Payload instead.";
    };

    allowRemoteAppPairing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables pairing Apple TV for use with the Control Center widget.";
    };

    allowPasswordProximityRequests = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system disables requesting passwords from nearby devices.";
    };

    forceDelayedSoftwareUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'true', the system delays user visibility of software updates. In macOS, the system allows seed build updates without delay. The delay is 30 days unless you set 'enforcedSoftwareUpdateDelay' to another value.";
    };

    enforcedSoftwareUpdateDelay = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "How many days to delay a software update on the device. With this restriction in place, the user doesn't see a software update until the specified number of days after the software update release date. The restrictions 'forceDelayedAppSoftwareUpdates' and 'forceDelayedSoftwareUpdates' use this value.";
    };

    allowDeviceSleep = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If 'false', the system prevents the device from automatically sleeping.";
    };

  };
}