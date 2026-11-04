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
        default = [ "PFC_SegmentedControl_0" "disableAutoUpdates" "autoUpdaterEnforcementHours" "installedUpdateEnforcementEnabled" "installedUpdateEnforcementHours" "updateViaUpdatesHost" "releaseChannel" "relaunchEnforcementHours" "configRecheckIntervalMinutes" "forceLoginOrgUUID" "deploymentOrganizationUuid" "disableDeploymentModeChooser" "disableDeepLinkRegistration" "endUserAttribution" "deploymentDisplayName" "deploymentDisplaySubtitle" "disableConfigDeprecationWarnings" "banner" "disableFeatureDiscovery" "claudeAiImport" "inferenceProvider" "inferenceCredentialKind" "inferenceSessionLifetimeSec" "userContentRendererUrl" "inferenceCustomHeaders" "inferenceCredentialHelper" "inferenceCredentialHelperWindows" "inferenceCredentialHelperArgs" "inferenceCredentialHelperTtlSec" "inferenceCredentialHelperTimeoutSec" "inferenceCredentialHelperSilentRefreshEnabled" "inferenceAnthropicApiKey" "inferenceStreamIdleTimeoutSec" "inferenceGatewayBaseUrl" "inferenceGatewayApiKey" "inferenceGatewayAuthScheme" "inferenceIdpAuthFlow" "inferenceIdpOidc" "inferenceGatewayOidcAuthFlow" "inferenceGatewayOidc" "inferenceBedrockRegion" "inferenceBedrockBaseUrl" "inferenceBedrockServiceTier" "inferenceBedrockBearerToken" "inferenceBedrockSsoStartUrl" "inferenceBedrockSsoRegion" "inferenceBedrockSsoAccountId" "inferenceBedrockSsoRoleName" "inferenceBedrockProfile" "inferenceBedrockAwsDir" "inferenceBedrockAwsCliPath" "inferenceVertexProjectId" "inferenceVertexRegion" "inferenceVertexBaseUrl" "inferenceVertexOAuthClientId" "inferenceVertexOAuthClientSecret" "inferenceVertexOAuthScopes" "inferenceVertexOAuthLoginHint" "inferenceVertexWorkforceAudience" "inferenceVertexWorkforceUserProject" "inferenceVertexWorkforceAuthFlow" "inferenceVertexWorkforceOidc" "inferenceVertexCredentialsFile" "inferenceFoundryResource" "inferenceFoundryBaseUrl" "inferenceFoundryApiKey" "inferenceFoundryTenantId" "inferenceFoundryClientId" "inferenceFoundryAuthFlow" "bootstrapEnabled" "bootstrapUrl" "bootstrapOidc" "bootstrapHeaders" "bootstrapHeadersHelper" "trustBootstrapDelivery" "inferenceModels" "modelDiscoveryEnabled" "modelPrefer1mContext" "defaultModelEffort" "alwaysStartWithDefaultModel" "effortLevel" "modelCatalogEnabled" "modelCatalogUrl" "inferenceModelPricingEnabled" "inferenceModelPricingMultiplier" "inferenceModelPricing" "inferenceMaxTokensPerWindow" "inferenceTokenWindowHours" "inferenceTokenWarningPercent" "desktopHome" "chatTabEnabled" "chatAdvancedFileAnalysisEnabled" "coworkTabEnabled" "secureVmFeaturesEnabled" "isClaudeCodeForDesktopEnabled" "autoModeEnabled" "disableBypassPermissionsMode" "sshHostAllowlist" "sshClientPath" "sshTransport" "disableBundledSkills" "skillCreationEnabled" "skillScanningEnabled" "scheduledTasksEnabled" "keepAwakeEnabled" "developerModeEnabled" "quickEntryDefaultShortcut" "quickEntryScreenshotsEnabled" "quickEntryFileSharingEnabled" "projectsEnabled" "sessionStatusLine" "builtinToolPolicy" "disabledBuiltinTools" "toolSearchEnabled" "organizationInstructions" "builtinBrowserEnabled" "builtinBrowserDefaultDomainPolicy" "builtinBrowserAllowedDomains" "builtinBrowserBlockedDomains" "requireCoworkFullVmSandbox" "allowedWorkspaceFolders" "blockReadsOutsideWorkingDirectories" "coworkEgressAllowedHosts" "skipWebFetchPreflight" "egressProxyUrl" "egressProxyPacUrl" "coworkVmIpv6Enabled" "managedMcpServers" "isLocalDevMcpEnabled" "mcpPersistentAlwaysAllowEnabled" "mcpScheduledTaskApprovalLifetimeDays" "mcpToolTimeoutSec" "allowedPluginMcpServers" "deniedPluginMcpServers" "microsoftAuthBroker" "microsoftAuthDefaultAccount" "isDesktopExtensionEnabled" "isDesktopExtensionDirectoryEnabled" "isDesktopExtensionSignatureRequired" "allowedPluginMarketplaces" "orgPluginSettings" "userPluginMarketplacesEnabled" "userPluginUploadsEnabled" "disableEssentialTelemetry" "disableNonessentialTelemetry" "disableNonessentialServices" "otlpEndpoint" "otlpProtocol" "otlpHeaders" "otlpAuthMode" "otlpHeadersHelper" "otlpResourceAttributes" "otlpDesktopLogLevel" "otlpContentCapture" "otlpTracesEnabled" "otlpAttrMaxChars" "chatSessionRetentionDays" "coworkSessionRetentionDays" "codeSessionRetentionDays" "sessionRetentionHold" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      PFC_SegmentedControl_0 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
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

      installedUpdateEnforcementEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "With auto-updates blocked, Claude restarts by itself for a newer version installed while it was open.";
      };

      installedUpdateEnforcementHours = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Hours before Claude restarts for a newer version installed while it was open. Unset: 72 hours, then when idle. A number skips the idle wait.";
      };

      updateViaUpdatesHost = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Read the update feed from releases.claude.com so api.anthropic.com can stay blocked. Defaults to false.";
      };

      releaseChannel = lib.mkOption {
        type = types.nullOr (types.enum [ "stable" "staggered" ]);
        default = null;
        description = "Stable: devices take each release as it rolls out. Staggered: devices update less often, usually a week or more behind.";
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

      forceLoginOrgUUID = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Require login to belong to a specific organization. Accepts a single UUID string, which also pre-selects that organization during login, or an array of UUIDs where any listed organization is accepted without pre-selection. Login fails if the authenticated account does not belong to a listed organization. Also honored by Claude Desktop in third-party (3P) mode, where it limits which Enterprise Admin Console organization a user can move the device to.";
      };

      deploymentOrganizationUuid = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "A UUID you generate. Tags telemetry so Anthropic support can locate your fleet's events, and namespaces each user's local data. Not used for auth.";
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

      inferenceProvider = lib.mkOption {
        type = types.nullOr (types.enum [ "gateway" "anthropic" "bedrock" "mantle" "vertex" "foundry" ]);
        default = null;
        description = "Selects the inference backend. Setting this key switches Claude Desktop into third-party (3P) mode.";
      };

      inferenceCredentialKind = lib.mkOption {
        type = types.nullOr (types.enum [ "static" "helper-script" "interactive" "vendor-profile" "workforce" "external-idp" ]);
        default = null;
        description = "Selects the credential source. When set, only that source is used, with no fallback.";
      };

      inferenceSessionLifetimeSec = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "How long a sign-in stays valid under your identity provider's session policy. A re-authenticate banner appears before it expires.";
      };

      userContentRendererUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "HTTPS origin of the user-content-renderer deployment used for artifact and file previews. Uses the commercial host when unset.";
      };

      inferenceCustomHeaders = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Header name";
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Header value";
            };
          };
        });
        default = null;
        description = "Extra headers sent on every inference and model-discovery request. Routing and tenant headers only; do not put credentials here (use the credential helper instead).";
      };

      inferenceCredentialHelper = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Absolute path to an executable that prints the credential (a bare token, or JSON with token and headers). When set, static credential keys are ignored. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceCredentialHelperWindows = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Absolute path of the credential helper executable on Windows devices, used there instead of the credential helper script. macOS and Linux devices ignore it; set it when one configuration serves both Windows and Mac devices. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceCredentialHelperArgs = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Arguments passed to the credential helper script, one per entry, in order. Entries may not be empty or contain double quotes, percent signs or control characters. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceCredentialHelperTtlSec = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "How long the helper output is cached before the helper runs again, without a relaunch. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceCredentialHelperTimeoutSec = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Maximum wait for the helper executable to finish. Raise this if the helper opens a browser for interactive sign-in. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceCredentialHelperSilentRefreshEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When the credential expires mid-session, re-run the helper to recover silently. Turn off if the helper cannot run non-interactively. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceAnthropicApiKey = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Claude API key. Leave blank to sign in with the browser or to supply the key through a credential helper.";
      };

      inferenceStreamIdleTimeoutSec = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Extra time to wait for model output on a streaming response that is sending only keep-alive pings. Gateway provider only.";
      };

      inferenceGatewayBaseUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Full URL of the inference gateway endpoint. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceGatewayApiKey = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "API key for the configured inference gateway.";
      };

      inferenceGatewayAuthScheme = lib.mkOption {
        type = types.nullOr (types.enum [ "bearer" "x-api-key" ]);
        default = null;
        description = "How the gateway credential is sent on the wire: Authorization: Bearer or an x-api-key header.";
      };

      inferenceIdpAuthFlow = lib.mkOption {
        type = types.nullOr (types.enum [ "browser" "broker" ]);
        default = null;
        description = "How the identity-provider sign-in runs: system browser (default) or the OS Microsoft Entra broker (Company Portal on macOS).";
      };

      inferenceIdpOidc = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            clientId = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "OAuth client ID of the desktop app registration at your identity provider (public client, PKCE).";
            };
            issuer = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "HTTPS issuer that supports OIDC discovery. Set this, or set the authorization and token URLs instead.";
            };
            authorizationUrl = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "HTTPS authorization endpoint. Used together with the token URL when no issuer is set.";
            };
            tokenUrl = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "HTTPS token endpoint. Used together with the authorization URL when no issuer is set.";
            };
            bearerTokenType = lib.mkOption {
              type = types.nullOr (types.enum [ "id_token" "access_token" ]);
              default = null;
              description = "Which token is sent as the bearer credential. Use access_token for a gateway or proxy that validates tokens as an OAuth resource server.";
            };
            scopes = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Space-separated scopes. Required in access-token mode, where it must name the gateway or proxy API scope.";
            };
            appendOfflineAccess = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Append offline_access to the scopes so the identity provider returns a refresh token for silent refresh.";
            };
            resource = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Access-token audience of the gateway or proxy (an HTTPS URL or an AD FS relying-party identifier). Leave unset for Microsoft Entra ID.";
            };
            redirectPort = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "Fixed loopback port for the sign-in redirect. Leave unset to use a free port each time.";
            };
            redirectHost = lib.mkOption {
              type = types.nullOr (types.enum [ "127.0.0.1" "localhost" ]);
              default = null;
              description = "Host named in the sign-in redirect URI. Use localhost only if your identity provider's registered redirect URI requires it.";
            };
            additionalRedirectReferrerHosts = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Space-separated hostnames also accepted as the referrer of the sign-in callback. Only needed when the identity provider completes sign-in from a different host.";
            };
          };
        });
        default = null;
        description = "Your organization's OpenID Connect identity provider, used with credential kind external-idp. The user's token is sent as the bearer credential to the gateway or the Bedrock proxy. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceGatewayOidcAuthFlow = lib.mkOption {
        type = types.nullOr (types.enum [ "browser" "broker" ]);
        default = null;
        description = "Deprecated by Anthropic; the original spelling keeps working with no end date set. Use Identity Provider Sign-in Flow (inferenceIdpAuthFlow) instead. How the gateway IdP sign-in runs: system browser (default) or the OS Microsoft Entra broker.";
      };

      inferenceGatewayOidc = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            clientId = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "OAuth client ID of the desktop app registration at your identity provider (public client, PKCE).";
            };
            issuer = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "HTTPS issuer that supports OIDC discovery. Set this, or set the authorization and token URLs instead.";
            };
            authorizationUrl = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "HTTPS authorization endpoint. Used together with the token URL when no issuer is set.";
            };
            tokenUrl = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "HTTPS token endpoint. Used together with the authorization URL when no issuer is set.";
            };
            bearerTokenType = lib.mkOption {
              type = types.nullOr (types.enum [ "id_token" "access_token" ]);
              default = null;
              description = "Which token is sent as the bearer credential. Use access_token for a gateway or proxy that validates tokens as an OAuth resource server.";
            };
            scopes = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Space-separated scopes. Required in access-token mode, where it must name the gateway or proxy API scope.";
            };
            appendOfflineAccess = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Append offline_access to the scopes so the identity provider returns a refresh token for silent refresh.";
            };
            resource = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Access-token audience of the gateway or proxy (an HTTPS URL or an AD FS relying-party identifier). Leave unset for Microsoft Entra ID.";
            };
            redirectPort = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "Fixed loopback port for the sign-in redirect. Leave unset to use a free port each time.";
            };
            redirectHost = lib.mkOption {
              type = types.nullOr (types.enum [ "127.0.0.1" "localhost" ]);
              default = null;
              description = "Host named in the sign-in redirect URI. Use localhost only if your identity provider's registered redirect URI requires it.";
            };
            additionalRedirectReferrerHosts = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Space-separated hostnames also accepted as the referrer of the sign-in callback. Only needed when the identity provider completes sign-in from a different host.";
            };
          };
        });
        default = null;
        description = "Deprecated by Anthropic; the original spelling keeps working with no end date set. Use Identity Provider (inferenceIdpOidc) with credential kind external-idp instead. External OIDC identity provider for gateway sign-in; the token is sent to the gateway as the bearer credential. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceBedrockRegion = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "AWS region for the Bedrock runtime endpoint.";
      };

      inferenceBedrockBaseUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "For VPC endpoints or gateway proxies. HTTPS scheme and host only, no path. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceBedrockServiceTier = lib.mkOption {
        type = types.nullOr (types.enum [ "flex" "priority" ]);
        default = null;
        description = "Sent as the X-Amzn-Bedrock-Service-Tier header. Leave unset for on-demand.";
      };

      inferenceBedrockBearerToken = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Static bearer token for Bedrock inference. Prefer profile or helper-script credentials where possible.";
      };

      inferenceBedrockSsoStartUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Enables in-app AWS IAM Identity Center sign-in (no AWS CLI needed). Set together with the SSO region, account ID and role name. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceBedrockSsoRegion = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "IAM Identity Center home region. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceBedrockSsoAccountId = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "12-digit AWS account ID assigned to users in IAM Identity Center. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceBedrockSsoRoleName = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "IAM Identity Center permission-set name granting bedrock:InvokeModel* on the account above. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceBedrockProfile = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "AWS named profile to use for Bedrock inference credentials. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceBedrockAwsDir = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Folder with AWS config and credentials files. Defaults to ~/.aws when no bearer token is set. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceBedrockAwsCliPath = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Absolute path to the aws executable. Leave unset to find it on PATH. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceVertexProjectId = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Google Cloud project ID for Vertex AI inference. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceVertexRegion = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "GCP region where your Vertex AI Claude models are deployed.";
      };

      inferenceVertexBaseUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Private Service Connect endpoint, if you use one. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceVertexOAuthClientId = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Desktop-app OAuth client ID. Enables Sign in with Google instead of a credentials file. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceVertexOAuthClientSecret = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Secret for the desktop-app OAuth client above. Google treats installed-app client secrets as non-confidential.";
      };

      inferenceVertexOAuthScopes = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Override the Google OAuth scopes (space-separated). Leave blank for the default.";
      };

      inferenceVertexOAuthLoginHint = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Pre-fills Google's account chooser and is forwarded to your federated IdP. {username} expands to the OS login name.";
      };

      inferenceVertexWorkforceAudience = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Workforce-pool provider audience. When set, sign-in uses your own IdP plus a GCP STS token exchange instead of a Google identity. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceVertexWorkforceUserProject = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "GCP project used for STS billing and quota. Defaults to the Vertex project ID. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceVertexWorkforceAuthFlow = lib.mkOption {
        type = types.nullOr (types.enum [ "browser" "broker" ]);
        default = null;
        description = "How the Workforce Identity IdP sign-in runs: system browser (default) or the OS Microsoft Entra broker.";
      };

      inferenceVertexWorkforceOidc = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            clientId = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "OAuth client ID of the desktop app registration at your identity provider (public client, PKCE).";
            };
            issuer = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "HTTPS issuer that supports OIDC discovery. Set this, or set the authorization and token URLs instead.";
            };
            authorizationUrl = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "HTTPS authorization endpoint. Used together with the token URL when no issuer is set.";
            };
            tokenUrl = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "HTTPS token endpoint. Used together with the authorization URL when no issuer is set.";
            };
            scopes = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Space-separated scopes. Defaults to openid profile email offline_access.";
            };
            redirectPort = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "Fixed loopback port for the sign-in redirect. Leave unset to use a free port each time.";
            };
            redirectHost = lib.mkOption {
              type = types.nullOr (types.enum [ "127.0.0.1" "localhost" ]);
              default = null;
              description = "Host named in the sign-in redirect URI. Use localhost only if your identity provider's registered redirect URI requires it.";
            };
            omitOfflineAccess = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Enable only if your identity provider rejects offline_access on this client. Users then sign in again each time the token expires.";
            };
            additionalRedirectReferrerHosts = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Space-separated hostnames also accepted as the referrer of the sign-in callback. Only needed when the identity provider completes sign-in from a different host.";
            };
          };
        });
        default = null;
        description = "Your organization's OIDC identity provider. The app runs an authorization-code-with-PKCE sign-in against it and exchanges the ID token at GCP STS. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceVertexCredentialsFile = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Absolute path to a service-account JSON file. Leave blank to fall back to Application Default Credentials. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceFoundryResource = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Azure AI Foundry resource name used to construct the endpoint URL. Still required when a Foundry base URL is set. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceFoundryBaseUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Full base URL, path included, for a gateway or proxy in front of Foundry (replaces https://RESOURCE.services.ai.azure.com/anthropic). When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceFoundryApiKey = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "API key for Azure AI Foundry inference.";
      };

      inferenceFoundryTenantId = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Directory (tenant) ID of the Entra ID app registration that has the Cognitive Services scope. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceFoundryClientId = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Application (client) ID of the Entra ID app registration. Device-code sign-in requires the registration to allow public client flows. When delivered by a bootstrap server, applies only after user consent unless trustBootstrapDelivery or machine-scoped MDM covers the bootstrap URL.";
      };

      inferenceFoundryAuthFlow = lib.mkOption {
        type = types.nullOr (types.enum [ "device-code" "browser" "broker" ]);
        default = null;
        description = "How Entra sign-in runs: device code (default), system browser, or the OS identity broker (Company Portal on macOS).";
      };

      bootstrapEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Fetch and apply the bootstrap config URL at launch. Turn off to keep the URL saved but skip the fetch. MDM only: ignored in a bootstrap server response.";
      };

      bootstrapUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "HTTPS endpoint that returns a per-user JSON configuration. Values from the response override local settings and become read-only. Embedded credentials are refused. MDM only: ignored in a bootstrap server response.";
      };

      bootstrapOidc = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            clientId = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "OAuth client ID of the desktop app registration at your identity provider (public client, PKCE).";
            };
            issuer = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "HTTPS issuer that supports OIDC discovery. Set this, or set the authorization and token URLs instead.";
            };
            authorizationUrl = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "HTTPS authorization endpoint. Used together with the token URL when no issuer is set.";
            };
            tokenUrl = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "HTTPS token endpoint. Used together with the authorization URL when no issuer is set.";
            };
            scopes = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Space-separated scopes. The token's audience must match what your bootstrap server validates.";
            };
            redirectPort = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "Fixed loopback port for the sign-in redirect. Leave unset to use a free port each time.";
            };
            redirectHost = lib.mkOption {
              type = types.nullOr (types.enum [ "127.0.0.1" "localhost" ]);
              default = null;
              description = "Host named in the sign-in redirect URI. Use localhost only if your identity provider's registered redirect URI requires it.";
            };
            additionalRedirectReferrerHosts = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Space-separated hostnames also accepted as the referrer of the sign-in callback. Only needed when the identity provider completes sign-in from a different host.";
            };
          };
        });
        default = null;
        description = "When set, the bootstrap request sends a bearer token from a browser sign-in (authorization code with PKCE) at this identity provider. Omit to use device-code mode against the bootstrap server. MDM only: ignored in a bootstrap server response.";
      };

      bootstrapHeaders = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Header name";
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Header value";
            };
          };
        });
        default = null;
        description = "HTTP headers sent on every bootstrap config fetch, for example a service-account credential or a tenant header. Use instead of embedding user:password in the URL. MDM only: ignored in a bootstrap server response.";
      };

      bootstrapHeadersHelper = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Absolute path to an executable that prints a JSON object of bootstrap request headers. Merged over the static headers; the helper wins on conflict. MDM only: ignored in a bootstrap server response.";
      };

      trustBootstrapDelivery = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Skip the per-user consent prompt for sign-in targets, inference endpoints, helper scripts and connectors that the bootstrap server delivers. MDM only: ignored in a bootstrap server response.";
      };

      inferenceModels = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            name = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Model ID exactly as the provider expects it.";
            };
            labelOverride = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Shown in the model picker. Leave blank to format the name from the ID.";
            };
            supports1m = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Adds a 1M-context variant of this model to the picker. Set only if your deployment accepts 1M-token context for it.";
            };
            prefer1m = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Shows one option for this model and requests 1M from the provider. No effect unless the entry offers 1M.";
            };
            anthropicFamilyTier = lib.mkOption {
              type = types.nullOr (types.enum [ "sonnet" "opus" "haiku" "fable" "mythos" ]);
              default = null;
              description = "The Claude tier this model stands in for, so a bare tier alias such as 'opus' resolves to it.";
            };
            isFamilyDefault = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "When several models share a tier alias, marks this one as the model the alias resolves to. Otherwise the first listed wins.";
            };
            behavesAs = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "For IDs the app cannot identify (such as a gateway alias): the Claude model this ID routes to, so it gets that model's effort levels and limits.";
            };
            maxEffort = lib.mkOption {
              type = types.nullOr (types.enum [ "low" "medium" "high" "xhigh" "max" ]);
              default = null;
              description = "Highest effort level offered for this model; higher levels are hidden and never requested. An unrecognized value caps the model at low.";
            };
          };
        }));
        default = null;
        description = "Overrides the auto-discovered model list. Use the provider's exact model IDs. The first entry is the default model.";
      };

      modelDiscoveryEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Populate the model picker from the provider's model-list endpoint at launch. When off, the model list is required and must use full model IDs.";
      };

      modelPrefer1mContext = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Every model that offers a 1M-token context window shows a single option in the picker and requests 1M from the provider.";
      };

      defaultModelEffort = lib.mkOption {
        type = types.nullOr (types.enum [ "low" "medium" "high" "xhigh" "max" ]);
        default = null;
        description = "Effort level the default model (the first listed model) starts at, instead of Anthropic's recommended level.";
      };

      alwaysStartWithDefaultModel = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "New conversations and tasks start on the default model and effort level, not each person's last choice. Users can still change both for the current one.";
      };

      effortLevel = lib.mkOption {
        type = types.nullOr (types.enum [ "low" "medium" "high" "xhigh" "max" ]);
        default = null;
        description = "Sets the default effort level for Claude Code sessions in Claude Desktop, applied fresh at the start of each session. Does not apply to Cowork sessions. Unset by default. Applies to standard deployments (users sign in with Claude.ai); Claude Desktop in third-party (3P) mode ignores this key. In 3P mode, use Default Model Effort (defaultModelEffort) instead.";
      };

      modelCatalogEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Fetch Anthropic's signed model catalog for model picker names, descriptions and effort options. When off, the app uses only its bundled copy.";
      };

      modelCatalogUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Fetch the model catalog and its signature file from this mirror inside your network instead of downloads.claude.ai. HTTPS required; redirects are not followed.";
      };

      inferenceModelPricingEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Show an estimated cost on the Usage page, at Anthropic list price unless a multiplier or per-model rates are set. Required for the two pricing keys below to apply.";
      };

      inferenceModelPricingMultiplier = lib.mkOption {
        type = types.nullOr (types.float);
        default = null;
        description = "Scales every estimated cost (0.85 = 85% of the price). Applies only while Show Estimated Cost is on.";
      };

      inferenceModelPricing = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            name = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "A model ID or provider alias. A built-in Claude ID also covers its dated and provider forms.";
            };
            inputPerMtok = lib.mkOption {
              type = types.nullOr (types.float);
              default = null;
              description = "USD per million input tokens.";
            };
            outputPerMtok = lib.mkOption {
              type = types.nullOr (types.float);
              default = null;
              description = "USD per million output tokens.";
            };
            cacheReadPerMtok = lib.mkOption {
              type = types.nullOr (types.float);
              default = null;
              description = "USD per million prompt-cache read tokens.";
            };
            cacheWritePerMtok = lib.mkOption {
              type = types.nullOr (types.float);
              default = null;
              description = "USD per million prompt-cache write tokens (5-minute and 1-hour writes alike).";
            };
          };
        }));
        default = null;
        description = "Per-model rates (USD per million tokens) replacing Anthropic list price in the Usage page's estimate. Applies only while Show Estimated Cost is on.";
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

      inferenceTokenWarningPercent = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Warn users once they have used this percentage of their token limit. At 100, the only warning comes at the limit. Has no effect unless Max Tokens per Window and Token Cap Window are both set. Unset: 75.";
      };

      desktopHome = lib.mkOption {
        type = types.nullOr (types.enum [ "standard" "off" ]);
        default = null;
        description = "standard turns on Unified Claude (Chat and Cowork in one view); off turns Chat and Cowork off. Replaces Allow Chat, Advanced File Analysis and Allow Cowork. Values are case-sensitive; an unrecognized value is read as off.";
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

      coworkTabEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable Cowork. Claude works on longer tasks like research, analysis, and documents. Defaults to true.";
      };

      secureVmFeaturesEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable Cowork access in Claude Desktop. Applies to standard deployments (users sign in with Claude.ai); Claude Desktop in third-party (3P) mode ignores this key. In 3P mode, use Allow Cowork (coworkTabEnabled) or Desktop Home (desktopHome) instead.";
      };

      isClaudeCodeForDesktopEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable Claude code access in desktop.";
      };

      autoModeEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls Auto mode. Unset: offered in the Code tab. true: also offered in Cowork. false: removed from both tabs.";
      };

      disableBypassPermissionsMode = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Remove the bypass permissions mode from Code sessions and Cowork tasks, so Claude always follows the permission policy. Off by default.";
      };

      sshHostAllowlist = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "SSH hosts allowed for Code sessions: exact hostnames, *. wildcards, or * for any host. Unset: off unless Claude Code managed settings on the device list hosts. An empty list: off.";
      };

      sshClientPath = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Absolute path to the OpenSSH ssh program (7.6 or newer) the app runs for SSH sessions. Unset: the first ssh on the user's PATH.";
      };

      sshTransport = lib.mkOption {
        type = types.nullOr (types.enum [ "auto" "system-openssh" "builtin" ]);
        default = null;
        description = "Which SSH engine carries Code sessions: the OpenSSH ssh program on the device or the app's built-in SSH library. Unset or auto: the build's default.";
      };

      disableBundledSkills = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Turns off the skills and workflows that ship with Claude Desktop.";
      };

      skillCreationEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When off, the options to create and upload skills are hidden and Claude does not offer to create or update skills.";
      };

      skillScanningEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Scan skills that users create.";
      };

      scheduledTasksEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Allow users to create and run scheduled tasks.";
      };

      keepAwakeEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Allow Claude Desktop to keep the computer awake while it works.";
      };

      developerModeEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When false, the Enable Developer Mode menu item and the Developer menu do not appear.";
      };

      quickEntryDefaultShortcut = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Default keyboard shortcut for Quick Entry.";
      };

      quickEntryScreenshotsEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Allow Quick Entry to capture screenshots of the screen and other apps.";
      };

      quickEntryFileSharingEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Allow Quick Entry to share files that are open in other apps.";
      };

      projectsEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Set to false to hide projects in Chat and Cowork. Projects are not deleted and reappear when the setting is turned back on.";
      };

      sessionStatusLine = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Absolute path to a program whose output Claude Desktop shows as one line of text above the message box in Cowork, Chat and Code. On macOS, the program and every folder above it must be writable only by root.";
      };

      builtinToolPolicy = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            __key__ = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Tool or rule";
            };
            __value__ = lib.mkOption {
              type = types.nullOr (types.enum [ "allow" "ask" ]);
              default = null;
              description = "Policy";
            };
          };
        });
        default = null;
        description = "Maps built-in tool names (or argument-scoped permission rules such as Bash(curl *)) to allow or ask. Applies to Cowork, Chat and Code. To block a tool, use Disabled Built-in Tools.";
      };

      disabledBuiltinTools = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Removes the listed built-in tools from the available set in Claude Desktop. Known tools: Task, Bash, Glob, Grep, Read, Edit, Write, NotebookEdit, WebFetch, TodoWrite, WebSearch, Skill, REPL, JavaScript, AskUserQuestion. ToolSearch and SendUserMessage are also available under specific conditions.";
      };

      toolSearchEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Load tool definitions on demand through tool search instead of all at once.";
      };

      organizationInstructions = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Instructions from your organization that are added to Claude's context.";
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

      requireCoworkFullVmSandbox = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Required the full VM sandbox for Cowork. Deprecated by Anthropic.";
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
              description = "Read-only folders can be viewed and searched but not modified in Cowork. In local Code sessions, read-only applies to file tools only; over SSH it also applies to Bash in its sandbox. One of: rw, ro.";
            };
          };
        }));
        default = null;
        description = "Folders where Claude may work. Applies to both Cowork and Code sessions. Leave unset for unrestricted access. Paths can reference ~ and these environment variables, expanded per user: %OneDrive%, %OneDriveCommercial%, %OneDriveConsumer%, %APPDATA%, %LOCALAPPDATA%, %USERNAME%, %XDG_DOCUMENTS_DIR%. The set is fixed; an entry that references any other %VAR%, or one that is unset on the device, is ignored.";
      };

      blockReadsOutsideWorkingDirectories = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Keep Claude from reading files outside a Code session's working directories. File tools refuse such reads; sandboxed shell commands lose the home directory.";
      };

      coworkEgressAllowedHosts = lib.mkOption {
        type = types.nullOr (types.listOf (types.str));
        default = null;
        description = "Hosts agent tools may reach in Cowork and Chat (and, in part, Code): exact hostnames, *. wildcards, optional :port, or * for all. Does not cover web search, inference or MCP traffic. Unset: web fetch is refused.";
      };

      skipWebFetchPreflight = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Skip the domain safety check that runs before WebFetch requests.";
      };

      egressProxyUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Sends the app's and the agent's traffic through this HTTP(S) proxy instead of the operating system's proxy settings. SOCKS proxies and embedded credentials are rejected. Read at launch. MDM only: ignored in a bootstrap server response.";
      };

      egressProxyPacUrl = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "URL of a PAC file that decides the proxy per request. Wins over the proxy server URL when both are set. MDM only: ignored in a bootstrap server response.";
      };

      coworkVmIpv6Enabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Gives the Cowork workspace VM an IPv6 address and route so the agent's tools can reach IPv6-only hosts through the device. Reachability only; the egress allowlist still applies.";
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
                    description = "Header name";
                  };
                  __value__ = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Header value";
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
                    description = "Tool name";
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
            toolTimeoutSec = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "How long a tool call to this server may run, in place of the MCP Tool Call Timeout (mcpToolTimeoutSec) for this server.";
            };
          };
        }));
        default = null;
        description = "Distributes remote MCP (Model Context Protocol) servers to users. Each entry requires a unique name and an HTTPS URL. Optional fields include transport, headers, OAuth, and tool-level policies. Used in Claude Cowork deployments on third-party platforms (Bedrock, Vertex AI, Azure AI Foundry, LLM gateways).";
      };

      isLocalDevMcpEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable or disable local Model Context Protocol (MCP) servers.";
      };

      mcpPersistentAlwaysAllowEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Offer the persistent “Always allow” approval options for MCP tools. Disable to keep tool approvals per-call or session-scoped only. Defaults to true.";
      };

      mcpScheduledTaskApprovalLifetimeDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "How long tool approvals granted for scheduled tasks stay valid.";
      };

      mcpToolTimeoutSec = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Per-call timeout for MCP tool calls, in seconds. Default 180 (3 minutes). Range: 60-3600.";
      };

      allowedPluginMcpServers = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            serverUrl = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "URL of the plugin-provided MCP server.";
            };
          };
        }));
        default = null;
        description = "MCP servers that plugins may provide, matched by server URL.";
      };

      deniedPluginMcpServers = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            serverUrl = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "URL of the plugin-provided MCP server.";
            };
          };
        }));
        default = null;
        description = "MCP servers that plugins may not provide, matched by server URL.";
      };

      microsoftAuthBroker = lib.mkOption {
        type = types.nullOr (types.enum [ "auto" "disabled" "required" ]);
        default = null;
        description = "How Microsoft 365 sign-in runs. auto: use the native OS broker (Company Portal SSO extension on macOS) when available, otherwise the browser. disabled: always use browser sign-in. required (1.49585.0 or later): sign-in fails when the broker is unavailable instead of falling back to the browser; earlier releases treat required as disabled. Defaults to auto.";
      };

      microsoftAuthDefaultAccount = lib.mkOption {
        type = types.nullOr (types.enum [ "enabled" "disabled" ]);
        default = null;
        description = "Whether Microsoft 365 sign-in uses the Windows account by default. One of: enabled, disabled. Defaults to disabled.";
      };

      isDesktopExtensionEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Allow Claude Desktop to load desktop extensions (.dxt and .mcpb files). When unset, the default depends on the deployment: on for standard deployments where users sign in with Claude.ai, off in third-party (3P) mode (since 1.19367.0).";
      };

      isDesktopExtensionDirectoryEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable or disable access to the extension directory. Applies to standard deployments (users sign in with Claude.ai); Claude Desktop in third-party (3P) mode ignores this key.";
      };

      isDesktopExtensionSignatureRequired = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When true, Claude Desktop rejects extensions that aren't signed by a trusted publisher.";
      };

      allowedPluginMarketplaces = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            source = lib.mkOption {
              type = types.nullOr (types.enum [ "github" "git" "url" ]);
              default = null;
              description = "github: a GitHub repository (set Repository). git: a Git remote (set URL). url: a hosted marketplace.json file (set URL).";
            };
            repo = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "GitHub repository in owner/repo form (github source).";
            };
            url = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "HTTPS Git remote (git source) or direct HTTPS URL of a hosted marketplace.json (url source).";
            };
            ref = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Commit SHA, branch or tag (github and git sources). Leave empty to track the default branch; auto_install and required need a full 40-character commit SHA.";
            };
            path = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Folder within the repository that contains the marketplace, when it isn't at the root (github and git sources).";
            };
            manifestSha256 = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "SHA-256 of the exact marketplace.json to accept (url source). Without it, auto_install and required act as available.";
            };
            expectedName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Rejects the marketplace if its manifest name differs.";
            };
            installationPreference = lib.mkOption {
              type = types.nullOr (types.enum [ "available" "auto_install" "required" ]);
              default = null;
              description = "Whether users install plugins themselves or get them automatically.";
            };
            credentialKind = lib.mkOption {
              type = types.nullOr (types.enum [ "anonymous" "userGit" "credentialHelper" "inferenceCredential" ]);
              default = null;
              description = "Credential sent with a fetch: nothing, the user's Git credential, a helper script's output, or the gateway or bootstrap credential (url source only).";
            };
            credentialHelper = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Executable that prints the access token to send.";
            };
          };
        }));
        default = null;
        description = "Git repositories or hosted marketplace.json files shown as plugin marketplaces in the Directory's Organization tab.";
      };

      orgPluginSettings = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            serverName = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Name of the plugin-delivered MCP server this policy applies to.";
            };
            tools = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  toolName = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "MCP tool name as the server reports it.";
                  };
                  permission = lib.mkOption {
                    type = types.nullOr (types.enum [ "allow" "ask" "blocked" ]);
                    default = null;
                    description = "Approval state locked for this tool.";
                  };
                };
              }));
              default = null;
              description = "Per-tool approval locks for this server.";
            };
          };
        }));
        default = null;
        description = "Locks tool permissions on the MCP servers that plugins provide. Unlisted tools stay user-controlled.";
      };

      userPluginMarketplacesEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Let users add plugin marketplaces. When off, marketplaces your organization did not provision are hidden and their plugins are not loaded.";
      };

      userPluginUploadsEnabled = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Allow users to add their own plugins. When off, every option for adding one is hidden and uploads are refused.";
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

      otlpAttrMaxChars = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Maximum length, in characters, of captured content such as a raw API body. Unset: 61,440 in Cowork tasks and Code sessions.";
      };

      chatSessionRetentionDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Delete chats, with their files, after this many days without activity. Unset: no deletion. Projects and memory are kept.";
      };

      coworkSessionRetentionDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Delete Cowork tasks, with their uploads and outputs, after this many days without activity. Unset: no deletion.";
      };

      codeSessionRetentionDays = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Delete Code sessions, conversation included, after this many days without activity. Unset: no deletion. Uncommitted work stays on disk.";
      };

      sessionRetentionHold = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Suspends the Chat, Cowork and Code retention periods (legal hold).";
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