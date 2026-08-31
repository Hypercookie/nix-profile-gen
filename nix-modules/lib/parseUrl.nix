# Minimal http(s) URL splitter.
#
# Nix has no URL parser, but the CalDAV/CardDAV payloads need host, port and
# path as separate keys while Home Manager stores a single `remote.url`.
#
# Returns null when the URL cannot be parsed, otherwise:
#   { scheme, host, port, path, useSSL }
# where `port` is null when the URL omits it (macOS then uses its default).
lib: url:
let
  match = builtins.match "^(https?)://([^/:?#]+)(:([0-9]+))?([/?#].*)?$" url;
in
if url == null || match == null then
  null
else
let
  scheme = builtins.elemAt match 0;
  rawPort = builtins.elemAt match 3;
  rawPath = builtins.elemAt match 4;
in
{
  inherit scheme;
  host = builtins.elemAt match 1;
  port = if rawPort == null then null else lib.toInt rawPort;
  path = if rawPath == null then "/" else rawPath;
  useSSL = scheme == "https";
}
