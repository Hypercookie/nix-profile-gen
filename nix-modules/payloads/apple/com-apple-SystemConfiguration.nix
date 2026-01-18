# Auto-generated from ProfileManifests: com.apple.SystemConfiguration.plist
# Domain: com.apple.SystemConfiguration
# Title: Proxies
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."apple-com-apple-SystemConfiguration" = {
    enable = lib.mkEnableOption "Proxies";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.SystemConfiguration";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    Proxies = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          HTTPEnable = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "If 'true', enables web proxy.";
          };
          HTTPProxy = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The host name or IP address for the web proxy.";
          };
          HTTPPort = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The web proxy port.";
          };
          HTTPSEnable = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "If 'true', enables secure web proxy.";
          };
          HTTPSProxy = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The host name or IP address for the secure web proxy.";
          };
          HTTPSPort = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The secure web proxy port.";
          };
          FTPEnable = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "If 'true', enables FTP proxy.";
          };
          FTPPassive = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "If 'true', enables passive FTP mode.";
          };
          FTPProxy = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The host name or IP address for the FTP proxy.";
          };
          FTPPort = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The FTP proxy port.";
          };
          SOCKSEnable = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "If 'true', enable the SOCKS proxy.";
          };
          SOCKSProxy = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The host name or IP address for the SOCKS proxy.";
          };
          SOCKSPortInteger = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The port on which to connect to the socks proxy server.";
          };
          RTSPEnable = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "If 'true', enable streaming proxy.";
          };
          RTSPProxy = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The host name or IP address for the streaming proxy.";
          };
          RTSPPort = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The streaming proxy port.";
          };
          GopherEnable = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "If 'true', enables gopher proxy.";
          };
          GopherProxy = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The host name or IP address for the gopher proxy.";
          };
          GopherPort = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The gopher proxy port.";
          };
          ExceptionsList = lib.mkOption {
            type = types.nullOr (types.listOf (types.str));
            default = null;
            description = "The list of hosts and domains that should bypass proxy settings.";
          };
          ProxyAutoConfigEnable = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "If 'true', enables automatic proxy configuration.";
          };
          ProxyAutoConfigURLString = lib.mkOption {
            type = types.nullOr (types.str);
            default = null;
            description = "The automatic proxy configuration URL.";
          };
          FallBackAllowed = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "If '1', enables fallback. Default is '1'.\n\nFor managed devices, if not supplied, the default is '0'.";
          };
          ProxyCaptiveLoginAllowed = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "If 1, allows client to log into captive portal network.";
          };
          SOCKSPortinteger = lib.mkOption {
            type = types.nullOr (types.int);
            default = null;
            description = "The SOCKS proxy port.";
          };
        };
      });
      default = null;
      description = "The dictionary containing all the proxies for this device.";
    };

  };
}