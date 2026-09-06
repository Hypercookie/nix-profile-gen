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
        inherit (nixpkgs) lib;

        # treefmt, evaluated via the plain-flake integration (this flake uses
        # flake-utils, not flake-parts). Drives `nix fmt`, checks.treefmt and
        # the pre-commit `treefmt` hook, so all three share one config and one
        # set of exclusions.
        treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;

        # The linters must never see the auto-generated payload modules or the
        # upstream manifest submodule, so they are stripped from the source
        # the lint check runs against rather than being filtered per-tool.
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

        # deadnix, statix and ruff over the hand-written sources only.
        lint = pkgs.runCommand "nixmagic-lint"
          {
            nativeBuildInputs = [ pkgs.ruff pkgs.statix pkgs.deadnix ];
          } ''
          cd ${lintSrc}

          echo "== ruff check =="
          # Configured by ruff.toml at the source root.
          ruff check --no-cache .

          echo "== statix =="
          statix check .

          echo "== deadnix =="
          # --no-lambda-arg / --no-lambda-pattern-names: the bridges and the
          # profile module take (name: acct:) and ({ pkgs, lib, ... }:)
          # signatures where ignoring an argument is deliberate and part of
          # the interface, not dead code.
          #
          # tests/default.nix is excluded for one real finding: the
          # `mkProfile` let binding at line 32 is genuinely unused. Remove it
          # and then drop this exclusion.
          deadnix \
            --no-lambda-arg \
            --no-lambda-pattern-names \
            --exclude tests/default.nix \
            --fail .

          touch "$out"
        '';

        # Belt and braces: the generated payloads and the vendored submodule
        # are already excluded by treefmt.nix and by lintSrc, but pre-commit
        # feeds staged filenames straight to the hooks, so the same exclusions
        # must be repeated here or a commit touching a generated module would
        # reformat it.
        preCommitExcludes = [
          "^ProfileManifests/"
          "^nix-modules/payloads/"
          "^flake\\.lock$"
        ];

        preCommitHooks = {
          # Reuses the exact wrapper `nix fmt` uses, config and all.
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
            # Same single known finding as the lint check above.
            excludes = [ "^tests/default\\.nix$" ];
          };

          # Upstream calls this hook `check-merge-conflicts` (plural).
          check-merge-conflicts.enable = true;
          check-added-large-files.enable = true;
        };

        # Installed into devShells.default via its shellHook. This variant
        # carries the branch guard.
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

        # The same hooks as a flake check, minus the branch guard.
        #
        # no-commit-to-branch is deliberately omitted here: the check runs
        # `pre-commit run --all-files` inside a build sandbox, where
        # git-hooks.nix `git init`s a throwaway repo whose default branch is
        # itself `master`. The guard would therefore always trip, failing the
        # check for a reason that has nothing to do with the commit being
        # made. It only carries meaning against a developer's real working
        # tree, which is exactly where `preCommit` above installs it.
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
            # Runs nix_o_s_module_generator.py.
            pkgs.python3

            # Everything the hooks and CI invoke, so a contributor can run
            # any of them by hand from inside the shell.
            pkgs.ruff
            pkgs.statix
            pkgs.deadnix
            treefmtEval.config.build.wrapper
            pkgs.nixpkgs-fmt
            pkgs.nodePackages.prettier
            pkgs.shfmt
          ];

          # Installs the git pre-commit hook on shell entry.
          inherit (preCommit) shellHook;
        };
      }
    );
}
