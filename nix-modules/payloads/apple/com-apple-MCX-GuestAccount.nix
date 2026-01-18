# Auto-generated from ProfileManifests: com.apple.MCX-GuestAccount.plist
# Domain: com.apple.MCX
# Title: Guest Account
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-MCX-GuestAccount" = {
    enable = lib.mkEnableOption "Guest Account";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.MCX";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    EnableGuestAccount = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system enables the guest account.";
    };

    DisableGuestAccount = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "If 'true', the system disables the guest account. This property has no effect if 'EnableGuestAccount' is 'true'.";
    };

  };
}