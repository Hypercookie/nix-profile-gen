# Home Manager account bridges.
#
# Importing this module is the opt-in: with `programs.macprofile.enable = true`
# every eligible `accounts.*` entry is turned into the matching Apple payload
# instance automatically.
#
# All mapped values use `lib.mkDefault`, so anything can be overridden through
# the normal typed payload path, e.g.
#
#   programs.macprofile.payloads."apple-com-apple-mail-managed"."work" = {
#     PreventMove = true;
#   };
#
# Individual bridges can be turned off with
# `programs.macprofile.bridges.<email|calendar|contact>.enable = false`, or
# narrowed with the corresponding `exclude` list.
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
