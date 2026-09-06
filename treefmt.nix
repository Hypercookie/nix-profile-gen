# treefmt configuration, evaluated from flake.nix via `treefmt-nix.lib.evalModule`.
#
# This repo uses flake-utils rather than flake-parts, so the plain-flake
# integration is used instead of the flake-parts module.
#
# Consumed by:
#   * `nix fmt`                  -> formatter.<system>
#   * `nix flake check`          -> checks.<system>.treefmt
#   * `pre-commit` (git-hooks.nix) -> the `treefmt` hook, which is handed this
#     very same wrapper, so the exclusions below apply on the commit path too.
_:
{
  # Anchors the project root for treefmt's file walk.
  projectRootFile = "flake.nix";

  programs = {
    # Nix. nixpkgs-fmt, not nixfmt-rfc-style: the existing hand-written modules
    # are already in nixpkgs-fmt style. Measured over the 11 hand-written .nix
    # files, nixpkgs-fmt needs 170 changed lines versus 1817 for
    # nixfmt-rfc-style, so this is by far the smaller diff.
    nixpkgs-fmt.enable = true;

    # Python. Both Python files are stdlib-only Python 3.
    ruff-format = {
      enable = true;
      # Matches `line-length` in ruff.toml; the two must agree or ruff-format
      # and `ruff check` will disagree about where lines end.
      lineLength = 100;
    };

    # Markdown / YAML / JSON.
    prettier = {
      enable = true;
      # Narrow prettier's default include list to the three file types this
      # repo actually has, so adding e.g. a vendored .js file later does not
      # silently start getting reformatted.
      includes = [
        "*.md"
        "*.json"
        "*.yaml"
        "*.yml"
      ];
    };

    # Shell. Only real script files: there is a lot of shell embedded in Nix
    # strings (activation scripts, onChange hooks, runCommand bodies) that
    # treefmt fundamentally cannot reach, and no attempt is made to.
    shfmt.enable = true;
  };

  settings.excludes = [
    # Git submodule holding upstream Apple manifests. Not our content, and
    # reformatting it would produce permanent submodule dirt.
    "ProfileManifests/**"

    # ~260 auto-generated payload modules, emitted by
    # nix_o_s_module_generator.py. Formatting them is pointless: the next
    # generator run overwrites the result, and the CI `generator` job compares
    # the generated output byte-for-byte against what is checked in, so a
    # reformat here would actively break that check. It would also make a
    # useless 260-file diff.
    "nix-modules/payloads/**"

    # Machine-maintained; nix regenerates it and prettier would reflow it.
    "flake.lock"
  ];
}
