# Account bridges, as part of every profile (see ../profile/default.nix).
#
# Each bridge is off by default and enabled per profile:
#
#   programs.appleProfile.profiles.mac.bridges.email.enable = true;
#   programs.appleProfile.profiles.iphone.bridges.email = {
#     enable = true;
#     exclude = [ "work" ];
#   };
#
# All mapped values use `lib.mkDefault`, so anything can be overridden through
# the normal typed payload path of the same profile, e.g.
#
#   programs.appleProfile.profiles.iphone.payloads
#     ."apple-com-apple-mail-managed".work.PreventMove = true;
#
# Note the bridge names mirror the Home Manager option names exactly:
# `accounts.email`, `accounts.calendar` and `accounts.contact` (singular).
{
  imports = [
    ./email.nix
    ./calendar.nix
    ./contact.nix
  ];
}
