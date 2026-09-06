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
        # Local MDM server. Inert until programs.macprofile.mdm.enable is set,
        # so including it in `default` costs nothing.
        mdm = ./mdm/nix-modules/mdm.nix;
        default = {
          imports = [
            ./nix-modules/generateMacOSProfile.nix
            ./nix-modules/bridges
            ./mdm/nix-modules/mdm.nix
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

        packages = {
          nanomdm = pkgs.callPackage ./mdm/packages/nanomdm.nix { };
          nixmagic-mdm = pkgs.callPackage ./mdm/packages/nixmagic-mdm.nix { };
        };

        apps.nixmagic-mdm = {
          type = "app";
          program = "${pkgs.callPackage ./mdm/packages/nixmagic-mdm.nix { }}/bin/nixmagic-mdm";
        };

        devShells.default = pkgs.mkShell {
          packages = [ pkgs.python3 ];
        };
      }
    );
}
