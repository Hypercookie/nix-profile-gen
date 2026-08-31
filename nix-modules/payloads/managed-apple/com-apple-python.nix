# Auto-generated from ProfileManifests: com.apple.python.plist
# Domain: com.apple.python
# Title: Python
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Python";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.apple.python";
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

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "DisablePythonAlert" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      DisablePythonAlert = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Controls whether warnings are shown to the user when an app or process calls the macOS-bundled Python2 interpreter. This interpreter has been deprecated and will be removed in a future version of macOS.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-apple-com-apple-python" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Python (com.apple.python) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}