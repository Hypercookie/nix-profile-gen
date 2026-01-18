# Auto-generated from ProfileManifests: com.apple.python.plist
# Domain: com.apple.python
# Title: Python
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-python" = {
    enable = lib.mkEnableOption "Python";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.python";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    DisablePythonAlert = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Controls whether warnings are shown to the user when an app or process calls the macOS-bundled Python2 interpreter. This interpreter has been deprecated and will be removed in a future version of macOS.";
    };

  };
}