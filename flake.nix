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
        # programs.appleProfile.profiles.<name>, bridges included (opt-in per
        # profile via bridges.<email|calendar|contact>.enable).
        profiles = ./nix-modules/home-manager.nix;

        default = ./nix-modules/home-manager.nix;
      };

      # The profile module on its own, with no Home Manager dependency. It
      # needs `pkgs` and `hmConfig` as special arguments; see mkProfile.
      profileModule = ./nix-modules/profile;

      # Build one .mobileconfig with plain lib.evalModules: no Home Manager
      # activation, no fake user.
      #
      #   nix-profile-gen.lib.mkProfile {
      #     pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      #     platform = "iOS";
      #     # Optional: an evaluated Home Manager config whose accounts.* the
      #     # bridges may read, e.g. config.home-manager.users.jane.
      #     homeConfig = ...;
      #     modules = [{
      #       bridges.email.enable = true;
      #       payloads."apple-com-apple-dnsSettings-managed".default = { ... };
      #     }];
      #   }
      #
      # Throws on failed assertions, traces warnings, and returns the
      # derivation. On macOS, a profile whose payloads land in both scopes
      # throws; use the `packages` attribute of the evaluated module instead.
      mkProfile =
        { pkgs
        , platform
        , modules ? [ ]
        , homeConfig ? { }
        , name ? "profile"
        }:
        let
          inherit (pkgs) lib;

          eval = lib.evalModules {
            modules = [
              profileModule
              {
                inherit platform;
                _label = "lib.mkProfile";
                _name = name;
              }
            ] ++ modules;
            specialArgs = {
              inherit pkgs;
              hmConfig = homeConfig;
            };
          };

          failed = map (a: a.message)
            (lib.filter (a: !a.assertion) eval.config.assertions);

          traced = lib.foldr
            (w: x: builtins.trace "warning: ${w}" x)
            eval.config.package
            eval.config.warnings;
        in
        if failed != [ ] then
          throw "\nFailed assertions:\n${lib.concatMapStringsSep "\n" (m: "- ${m}") failed}"
        else
          traced;
    in
    {
      inherit homeModules;

      lib = {
        inherit mkProfile profileModule;
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
            inherit mkProfile;
          } // {
          treefmt = treefmtEval.config.build.check self;
          inherit lint;
          pre-commit = preCommitCheck;
        };

        formatter = treefmtEval.config.build.wrapper;

        # The Fleet uploader behind programs.appleProfile.upload.fleet, for
        # uploading a profile by hand:
        #   nix run .#nix-profile-gen-fleet -- <url> <token file> upload <file>
        packages.nix-profile-gen-fleet = pkgs.callPackage ./nix-modules/uploaders/fleet.nix { };

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
