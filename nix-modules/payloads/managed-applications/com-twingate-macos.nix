# Auto-generated from ProfileManifests: com.twingate.macos.plist
# Domain: com.twingate.macos
# Title: Twingate
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-twingate-macos" = {
    enable = lib.mkEnableOption "Twingate";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.twingate.macos";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    network = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "A pre-configured Twingate network subdomain (eg. autoco from autoco.twingate.com). This avoids users needing to enter your Twingate network address on first run.";
    };

    startAtLogin = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Starts the Twingate Client upon user login";
    };

    PresentedDataPrivacy = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Suppresses the first run Data Privacy screen";
    };

    PresentedEducation = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Suppresses the first run Education screens";
    };

  };
}