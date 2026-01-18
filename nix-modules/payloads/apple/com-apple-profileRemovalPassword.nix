# Auto-generated from ProfileManifests: com.apple.profileRemovalPassword.plist
# Domain: com.apple.profileRemovalPassword
# Title: Profile Removal Password
# Platforms: iOS, macOS, tvOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-profileRemovalPassword" = {
    enable = lib.mkEnableOption "Profile Removal Password";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.profileRemovalPassword";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    RemovalPassword = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "The password to allow removing the profile.";
    };

  };
}