# Auto-generated from ProfileManifests: com.microsoft.VSCode.plist
# Domain: com.microsoft.VSCode
# Title: Visual Studio Code
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Visual Studio Code";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.microsoft.VSCode";
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
        default = [ "UpdateMode" "AllowedExtensions" "ExtensionGalleryServiceUrl" "TelemetryLevel" "EnableFeedback" "ChatAgentExtensionTools" "ChatAgentMode" "ChatMCP" "ChatPromptFiles" "ChatToolsAutoApprove" "BrowserChatTools" "ChatAgentAllowedNetworkDomains" "ChatAgentDeniedNetworkDomains" "ChatAgentNetworkFilter" "ChatApprovedAccountOrganizations" "ChatHooks" "ChatPluginsEnabled" "ChatToolsEligibleForAutoApproval" "ChatAgentSandboxAllowAutoApprove" "ChatAgentSandboxAllowUnsandboxedCommands" "ChatAgentSandboxAutoApproveUnsandboxedCommands" "ChatAgentSandboxEnabled" "ChatToolsTerminalEnableAutoApprove" "McpGalleryServiceUrl" "Claude3PIntegration" "CopilotNextEditSuggestions" "CopilotReviewAgent" "CopilotReviewSelection" "CopilotSessionSync" "DeprecatedEditModeHidden" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      UpdateMode = lib.mkOption {
        type = types.nullOr (types.enum [ "none" "manual" "start" "default" ]);
        default = null;
        description = "Controls whether VS Code automatically updates when a new version is released.";
      };

      AllowedExtensions = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Controls which extensions can be installed. The value of this policy is a JSON string that contains the allowed extensions.";
      };

      ExtensionGalleryServiceUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Configure the Marketplace service URL to connect to.";
      };

      TelemetryLevel = lib.mkOption {
        type = types.nullOr (types.enum [ "all" "error" "crash" "off" ]);
        default = null;
        description = "Controls the level of telemetry data.";
      };

      EnableFeedback = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls feedback mechanisms, such as the issue reporter and surveys.";
      };

      ChatAgentExtensionTools = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable using tools contributed by third-party extensions.";
      };

      ChatAgentMode = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable agent mode for chat. When this is enabled, agent mode can be activated via the dropdown in the view.";
      };

      ChatMCP = lib.mkOption {
        type = types.nullOr (types.enum [ "none" "registry" "all" ]);
        default = null;
        description = "Controls access to installed Model Context Protocol servers.";
      };

      ChatPromptFiles = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enables reusable prompt and instruction files in Chat sessions.";
      };

      ChatToolsAutoApprove = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Global auto approve also known as \"YOLO mode\" disables manual approval completely for all tools in all workspaces, allowing the agent to act fully autonomously. This is extremely dangerous and is *never* recommended, even containerized environments like Codespaces and Dev Containers have user keys forwarded into the container that could be compromised.\n			\n			This feature disables critical security protections and makes it much easier for an attacker to compromise the machine.";
      };

      BrowserChatTools = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When enabled, chat agents can use browser tools to open and interact with pages in the Integrated Browser.";
      };

      ChatAgentAllowedNetworkDomains = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Allowed domains for network access by agent tools (fetch tool, integrated browser). Applies when #chat.agent.networkFilter# or #chat.agent.sandbox.enabled# is enabled. When #chat.agent.sandbox.enabled# is set to allowNetwork, all domains are allowed. Supports wildcards like *.example.com. When both allowed and denied lists are empty, all domains are blocked. Denied domains (see #chat.agent.deniedNetworkDomains#) take precedence.";
      };

      ChatAgentDeniedNetworkDomains = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Denied domains for network access by agent tools (fetch tool, integrated browser). Applies when #chat.agent.networkFilter# or #chat.agent.sandbox.enabled# is enabled. This does not apply when #chat.agent.sandbox.enabled# is set to allowNetwork. Takes precedence over #chat.agent.allowedNetworkDomains#. Supports wildcards like *.example.com.";
      };

      ChatAgentNetworkFilter = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When enabled, network access by agent tools (fetch tool, integrated browser) is restricted according to #chat.agent.allowedNetworkDomains# and #chat.agent.deniedNetworkDomains#. Domain filtering is also applied to those tools when #chat.agent.sandbox.enabled# is enabled.";
      };

      ChatApprovedAccountOrganizations = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Setting this policy to a non-empty list activates the Approved Account gate: all AI features are disabled until the user signs into a GitHub account whose organizations intersect this list AND the account-side policy data has resolved. Comparison is case-insensitive. Use '*' as a wildcard to accept any signed-in GitHub or GHE account (use this for GHE deployments where the organization list is not surfaced).";
      };

      ChatHooks = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls whether chat hooks are executed at strategic points during an agent's workflow. Hooks are loaded from the files configured in #chat.hookFilesLocations#.";
      };

      ChatPluginsEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable agent plugin integration in chat.";
      };

      ChatToolsEligibleForAutoApproval = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Controls which tools are eligible for automatic approval. Tools set to 'false' will always present a confirmation and will never offer the option to auto-approve. The default behavior (or setting a tool to 'true') may result in the tool offering auto-approval options.";
      };

      ChatAgentSandboxAllowAutoApprove = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls whether agent mode terminal commands that run inside the sandbox are auto-approved. When disabled, the run in terminal tool uses the existing approval flow. This applies only when #chat.agent.sandbox.enabled# is enabled.";
      };

      ChatAgentSandboxAllowUnsandboxedCommands = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls whether agent mode terminal commands can run outside the sandbox after user confirmation when a sandboxed command fails or when sandbox restrictions would block the command. This applies only when #chat.agent.sandbox.enabled# is enabled.";
      };

      ChatAgentSandboxAutoApproveUnsandboxedCommands = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls whether agent mode terminal commands that run outside the sandbox are auto-approved. This applies only when both #chat.agent.sandbox.enabled# and #chat.agent.sandbox.allowUnsandboxedCommands# are enabled.";
      };

      ChatAgentSandboxEnabled = lib.mkOption {
        type = types.nullOr (types.enum [ "off" "on" "allowNetwork" ]);
        default = null;
        description = "Controls whether agent mode terminal commands that run outside the sandbox are auto-approved. This applies only when both #chat.agent.sandbox.enabled# and #chat.agent.sandbox.allowUnsandboxedCommands# are enabled.";
      };

      ChatToolsTerminalEnableAutoApprove = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls whether to allow auto approval in the run in terminal tool.";
      };

      McpGalleryServiceUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Configure the MCP Gallery service URL to connect to.";
      };

      Claude3PIntegration = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable Claude Agent sessions in VS Code. Start and resume agentic coding sessions powered by Anthropic Claude Agent SDK directly in the editor. Uses your existing Copilot subscription.";
      };

      CopilotNextEditSuggestions = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Whether to enable next edit suggestions (NES). NES can propose a next edit based on your recent changes.";
      };

      CopilotReviewAgent = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enables the code review agent.";
      };

      CopilotReviewSelection = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enables code review on current selection.";
      };

      CopilotSessionSync = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable session sync to GitHub.com for cross-device Copilot session history. When disabled by organization policy, session data is kept local only.";
      };

      DeprecatedEditModeHidden = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When enabled, hides the Edit mode from the chat mode picker.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-VSCode" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Visual Studio Code (com.microsoft.VSCode) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}