{
  description = "A reusable Home Manager module for macOS (Intel & Apple Silicon) generating configuration profiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils }:
    let
      # Home Manager modules are system-independent, so they must live outside
      # eachDefaultSystem. (They used to be nested inside it, which made them
      # reachable only as homeModules.<system>.profiles.)
      homeModules = {
        profiles = ./nix-modules/generateMacOSProfile.nix;
        bridges = ./nix-modules/bridges;
        default = {
          imports = [
            ./nix-modules/generateMacOSProfile.nix
            ./nix-modules/bridges
          ];
        };
      };
    in
    { inherit homeModules; }
    // flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        checks = import ./tests {
          inherit pkgs system home-manager;
          inherit (nixpkgs) lib;
          modules = homeModules;
        };

        devShells.default = pkgs.mkShell {
          packages = [ pkgs.python3 ];
        };
      }
    );
}
