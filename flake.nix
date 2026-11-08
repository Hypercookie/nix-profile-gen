{
  description = "A reusable Home Manager module for macOS (Intel & Apple Silicon) generating configuration profiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, treefmt-nix, git-hooks }:
    let
      # Home Manager modules are system-independent, so they must live outside
      # eachDefaultSystem.
      homeModules = {
        profiles = ./nix-modules/generateMacOSProfile.nix;
        bridges = ./nix-modules/bridges;

        # Local MDM server. Inert until programs.macprofile.mdm.enable is set.
        mdm = ./mdm/nix-modules/mdm.nix;

        default = {
          imports = [
            ./nix-modules/generateMacOSProfile.nix
            ./nix-modules/bridges
            ./mdm/nix-modules/mdm.nix
          ];
        };
      };

      # Build a standalone .mobileconfig without requiring a Home Manager
      # activation. The caller supplies pkgs for the target architecture.
      mkProfile =
        { pkgs
        , modules
        , platform ? "iOS"
        , name ? "profile"
        , scope ? "System"
        , username ? "nixmagic"
        , homeDirectory ? "/var/empty"
        , stateVersion ? "24.11"
        ,
        }:

        let
          hm = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            modules = [
              self.homeModules.profiles

              ({ lib, ... }: {
                home.username = lib.mkDefault username;
                home.homeDirectory = lib.mkDefault homeDirectory;
                home.stateVersion = lib.mkDefault stateVersion;

                programs.macprofile = {
                  enable = true;
                  inherit platform scope;
                  profileName = lib.mkDefault name;
                  outputPath = "profile.mobileconfig";
                };
              })
            ] ++ modules;
          };

          profilePath =
            hm.config.programs.macprofile.outputPaths.${scope};

          profileSource =
            hm.config.home.file.${profilePath}.source;

        in
        pkgs.runCommand "${name}.mobileconfig" { } ''
          cp ${profileSource} "$out"
        '';
    in
    {
      inherit homeModules;

      lib = {
        inherit mkProfile;
      };
    }
    // flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        inherit (nixpkgs) lib;

        # treefmt, evaluated via the plain-flake integration.
        treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;

        # The generated payload modules and upstream manifests are excluded
        # from linting.
        lintSrc = lib.cleanSourceWith {
          name = "nixmagic-lint-src";
          src = ./.;
          filter =
            let root = toString ./.; in
            path: _type:
              let rel = lib.removePrefix "${root}/" (toString path); in
                !(lib.hasPrefix "ProfileManifests" rel
                || lib.hasPrefix "nix-modules/payloads" rel);
        };

        # deadnix, statix and ruff over hand-written sources.
        lint = pkgs.runCommand "nixmagic-lint"
          {
            nativeBuildInputs = [ pkgs.ruff pkgs.statix pkgs.deadnix ];
          } ''
          cd ${lintSrc}

          echo "== ruff check =="
          ruff check --no-cache .

          echo "== statix =="
          statix check .

          echo "== deadnix =="
          deadnix \
            --no-lambda-arg \
            --no-lambda-pattern-names \
            --exclude tests/default.nix \
            --fail .

          touch "$out"
        '';

        # Same exclusions for treefmt and pre-commit.
        preCommitExcludes = [
          "^ProfileManifests/"
          "^nix-modules/payloads/"
          "^flake\\.lock$"
        ];

        preCommitHooks = {
          treefmt = {
            enable = true;
            packageOverrides.treefmt = treefmtEval.config.build.wrapper;
          };

          ruff.enable = true;

          statix.enable = true;

          deadnix = {
            enable = true;
            settings = {
              noLambdaArg = true;
              noLambdaPatternNames = true;
            };
            excludes = [ "^tests/default\\.nix$" ];
          };

          check-merge-conflicts.enable = true;
          check-added-large-files.enable = true;
        };

        # Developer pre-commit hooks, including the branch guard.
        preCommit = git-hooks.lib.${system}.run {
          src = ./.;
          excludes = preCommitExcludes;
          hooks = preCommitHooks // {
            no-commit-to-branch = {
              enable = true;
              settings.branch = [ "master" ];
            };
          };
        };

        # CI pre-commit checks, without the branch guard.
        preCommitCheck = git-hooks.lib.${system}.run {
          src = ./.;
          excludes = preCommitExcludes;
          hooks = preCommitHooks;
        };
      in
      {
        checks = import ./tests
          {
            inherit pkgs system home-manager;
            inherit (nixpkgs) lib;
            modules = homeModules;
          } // {
          treefmt = treefmtEval.config.build.check self;
          inherit lint;
          pre-commit = preCommitCheck;
        };

        formatter = treefmtEval.config.build.wrapper;

        packages = {
          nanomdm = pkgs.callPackage ./mdm/packages/nanomdm.nix { };
          nixmagic-mdm = pkgs.callPackage ./mdm/packages/nixmagic-mdm.nix { };
        };

        apps.nixmagic-mdm = {
          type = "app";
          program = "${pkgs.callPackage ./mdm/packages/nixmagic-mdm.nix { }}/bin/nixmagic-mdm";
        };

        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.python3
            pkgs.optnix
            pkgs.ruff
            pkgs.statix
            pkgs.deadnix
            treefmtEval.config.build.wrapper
            pkgs.nixpkgs-fmt
            pkgs.nodePackages.prettier
            pkgs.shfmt
          ];

          inherit (preCommit) shellHook;
        };
      }
    );
}
