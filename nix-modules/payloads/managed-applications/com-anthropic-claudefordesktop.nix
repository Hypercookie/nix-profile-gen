# Auto-generated from ProfileManifests: com.anthropic.claudefordesktop.plist
# Domain: com.anthropic.claudefordesktop
# Title: Claude Desktop
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Claude Desktop";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.anthropic.claudefordesktop";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
        description = "Whether macOS allows only one instance of this payload per profile.";
      };

      _displayName = lib.mkOption {
        internal = true;
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "PayloadDisplayName for this instance. Defaults to the domain.";
      };

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "system" "user" ];
        description = "Profile scopes this payload may be installed into (pfm_targets).";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "forceLoginOrgUUID" "disableAutoUpdates" "autoUpdaterEnforcementHours" "updateViaUpdatesHost" "relaunchEnforcementHours" "configRecheckIntervalMinutes" "isDesktopExtensionEnabled" "isDesktopExtensionDirectoryEnabled" "isLocalDevMcpEnabled" "isClaudeCodeForDesktopEnabled" "secureVmFeaturesEnabled" "coworkTabEnabled" "builtinBrowserEnabled" "builtinBrowserDefaultDomainPolicy" "builtinBrowserAllowedDomains" "builtinBrowserBlockedDomains" "microsoftAuthBroker" "isDesktopExtensionSignatureRequired" "disabledBuiltinTools" "managedMcpServers" "mcpPersistentAlwaysAllowEnabled" "mcpToolTimeoutSec" "deploymentOrganizationUuid" "disableEssentialTelemetry" "disableNonessentialTelemetry" "disableNonessentialServices" "effortLevel" "allowedWorkspaceFolders" "disableBypassPermissionsMode" "blockReadsOutsideWorkingDirectories" "disableDeploymentModeChooser" "disableDeepLinkRegistration" "chatTabEnabled" "chatAdvancedFileAnalysisEnabled" "inferenceMaxTokensPerWindow" "inferenceTokenWindowHours" "endUserAttribution" "deploymentDisplayName" "deploymentDisplaySubtitle" "disableConfigDeprecationWarnings" "banner" "disableFeatureDiscovery" "claudeAiImport" "otlpEndpoint" "otlpProtocol" "otlpHeaders" "otlpAuthMode" "otlpHeadersHelper" "otlpResourceAttributes" "otlpDesktopLogLevel" "otlpContentCapture" "otlpTracesEnabled" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      forceLoginOrgUUID = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Require login to belong to a specific organization. Accepts a single UUID string, which also pre-selects that organization during login, or an array of UUIDs where any listed organization is accepted without pre-selection. Login fails if the authenticated account does not belong to a listed organization.";
      };

      disableAutoUpdates = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Disable automatic updates for Claude Desktop.";
      };

      autoUpdaterEnforcementHours = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Hours before forcefully restarting Claude to apply a prepared update. Must be between 1 and 72 hours.";
      };

      updateViaUpdatesHost = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Read the update feed from releases.claude.com so api.anthropic.com can stay blocked. Defaults to false.";
      };

      relaunchEnforcementHours = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Hours a user may keep working on the old configuration after a managed-configuration change is detected. 0 = restart required at once. Blank = 24 hours. Defaults to 24. Range: 0-336.";
      };

      configRecheckIntervalMinutes = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Minutes between the running app's checks for a changed managed configuration. Blank = 10 minutes. Defaults to 10. Range: 2-30.";
      };

      isDesktopExtensionEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable or disable Claude Desktop extensions.";
      };

      isDesktopExtensionDirectoryEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable or disable access to the extension directory.";
      };

      isLocalDevMcpEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable or disable local Model Context Protocol (MCP) servers.";
      };

      isClaudeCodeForDesktopEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable Claude code access in desktop.";
      };

      secureVmFeaturesEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable Cowork access in desktop";
      };

      coworkTabEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable Cowork. Claude works on longer tasks like research, analysis, and documents. Defaults to true.";
      };

      builtinBrowserEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Claude Desktop on third-party inference deployments. Enable the built-in browser in Cowork and Code sessions. False disables the browser pane; Code retains its localhost-only dev-server preview. Defaults to false. When bootstrapUrl is set, configure this key in the served configuration.";
      };

      builtinBrowserDefaultDomainPolicy = lib.mkOption {
        type = types.nullOr (types.enum [ "allow" "block" ]);
        default = null;
        description = "Claude Desktop on third-party inference deployments. Default policy for sites Claude may open, read, or act on when the built-in browser is enabled. Allowed domains are exceptions under block; blocked domains are exceptions under allow. Users can still view sites denied to Claude. Defaults to allow.";
      };

      builtinBrowserAllowedDomains = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Claude Desktop on third-party inference deployments. Sites Claude may open, read, or act on when builtinBrowserDefaultDomainPolicy is block; ignored under allow. Empty or unset allows no external sites for Claude. Users can still view other sites. Bare * and public-suffix wildcards are ignored.";
      };

      builtinBrowserBlockedDomains = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Claude Desktop on third-party inference deployments. Sites Claude may not open, read, or act on when builtinBrowserDefaultDomainPolicy is allow; ignored under block. Empty or unset adds no blocked sites. Users can still view blocked sites. * blocks every external site for Claude; localhost dev servers are unaffected.";
      };

      microsoftAuthBroker = lib.mkOption {
        type = types.nullOr (types.enum [ "auto" "disabled" ]);
        default = null;
        description = "Set to “disabled” to force browser-based Microsoft 365 sign-in instead of the native Company Portal / Windows account broker. One of: auto, disabled. Defaults to auto.";
      };

      isDesktopExtensionSignatureRequired = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true, Claude Desktop rejects extensions that aren't signed by a trusted publisher.";
      };

      disabledBuiltinTools = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Removes the listed built-in tools from the available set in Claude Desktop. Known tools: Task, Bash, Glob, Grep, Read, Edit, Write, NotebookEdit, WebFetch, TodoWrite, WebSearch, Skill, REPL, JavaScript, AskUserQuestion. ToolSearch and SendUserMessage are also available under specific conditions.";
      };

      managedMcpServers = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            name = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Unique name identifying this MCP server.";
            };
            url = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "HTTPS URL of the remote MCP server.";
            };
            transport = lib.mkOption {
              type = types.nullOr (types.enum [ "http" "sse" ]);
              default = null;
              description = "Transport protocol used to reach the MCP server.";
            };
            headers = lib.mkOption {
              type = types.nullOr (types.submodule {
                options = {
                  __key__ = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Header Name";
                  };
                  __value__ = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Header Value";
                  };
                };
              });
              default = null;
              description = "Static request headers used to authenticate to the MCP server (for example, Authorization). Mutually exclusive with the OAuth field.";
            };
            oauth = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "When true, Claude Desktop runs a PKCE OAuth flow at first use to acquire user credentials. Mutually exclusive with the Headers field.";
            };
            toolPolicy = lib.mkOption {
              type = types.nullOr (types.submodule {
                options = {
                  __key__ = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Tool Name";
                  };
                  __value__ = lib.mkOption {
                    type = types.nullOr (types.enum [ "allow" "ask" "blocked" ]);
                    default = null;
                    description = "Policy";
                  };
                };
              });
              default = null;
              description = "Maps tool names exposed by the MCP server to a policy. Allowed values per tool: allow, ask, blocked. The \"ask\" policy prompts the user to confirm before the tool runs.";
            };
          };
        }));
        default = null;
        description = "Distributes remote MCP (Model Context Protocol) servers to users. Each entry requires a unique name and an HTTPS URL. Optional fields include transport, headers, OAuth, and tool-level policies. Used in Claude Cowork deployments on third-party platforms (Bedrock, Vertex AI, Azure AI Foundry, LLM gateways).";
      };

      mcpPersistentAlwaysAllowEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Offer the persistent “Always allow” approval options for MCP tools. Disable to keep tool approvals per-call or session-scoped only. Defaults to true.";
      };

      mcpToolTimeoutSec = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Per-call timeout for MCP tool calls, in seconds. Default 180 (3 minutes). Range: 60-3600.";
      };

      deploymentOrganizationUuid = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "A UUID you generate. Tags telemetry so Anthropic support can locate your fleet's events, and namespaces each user's local data. Not used for auth.";
      };

      disableEssentialTelemetry = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Crash and performance reports to Anthropic. Defaults to false.";
      };

      disableNonessentialTelemetry = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Product-usage analytics and diagnostic-report uploads. No message content. Defaults to false.";
      };

      disableNonessentialServices = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Connector favicons and the artifact-preview and MCP Apps widget iframe origins. Artifacts will not render. Defaults to false.";
      };

      effortLevel = lib.mkOption {
        type = types.nullOr (types.enum [ "low" "medium" "high" "xhigh" "max" ]);
        default = null;
        description = "Sets the default effort level for Claude Code sessions in Claude Desktop.";
      };

      allowedWorkspaceFolders = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            path = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Absolute folder path. May start with ~ or one of the listed %VAR% tokens, expanded per user. Subfolders are included.";
            };
            isDefaultSelected = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Shows as a folder chip on the new-task page and skips the trust prompt. Users can remove it.";
            };
            mode = lib.mkOption {
              type = types.nullOr (types.enum [ "rw" "ro" ]);
              default = null;
              description = "Read-only folders can be viewed and searched but not modified in Cowork. In Code, applies to file tools only; Bash and SSH do not yet enforce read-only. One of: rw, ro.";
            };
          };
        }));
        default = null;
        description = "Folders where Claude may work. Applies to both Cowork and Code sessions. Leave unset for unrestricted access. Paths can reference ~ and these environment variables, expanded per user: %OneDrive%, %OneDriveCommercial%, %OneDriveConsumer%, %APPDATA%, %LOCALAPPDATA%, %USERNAME%, %XDG_DOCUMENTS_DIR%. The set is fixed; an entry that references any other %VAR%, or one that is unset on the device, is ignored.";
      };

      disableBypassPermissionsMode = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Remove the bypass permissions mode from Code sessions and Cowork tasks, so Claude always follows the permission policy. Off by default.";
      };

      blockReadsOutsideWorkingDirectories = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Keep Claude from reading files outside a Code session's working directories. File tools refuse such reads; sandboxed shell commands lose the home directory.";
      };

      disableDeploymentModeChooser = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Users see only this provider at the login screen. The option to sign in to Claude.ai is hidden. Defaults to false.";
      };

      disableDeepLinkRegistration = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Stop external apps and websites from opening Claude Desktop via claude:// links. Defaults to false.";
      };

      chatTabEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable Chat. Quick questions and drafting.";
      };

      chatAdvancedFileAnalysisEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Allow Claude to run code in a local sandbox to analyze attached files it can't read natively — like Excel and PowerPoint. Off by default.";
      };

      inferenceMaxTokensPerWindow = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Per-user soft cap, counted client-side over the token cap window. Not a server-enforced quota. Requires inferenceTokenWindowHours to also be set — without a window length the cap is inert and no limit is enforced.";
      };

      inferenceTokenWindowHours = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Tumbling window length for the token cap. Max 720 hours (30 days). Range: 1-720. Required when inferenceMaxTokensPerWindow is set — the cap only takes effect once both are configured.";
      };

      endUserAttribution = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Show the signed-in user's identity-provider identity in the sidebar and account menu, and emit it as the OpenTelemetry enduser.id resource attribute.";
      };

      deploymentDisplayName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Overrides the provider label shown in the sidebar footer, user-menu header, and connection-error banner.";
      };

      deploymentDisplaySubtitle = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Optional detail shown after the deployment display name in the account-menu header.";
      };

      disableConfigDeprecationWarnings = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Don't show users the in-app warning that this configuration uses a deprecated field. The final reminder in the 24 hours before the cut-off still appears.";
      };

      banner = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            enabled = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Turns the banner on or off.";
            };
            text = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Text shown in the banner.";
            };
            backgroundColor = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Banner background color, as a hex code.";
            };
            textColor = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Banner text color, as a hex code.";
            };
            linkUrl = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "URL the banner links to when clicked.";
            };
          };
        });
        default = null;
        description = "A persistent banner across the top of the app window after sign-in.";
      };

      disableFeatureDiscovery = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Suppress unprompted feature-announcement UI: the post-update “What's new” nudge and new-feature tips. Users can still open release notes themselves. Defaults to false.";
      };

      claudeAiImport = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            enabled = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Turns history import on. The banner and import actions stay off until this is true.";
            };
            exportEnabled = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Lets users export Claude.ai chats and projects. automatic3pImport is a separate switch.";
            };
            bannerBehavior = lib.mkOption {
              type = types.nullOr (types.enum [ "off" "detect" "show" ]);
              default = null;
              description = "When the import banner appears.";
            };
          };
        });
        default = null;
        description = "Lets users import Claude.ai chats and projects, plus earlier Claude sessions on this computer, when enabled is true. automatic3pImport is a separate switch.";
      };

      otlpEndpoint = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Where OpenTelemetry logs and metrics are sent. Leave blank to disable.";
      };

      otlpProtocol = lib.mkOption {
        type = types.nullOr (types.enum [ "http/protobuf" "http/json" "grpc" ]);
        default = null;
        description = "grpc or http/protobuf. One of: http/protobuf, http/json, grpc. Defaults to http/protobuf.";
      };

      otlpHeaders = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Static collector headers — routing and tenant headers only. No credentials here; use Collector authentication or the headers helper script for tokens.";
      };

      otlpAuthMode = lib.mkOption {
        type = types.nullOr (types.enum [ "none" "inference-credential" ]);
        default = null;
        description = "inference-credential sends the user's inference bearer token to the collector as Authorization: Bearer. One of: none, inference-credential.";
      };

      otlpHeadersHelper = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Absolute path to an executable that prints a JSON object of collector headers. Merged over the static headers and Collector authentication; the helper wins.";
      };

      otlpResourceAttributes = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Extra resource attributes to attach to every span/metric. A static enduser.id set here always wins over the runtime identity.";
      };

      otlpDesktopLogLevel = lib.mkOption {
        type = types.nullOr (types.enum [ "off" "error" "warn" "info" "debug" ]);
        default = null;
        description = "Controls the Claude Desktop application's events, separate from Cowork and Code sessions. Defaults to error. One of: off, error, warn, info, debug. Defaults to error.";
      };

      otlpContentCapture = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Content categories the desktop exporter sends unredacted to your collector. Leave empty to redact all content (default). One of: userPrompts, assistantResponses, toolDetails, toolContent, rawApiBodies.";
      };

      otlpTracesEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Also export OpenTelemetry traces from Cowork tasks and Code sessions. Uses Claude Code's session tracing.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-anthropic-claudefordesktop" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Claude Desktop (com.anthropic.claudefordesktop) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}