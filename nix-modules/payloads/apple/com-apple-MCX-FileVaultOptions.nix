# Auto-generated from ProfileManifests: com.apple.MCX-FileVaultOptions.plist
# Domain: com.apple.MCX
# Title: FDE FileVault Options
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-MCX-FileVaultOptions" = {
    enable = lib.mkEnableOption "FDE FileVault Options";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.MCX";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    dontAllowFDEDisable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system won't disable FileVault.";
    };

    dontAllowFDEEnable = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system won't enable FileVault.";
    };

    DestroyFVKeyOnStandby = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system won't store th FileVault key across restarts.";
    };

  };
}