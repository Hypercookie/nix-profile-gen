# Auto-generated from ProfileManifests: com.apple.TextEdit.plist
# Domain: com.apple.TextEdit
# Title: TextEdit
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-apple-TextEdit" = {
    enable = lib.mkEnableOption "TextEdit";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.TextEdit";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    PFC_SegmentedControl_DocSettings = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    AddExtensionToNewPlainTextFiles = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Set this preference to 'false' to forcibly disable adding the \".txt\" extension to plain text files.";
    };

    HTMLEncoding = lib.mkOption {
      type = types.nullOr (types.enum [ 10 4 30 12 2147483649 2147486209 2147483650 2147483651 2147483673 2147485234 ]);
      default = null;
    };

    CheckGrammarWithSpelling = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'false' to forcibly disable grammar checking with spelling.";
    };

    CheckSpellingWhileTyping = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'false' to forcibly disable spell checking while typing.";
    };

    CorrectSpellingAutomatically = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'false' to forcibly disable automatic spelling correction.";
    };

    DataDetectors = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'true' to forcibly enable data detectors. Data detectors can automatically detect date, time, and contact information, which can then be used to update a contact, create a new Calendar event, and more.";
    };

    HeightInChars = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "By default, the Window Size height is 30 lines. Enable this setting to change this default window height.";
    };

    IgnoreHTML = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'true' to display .html files as HTML code instead of formatted text when opening a file.";
    };

    IgnoreRichText = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'true' to display .rtf files as RTF code instead of formatted text when opening a file.";
    };

    NSDocumentSuppressTempVersionStoreWarning = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'false' to suppress TextEdit messages when closing documents saved on storage volumes that don't support Apple's permanent version storage. This will not inform users about being unable to access these older versions via Time Machine.";
    };

    NSFixedPitchFont = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enter the name of the desired plain text font.  This defaults to Menlo.\n\nString format: Find your desired font file in either /System/Library/Fonts or /Library/Fonts. Whatever the name of this font file is is exactly what needs to be entered for the font name. Additionally, if you desire to use a font typeset that is not the default - Plain, Regular, etc. - , you can specify this by adding the name of the typeset to end of the font name string with a hyphen inbetween.\n\nEx. AlBayan-Bold\nEx. AmericanTypewriter-Condensed\nEx. ArialMT";
    };

    NSFixedPitchFontSize = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Enter the desired font size for plain text documents.";
    };

    NSFont = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enter the name of the desired rich text font. This defaults to Helvetica.\n\nString format: Find your desired font file in either /System/Library/Fonts or /Library/Fonts. Whatever the name of this font file is is exactly what needs to be entered for the font name. Additionally, if you desire to use a font typeset that is not the default - Plain, Regular, etc. - , you can specify this by adding the name of the typeset to end of the font name string with a hyphen inbetween.\n\nEx. AlBayan-Bold\nEx. AmericanTypewriter-Condensed\nEx. ArialMT";
    };

    NSFontSize = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "Enter the desired font size for rich text documents.";
    };

    PreserveDocumentWhitespace = lib.mkOption {
      type = types.nullOr (types.bool);
      default = true;
      description = "Set this preference to 'false' to not include code that preserves the white space in your document's formatted text.";
    };

    ShowPageBreaks = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'true' to forcibly make text wrap to document margins, rather than window boundaries.";
    };

    ShowRuler = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'false' to not show the ruler in rich text documents by default.";
    };

    SmartCopyPaste = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'false' to forcibly disable \"smart\" copy/paste.";
    };

    SmartLinks = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'false' to forcibly disable \"smart\" links.";
    };

    SmartQuotes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'false' to forcibly disable \"smart\" quotes.";
    };

    SmartSubstitutionsEnabledInRichTextOnly = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'true' to enable \"smart\" substitutions for quotes and dashes in rich text documents.  Takes effect for newly opened documents and after \"Make Plain Text\".";
    };

    TextReplacement = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'false' to forcibly disable text replacement.";
    };

    PlainTextEncoding = lib.mkOption {
      type = types.nullOr (types.enum [ 10 4 30 12 2147483649 2147486209 2147483650 2147483651 2147483673 2147485234 ]);
      default = null;
      description = "Set this preference to choose a specific encoding method for opening plain text files, rather than \"Automatic\".";
    };

    PlainTextEncodingForWrite = lib.mkOption {
      type = types.nullOr (types.enum [ 10 4 30 12 2147483649 2147486209 2147483650 2147483651 2147483673 2147485234 ]);
      default = null;
      description = "Set this preference to choose a specific encoding method for saving plain text files, rather than \"Automatic\".";
    };

    RichText = lib.mkOption {
      type = types.nullOr (types.enum [ 0 1 ]);
      default = null;
      description = "Enable this preference to forcibly apply a default TextEdit file format. By default, TextEdit defaults to rich text - .rtf -, rather than plain text - .txt";
    };

    UseEmbeddedCSS = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable this setting for HTML Embedded CSS styling.\n\nex. UseEmbeddedCSS = true == \"Embedded CSS\"\nex. UseEmbeddedCSS = true & UseInlineCSS = false == \"Embedded CSS\"\nex. UseEmbeddedCSS = false & UseInlineCSS = false == \"No CSS\"";
    };

    UseInlineCSS = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Enable this setting for HTML Inline CSS styling.\n\nex. UseInlineCSS = true == \"Inline CSS\"\nex. UseInlineCSS = true & UseEmbeddedCSS = false == \"Inline CSS\"\nex. UseInlineCSS = false & UseEmbeddedCSS = false == \"No CSS\"";
    };

    UseTransitionalDocType = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'false' to use the \"Strict\" HTML or XHTML document type, rather than \"Transitional\".\n\nex. UseTransiontalDocType = false & UseXHTMLDocType = false == \"HTML Strict\"\nex. UseTransiontalDocType = false & UseXHTMLDocType = true == \"XHTML Strict\"\nex. UseTransiontalDocType = true & UseXHTMLDocType = false == \"HTML Transitional\"\nex. UseTransiontalDocType = true & UseXHTMLDocType = true == \"XHTML Transitional\"";
    };

    UseXHTMLDocType = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Set this preference to 'false' to use the HTML, rather than the XHTML document type.\n\nex. UseTransiontalDocType = false & UseXHTMLDocType = false == \"HTML Strict\"\nex. UseTransiontalDocType = false & UseXHTMLDocType = true == \"XHTML Strict\"\nex. UseTransiontalDocType = true & UseXHTMLDocType = false == \"HTML Transitional\"\nex. UseTransiontalDocType = true & UseXHTMLDocType = true == \"XHTML Transitional\"";
    };

    WidthInChars = lib.mkOption {
      type = types.nullOr (types.int);
      default = null;
      description = "By default, the Window Size width is 90 lines. Enable this setting to change this default window width.";
    };

    author = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enter a default author name for documents.";
    };

    company = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enter a default organization / company for documents.";
    };

    copyright = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "Enter a default copyright for documents.";
    };

  };
}