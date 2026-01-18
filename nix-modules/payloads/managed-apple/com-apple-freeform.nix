# Auto-generated from ProfileManifests: com.apple.freeform.plist
# Domain: com.apple.freeform
# Title: Freeform
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-freeform" = {
    enable = lib.mkEnableOption "Freeform";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.freeform";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    CRLConnectICloudDialogShown = lib.mkOption {
      type = types.nullOr (types.int);
      default = 99999999;
      description = "Enabling this preference and using the default value will suppress a prompt offering to sign in to iCloud.";
    };

  };
}