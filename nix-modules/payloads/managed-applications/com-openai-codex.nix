# Auto-generated from ProfileManifests: com.openai.codex.plist
# Domain: com.openai.codex
# Title: ChatGPT / Codex
# Platforms: macOS
# Unique: yes
# Targets: system, user

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "ChatGPT / Codex";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.openai.codex";
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
        default = [ "config_toml_base64" "requirements_toml_base64" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      config_toml_base64 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Base64-encoded TOML that supplies managed default configuration. It is applied as the highest-precedence configuration layer, above /etc/codex/managed_config.toml and the user's config.toml, so values set here override user settings. Encode the TOML with 'base64' without line wrapping. Users must restart ChatGPT or Codex for changes to take effect.";
      };

      requirements_toml_base64 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Base64-encoded TOML that supplies enforced requirements, such as allowed approval policies, sandbox modes, and MCP servers. Requirements constrain what users can configure. This layer is applied below the system /etc/codex/requirements.toml and any cloud-managed requirements. Encode the TOML with 'base64' without line wrapping. Users must restart ChatGPT or Codex for changes to take effect.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-openai-codex" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "ChatGPT / Codex (com.openai.codex) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}