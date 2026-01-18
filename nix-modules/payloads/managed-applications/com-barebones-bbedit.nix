# Auto-generated from ProfileManifests: com.barebones.bbedit.plist
# Domain: com.barebones.bbedit
# Title: BBEdit
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-barebones-bbedit" = {
    enable = lib.mkEnableOption "BBEdit";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.barebones.bbedit";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    ApplicationAppearanceMode = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Offers you three choices to control BBEdit’s appearance.";
    };

    SelectedColorSchemeName = lib.mkOption {
      type = types.nullOr (types.enum [ "BBEdit Classic" "BBEdit Dark" "BBEdit Light" "BBEdit Retro Dark" "BBEdit Retro Light" "Douce nuit 4" "Dusk" "Ponies" "Seafoam" "Toothpaste" "Xcode Dark" ]);
      default = null;
      description = "Allows you to easily select any existing color scheme.";
    };

    SelectedColorSchemeNameDarkMode = lib.mkOption {
      type = types.nullOr (types.enum [ "BBEdit Classic" "BBEdit Dark" "BBEdit Light" "BBEdit Retro Dark" "BBEdit Retro Light" "Douce nuit 4" "Dusk" "Ponies" "Seafoam" "Toothpaste" "Xcode Dark" ]);
      default = null;
      description = "Allows you to easily select any existing color scheme.";
    };

    StatusBarSizeMode = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Controls whether the text and icons displayed in the navigation bar, the status bar, and in the sidebars of editing, project, and differences windows are of normal, large, or extra-large size.";
    };

    ListDisplayFontSize = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "Controls the size of the system font used to display text in browser list panes, including disk browsers, search results browsers, FTP/SFTP browsers, etc.";
    };

    WhichAppIcon = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 ]);
      default = null;
      description = "Allows you to control which icon BBEdit presents in the Finder (if possible) and in the Dock (while the application is running).";
    };

    ToolbarShowTextOptionsMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the Text Options popover in the navigation bar.";
    };

    NavbarShowDocumentNavigation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the Document popup menu in the navigation bar.";
    };

    NavbarShowMarkerMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the Marker popup menu in the navigation bar.";
    };

    NavbarShowFileVersionsButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the File Revisions button in the navigation bar.";
    };

    NavbarShowCounterpartButton = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the Related Files button in the navigation bar.";
    };

    NavbarShowDocumentIcon = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the document status icon in the navigation bar.";
    };

    NavbarShowFunctionMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the Function popup menu in the navigation bar.";
    };

    FunctionMenuSortItemsByName = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the Function popup menu in the navigation bar.";
    };

    EditingWindowShowLineNumbers = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays line numbers along the left edge of the window.";
    };

    EditingWindowShowGutter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the gutter.";
    };

    EditingWindowShowTabStops = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays tab stops as vertical grid lines within the content area of text windows, using the tab width set in the Editor Defaults panel.";
    };

    EditingWindowShowPageGuide = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the page guide.";
    };

    EditingWindowPageGuideWidth = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Displays the page guide at the specified character width.";
    };

    EditingWindowGuideContrast = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "Adjusts the contrast level of the page guide display region.";
    };

    TextStatusBarShowCursorPosition = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the current location (line and column) of the insertion point, or the endpoint of the current selection range in the status bar.";
    };

    TextStatusBarShowLanguageMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the Language popup menu in the status bar.";
    };

    TextStatusBarShowTextEncodingMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the Text Encoding popup menu in the status bar.";
    };

    TextStatusBarShowLineBreakMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the Line Break Type popup menu in the status bar.";
    };

    TextStatusBarShowDocumentLockState = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays a padlock icon in the status bar to represent the document’s current lock state.";
    };

    TextStatusBarShowDocumentDate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the current document’s last saved date and time (if applicable) in the status bar.";
    };

    TextStatusBarShowDocumentStatistics = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays an item in the status bar which shows the number of characters, words, and lines in the document.";
    };

    TextStatusBarShowLiveMatchCount = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays either the number of matches for the selected text within the document, or the word surrounding the insertion point if applicable.";
    };

    TextStatusBarShowMagnification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the Magnification popup in the status bar.";
    };

    NewAndOpenPrefersSharedWindow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls whether BBEdit should attempt to open newly created or opened documents into the frontmost window (if possible), or whether each document should open directly into a separate text window.";
    };

    WatchDocumentsOnDisk = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Checks if documents have changed on disk while they’re open.";
    };

    NSRecentDocumentsLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "How many files appear on the Open Recent sub-menu";
    };

    Display_FullPathInRecentMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Always display full paths in the Open Recent menu.";
    };

    StartupAndResumeAction = lib.mkOption {
      type = types.nullOr (types.enum [ 1 0 ]);
      default = null;
      description = "Controls what BBEdit does when you launch it, or activate it when there are no open windows.";
    };

    RestoreApplicationStateAtStartup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Remember what documents (as well as disk browsers and FTP/SFTP browsers) were open when you choose the “Quit” command, and will attempt to reopen those documents the next time you launch it.";
    };

    RestoreUnsavedDocumentsAtStartup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will preserve the contents of any unsaved document contents when you quit and restore those documents the next time you launch it.";
    };

    ReopenDocumentsOnRemoteVolumes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Attempt to reopen documents from remote servers when you launch BBEdit.";
    };

    AlwaysFetchRemoteDocuments = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Always reconnect and reload all files previously opened from remote servers.";
    };

    SUSoftwareUpdateEnabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Automatically looks to see if a newer version is available.";
    };

    GetMeOnTheBetaTrainWooWoooooChuggaChuggaChuggaChugga = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Checks for pre-release versions.";
    };

    ChatGPTModel = lib.mkOption {
      type = types.nullOr (types.enum [ "gpt-3.5-turbo" "gpt-3.5-turbo-16k" "gpt-3.5-turbo-instruct" "gpt-4" "gpt-4-32k" ]);
      default = null;
      description = "The default model BBEdit should use for ChatGPT.";
    };

    AIWorksheetWrapResponses = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = " Responses should be wrapped.";
    };

    AIWorksheetWrapResponseCharLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Set the character width at which lines within responses should be wrapped.";
    };

    TextCompletionTrigger = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Choose when BBEdit will display text completions.";
    };

    Editor_AutoCompleteDelay = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "Choose when BBEdit will display text completions.";
    };

    IncludeDictionaryWordsInCompletionList = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will include dictionary words in the text completion list.";
    };

    IncludeTextReplacementsInCompletionList = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will include any system-wide Text Replacement triggers (as configured in the “Keyboard” system preferences) which begin with the text you typed in the completion popup.";
    };

    AutoInsertPairs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Typing any opening delimiter will cause BBEdit to immediately insert the appropriate closing delimiter.";
    };

    AutoPairsSurroundSelection = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Typing an opening delimiter will cause BBEdit to surround the selected text with a matched pair of delimiters.";
    };

    HighlightInstancesOfSelectedText = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will display all occurrences of the selection within the current document.";
    };

    UseLineHeightHighlightingForInstancesOfSelectedText = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 ]);
      default = null;
      description = "Will display all occurrences of the selection within the current document via either underlining or highlighting.";
    };

    DelayBeforeHighlightingInstancesOfSelectedText = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "Adjust the duration of the delay before BBEdit applies highlighting.";
    };

    ShowTickMarksForInstancesOfSelectedText = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows tick marks for instances of selected text.";
    };

    ShowTickMarksForLiveSearchMatches = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows tick marks for instances of Live Search results.";
    };

    ShowTickMarksForSpellingErrors = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows tick marks for instances of spelling errors.";
    };

    ShowTickMarksForLanguageDiagnostics = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows tick marks for instances of issues.";
    };

    ShowLSPDiagnosticsInLineBar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will display LSP-generated diagnostics when available.";
    };

    HighlightInsertionPoint = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will highlight the line that currently contains the insertion point.";
    };

    UseHardLineNumbersInSoftWrappedViews = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "The line number bar, position display, and Line Number commands in editing views will use line and character position numbers that correspond to the “hard” line breaks actually present in the document, rather than the soft-wrapped line breaks.";
    };

    InsertionPointCursorType = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 ]);
      default = null;
      description = "Choose your desired insertion point cursor style.";
    };

    EditorLineSpacingMultiplier = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "Adjust the amount of space between lines of text in editing views.";
    };

    ExtraSpaceInTextViews = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 3 ]);
      default = null;
      description = "Allows you to specify how much empty space BBEdit should leave after the end of each document’s content.";
    };

    PinchZoomChangesMagnification = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use touchpad pinch gestures to increase or decrease the magnification level of the frontmost (active) document.";
    };

    AllowSingleClickLineSelection = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Select lines by single-clicking on them in the line number bar or gutter.";
    };

    EditorCutCopyLinesForInsertionPoint = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "The Cut and Copy commands will act upon the entire line which contains the insertion point, in order to make life easier for Windows refugees.";
    };

    CollapseFoldsWhenOpening = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will automatically collapse all folds.";
    };

    CollapseFoldsWhenOpeningBelowLevel = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "Specifies the level to collaps folds.";
    };

    GlyphForInvisibleTabs = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Allows you to specify alternative characters for tabs.";
    };

    GlyphForInvisibleLineBreaks = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Allows you to specify alternative characters for tabs.";
    };

    BBEditorFont = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Controls the standard font and font size which BBEdit uses to display the contents of text windows. This is in \"data\" format.\nTo get the correct entry you will need to set the font in BBEdit first, then open the preference plist file in Xcode and copy the data string from the BBEditorFont key. Omit the <> from start and end of the string.";
    };

    EditorFontSettingOverridesSavedState = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will cause the default font to always prevail over any previously saved font settings associated with a given text file.";
    };

    EditorDefaultTabWidth = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "Controls the default number of spaces that BBEdit uses to represent the width of a tab character.";
    };

    EditorDefaultMagnification = lib.mkOption {
      type = types.nullOr (types.enum [ 800 500 400 300 200 175 150 125 100 75 50 33 25 10 ]);
      default = null;
      description = "Sets the default magnification for new text documents.";
    };

    EditorAutoIndent = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Pressing the Return key in new windows automatically inserts spaces or tabs to indent the new line to the same level as the previous line.";
    };

    BalanceWhileTyping = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Flashes the matching open parenthesis, brace, bracket, or curly quote when you type a closing one.";
    };

    EditorUseTypographersQuotes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will automatically substitutes curly (or typographer’s) quotes (“ ” ‘ ’) for straight quotes (\" ') in any new documents you create.";
    };

    EditorAutoExpandTabs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Inserts an appropriate number of spaces instead of a tab character every time you press the Tab key.";
    };

    EditorShowInvisibleCharacters = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Shows or hides non-printing characters in the window.";
    };

    EditorShowSpaces = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will display placeholder characters for spaces.";
    };

    EditorShowTabs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will display placeholder characters for tabs.";
    };

    EditorShowLineBreaks = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will display placeholder characters for line breaks.";
    };

    EditorCheckSpellingAsYouType = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will automatically check spelling as you type, and underline any potentially misspelled words.";
    };

    EditorSoftWrap = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Soft-wraps the text in the file to the right margin that you choose.";
    };

    SoftWrapStyle = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 3 ]);
      default = null;
      description = "Soft-wraps the text in the file to the right margin that you choose.";
    };

    EditorSoftWrapWidth = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Soft-wraps the text in the file to the right margin that you choose.";
    };

    SoftWrapIndentation = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 3 ]);
      default = null;
      description = "Lets you specify how BBEdit should indent soft wrapped text.";
    };

    TabNavigatesPlaceholders = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will jump to the next placeholder in the document (if any) when you press the Tab key, or the previous placeholder if you press Shift-Tab.";
    };

    HomeAndEndKeys = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 3 ]);
      default = null;
      description = "This setting will have the Home and End keys perform these respective actions.";
    };

    EnterGeneratesReturn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will generate a line break when you press the Enter key.";
    };

    AllowTabToIndentText = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "You can press the Tab key to invoke the Shift Right command, or Shift-Tab to invoke the Shift Left command.";
    };

    EnableShiftDeleteAsForwardDelete = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Holding down the Shift key with the Delete key makes the Delete key work the same way as the Forward Delete key on extended keyboards.";
    };

    EnableOSHelpKey = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Pressing the Insert key present on some PC-style keyboards will open BBEdit’s Help book.";
    };

    TrimLeadingWhitespaceWhenAutoIndenting = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When you type Return, BBEdit will insert a line break and strip the following whitespace, leaving the remaining text also left-aligned.";
    };

    PageUpOrDownMovesInsertionPoint = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Move the insertion point to the same relative position within the window in each new screenful of text displayed by Page Up or Page Down.";
    };

    OptionUpAndDownArrowMoveByParagraphs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "The Option-Up arrow and Option-Down arrow key shortcuts will advance to the previous or next paragraph.";
    };

    EmulateEmacsKeyBindings = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "This option allows you to use the basic Emacs navigation keystrokes to move around in editing views.";
    };

    DisplayEmacsStatusWindow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will display a small palette which shows Emacs shortcuts as you type them.";
    };

    EnableEmacsMetaSequences = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will intercept presses of the Escape key and use these to emulate a meta key to generate Emacs command sequences, at the cost of no longer being able to use the Escape key to exit full screen mode.";
    };

    UseEscapeKeyAsCompletionTrigger = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Pressing the Escape key will trigger text completion.";
    };

    DefaultLanguageNameForNewDocuments = lib.mkOption {
      type = types.nullOr (types.enum [ "actionscript" "ansi-c" "arduino" "c++" "clojure" "comma-separated-values" "css" "editorconfig" "fortran" "fortran-9x" "go" "html" "ini-file" "java" "javascript" "json" "jsp" "lasso" "lisp" "log-file" "lua" "make" "markdown" "object-pascal" "objective-c" "objective-c++" "perl" "php" "php-in-html" "python" "r" "racket" "rez" "ruby" "ruby-in-html" "rust" "sandbox-profile" "scheme" "scss" "setext" "software-package-notes" "solidity" "sql-(generic)" "sql-(ms-transact)" "sql-(mysql)" "sql-(pl/sql)" "sql-(postgresql)" "strings-file" "svelte" "swift" "tab-separated-values" "tcl" "tex" "text-file" "textile" "toml" "typescript" "unix-man-page" "unix-shell-script" "usda" "vbscript" "vectorscript" "verilog-hdl" "vhdl" "vue.js" "xcode-project" "xml" "yaml" ]);
      default = null;
      description = "If you like, you can set the default language for new untitled documents.";
    };

    DefaultLanguageNameForUnmappedFiles = lib.mkOption {
      type = types.nullOr (types.enum [ "actionscript" "ansi-c" "arduino" "c++" "clojure" "comma-separated-values" "css" "editorconfig" "fortran" "fortran-9x" "go" "html" "ini-file" "java" "javascript" "json" "jsp" "lasso" "lisp" "log-file" "lua" "make" "markdown" "object-pascal" "objective-c" "objective-c++" "perl" "php" "php-in-html" "python" "r" "racket" "rez" "ruby" "ruby-in-html" "rust" "sandbox-profile" "scheme" "scss" "setext" "software-package-notes" "solidity" "sql-(generic)" "sql-(ms-transact)" "sql-(mysql)" "sql-(pl/sql)" "sql-(postgresql)" "strings-file" "svelte" "swift" "tab-separated-values" "tcl" "tex" "text-file" "textile" "toml" "typescript" "unix-man-page" "unix-shell-script" "usda" "vbscript" "vectorscript" "verilog-hdl" "vhdl" "vue.js" "xcode-project" "xml" "yaml" ]);
      default = null;
      description = "If you like, you can set the default language for unmapped documents.";
    };

    BBSuffixMapOverrides = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          fileExtension = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Extension";
          };
          languageName = lib.mkOption {
            type = types.nullOr (types.submodule {
              options = {
                languageCode = lib.mkOption {
                  type = types.nullOr (types.enum [ "AScr" "C   " "Adno" "C++ " "Cloj" "CSV " "CSS " "ECFG" "Fort" "F90 " "GitC" "Go  " "GrpR" "GrpS" "HTML" ".ini" "Java" "JScr" "JSON" "JSP " "Laso" "Lisp" "LOG " "Lua " "Make" "MRKD" "Pasc" "ObjC" "ObC+" "P4  " "Perl" "PHP " "PHTM" "Pyth" "R___" "Rakt" "Rez " "Ruby" "RHTM" "Rust" "SBox" "Schm" "SCSS" "Setx" "ShWk" "PkgD" "Sold" "SQL " "MsSQ" "MySQ" "PlSQ" "PgSQ" "STRS" "Svel" "Swft" "TSV " "Tcl " "TeX " "DATA" "TxSR" "Txtl" "TOML" "TScr" "ManP" "Shel" "USDA" "VBSc" "VScr" "Veri" "VHDL" "VuJS" "PBXP" "XML " "YAML" ]);
                  default = null;
                  description = "Language: Code";
                };
                languageName = lib.mkOption {
                  type = types.nullOr (types.enum [ "ActionScript" "ANSI C" "Arduino" "C++" "Clojure" "Comma-separated Values" "CSS" "EditorConfig" "Fortran" "Fortran 9x" "Git commit note" "Go" "Grep Replace Pattern" "Grep Search Pattern" "HTML" "INI File" "Java" "JavaScript" "JSON" "JSP" "Lasso" "Lisp" "Log File" "Lua" "Make" "Markdown" "Object Pascal" "Objective-C" "Objective-C++" "Perforce Specification" "Perl" "PHP" "PHP in HTML" "Python" "R" "Racket" "Rez" "Ruby" "Ruby in HTML" "Rust" "Sandbox Profile" "Scheme" "SCSS" "Setext" "Shell Worksheet" "Software Package Notes" "Solidity" "SQL (Generic)" "SQL (MS Transact)" "SQL (MySQL)" "SQL (PL/SQL)" "SQL (PostgreSQL)" "Strings File" "Svelte" "Swift" "Tab-separated Values" "Tcl" "TeX" "Text File" "Text Search/Replace String" "Textile" "TOML" "TypeScript" "Unix man page" "Unix Shell Script" "USDA" "VBScript" "VectorScript" "Verilog HDL" "VHDL" "Vue.js" "Xcode Project" "XML" "YAML" ]);
                  default = null;
                  description = "Language: Name";
                };
              };
            });
            default = null;
            description = "Language";
          };
        };
      }));
      default = null;
      description = "You may add (or remove) additional extension mapping via the Custom Extension Mappings list. The values for the keys Language: Code and Language: Name need to match.";
    };

    "BBEditRegisteredOwner_11.0" = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Organization registered to BBEdit 11 license.";
    };

    "BBEditSerialNumber_11.0" = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "BBEdit 11 license.";
    };

    "BBEditRegisteredOwner_12.0" = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Organization registered to BBEdit 12 license.";
    };

    "BBEditSerialNumber_12.0" = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "BBEdit 12 license.";
    };

    "BBEditRegisteredOwner_13.0" = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Organization registered to BBEdit 13 license.";
    };

    "BBEditSerialNumber_13.0" = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "BBEdit 13 license.";
    };

    "BBEditRegisteredOwner_14.0" = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Organization registered to BBEdit 14 license.";
    };

    "BBEditSerialNumber_14.0" = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "BBEdit 14 license.";
    };

    "BBEditRegisteredOwner_15.0" = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Organization registered to BBEdit 15 license.";
    };

    "BBEditSerialNumber_15.0" = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "BBEdit 15 license.";
    };

    PreviewBrowserList = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          bundleID = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Bundle ID";
          };
          name = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Name";
          };
          path = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Path";
          };
          version = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "Version";
          };
        };
      }));
      default = null;
      description = "Displays all the available (installed) web browsers known to BBEdit.";
    };

    DefaultRenderer_Markdown = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 2 3 5 4 999 ]);
      default = null;
      description = "Allows you to select which built-in, or installed and recognized, Markdown processor BBEdit should employ to convert Markdown content to HTML for previewing and export.\nBBEdit has built-in support for ‘cmark’ as well as ‘classic’ Markdown.";
    };

    CustomRendererCommand_Markdown = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The command name must be available in your $PATH.";
    };

    CustomRendererCommandArguments_Markdown = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The command arguments must be separated by spaces.";
    };

    PrintUsingDocumentFont = lib.mkOption {
      type = types.nullOr (types.enum [ 1 0 ]);
      default = null;
      description = "specifies the default font BBEdit uses for printing when the “Print using document’s font” option is turned off.";
    };

    BBPrintingFont = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Uses the specified font and tab settings when printing. This is in \"data\" format.\nTo get the correct entry you will need to set the font in BBEdit first, then open the preference plist file in Xcode and copy the data string from the BBPrintingFont key. Omit the <> from start and end of the string.";
    };

    FramePrintingArea = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Draws a box along the edges of the printed text.";
    };

    PrintPageHeaders = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Prints the page number, the name of the file, the time and date printed in a header at the top of each page.";
    };

    PrintFullPathname = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Prints the full path of the file being printed in the header.";
    };

    PrintLineNumbers = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Prints line numbers along the left edge of the paper.";
    };

    PrintOneInchGutter = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Leaves a one-inch margin along the left edge of the paper.";
    };

    PrintColorSyntax = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Prints all colorized text within the document in color.";
    };

    PrintTimestampMode = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 ]);
      default = null;
      description = "Choose whether the date that appears in the printed page header is the date that the file was last modified or the date that the file was printed.";
    };

    AlwaysWrapToPrintedPage = lib.mkOption {
      type = types.nullOr (types.enum [ 1 0 ]);
      default = null;
      description = "Choose whether a document’s contents should always be soft-wrapped upon printing, or only if soft wrapping is enabled for that document.";
    };

    AlwaysShowFileList = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls whether BBEdit should display the sidebar only as needed.\nThe preference setting in BBEdit actually controlls two keys; AlwaysShowFileList and AutoShowFileList.\nThe proper settings for these key key match as follows:\nAs needed: AlwaysShowFileList-False / AutoShowFileList-True\nAlways: AlwaysShowFileList-True / AutoShowFileList-False\nNever: AlwaysShowFileList-False / AutoShowFileList-False";
    };

    AutoShowFileList = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls whether BBEdit should display the sidebar only as needed.\nThe preference setting in BBEdit actually controlls two keys; AlwaysShowFileList and AutoShowFileList.\nThe proper settings for these key key match as follows:\nAs needed: AlwaysShowFileList-False / AutoShowFileList-True\nAlways: AlwaysShowFileList-True / AutoShowFileList-False\nNever: AlwaysShowFileList-False / AutoShowFileList-False";
    };

    SidebarShowHideReshapesWindow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will reshape the entire window when the sidebar appears (or is hidden) to maintain the editing pane at a consistent size.";
    };

    SidebarListOpenDocumentsInNameOrder = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will add newly created and/or opened documents to the sidebar list in alphabetical order.";
    };

    ShowIconsInSidebarLists = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays icons for files and folders in the sidebar’s file list.";
    };

    ShowFinderTagsInSidebarLists = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Displays the Finder tags for files and folders in the sidebar’s file list.";
    };

    ProjectsListCanAcquireKeyboardFocus = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "The sidebar lists in projects, multi-document editing windows, and differences windows can acquire keyboard focus (by clicking or tabbing into them), and you can then use conventional keyboard navigation gestures to change the selection.";
    };

    BackgroundColor = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Controls the background color used within editing windows.\nThis needs to be entered as a comma seperated list of hue, saturation, lightness, and alpha (transparency).\nExample: hsla(0.668, 0.001, 0.970, 1.000)";
    };

    SpellingColor = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Controls the color BBEdit uses to highlight misspelled words.\nThis needs to be entered as a comma seperated list of hue, saturation, lightness, and alpha (transparency).\nExample: hsla(1.001, 0.503, 1.000, 1.000)";
    };

    InvisibleSpacesColor = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Controls the color BBEdit uses to display spaces when the Show Invisibles and Show Spaces display options are active.\nThis needs to be entered as a comma seperated list of hue, saturation, lightness, and alpha (transparency).\nExample: hsla(0.668, 0.003, 0.660, 1.000)";
    };

    InvisibleOthersColor = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Controls the color BBEdit uses to display invisible characters other than spaces when the Show Invisibles display options is active.\nThis needs to be entered as a comma seperated list of hue, saturation, lightness, and alpha (transparency).\nExample: hsla(0.003, 0.974, 0.868, 1.000)";
    };

    DifferenceHighlightColor = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Controls the color BBEdit uses to highlight differing regions within a Differences window.\nThis needs to be entered as a comma seperated list of hue, saturation, lightness, and alpha (transparency).\nExample: hsla(0.759, 0.311, 1.000, 1.000)";
    };

    SublineDifferenceHighlightColor = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Provides explicit control over the color BBEdit uses to display character ranges within a single top-level (or line-level) difference, rather than using a derived color.\nThis needs to be entered as a comma seperated list of hue, saturation, lightness, and alpha (transparency).\nExample: hsla(0.771, 0.389, 0.881, 1.000)";
    };

    InsertionPointLineHighlightColor = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Controls the color BBEdit uses to highlight the current line the insertion point is located at.\nThis needs to be entered as a comma seperated list of hue, saturation, lightness, and alpha (transparency).\nExample: hsla(0.172, 0.116, 0.976, 1.000)";
    };

    UseCustomHighlightColor = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Turn this option on to have BBEdit use custom highlight colors.";
    };

    PrimaryHighlightColor = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Choose the primary highlight color.\nThis needs to be entered as a comma seperated list of hue, saturation, lightness, and alpha (transparency).\nExample: hsla(0.591, 0.298, 1.000, 1.000)";
    };

    SecondaryHighlightColor = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Choose the secondary highlight color.\nThis needs to be entered as a comma seperated list of hue, saturation, lightness, and alpha (transparency).\nExample: hsla(0.668, 0.001, 0.864, 1.000)";
    };

    EnabledTextEncodings = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ 1030 525 1287 1048 39 1042 514 516 29 1281 1586 1585 36 1043 517 2562 152 7 1282 9 34 40 1041 1052 1029 519 6 1283 11 10 1046 37 236 2336 2080 1 1576 2561 1056 41 2368 3 1058 1024 1050 522 1045 528 38 1051 2352 25 1057 33 21 1053 26 2566 2569 2563 2353 2 1059 1044 521 35 1284 2568 909209186 909210741 825650786 1970549046 1970562616 809004642 1288 1536 1040 3074 3073 513 515 527 2564 0 2817 1280 ]));
      default = null;
      description = "Allows you to choose which of these encodings BBEdit includes in its menus.\nIf you make changes, the following entries are the defaults or are required:\nChinese (GB 18030)\nChinese (GBK)\nCyrillic (Windows)\nJapanese (ISO 2022-JP)\nJapanese (Mac OS)\nJapanese (Shift JIS)\nKorean (Mac OS)\nSimplified Chinese (GB 2312)\nSimplified Chinese (Mac OS)\nTraditional Chinese (Big 5)\nTraditional Chinese (Mac OS)\n[↓ These are required ↓]\nUnicode (UTF-16 Little-Endian, no BOM)\nUnicode (UFT-16 Little-Endian)\nUnicode (UTF-16, no BOM)\nUnicode (UTF-16)\nUnicode (UTF-8, with BOM)\nUnicode (UTF-8)\n[↑ These are required ↑]\nWestern (ISO Latin 1)\nWestern (ISO Latin 9)\nWestern (Mac OS Roman)\nWestern (Windows Latin 1)";
    };

    WriteTextEncodingValue = lib.mkOption {
      type = types.nullOr (types.enum [ 1030 525 1287 1048 39 1042 514 516 29 1281 1586 1585 36 1043 517 2562 152 7 1282 9 34 40 1041 1052 1029 519 6 1283 11 10 1046 37 236 2336 2080 1 1576 2561 1056 41 2368 3 1058 1024 1050 522 1045 528 38 1051 2352 25 1057 33 21 1053 26 2566 2569 2563 2353 2 1059 1044 521 35 1284 2568 909209186 909210741 825650786 1970549046 1970562616 809004642 1288 1536 1040 3074 3073 513 515 527 2564 0 2817 1280 ]);
      default = null;
      description = "Uses the encoding specified by this option for new documents which do not contain an intrinsic encoding specification.";
    };

    ReadTextEncodingFallbacks = lib.mkOption {
      type = types.nullOr (types.listOf (types.enum [ 1030 525 1287 1048 39 1042 514 516 29 1281 1586 1585 36 1043 517 2562 152 7 1282 9 34 40 1041 1052 1029 519 6 1283 11 10 1046 37 236 2336 2080 1 1576 2561 1056 41 2368 3 1058 1024 1050 522 1045 528 38 1051 2352 25 1057 33 21 1053 26 2566 2569 2563 2353 2 1059 1044 521 35 1284 2568 909209186 909210741 825650786 1970549046 1970562616 809004642 1288 1536 1040 3074 3073 513 515 527 2564 0 2817 1280 ]));
      default = null;
      description = "If BBEdit cannot determine a file’s proper encoding by examination, it will try opening the file using the encodings contained in this list, in the order they appear.\nThe default required value is \"Western (Mac OS Roman)\".";
    };

    DefaultLineBreakCharacter = lib.mkOption {
      type = types.nullOr (types.enum [ 1 2 3 ]);
      default = null;
      description = "If BBEdit cannot determine a file’s proper encoding by examination, it will try opening the file using the encodings contained in this list, in the order they appear.\nThe default required value is \"Western (Mac OS Roman)\".";
    };

    EnsureTrailingLineBreak = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will add a line break at the end of the file if there is not already one present.";
    };

    StripTrailingWhitespace = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will trim all trailing non-vertical whitespace from the document file before writing it out.";
    };

    MakeBackup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Automatically make a backup copy of each file that you save.";
    };

    KeepHistoricalBackups = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will preserve backups in the “BBEdit Backups” folder.";
    };

    BackupsPreserveFilenameExtension = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Have BBEdit place the tilde after the “base” name of the file (“foo~.html”) instead of the name of the original with a tilde appended (“foo.html~”).";
    };

    RescueDiscardedUntitledDocuments = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When this option is on and you close an untitled document (one that has never been saved to disk), and click “Don't Save”, BBEdit will preserve a snapshot of that document's contents.";
    };

    EnableRescueDocumentCleanup = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Will automatically perform some housekeeping for you by cleaning up rescued data.";
    };

    RescuedDocumentsCleanupInterval = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "You can adjust the interval from 1 to 365 days.";
    };

    TextFileNameExtensions = lib.mkOption {
      type = types.nullOr (types.listOf (types.str));
      default = null;
      description = "Add filename extensions for files that BBEdit does not intrinsically know about, but which should be treated as (plain) text files.";
    };

    AllowEditorConfigReadEncoding = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow Editor Config Read Encoding";
    };

    AllowFolderSelectionInOpenDialog = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow Folder Selection in Open Dialog";
    };

    AllowMultiLinePlaceholders = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow Multi Line Placeholders";
    };

    AllowPrototypeObjectExtend_JavaScript = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow Prototype Object Extend (JavaScript)";
    };

    AllowShebangLineOverride = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Allow Shebang Line Override";
    };

    AllowShiftRightToIndentWhitespaceOnlyLines = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "By default, the \"Shift Right\" command on the Text menu will not add indentation to lines that are empty or consist entirely of white space. If you would prefer to indent every line, regardless of its whitespace-only nature, set this preference to 'true'.";
    };

    AllowVolumeMountDuringStateRestore = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "BBEdit provides control over whether documents on remote servers - FTP/SFTP - or unmounted volumes are opened when automatically reopening documents at application startup. You can modify its behavior by setting this to 'true'.";
    };

    PromptToReopenRemoteDocuments = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If set to 'false', BBEdit will not attempt to open any documents that were opened from FTP/SFTP servers. Defaults to 'true'.  If set to 'false', BBEdit will open remote documents without asking, if ReopenRemoteDocuments is set to 'true'.";
    };

    AlwaysBringUnixScriptOutputToFront = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Always Bring Unix Script Output To Front";
    };

    AlwaysDisplaySoftHyphens = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Always Display Soft Hyphens";
    };

    AlwaysShowAnnunciatorForNotFound = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "To skip the sound check and always have BBEdit show the overlay alert instead of beeping.";
    };

    AlwaysUseBasePythonWithVirtualEnvironment = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Always Use Base Python With Virtual Environment";
    };

    AlwaysUseBasePythonWithVirtualEnvironment_Python = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Always Use Base Python With Virtual Environment (Python)";
    };

    AppleShowAllExtensions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Apple Show All Extensions";
    };

    AskForUnguessableFileEncoding = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Ordinarily, BBEdit will only ask you to choose a file's encoding when it can't otherwise figure out what the encoding is, and your \"if the file's encoding can't be guessed\" preference is a UTF-8 or UTF-16 variant. This should be fine for general use, but if for some reason you always want BBEdit to ask you when it can't guess a file's encoding, even if your preference would do the job, you can set this to 'true'.";
    };

    AskXcodeForOpenFileByName = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If Xcode is running, Open Selection and Open File by Name will ask it for a path to the file name; if something useful comes back, BBEdit will open it. If for some reason you are using Xcode but don't want BBEdit to do this, you can turn it off by setting this to 'false'.";
    };

    AutoIndentLSPCompletionText = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Auto Indent LSP Completion Text";
    };

    AutoRevealSelectedDocumentInProjectList = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "BBEdit will not automatically reveal documents in the project list when you select them;  View => Reveal in Project List works for this purpose. If you want automatic revealing, set to this to 'true'";
    };

    AutoSaveAppState = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Auto Save App State";
    };

    AutoSaveIntervalInMinutes_v2 = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "If document auto-save for crash recovery is on, this preference will define the default save time interval.";
    };

    AutoSwapCloseShortcuts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Auto Swap Close Shortcuts";
    };

    AutoWrapDocumentsWithLongLines = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Auto Wrap Documents With Long Lines";
    };

    AutoWrapDocumentsWithLongLines_HTML = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Auto Wrap Documents With Long Lines (HTML)";
    };

    AutoWrapLineLengthThreshold = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Auto Wrap Line Length Threshold";
    };

    BalanceIncludesDelimiters = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "By default, the \"Balance\" command (or double-clicking on a delimiter to balance) does not include the delimiters in the resulting selection. If you would like for it to do so, set this preference to 'true'.";
    };

    BRIEFStateTimeout = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "The progressive (BRIEF compatible) behavior of the Home and End keys operates within a specific time period; if you wait longer than that, the behavior state resets. The factory default timeout period is ten seconds.";
    };

    CamelCaseNavigationIncludesUnderscores = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When using \"camel case\" navigation (see above), BBEdit does not include underscores ( _ ) when moving or extending the selection range. If you would prefer that it do so, you can turn this on.";
    };

    CascadeNewWindows = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Cascade New Windows";
    };

    ChatGPTAPIRequestTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "ChatGPT API Request Timeout";
    };

    CheckModificationDateForRemoteSaves = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Check Modification Date For Remote Saves";
    };

    ClipboardTextDisplayLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Clipboard Text Display Limit";
    };

    Clipboard_ConvertNonBreakingSpacesWhenPasting = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Clipboard: Convert Non Breaking Spaces When Pasting";
    };

    ClippingsWorkInFindWindows = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Clippings Work In Find Windows";
    };

    CloseOFBNWindowAfterOpeningSelection = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "By default, the \"Open File by Name\" window stays open when you click the \"Open\" button. However, if you would prefer for it to act more like a modal dialog, set this to 'true'.";
    };

    CodelessPCRETimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Codeless PCRE Timeout";
    };

    ColorPatternsInGrepCheatSheet = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "BBEdit will color patterns (the left-hand column) in the Grep Cheat Sheet menu according to the active color scheme. If you would prefer monochromatic patterns for any reason turn this off.";
    };

    CommentWholeLineWithInsertionPoint = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When using the Un/Comment command, if nothing is selected, BBEdit will use the line comment delimiter to comment (or uncomment) the entire line. If you would prefer that BBEdit insert the line-comment delimiter at the insertion point instead, set this preference to 'false'.";
    };

    CondaInterfaceCommandTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Conda Interface Command Timeout";
    };

    ContextMenuClipboard = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Context Menu Clipboard";
    };

    ContextMenuMarkers = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Context Menu Markers";
    };

    ContextMenuResolveURL = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Context Menu Resolve URL";
    };

    ContextMenuSaveNewSelection = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Context Menu Save New Selection";
    };

    ContextMenuSpellChecking = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Context Menu Save New Selection";
    };

    ContextMenuTextFolding = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Context Menu Text Folding";
    };

    ContextMenuTextSearching = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Context Menu Text Searching";
    };

    CounterpartSiblingSearchNames = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "When the active document is either a source or a header file, the \"Open Counterpart\" command will now search the siblings of this file's parent for eligible counterparts. By default, BBEdit will only search in such folders if their names match one of the following patterns (including wildcards): `inc*`, `source`, `src`, or `*priv*`. If you wish to add additional qualifying names, you may do so by setting \"CounterpartSiblingSearchNames\" to contain a comma-delimited list of folder name patterns.\n\nAny whitespace surrounding the provided names will be stripped.";
    };

    CrossCheckForImageFilesWithTextEncodingXattr = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Cross Check For Image Files With Text Encoding Xattr";
    };

    CSSMarkup_NewLineBeforeBrace = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "CSS Markup: New Line Before Brace";
    };

    CSSMarkup_PreferShortHexColors = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "CSS Markup: Prefer Short Hex Colors";
    };

    CSSMarkup_SimpleRulesOnOneLine = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "CSS Markup: Simple Rules On One Line";
    };

    CtagsCompletionThreshold = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Ctags Completion Threshold";
    };

    DefaultNoteLanguageMode = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Ctags Completion Threshold";
    };

    Diff_IgnoreRCSKeywords = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When comparing text files, BBEdit will canonicalize RCS keywords to their unexpanded state, so that the values of RCS keywords are not significant to the differences calculations. If you wish, you can disable this, so that any chance in the RCS keywords on a line will cause the line to appear in the differences.";
    };

    DisableAllFontLigatures = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable All Font Ligatures";
    };

    DisableAttachmentScripts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Disable Attachment Scripts";
    };

    DisableCtagsScanOnRemoteVolumes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When editing files that are on remote file servers - AFP, NFS, SMB, etc. -, BBEdit will not look for directory-relative ctags data files. This is a particular performance win when the file is located on a volume mounted via MacFUSE/SSH or similar, or if the file server is over a slow or high-latency link.\n\nTo enable scanning for tags files on remote volumes, set this to 'false'.";
    };

    DisableCursorBlink = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "You can disable the cursor blink in BBEdit's editing windows.";
    };

    DisableFindAndReplaceHistory = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Completely disable the search history in the Find and Multi-File Search windows.";
    };

    DisablePassiveFTP = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Settings are available for disabling passive FTP, in order to deal with hosts that misbehave when sent the PASV command.\n\nPassive FTP can be disabled per host, per domain, or globally.";
    };

    DisplayPrivateAreaGlyphs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Display Private Area Glyphs";
    };

    Display_FullPathInWindowMenu = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Display: Full Path In Window Menu";
    };

    DoubleClickToBalance = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Double Click To Balance";
    };

    EditorTailMode_Log_File = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Editor Tail Mode (Log File)";
    };

    Editor_AlwaysOpenQuickFind = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "The Live Search bar is not visible by default, but appears when you choose \"Live Search\" from the Search menu. If you would like the Live Search bar to be visible in each new document that you create or open, set this to 'true'.";
    };

    Editor_AutoIndentIsBraceAware = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Editor: Auto Indent Is Brace Aware";
    };

    Editor_AutoWordCountSizeThreshold = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Automatic word counting is disabled for documents over a set size threshold, in order to avoid needless delays when working on very large documents. The factory default is 16M characters - 16777216 -, but you may change this limit. Setting to 0 disables the limit check entirely.";
    };

    Editor_ControlArrowCamelCase = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "BBEdit supports \"camel case\" navigation: press Control-left-arrow or Control-right-arrow to jump to the next (or previous) transition from lower-case to upper-case characters (or a word boundary, whichever comes first).\n\nNote that this use of Control-left-arrow and Control-right-arrow replaces the pre-8.5 behavior of using these key combinations to scroll horizontally. If you prefer the old behavior, set these this preference to 'false'.";
    };

    Editor_ControlArrowHScroll = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "BBEdit supports \"camel case\" navigation: press Control-left-arrow or Control-right-arrow to jump to the next (or previous) transition from lower-case to upper-case characters (or a word boundary, whichever comes first).\n\nNote that this use of Control-left-arrow and Control-right-arrow replaces the pre-8.5 behavior of using these key combinations to scroll horizontally. If you prefer the old behavior, set these this preference to 'true'.";
    };

    Editor_DeleteIndentationWhitespaceToTabStop = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When you backspace from the insertion point, BBEdit will delete a tab stop's worth of spaces if there are only spaces (and tabs) between the insertion point and the start of the line on which you're editing. This may be disabled by setting this preference to 'false'.";
    };

    Editor_SoftWrapLengthThreshold = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "For text documents whose size exceeds a certain threshold (expressed in bytes), BBEdit will ignore the Soft Wrap Text preference and leave wrapping off in order to improve the performance of opening very large files.";
    };

    Editor_SpellCheckLengthLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Since \"Find All Misspelled Words\" is pretty much pointless on files over a certain size, the maximum amount of text checked by this command is limited to 1M - 1024 squared - characters. This may be adjusted. Setting to 0 supresses the limit altogether.";
    };

    EnableAutoSave_v2 = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Document auto-save for crash recovery is on by default, to change this set this to 'false'.";
    };

    EnableCharacterWrappingToWindowWidth = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Character Wrapping To Window Width";
    };

    EnableDefaultFilenameExtensions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Default Filename Extensions";
    };

    EnableFontLigatures = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Font Ligatures";
    };

    EnableFontLigatures_Cascadia_Mono_ = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Font Ligatures: Cascadia Mono*";
    };

    EnableFontLigatures_Fira_Code_ = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Font Ligatures: Fira Code*";
    };

    EnableFontLigatures_Hasklig_ = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Font Ligatures: Hasklig*";
    };

    EnableFontLigatures_JetBrains_Mono_ = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Font Ligatures: Jet Brains Mono*";
    };

    EnableFontLigatures_MonoLisa_ = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Font Ligatures: Mono Lisa*";
    };

    EnableFontLigatures_Monoid_ = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Font Ligatures: Monoid*";
    };

    EnableFontLigatures_Monoisome_ = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Font Ligatures: Monoisome*";
    };

    EnableRareLigatures = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Rare Ligatures";
    };

    EnableSSHCompression = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Some servers don't work correctly when SSH compression is enabled. To work around this, SSH compression can be disabled per host, per domain, or globally.";
    };

    EnableSSHLegacyRSAHostKeys = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable SSH Legacy RSA Host Keys";
    };

    EnableSyntaxColoring = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable Syntax Coloring";
    };

    ExchangeCommandAndOptionHorizontal = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Exchange Command And Option Horizontal";
    };

    ExchangeCommandAndOptionVertical = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Exchange Command And Option Vertical";
    };

    FindAndReplaceHistorySize = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "By default, BBEdit will remember the 16 most recent search and replace strings/patterns for the popup menu in the Find and Multi-File Search windows. Setting the history to zero makes it infinite.";
    };

    FindDialog_UsesFindScrap = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Like many Mac OS X applications, BBEdit supports the \"Find Scrap\", a feature of the OS that enables sharing of the \"search for\" string between applications. Some applications put inappropriate content - such as Web search strings - on the Find Scrap, which can cause the \"search for\" string in BBEdit's Find dialog to be replaced when you didn't expect it.\n\nTo tell BBEdit not to import the Find Scrap into its Find window, nor to export the \"search for\" string to the Find Scrap, set this to 'false'.";
    };

    FixedWidthFontSmoothingThreshold = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Whether or not BBEdit uses text smoothing - antialiasing - may be adjusted separately for fixed-width and for proportional fonts. The factory default smoothing thresholds are 8pt for fixed width fonts, and 4pt for proportional fonts, respectively.";
    };

    FlashBalancePointsWhenNavigating = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When you use the right-arrow key to navigate over a closing delimiter (right paren/brace/bracket/curly quote), the opening delimiter will be briefly highlighted. If you wish to turn this off, set this preference to 'false'.";
    };

    FontSmoothingThreshold = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Whether or not BBEdit uses text smoothing - antialiasing - may be adjusted separately for fixed-width and for proportional fonts. Font sizes above the specified FixedWidthFontSmoothingThreshold are smoothed; font sizes below the threshold are not.";
    };

    ForceSingletonWindowsForUnixScriptOutput = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Force Singleton Windows For Unix Script Output";
    };

    FTPAbortTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "FTP Abort Timeout";
    };

    FTPAutoDisconnectPeriod = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "FTP Auto Disconnect Period";
    };

    FTPConnectionTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "FTP Auto Disconnect Period";
    };

    FTPControlTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "FTP Control Timeout";
    };

    FTPDisableMLSD = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Ordinarily, BBEdit will use the MLSD command to obtain directory listings if the server supports it; and will fall back to more primitive methods if not. On some servers, however, MLSD works, but does not return the same results as the older methods. Therefore, there is a method to disable use of MLSD.";
    };

    FTPRememberRecentFiles = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "FTP Remember Recent Files";
    };

    FTPSafeSaves = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "FTP Safe Saves";
    };

    FTPShowParentDir = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "On FTP servers, when using 'Show items starting with \".\",' the FTP server may return the `.` and `..` items as part of the listing. This is normal, but if you don't want to see these items, you can hide them.";
    };

    FTPTransferTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "FTP Transfer Timeout";
    };

    FullScreenWindowsHogScreen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "By default, the application will allow windows to take up the entire screen when entering full screen mode. If desired, you may prevent this and instruct the application to figure out whether a window should be made the full width of the screen by setting this to 'false'.";
    };

    FullScreenWidthThreshold = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "When entering full screen mode, the application figures out whether the window width should be increased to take up the full screen width, or not, based on the width of the window relative to the width of the screen that it's on. The threshold at which the window is made to take up the entire screen width can be set. This setting requires that FullScreenWindowsHogScreen be turned on\nNEED FLOAT NUMBER MIN & MAX";
    };

    FunctionMenuShowCommentCallouts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Function Menu Show Comment Callouts";
    };

    FunctionMenuShowFunctionPrototypes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Function Menu Show Function Prototypes";
    };

    FunctionPopup_Prototypes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Function Popup: Prototypes";
    };

    FunctionPopup_SortByName = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Function Popup: Sort By Name";
    };

    GenerateCompletionsFromNearbyTagsFiles = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Generate Completions From Nearby Tags Files";
    };

    GenerateTemporaryTagsForCompletion = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Generate Temporary Tags For Completion";
    };

    GrayLevelForModifiedRingsInListWidgets = lib.mkOption {
      type = types.nullOr (types.float);
      default = null;
      description = "Gray Level For Modified Rings In List Widgets";
    };

    GroupWindowsMenuByKind = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Group Windows Menu By Kind";
    };

    HonorEmacsStateOnOpen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Honor Emacs State On Open";
    };

    HTMLImageMarkupCreatesSizeAttributes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When you drop an image file into an HTML document to generate an image tag, BBEdit will generate \"width\" and \"height\" tags based on information in the file itself. If you would prefer to omit these, set these to 'false'.";
    };

    HTMLImageMarkupUseInlineStyleForImageSize = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If HTMLImageMarkupCreatesSizeAttributes is turned on, you can instruct BBEdit to generate inline styles for image sizes, instead of height and width by setting this to 'true'.";
    };

    HTMLImageMarkupUsesFileNameForAlt = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When generating image markup as a result of dropping an image file into an HTML document, BBEdit will generate an \"alt\" attribute for the image tag, whose value is the file's name. If you would prefer for the \"alt\" attribute to be omitted (which will result in an error when checking syntax), you can disable this by setting this to 'false'.";
    };

    InspectTextFileContentsForListFiltering = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "The \"Text Files Only\" filtering in project lists and disk browsers looks inside of files if necessary, for improved filtering accuracy.";
    };

    InspectZipArchiveContentsForFileFiltering = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When inspecting files to determine whether they're Zip archives for file filtering and searching, BBEdit will ordinarily only inspect the contents of the file if its metadata does not indicate that it’s a Zip archive. If for some reason you have files whose metadata indicates that they're Zip archives, but aren't really, you can use this setting to tell BBEdit to always inspect Zip archive contents.";
    };

    LeaveRoomForPalettes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Leave Room For Palettes";
    };

    LegacyUndoSelectionBehavior = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When performing an Undo or Redo and the selection range changes, the Undo/Redo operation will select the affected text, rather than updating the Undo/Redo state to include the actual current selection range. If however you prefer the classic behavior (as implemented from the beginning of time up through BBEdit 11.6), you may obtain set this preference to 'true'.";
    };

    LinkEncodingToCharset = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Link Encoding To Charset";
    };

    LiveMatchSizeLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Live Match Size Limit";
    };

    LongestLineCalculationLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Longest Line Calculation Limit";
    };

    LSPCompletionsReplaceInsteadOfInsert = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "LSP Completions Replace Instead Of Insert";
    };

    LSPEnableMarkdownDocumentation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "LSP Enable Markdown Documentation";
    };

    MakeShebangScriptsExecutable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Make Shebang Scripts Executable";
    };

    MakeTempProjectForFolderOpen = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Make Temp Project For Folder Open";
    };

    MarkupPanelAutoPrefillRecommendedAttributeNames = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When you invoke the Markup Panel to create a new tag, it will automatically fill in attribute names for \"promoted\" attributes. If there are any attributes that you don't want to be present in the generated markup, just leave their values blank, and the panel will omit them (unless the attributes are required).\n\nIf you wish, you can suppress the auto fill by setting this to 'false'.\n\nTurning off the auto fill will cause the \"gear\" to appear in the markup panel, and clicking it will manually fill in the promoted attributes for you.";
    };

    MarkupToolsMisc_SkipXMLFilesWhenScanningFolders = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When doing Check Syntax, Check Links, Update, or Update Images on a folder (including a web site), BBEdit will skip XML files (that is, files determined to be XML either by mapping their file name extensions, or by inspection of their contents). If you prefer to include such files, set this to 'false'.";
    };

    MaxDocumentLengthForCompletionTokenizer = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Since \"Find All Misspelled Words\" is pretty much pointless on files over a certain size, the maximum amount of text checked by this command is limited to 1M - 1024 squared - characters. This may be adjusted. Setting to 0 supresses the limit altogether.";
    };

    MaxFindDifferencesGroupSize = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Max Find Differences Group Size";
    };

    MaximumHeaderFontSize = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Maximum Header Font Size";
    };

    MaximumLineBarPointSize = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "BBEdit will calculate an appropriate size for font used in the line number bar, based on the point size of the font used for editing.";
    };

    MaximumTextLengthForLanguageGuessing = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Maximum Text Length For Language Guessing";
    };

    MinimumLinesForBlockFold = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Minimum Lines For Block Fold";
    };

    MostRecentItemsGroupLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The \"Remember the … most recently used items\" setting in the Application preferences applies to all item types. So, if it's set to 15, BBEdit will remember 15 text documents, 15 folders, 15 projects, 15 images, and so on. If you want finer control, you can construct an expert pref using the name of the document type as it appears in the menu, and if that name contains spaces, you'll need to quote it.\n\nYou can also control the number of items shown in the \"Most Recently Used\" group.";
    };

    MoveModelessWindowToActiveSpace = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When using Spaces, you can control whether BBEdit's modeless dialog boxes - Find, Multi-File Search, and Open File by Name - get moved to the active space when switching spaces. By default, this is allowed for the Find, Multi-File Search, and Open File by Name windows. To control whether windows of these types are moved to the active space, set this to 'true'.\n\nThis preference sets the default behavior for any of the defined window types for which a default is not explicitly specified.";
    };

    NumberOfOpenByNameItems = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Number Of Open By Name Items";
    };

    OFBNEnumeratesXcodeSubprojects = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "OFBN Enumerates Xcode Subprojects";
    };

    OFBNIncludesRecentItems = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "OFBN Includes Recent Items";
    };

    OnlyShowInvisibleUnicodeSpacesWhenShowSpacesIsTurnedOn = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Only Show Invisible Unicode Spaces When Show Spaces Is Turned On";
    };

    OpaqueBlockComments_PHP = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Opaque Block Comments (PHP)";
    };

    OpaqueHereDoc_PHP = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Opaque Here Doc (PHP)";
    };

    OpaqueLineComments_PHP = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Opaque Line Comments (PHP)";
    };

    OpaqueStrings_PHP = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Opaque Strings (PHP)";
    };

    OpenByNameMaxWildcardMatches = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "When searching for matches, Open File by Name limits the number of matches to a reasonable maximum. The factory default is 200.";
    };

    OpenDiskBrowserForTarballs = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Open Disk Browser For Tarballs";
    };

    OpenDiskBrowserForZipFiles = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Open Disk Browser For Zip Files";
    };

    OpenItemsOnSingleClick = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Open Items On Single Click";
    };

    OpenPanelShowsFrontDocumentDirectory = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "By default, the Open panel implements the standard system behavior of displaying the same folder that was viewed the last time you used the Open command. If you wish, you may instead have the Open panel display the directory containing the active document by setting this to 'true'.\n\nIf the active document is untitled or was opened from an FTP/SFTP server, or if there are no documents open, the Open panel will show you the last-used directory.";
    };

    OpenPDFsAsText = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "By default, PDFs are considered text files and so may be opened and searched along with all other text files. To have PDFs treated as a special file type - (they will be ignored for any operation that requires a text file - set this to 'false'.";
    };

    PerformLineFeedTranslation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Perform Line Feed Translation";
    };

    PrecomposeUnicodeWhenPasting = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you find that you frequently need to bring in text which contains combining Unicode characters (as are frequently found in PDFs generated on other platforms, for example), it can be desirable to preprocess the combining characters into one composed character where possible. This is not a general need, but if you run into it often enough, you can tell BBEdit to combine the characters for you by setting this preference to 'true'.\nDespite the name, the precomposition is done when BBEdit imports the Clipboard from other applications, not when the paste is actually done.\n\nNote that this requires an additional copy of the Clipboard when the application imports the text, and for very large pastes, there may be a noticeable delay while the text gets precomposed. Thus, you should only turn on this setting when you are frequently working with text that contains combining Unicode characters";
    };

    PreferEditorConfigTabWidth = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Prefer Editor Config Tab Width";
    };

    PrettyPrintPastedHTML = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Pretty Print Pasted HTML";
    };

    ProjectsAllowVolumeMountWhenReopening = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Projects Allow Volume Mount When Reopening";
    };

    ProjectsOpenItemsOnSingleClick = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Project windows will ordinarily open an item in the file list for editing when you click on it and the editing view is visible. To require a double-click, set this to 'false'.";
    };

    ProjectsRememberOpenDocuments = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Projects Remember Open Documents";
    };

    ProvideSTDINToUnixScripts = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "BBEdit provides the selection range in the active document (or the active document's contents, if there is no selection) as stdin when running a Unix script or executable from the Scripts menu. If the script isn't expecting this and never reads from stdin, this can cause a problem if there is more than 64K of data provided. The result will usually be a 100032 error.\nIf this is a regular occurrence for you, you can turn the feature off.";
    };

    NSRecentDocumentsLimit_Folders = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The \"Remember the … most recently used items\" setting in the Application preferences applies to all item types. So, if it's set to 15, BBEdit will remember 15 text documents, 15 folders, 15 projects, 15 images, and so on. If you want finer control, you can construct an expert pref using the name of the document type as it appears in the menu, and if that name contains spaces, you'll need to quote it.\n\nIf you don't want to remember any recent documents of a particular type - they won't appear in the menu, either -, you can set its limit to 0";
    };

    NSRecentDocumentsLimit_Images = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The \"Remember the … most recently used items\" setting in the Application preferences applies to all item types. So, if it's set to 15, BBEdit will remember 15 text documents, 15 folders, 15 projects, 15 images, and so on. If you want finer control, you can construct an expert pref using the name of the document type as it appears in the menu, and if that name contains spaces, you'll need to quote it.\n\nIf you don't want to remember any recent documents of a particular type - they won't appear in the menu, either -, you can set its limit to 0";
    };

    NSRecentDocumentsLimit_Projects = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The \"Remember the … most recently used items\" setting in the Application preferences applies to all item types. So, if it's set to 15, BBEdit will remember 15 text documents, 15 folders, 15 projects, 15 images, and so on. If you want finer control, you can construct an expert pref using the name of the document type as it appears in the menu, and if that name contains spaces, you'll need to quote it.\n\nIf you don't want to remember any recent documents of a particular type - they won't appear in the menu, either -, you can set its limit to 0";
    };

    NSRecentDocumentsLimit_Shell_Worksheets = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "The \"Remember the … most recently used items\" setting in the Application preferences applies to all item types. So, if it's set to 15, BBEdit will remember 15 text documents, 15 folders, 15 projects, 15 images, and so on. If you want finer control, you can construct an expert pref using the name of the document type as it appears in the menu, and if that name contains spaces, you'll need to quote it.\n\nIf you don't want to remember any recent documents of a particular type - they won't appear in the menu, either -, you can set its limit to 0";
    };

    RecentItems_RememberTempFiles = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "By default, BBEdit does not remember recent items opened from any of the canonical locations for temporary files. This also includes the \"svn-commit.tmp\" files used for Subversion commits. If desired, you can change this by setting this to 'true'.";
    };

    RememberFTPPasswords = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Remember FTP Passwords";
    };

    ReplaceAllResultsIncludeTiming = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you want to amaze and impress your friends and family with just how fast BBEdit's \"Replace All\" is, set this to 'true'.\n\nWhen set to 'true', the sheet, or growl notification, will display the amount of time required for the \"Replace All\" operation.";
    };

    ReportNonzeroExitCodeFromUnixFilters = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Report Nonzero Exit Code From Unix Filters";
    };

    ReportReplaceAllResults = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When performing a single-file \"Replace All\" operation, BBEdit can show a confirmation sheet showing the number of replacements performed. If you would like to see this confirmation, set this to 'true'.";
    };

    ReuseSearchResultsWindowsWhenPossible = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Reuse Search Results Windows When Possible";
    };

    ReverseSwipeNavigationSense = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Reverse Swipe Navigation Sense";
    };

    RunUnixCommand_HistoryLimit = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Run Unix Command: History Limit";
    };

    RunUsingPython3 = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When running a Python script, if python3 is anywhere in your $PATH, BBEdit will use it instead of python. While this is generally useful in a teaching environment, if you are using a custom Python installation (such as Anaconda), it may prove inconvenient.";
    };

    SafeSavesDisabled = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Safe Saves Disabled";
    };

    SaveDocumentState = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Save Document State";
    };

    SaveDocumentStateForTempFiles = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "By default, BBEdit will not store document state for documents located in any of the canonical locations for temporary files. This also includes the \"svn-commit.tmp\" files used for Subversion commits. If you wish, you can change this by setting this to 'true'.";
    };

    SaveOpenWithDataInTypelessFiles = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Prevent BBEdit from adding a filename extension.";
    };

    SaveTitledDocumentsBeforeSleeping = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "The \"Sleep\" command does not save any documents in place, since it creates an auto-save file for any open documents with unsaved changes. However, if you want BBEdit to save any titled - i.e. opened from an existing file - documents to disk before sleeping, you can set this preference to 'true'.";
    };

    ScanHTMLStringsForFunctions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Scan HTML Strings For Functions";
    };

    ScanHTMLStringsForFunctions_Python = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Scan HTML Strings For Functions (Python)";
    };

    ScriptEditorBundleID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "By default, BBEdit will open AppleScript files using whatever application the OS claims is capable of doing so. If you wish to override this, change the \"ScriptEditorBundleID\" preference to the bundle ID of your preferred script editor.";
    };

    SelectFirstPlaceholderInCompletions = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Select First Placeholder In Completions";
    };

    SFTPConnectionTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Most of the time, the default timeout for connecting to an SFTP server will suffice; however, if the server is heavily loaded it may take longer to respond.";
    };

    ShowAnonymousFunctions_ActionScript = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show Anonymous Functions (ActionScript)";
    };

    ShowAnonymousFunctions_JavaScript = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show Anonymous Functions (JavaScript)";
    };

    ShowFTPDotFiles = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show FTP Dot Files";
    };

    ShowFullPathsInSearchResults = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If you like BBEdit to show the full paths of files listed in search results windows, set this to 'true'.";
    };

    ShowGitIgnoredCommandIsVisible = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show Git Ignored Command Is Visible";
    };

    ShowLanguageSettingInShellWorksheets = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show Language Setting In Shell Worksheets";
    };

    ShowSCMDataCommandIsVisible = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show SCM Data Command Is Visible";
    };

    ShowSVNSwitchedItems = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "\"Show Working Copy Status\" for svn does not include switched items. If this affects you and you would prefer to see switched items, you may make them visibile by setting this to 'true'.";
    };

    ShowVariablesInFunctionList_PHP = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Show Variables In Function List (PHP)";
    };

    SkipNodeModulesWhenScanningFolders = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When scanning folders for various purposes (multi-file search, Find Differences, text factories, Open File by Name, and others), BBEdit will not explore node_modules directories that it encounters. If you want BBEdit to search node_modules directories turn this off.";
    };

    SkipSCMAdminDirsWhenScanningFolders = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When scanning folders for various purposes - multi-file search, Find differences, and others -, SCM administrative directories are specifically ignored, even if \"Search Invisible Folders\" is turned on: CVS, .svn, .git, .hg, .bzr. This avoids potential disasters that can result from indiscriminate search and replace in such directories. If, however, you choose to live dangerously, you can allow BBEdit to see inside of these directories by setting this to 'false'.";
    };

    SortCompletionResultsByName = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Sort Completion Results By Name";
    };

    SortWindowsAndDocumentsByName = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "The Window menu and Windows palette will list windows (and documents within them) sorted by name. If you would like them to be sorted by windowing order turn this off.";
    };

    SpellCheckerContextMenuTimeout = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Spell Checker Context Menu Timeout";
    };

    SpellingWordCompletionThreshold = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Spelling Word Completion Threshold";
    };

    SSHServerKeepaliveInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "If you have problems with your SSH server closing the connection after a period of non-use (which will subsequently cause errors in BBEdit), you can tell BBEdit to send a periodic \"keepalive\" message to while connected to the server.\n\nThis is configurable per host, per domain, or globally. Determining the appropriate value may require some experimentation, but 90 seconds is probably a good starting point.";
    };

    StrictCounterpartMatchingForCLanguages = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Strict Counterpart Matching For C Languages";
    };

    SurfNextPreviousInDisplayOrder = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When using the \"Previous Document\" and \"Next Document\" commands on the View menu, or the navigation arrows in the navigation bar, the order in which BBEdit navigates documents is determined by the order in which they were opened. If you prefer, these commands can be made to navigate the documents in the order shown in the file list by setting this to 'true'.";
    };

    SwipeToNavigateBetweenDocuments = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Swipe To Navigate Between Documents";
    };

    TerminalBundleID = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The \"Run in Terminal\" and \"Go Here in Terminal\" commands will use Apple's \"Terminal\" application by default. If you would like to use a different one, set this here.";
    };

    ThrottleVerticalScrollingSpeed = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "While drag-scrolling (that is, making a selection with the mouse and dragging it beyond the view boundaries, or using drag-and-drop for the same purpose), BBEdit will not normally limit the vertical scrolling speed. If this is too fast for you turn this off.";
    };

    TranslateLineBreaksInKeyboardInput = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Translate Line Breaks In Keyboard Input";
    };

    UsePATHForSSH = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use $PATH For SSH";
    };

    UseClippingsForCompletion = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If there is a partial word to the immediate left of the insertion point, the \"Insert Clipping...\" command will attempt to autocomplete that word based clipping names in the current and universal set (using a \"begins with\" style match.) If you wish to disable the autocompletion, set this preference to 'false'.";
    };

    UseColorSchemeBackgroundForDarkModeUI = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use Color Scheme Background For Dark Mode Ul";
    };

    UseDashForReferenceLookups = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If Dash is installed, BBEdit will use it for \"Find in Reference\", in preference to any predefined or custom reference lookup URLs.\n\nYou could, if you wanted, turn off Dash support by default and then enable it for specific languages.";
    };

    UseDistinctColorsForHTMLAttributesAndValues = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use Distinct Colors For HTML Attributes And Values";
    };

    UseFlakeForPythonSyntaxChecking = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "The Python language module will use flake8 for syntax checking, if you have it installed and it is available in your $PATH. If you want to disable this and use Python’s built-in syntax checking turn this off.";
    };

    UseFlakeForPythonSyntaxChecking_Python = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use Flake For Python Syntax Checking (Python)";
    };

    UseInlineStylesForCopiedHTML = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "The \"Copy as Styled HTML\" and \"Save as Styled HTML\" commands normally generate style information inline. If you want to use an embedded style sheet instead, set this to 'false'.";
    };

    UseNumericKeypadForCursorMovement = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use Numeric Keypad For Cursor Movement";
    };

    UseResourceForkForDocumentState = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Beginning with version 8.0, BBEdit stores document state (window position and various settings) in a central repository in your BBEdit preferences folder. If you wish, you can ask BBEdit to store document state in the resource fork of the document's file by setting this to 'true'.";
    };

    UseSeparatorsInUnixScriptOutput = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Ordinarily, the output from Unix scripts run within BBEdit is delimited with line separators - except when the script output is sent to a new untitled document. If you wish to suppress the separators, you can set this to 'false'.";
    };

    UseSystemFontForLineBar = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "BBEdit uses the document's display font to draw line numbers in the line number bar. This may be less than ideal if the display font isn't monospaced. If desired, you can instruct BBEdit to use the system font with monospaced numbers for the line number bar.";
    };

    UseTabKeyAsCompletionTrigger = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "To use the Tab key to trigger text completion, set this preference to 'true'.";
    };

    UseTokensFromDocumentForCompletion = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Use Tokens From Document For Completion";
    };

    UseXMLMarkupRulesForHTML5 = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Ordinarily, BBEdit will generate XHTML-style markup in HTML5 documents (those with a \"<!DOCTYPE HTML>\" declaration). If you wish, you can suppress this by setting this to 'false'.";
    };

    VisibleSearchSources_ConfiguredWebSites = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Visible Search Sources: Configured Web Sites";
    };

    VisibleSearchSources_DiskBrowsers = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Visible Search Sources: Disk Browsers";
    };

    VisibleSearchSources_FrontmostProject = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Visible Search Sources: Frontmost Project";
    };

    VisibleSearchSources_OpenDocuments = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Visible Search Sources: Open Documents";
    };

    VisibleSearchSources_Projects = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Visible Search Sources: Projects";
    };

    VisibleSearchSources_RecentFolders = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Visible Search Sources: Recent Folders";
    };

    VisibleSearchSources_RecentXcodeProjects = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Visible Search Sources: Recent Xcode Projects";
    };

    VisibleSearchSources_ResultsBrowsers = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Visible Search Sources: Results Browsers";
    };

    VisibleSearchSources_SavedSearchSets = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Visible Search Sources: Saved Search Sets";
    };

    VisibleSearchSources_SavedSpotlightSearches = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Visible Search Sources: Saved Spotlight Searches";
    };

    WarnMalformedUTF8 = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "To control whether BBEdit warns you when opening a malformed UTF-8 file, set this to 'true'.";
    };

    WarnWhenWindowContainsMultipleDocuments = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Visible Search Sources: Saved Spotlight Searches";
    };

    WorksheetNotificationMinimumRunTime = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Worksheet Notification Minimum Run Time";
    };

    WriteEmacsStateOnSave = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Visible Search Sources: Saved Spotlight Searches";
    };

    WriteExtendedAttributes = lib.mkOption {
      type = types.nullOr (types.enum [ "Always" "Never" "Smart" ]);
      default = null;
      description = "By default, BBEdit will avoid writing extended attributes - HFS Type/Creator - to volumes which don't natively support them - i.e. to avoid creating the ._FILE - when it is safe to do so. We'll be able to re-open the document correctly later. If desired, you can fine-tune this behavior.";
    };

    ZoomWindowsInPlace = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "BBEdit attempts to move windows as little as possible when you zoom them. To override this and let BBEdit place the window in the upper left-hand corner of the screen, set this to 'false'.";
    };

    MoveModelessWindowsToActiveSpace = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When using Spaces, you can control whether BBEdit's modeless dialog boxes - Find, Multi-File Search, and Open File by Name - get moved to the active space when switching spaces. By default, this is allowed for the Find, Multi-File Search, and Open File by Name windows. To control whether windows of these types are moved to the active space, set this to 'true'.\n\nThis preference sets the default behavior for any of the defined window types for which a default is not explicitly specified.\n\nThis key has been removed from BBEdit as of version 15. This has been replaced with MoveModelessWindowToActiveSpace.";
    };

    MoveModelessWindowsToActiveSpace_FindWindow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When using Spaces, you can control whether BBEdit's modeless dialog boxes - Find, Multi-File Search, and Open File by Name - get moved to the active space when switching spaces. By default, this is allowed for the Find, Multi-File Search, and Open File by Name windows. To control whether windows of these types are moved to the active space, set this to 'true'.\n\nThis key has been removed from BBEdit as of version 15. This has been replaced with MoveModelessWindowToActiveSpace.";
    };

    MoveModelessWindowsToActiveSpace_MultiFileFindWindow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When using Spaces, you can control whether BBEdit's modeless dialog boxes - Find, Multi-File Search, and Open File by Name - get moved to the active space when switching spaces. By default, this is allowed for the Find, Multi-File Search, and Open File by Name windows. To control whether windows of these types are moved to the active space, set this to 'true'.\n\nThis key has been removed from BBEdit as of version 15. This has been replaced with MoveModelessWindowToActiveSpace.";
    };

    MoveModelessWindowsToActiveSpace_OpenFileByNameWindow = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "When using Spaces, you can control whether BBEdit's modeless dialog boxes - Find, Multi-File Search, and Open File by Name - get moved to the active space when switching spaces. By default, this is allowed for the Find, Multi-File Search, and Open File by Name windows. To control whether windows of these types are moved to the active space, set this to 'true'.\n\nThis key has been removed from BBEdit as of version 15. This has been replaced with MoveModelessWindowToActiveSpace.";
    };

    QuickTimeImages = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "BBEdit ordinarily recognizes image files as images, and will open them into image windows (or ignore them when filtering for text files). To have images possibly treated as text files, which can be potentially dangerous, set this to 'false'.\n\nThis key has been removed from BBEdit as of version 15.";
    };

    ReopenRemoteDocuments = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "If set to 'true', BBEdit will attempt to mount a volume containing a document it wants to reopen. Defaults to 'false'.\n\nThis key has been removed from BBEdit as of version 15. This has been replaced with ReopenDocumentsOnRemoteVolumes.";
    };

    SUAllowsAutomaticUpdates = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls the automatic update install prompt. When enabled, presents users with the option to allow automatic download and install of available updates. If disabled, disallows automatic updates and requires manual installation every time.";
    };

    SUAutomaticallyUpdate = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls automatic silent updates. If enabled, users will not be informed about updates and updates will be silently installed when the app quits.";
    };

    SUEnableAutomaticChecks = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Controls automatic update checks.";
    };

    SUFeedURL = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Setting this to a non-existent URL will disable the ability for users to manually check for updates. Useful when you intend to use your own software distribution mechanism to deploy updates.";
    };

    SUScheduledCheckInterval = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Controls the automatic update check interval. The default is 1 day (86400 seconds). Setting to 0 disables updates.";
    };

  };
}