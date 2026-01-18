# Auto-generated from ProfileManifests: com.apple.systempolicy.managed.plist
# Domain: com.apple.systempolicy.managed
# Title: System Policy Managed
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-systempolicy-managed" = {
    enable = lib.mkEnableOption "System Policy Managed";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.systempolicy.managed";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    DisableOverride = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', disables the Finder's contextual menu item.";
    };

  };
}