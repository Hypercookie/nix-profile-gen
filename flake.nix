{
  description = "A reusable Home Manager module for macOS (Intel & Apple Silicon) generating prov profiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        hm = import home-manager {
          inherit pkgs;
          # For Nix-Darwin: don't need 'configuration' here
          # only importing library functions
        };
      in
      {
        # Export the module for reuse
        homeModules.profiles = ./nix-modules/generateMacOSProfile.nix;

        # Optional: export packages or nixosModules if needed
        packages.default = pkgs.stdenv.mkDerivation {
          name = "dummy"; # just a placeholder if you want
          buildCommand = "echo 'nothing'";
        };
      }
    );
}
