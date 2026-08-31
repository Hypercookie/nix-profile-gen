# Auto-generated from ProfileManifests: com.anthropic.claudefordesktop.plist
# Domain: com.anthropic.claudefordesktop
# Title: Claude Desktop
# Platforms: macOS
# Unique: yes

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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "forceLoginOrgUUID" "disableAutoUpdates" "autoUpdaterEnforcementHours" "isDesktopExtensionEnabled" "isDesktopExtensionDirectoryEnabled" "isLocalDevMcpEnabled" "isClaudeCodeForDesktopEnabled" "secureVmFeaturesEnabled" "isDesktopExtensionSignatureRequired" "disabledBuiltinTools" "managedMcpServers" ];
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