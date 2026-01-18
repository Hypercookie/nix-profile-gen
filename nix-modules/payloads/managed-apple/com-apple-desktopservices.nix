# Auto-generated from ProfileManifests: com.apple.desktopservices.plist
# Domain: com.apple.desktopservices
# Title: Desktop Services
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-desktopservices" = {
    enable = lib.mkEnableOption "Desktop Services";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.desktopservices";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    DSDontWriteNetworkStores = lib.mkOption {
      type = types.nullOr (types.bool);
      default = null;
      description = "Prevent .DS_Store file creation when interacting with a remote file server using the Finder.";
    };

  };
}