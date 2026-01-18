# Auto-generated from ProfileManifests: us.zoom.config.plist
# Domain: us.zoom.config
# Title: Zoom
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-us-zoom-config" = {
    enable = lib.mkEnableOption "Zoom";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "us.zoom.config";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    ZAutoSSOLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Default to login with SSO";
    };

    ZSSOHost = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Set the default SSO URL for SSO login. If your Zoom login URL were myorg.zoom.us, the value for this preference would be 'myorg'.";
    };

    ForceSSOURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Set and lock the default SSO URL for SSO login. If your Zoom login URL were myorg.zoom.us, the value for this preference would be 'myorg'.";
    };

    DisableAutoLaunchSSO = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent Zoom from automatically launching the previously used SSO URL. This is useful for users with multiple accounts, each having their own SSO URL.";
    };

    NoGoogle = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable the Google login option";
    };

    NoFacebook = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable the Facebook login option";
    };

    EnableAppleLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enable the Apple login option";
    };

    NoSSO = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable the SSO login option";
    };

    DisableLoginWithEmail = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Remove Email login option";
    };

    DisableKeepSignedInWithFacebook = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Require new Facebook login every time Zoom launches.";
    };

    DisableKeepSignedInWithGoogle = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Require new Google login every time Zoom launches.";
    };

    DisableKeepSignedInWithSSO = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Require new SSO login every time Zoom launches.";
    };

    SetWebDomain = lib.mkOption {
      type = types.nullOr (types.str);
      default = "https://zoom.us";
      description = "Sets the web domain for logging in or joining a meeting. By default, the value is https://zoom.us or https://zoom.com";
    };

    Login_Domain = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Set the email address domains that users can login with, each separated by '&'";
    };

    LastLoginType = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Remember the last login type used";
    };

    KeepSignedIn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Client automatically logs in to the last email account used";
    };

    AU2_EnableAutoUpdate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enable auto updates through the client";
    };

    AU2_SetUpdateChannel = lib.mkOption {
      type = types.nullOr (types.enum [ False True ]);
      default = false;
      description = "Set the cadence of updates applied to the desktop client";
    };

    AU2_EnableShowZoomUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Show the Zoom Updates section of the General tab in client settings";
    };

    AU2_EnableUpdateAvailableBanner = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Show the Update Available banner on the Home tab of the client, when an update is available";
    };

    AU2_EnablePromptUpdateForAU2 = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prompt users to update when exiting a meeting or webinar, when an update is available";
    };

    AU2_EnableUpdateSuccessNotification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Show notification indicating an update has been successfully installed";
    };

    AU2_EnableManualUpdate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Control the visibility of the Check for Updates option in the client";
    };

    AU2_DeploySpecificVersion = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Download and install the specified version if the currently installed version is below that version. Format should be the official version without spaces or parentheses";
    };

    AU2_SetUpdateSchedule = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Timeframe to download an available update version. Update is then initiated by the user through prompt, or during idle time or the specified safe upgrade period";
    };

    AU2_InstallAtIdleTime = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Auto install an available update when the device is idle";
    };

    AU2_SafeUpgradePeriod = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Set to install updates within a given time period. Requires AU2_InstallAtIdleTime be enabled";
    };

    ZAutoUpdate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Allow users to check for updates through the Zoom client. If set to 'false', the 'Check for Updates' button is hidden.";
    };

    EnableSilentAutoUpdate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allows the Zoom client to silently check for available stable version updates. This option requires zAutoUpdate option to be enabled, and will fail if not enabled.";
    };

    AlwaysCheckLatestVersion = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Allows the desktop client to check for any available updates. This option requires zAutoUpdate option to be enabled, and will fail if not enabled.";
    };

    SetUpdatingChannel = lib.mkOption {
      type = types.nullOr (types.enum [ False True ]);
      default = false;
      description = "Configures the cadence of updates available to the Zoom client. If set to 'false', will use the 'Slow' (stable) channel. If set to 'true', will use the 'Fast' channel.";
    };

    EnableCloudSwitch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enable the option to switch between Zoom commercial (default) and Zoom for Gov.";
    };

    EnableEmbedBrowserForSSO = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Use the embedded browser in the Zoom client for SSO.";
    };

    EnablePhoneLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enables login with phone authentication.";
    };

    EnableAlipayLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enables login with Alipay authentication.";
    };

    EnableQQLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enables login with QQ authentication.";
    };

    EnableWeChatLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enables login with WeChat authentication.";
    };

    EnforceSignInToJoin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Force users to be signed in with a Zoom account before joining a meeting. Users can be signed-in on the web portal when joining via a join URL.";
    };

    EnforceSignInToJoinForWebinar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Force users to be signed in with a Zoom account before joining a webinar. Users can be signed-in on the web portal when joining via a join URL.";
    };

    EnforceAppSignInToJoin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Force users to be signed in with a Zoom account in the app before joining any meeting or webinar.";
    };

    EnforceAppSignInToJoinForWebinar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Force users to be signed in with a Zoom account in the app before joining any webinar.";
    };

    DisableDaemonInstall = lib.mkOption {
      type = types.nullOr (types.enum [ False True ]);
      default = false;
      description = "Controls the use of the daemon helper to install updates, which bypasses the need to enter admin credentials when upgrading. This option requires AutoUpdate option to be enabled, and will fail if not enabled.";
    };

    SetEnrollToken4CloudMDM = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Auto enroll devices to Zoom MDM with a token provided from the Zoom web portal.";
    };

    DefaultUsePortraitView = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Default to Portrait Mode upon opening Zoom";
    };

    DisableDirectShare = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables direct share with Zoom Rooms";
    };

    PresentInMeetingOption = lib.mkOption {
      type = types.nullOr (types.enum [ False True ]);
      default = false;
      description = "Set default sharing option when sharing directly to a Zoom Room within a meeting.";
    };

    PresentToRoomOption = lib.mkOption {
      type = types.nullOr (types.enum [ False True ]);
      default = true;
      description = "Set the default sharing option when sharing directly to a Zoom Room.";
    };

    PresentToRoomWithAudio = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Share sound when screen sharing to a Zoom Room";
    };

    PresentToRoomOptimizeVideo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If enabled, will optimize screen sharing for video clip when sharing directly to a Zoom Room.";
    };

    EnableHIDControl = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enables HID control of USB audio devices from the Zoom client";
    };

    EnableStartMeetingWithRoomSystem = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Displays the 'Call Room System' button on the home screen of the Zoom client";
    };

    AlwaysShowVideoPreviewDialog = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If enabled, always show the video preview when joining a meeting.";
    };

    IgnoreBandwidthLimits = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Ignore bandwidth limited set on web settings.";
    };

    LegacyCaptureMode = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If enabled, disables GPU acceleration.";
    };

    BlockUntrustedSSLCert = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Block connections to untrusted SSL certificates.";
    };

    DisableCertPin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable Certificate Pinning";
    };

    DisableAudioOverProxy = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent audio traffic over proxies.";
    };

    DisableDirectConnection2Web = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable all direct connections to Zoom web service.";
    };

    DisableSharingOverProxy = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent sharing traffic over proxies.";
    };

    DisableVideoOverProxy = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent video traffic over proxies.";
    };

    EmbedUserAgentString = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Embed a specified user agent string for all HTTP requests from the Zoom client.";
    };

    EmbedDeviceTag = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Embed a specified device tag string for all HTTP requests from Zoom client application. This string will be appended to the head of the regular HTTP requests.";
    };

    DisableZoomApps = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If enabled, hides the Zoom Apps quick launch button in the Zoom interface.";
    };

    DisableZoomAppsGuestAccess = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Control the ability for users to utilize a Zoom App in Guest mode.";
    };

    Account = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Restrict the Zoom client to join meetings from the specified account IDs.";
    };

    SetDevicePolicyToken = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enforce internal meeting authentication.";
    };

    ZDisableVideo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Automatically turn off camera when joining a meeting";
    };

    zDisableSendVideo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Disable sending video from the Zoom Client";
    };

    zDisableRecvVideo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Disable receiving video from the Zoom Client";
    };

    DisableComputerAudio = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Disable use of computer audio on the Zoom Client";
    };

    EnableOriginalSound = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enable Orginal Sound for audio";
    };

    ZAutoJoinVoip = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Automatically join VoIP ";
    };

    AudioAutoAdjust = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Automatically adjust microphone levels";
    };

    Enable49Video = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Sets the max number of participants displayed in Gallery View to 49 participants per screen";
    };

    HideSelfView = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Controls the use of the Hide Self View option";
    };

    EnableFaceBeauty = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enables the 'Touch Up' appearance setting";
    };

    SetFaceBeautyValue = lib.mkOption {
      type = types.nullOr (types.str);
      default = "25";
      description = "Allows setting the exact intensity of the Touch up my appearance filter";
    };

    EnableEchoCancellation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enables echo cancellation for the microphone audio";
    };

    EnableHardwareOptimizeVideoSharing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enable to require hardware acceleration to optimize video sharing";
    };

    SetSuppressBackgroundNoiseLevel = lib.mkOption {
      type = types.nullOr (types.enum [ "0" "1" "2" "3" ]);
      default = "0";
      description = "Set the noise suppression level";
    };

    SetScreenCaptureMode = lib.mkOption {
      type = types.nullOr (types.enum [ "0" "1" "2" "3" "4" ]);
      default = "0";
      description = "Forces the specified screen capture mode";
    };

    SetUseSystemDefaultSpeakerForVOIP = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Uses the system default speaker when using computer audio";
    };

    SetUseSystemDefaultMicForVOIP = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Uses the system default speaker when using microphone audio";
    };

    ZDualMonitorOn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Automatically enable dual monitor";
    };

    ZAutoFullScreenWhenViewShare = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Automatically enter full screen when viewing shared content";
    };

    ZAutoFitWhenViewShare = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Automatically fit to window when viewing shared content";
    };

    ZDisableAnnotation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable and remove the ability to annotate over shared screen";
    };

    EnableSplitScreen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enables side-by-side mode by default";
    };

    EnableSpotlightSelf = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If enabled, shows self as the active speaker when speaking";
    };

    FullScreenWhenJoin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Full Screen when starting or joining a meeting";
    };

    HidePhoneInComingCallWhileInMeeting = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If enabled, prevents incoming call notifications while in a meeting";
    };

    EnableLaunchApp4IncomingCalls = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Control the Launch an external app or a URL for incoming calls option in the client";
    };

    SetCommand4IncomingCalls = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Set the URL used when the client receives an incoming call";
    };

    AutoHideToolbar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If set to 'false', always show meeting controls (enables the always show meeting control setting).";
    };

    ZUse720PByDefault = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enable HD video in meetings";
    };

    ZRemoteControllAllApp = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Remote control all applications";
    };

    ZHideNoVideoUser = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Hide non-video participants by default";
    };

    MuteVoipWhenJoin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Always mute microphone when joining a meeting";
    };

    ShowConnectedTime = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Show the length of time that the user has been in a meeting";
    };

    MuteWhenLockScreen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Automatically mute the microphone and turn off video, when the screen is locked during a meeting.";
    };

    ConfirmWhenLeave = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Confirm before leaving a meeting";
    };

    DisableScreenShare = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable Screen Share when starting or joining a meeting";
    };

    EnableShareAudio = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enable the Share computer audio option when sharing";
    };

    EnableShareVideo = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enable the Optimize for video clip option when sharing";
    };

    DisableWhiteBoard = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable Classic Whiteboard feature";
    };

    DisableInMeetingWhiteBoard = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable the Zoom Whiteboard feature in meetings and webinars";
    };

    DisableDesktopShare = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable the option to share your desktop when screen sharing";
    };

    DisableSlideControl = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable the use of slide control";
    };

    DisableRemoteControl = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables Remote Control when screen sharing";
    };

    EnableDoNotDisturbInSharing = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Silence system notifications when sharing desktop";
    };

    DisableRemoteSupport = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Disables 1:1 remote support when screen sharing";
    };

    EnableMirrorEffect = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Enable mirroring of shared video";
    };

    zDisableLocalRecord = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables Local Recording from the Zoom Client";
    };

    zDisableCMR = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables Cloud Recording from the Zoom Client";
    };

    zDisableChat = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable in-meeting chat";
    };

    zDisableFT = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables in-metting file transfer (sharing and receiving)";
    };

    DisableMeeting3rdPartyFileStorage = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable in-meeting 3rd party file transfer";
    };

    DisableQnA = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable Q&A in webinars";
    };

    DisableVirtualBkgnd = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables use of the Virtual Background feature";
    };

    DisableMeetingReactions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables use of reactions in meetings";
    };

    DisableNonVerbalFeedback = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable the use of non-verbal feedback.";
    };

    DisableWebinarReactions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable the use of Webinar reactions.";
    };

    DisableBroadcastBOMessage = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable the ability for the host to broadcast a message to all open breakout rooms.";
    };

    EnableAutoReverseVirtualBkgnd = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Require post-meeting virtual background auto-reversal.";
    };

    DisableVideoFilters = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables use of video filters";
    };

    EnableIndependentDataPort = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Split traffic across different ports for easier identification";
    };

    EnableLightAdaption = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Set use of adjust for low-light video setting";
    };

    EnableAutoLightAdaption = lib.mkOption {
      type = types.nullOr (types.enum [ False True ]);
      default = false;
      description = "Set method of adjusting low-light video feature";
    };

    SetLightAdaptionManualValue = lib.mkOption {
      type = types.nullOr (types.str);
      default = "20";
      description = "Set method of adjusting low-light video feature";
    };

    VideoRenderMethod = lib.mkOption {
      type = types.nullOr (types.enum [ "0" "1" "2" "3" "4" ]);
      default = "0";
      description = "Set the video rendering method";
    };

    EnableRemindMeetingTime = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If enabled, sets a reminder for upcoming meetings";
    };

    EnableSSLVerification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "The Zoom Client will verify the server certificate";
    };

    EnableShareClipboardWhenRemoteControl = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Allow clipboard access during remote control sessions";
    };

    DisableClosedCaptioning = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent the use of closed captioning";
    };

    DisableManualClosedCaptioning = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Prevent the use of manual, user-entered closed captioning";
    };

    BandwidthLimitUp = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Limit the Maximum amount of bandwidth by the Mac client";
    };

    BandwidthLimitDown = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Limit the Minimum amount of bandwidth used by the Mac client";
    };

    RecordPath = lib.mkOption {
      type = types.nullOr (types.str);
      default = "/Users/User Name/Documents/Zoom";
      description = "Set path for local meeting recording files";
    };

    ProxyBypass = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Set proxy bypass rule for the Zoom Client";
    };

    ProxyServer = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Set the proxy server for the Zoom Client";
    };

    ProxyPAC = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Set proxy server to client with PAC URL for the Zoom Client";
    };

    DisableLinkPreviewInChat = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disable Link Preview";
    };

    SetMessengerDoNotDropThread = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Move messages with new replies to the bottom of the chat/channel";
    };

    ShowProfilePhotosInChat = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Controls if user profile pictures are shown in Zoom Chat";
    };

    MuteIMNotificationWhenInMeeting = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Control if IM message system notifications are muted when in a meeting";
    };

    PlaySoundForIMMessage = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Control the audio notifications when an IM message is received";
    };

    ShowIMMessagePreview = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Control if the message previews in system notifications when an IM message is received";
    };

    ShowVoiceMessageButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "If enabled, shows the send voice message button";
    };

    ShowVideoMessageButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Allow use of the Send video message option";
    };

    OverrideEnforceSigninIntercloud = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Override the EnforceSignInToJoin policy and allows a user to join a Zoom meeting hosted on the ZfG Cloud, without the need to authenticate";
    };

    Intercloud_DisableAllFeatures = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables all features except for audio and video for meetings hosted on the ZfG Cloud";
    };

    Intercloud_DisableMeetingChat = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables the use of in-meeting chat on meetings hosted on the ZfG Cloud";
    };

    Intercloud_DisableShareScreen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables the local ability to share screen on meetings hosted on the ZfG Cloud";
    };

    Intercloud_DisableMeetingReactions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables the use of meeting reactions on meetings hosted on the ZfG Cloud";
    };

    Intercloud_DisableMeetingFileTransfer = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables the use of file transfers through in-meeting chat on meetings hosted on the ZfG Cloud";
    };

    Intercloud_DisableAnnotation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables the local ability to annotate on shared content in meetings hosted on the ZfG Cloud";
    };

    Intercloud_DisableWhiteBoard = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disables the use of in-meeting whiteboarding on meetings hosted on the ZfG Cloud";
    };

    Intercloud_DisableLocalRecording = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disabled by default, this option disables the ability to locally record meetings hosted on the ZfG Cloud";
    };

    Intercloud_DisableClosedCaptioning = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disabled by default, this option disables the use of captioning features on meetings hosted on the ZfG Cloud";
    };

    Intercloud_DisableRemoteControl = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disabled by default, this option disables the remote control of shared screens in meetings hosted on the ZfG Cloud";
    };

    Intercloud_DisableMeetingPolls = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disabled by default, this option disables the use of polling in meetings hosted on the ZfG Cloud";
    };

    Intercloud_DisableComputerAudio = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Disabled by default, this option disables the use of computer audio for connecting to meetings hosted on the ZfG Cloud";
    };

  };
}