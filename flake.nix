{
  description = "A reusable Home Manager module for macOS (Intel & Apple Silicon) generating prov profiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager }:
    { system }:
    let
      pkgs = import nixpkgs { inherit system; };
      hm = import home-manager { inherit pkgs; };
    in
    {
      homeModules.myMacModule = hm.lib.homeManagerModule {
        modules = [
          ./nix-modules/generateMacOSProfile.nix
        ];
      };
    };
}
