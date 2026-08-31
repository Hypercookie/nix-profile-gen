# Auto-generated from ProfileManifests: com.apple.proxy.http.global.plist
# Domain: com.apple.proxy.http.global
# Title: Global HTTP Proxy
# Platforms: iOS, macOS, tvOS
# Unique: yes
# Targets: system

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Global HTTP Proxy";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.proxy.http.global";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
        description = "Whether macOS allows only one instance of this payload per profile.";
      };

      _displayName = lib.mkOption {
        internal = true;
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "PayloadDisplayName for this instance. Defaults to the domain.";
      };

      _targets = lib.mkOption {
        internal = true;
        type = lib.types.listOf (lib.types.enum [ "system" "user" ]);
        default = [ "system" ];
        description = "Profile scopes this payload may be installed into (pfm_targets).";
      };

      _scope = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum [ "User" "System" ]);
        default = null;
        description = "Force this instance into a specific profile scope, overriding pfm_targets.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "ProxyType" "ProxyServer" "ProxyServerPort" "ProxyUsername" "ProxyPassword" "ProxyPACURL" "ProxyPACFallbackAllowed" "ProxyCaptiveLoginAllowed" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      ProxyType = lib.mkOption {
        type = types.nullOr (types.enum [ "Manual" "Auto" ]);
        default = null;
        description = "The proxy type. For a manual proxy type, the profile contains the proxy server address, including its port, and optionally a user name and password. For an auto proxy type, you can enter a PAC URL.";
      };

      ProxyServer = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The proxy server's network address. The device requires this if 'ProxyType' is set to 'Manual', and ignores it if 'ProxyType' is set to 'Automatic'.";
      };

      ProxyServerPort = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The proxy server's port number. The device requires this if 'ProxyType' is set to 'Manual', and ignores this if 'ProxyType' is set to 'Automatic'.";
      };

      ProxyUsername = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The user name used to authenticate to the proxy server. The device only uses this if 'ProxyType' is set to 'Manual', and ignores it if 'ProxyType' is set to 'Automatic'.";
      };

      ProxyPassword = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The password used to authenticate to the proxy server. The device only uses this if 'ProxyType' is set to 'Manual', and ignores it if 'ProxyType' is set to 'Automatic'.";
      };

      ProxyPACURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "The URL of the PAC file that defines the proxy configuration. Starting in iOS 13 and macOS 10.15, only URLs that begin with 'http://' or 'https://' are allowed. This is only used if 'ProxyType' is set to 'Automatic', and is ignored if 'ProxyType' is set to 'Manual'.";
      };

      ProxyPACFallbackAllowed = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', allows connecting directly to the destination if the proxy autoconfiguration (PAC) file is unreachable.";
      };

      ProxyCaptiveLoginAllowed = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "If 'true', allows the device to bypass the proxy server to display the login page for captive networks.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."apple-com-apple-proxy-http-global" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Global HTTP Proxy (com.apple.proxy.http.global) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}