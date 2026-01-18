{
  description = "macOS Configuration Profile Generator for Nix/Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    optnix = {
      url = "github:water-sucks/optnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, optnix, home-manager, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        
        # Generate payload modules
        generatePayloads = pkgs.writeShellScriptBin "generate-payloads" ''
          set -euo pipefail
          echo "Generating payload modules from ProfileManifests..."
          ${pkgs.python3}/bin/python3 ${./nix_o_s_module_generator.py}
          echo "Done! Payload modules generated in nix-modules/payloads/"
        '';


      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            python3
            jq
            generatePayloads
            optnix.packages.${system}.default
            # Note: home-manager-options should be available in your Home Manager environment
            # If not, you can add home-manager here or use optnix with the Python script
          ];

          shellHook = ''
            echo "🔧 macOS Profile Generator DevShell"
            echo ""
            echo "Available commands:"
            echo "  generate-payloads  - Generate payload modules from ProfileManifests"
            echo "  optnix             - Interactive option browser"
            echo ""
            echo "To generate payload modules, run:"
            echo "  generate-payloads"
            echo ""
            echo "To browse options with optnix, run:"
            echo "  optnix search programs.macprofile"
            echo ""
            
            # Set up optnix config if it doesn't exist or update it
            OPTNIX_CONFIG="$HOME/.config/optnix/config.toml"
            mkdir -p "$(dirname "$OPTNIX_CONFIG")"
            
            # Create or update the macprofile scope
            if [ ! -f "$OPTNIX_CONFIG" ]; then
              cat > "$OPTNIX_CONFIG" << 'EOF'
            default_scope = "macprofile"
            formatter_cmd = "nixfmt"
            EOF
            fi
            
            # Add macprofile scope if it doesn't exist
            if ! grep -q '\[scopes.macprofile\]' "$OPTNIX_CONFIG" 2>/dev/null; then
              cat >> "$OPTNIX_CONFIG" << EOF

            [scopes.macprofile]
            description = "macOS Profile Generator Options"
            # Use Python script to list option names (one per line)
            options-list-command = "${pkgs.python3}/bin/python3 ${./list-macprofile-options.py} --optnix 2>/dev/null || echo ''"
            # Try home-manager-options first, fallback to Python script
            evaluator = "home-manager-options '{{ .Option }}' 2>/dev/null || ${pkgs.python3}/bin/python3 ${./list-macprofile-options.py} '{{ .Option }}' 2>/dev/null || echo 'Option not found'"
            EOF
              echo "✅ Added macprofile scope to optnix config"
            fi
            
            echo "💡 Tip: Use 'optnix search programs.macprofile' to browse options"
          '';
        };

        packages = {
          inherit generatePayloads;
          default = generatePayloads;
        };

        # Provide the module as a flake output for easy importing
        nixosModules.macprofile = ./nix-modules/generateMacOSProfile.nix;
        homeManagerModules.macprofile = ./nix-modules/generateMacOSProfile.nix;
      }
    );
}
