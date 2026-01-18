# Auto-generated from ProfileManifests: com.microsoft.office.plist
# Domain: com.microsoft.office
# Title: Microsoft Office
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-office" = {
    enable = lib.mkEnableOption "Microsoft Office";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.microsoft.office";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    TermsAccepted1809 = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If you don't want your users to see the Office 2019 Use Terms dialog, and instead accept the terms on their behalf, set this value to TRUE.";
    };

    OfficeActivationEmailAddress = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "This value pre-fills the account authentication field for O365 users and sets the 'Belongs to' field in the About Box for both O365 and VL users.";
    };

    OfficeAutoSignIn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Automatically configure Office 365 mailbox on first launch for Outlook. Will suppress first run dialogs for Word, Excel, PowerPoint and OneNote. For new installations from the Mac App Store, will bypass the first run dialogs that ask users if they wish to purchase a new Office 365 subscription.";
    };

    ConnectedOfficeExperiencesPreference = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "You can use this preference to control whether most connected experiences are available to your users.";
    };

    OfficeExperiencesAnalyzingContentPreference = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Connected experiences that analyze your content are experiences that use your Office content to provide you with design recommendations, editing suggestions, data insights, and similar features. For example, PowerPoint Designer or Researcher in Word.";
    };

    OfficeExperiencesDownloadingContentPreference = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Connected experiences that download online content are experiences that allow you to search and download online content including templates, images, 3D models, videos, and reference materials to enhance your documents. For example, Office templates or PowerPoint QuickStarter.";
    };

    OptionalConnectedExperiencesPreference = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "In addition to the connected experiences above, there are some optional connected experiences that you may choose to allow your users to access. For example, the LinkedIn features of the Resume Assistant in Word or the Weather Bar in Outlook, which uses MSN Weather.";
    };

    DiagnosticDataTypePreference = lib.mkOption {
      type = types.nullOr (types.enum [ "BasicDiagnosticData" "FullDiagnosticData" "ZeroDiagnosticData" ]);
      default = "BasicDiagnosticData";
      description = "Diagnostic data is used to keep Office secure and up-to-date, detect, diagnose and remediate problems, and also make product improvements.";
    };

    SendAllTelemetryEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Controls wether diagnostic data transmission is on or off.";
    };

    HasUserSeenEnterpriseFREDialog = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Setting this option to TRUE will suppress the 'Your privacy options' dialog for Volume License users only.";
    };

    msoridEnableLogging = lib.mkOption {
      type = types.nullOr (types.int);
      default = 0;
      description = "Increase logging levels for authentication requests. Enable Minimum Severity (msoridDefaultMinimumSeverity) option if this key is enabled.";
    };

    msoridDefaultMinimumSeverity = lib.mkOption {
      type = types.nullOr (types.int);
      default = 200;
      description = "Set value to 200 if 'logging for authentication requests' (msoridEnableLogging) is enabled.";
    };

    DefaultsToLocalOpenSave = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "When set to true will force the open/save panel to ‘On My Mac' instead of 'Online Locations'.";
    };

    ShowDocStageOnLaunch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Show or Hide the Document gallery selector when office applications are launched.";
    };

    ShowWhatsNewOnLaunch = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "A setting of FALSE supresses all \"What's new\" messages for all suite apps: Word, PowerPoint, Excel, Outlook and OneNote.";
    };

    kCUIThemePreferencesThemeKeyPath = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = 0;
      description = "Set the theme used by Microsoft Office.";
    };

    InstallAutoUpdate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Uncheck (FALSE) to prevent the Office suite installer from installing AutoUpdate. (Not needed if you want to use default value of TRUE.)";
    };

    InstallDefender = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Uncheck (FALSE) to prevent the Office suite installer from installing Defender. (Not needed if you want to use default value of TRUE.)";
    };

    InstallExcel = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Uncheck (FALSE) to prevent the Office suite installer from installing Excel. (Not needed if you want to use default value of TRUE.)";
    };

    InstallOneDrive = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Uncheck (FALSE) to prevent the Office suite installer from installing OneDrive. (Not needed if you want to use default value of TRUE.)";
    };

    InstallOneNote = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Uncheck (FALSE) to prevent the Office suite installer from installing OneNote. (Not needed if you want to use default value of TRUE.)";
    };

    InstallOutlook = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Uncheck (FALSE) to prevent the Office suite installer from installing Outlook. (Not needed if you want to use default value of TRUE.)";
    };

    InstallPowerPoint = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Uncheck (FALSE) to prevent the Office suite installer from installing PowerPoint. (Not needed if you want to use default value of TRUE.)";
    };

    InstallTeams = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Uncheck (FALSE) to prevent the Office suite installer from installing Teams. (Not needed if you want to use default value of TRUE.)";
    };

    InstallWord = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Uncheck (FALSE) to prevent the Office suite installer from installing Word. (Not needed if you want to use default value of TRUE.)";
    };

    VisualBasicEntirelyDisabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If enabled, completely disables VBA.";
    };

    VisualBasicMacroExecutionState = lib.mkOption {
      type = types.nullOr (types.enum [ "DisabledWithoutWarnings" "DisabledWithWarnings" "EnabledWithoutWarnings" ]);
      default = "DisabledWithWarnings";
      description = "The VisualBasicMacroExecutionState1 setting controls whether macros are ever allowed to execute, and what the user experience is when opening a file that contains a macro. By default, macros will only run after the user is presented with an alert when opening a file that contains a macro. The user must make a choice whether to allow or deny macros for each individual file, each time that file is opened.";
    };

    DisableVisualBasicExternalDylibs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Controls the ability for 3rd party vendors to use a DECLARE statement to bind a Visual Basic symbol name to an external procedure in the local OS.";
    };

    AllowVisualBasicToBindToSystem = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Determines if macros are allowed to use a DECLARE to bind to the system() OS API. This API allows macros to execute arbitrary external processes and pass them arbitrary data on the command line.";
    };

    DisableVisualBasicToBindToPopen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Determines if macros are allowed to use a DECLARE to bind to the popen() OS API. This API allows macros to execute arbitrary external processes and pass them arbitrary data on the command line.";
    };

    DisableVisualBasicMacScript = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "The DisableVisualBasicMacScript setting determines if macros are allowed to invoke the MacScript() Visual Basic API. This API allows macros to execute arbitrary processes via AppleScript by including \"do shell script ...\" in the AppleScript code.";
    };

    VBAObjectModelIsTrusted = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Controls the ability for Office to write to the VB project through the VBA object model.";
    };

  };
}