#!/usr/bin/env python3
"""
List all available macprofile options and payloads.

Usage:
    python3 list-macprofile-options.py                    # List all payloads
    python3 list-macprofile-options.py <payload-name>    # Show options for a specific payload
    python3 list-macprofile-options.py --nix-eval        # Use nix eval to query options (requires nix)
"""
from __future__ import annotations

import re
import sys
from pathlib import Path
from typing import Optional


def extract_payload_info(nix_file: Path) -> Optional[dict]:
    """Extract payload information from a generated .nix file."""
    try:
        with open(nix_file, 'r') as f:
            content = f.read()
        
        # Extract manifest name (the key in options.programs.macprofile.payloads."...")
        manifest_match = re.search(r'options\.programs\.macprofile\.payloads\.\"([^\"]+)\"', content)
        if not manifest_match:
            return None
        
        manifest_name = manifest_match.group(1)
        
        # Extract domain
        domain_match = re.search(r'# Domain: (.+)', content)
        domain = domain_match.group(1) if domain_match else None
        
        # Extract title
        title_match = re.search(r'# Title: (.+)', content)
        title = title_match.group(1) if title_match else None
        
        # Extract platforms
        platforms_match = re.search(r'# Platforms: (.+)', content)
        platforms = platforms_match.group(1).split(', ') if platforms_match else []
        
        # Extract enable option description
        enable_match = re.search(r'enable = lib\.mkEnableOption \"([^\"]+)\"', content)
        enable_desc = enable_match.group(1) if enable_match else None
        
        # Extract all option names (look for "option_name = lib.mkOption")
        option_matches = re.findall(r'^\s+([a-zA-Z0-9_]+)\s+=\s+lib\.mkOption', content, re.MULTILINE)
        options = [opt for opt in option_matches if opt not in ['enable', '_domain']]
        
        # Extract option descriptions
        option_descriptions = {}
        for opt in options:
            # Find the option block
            opt_pattern = rf'{re.escape(opt)}\s*=\s*lib\.mkOption\s*\{{(.*?)\}};'
            opt_match = re.search(opt_pattern, content, re.DOTALL)
            if opt_match:
                opt_content = opt_match.group(1)
                desc_match = re.search(r'description\s*=\s*"([^"]+)"', opt_content)
                if desc_match:
                    option_descriptions[opt] = desc_match.group(1)
        
        return {
            'manifest_name': manifest_name,
            'domain': domain,
            'title': title,
            'platforms': platforms,
            'enable_desc': enable_desc,
            'options': options,
            'option_descriptions': option_descriptions,
            'file': nix_file.name,
        }
    except Exception as e:
        print(f"Error reading {nix_file}: {e}", file=sys.stderr)
        return None


def list_all_payloads(payloads_dir: Path):
    """List all available payloads."""
    payloads = []
    
    for nix_file in sorted(payloads_dir.rglob('*.nix')):
        if nix_file.name in ('default.nix', 'all-payloads.nix'):
            continue
        
        info = extract_payload_info(nix_file)
        if info:
            payloads.append(info)
    
    print(f"Found {len(payloads)} payloads:\n")
    
    # Group by category (extract from manifest name prefix)
    by_category = {}
    for payload in payloads:
        # Extract category from manifest name (e.g., "apple-com-apple-finder" -> "apple")
        manifest_name = payload['manifest_name']
        if '-' in manifest_name:
            category = manifest_name.split('-')[0]
        else:
            category = 'other'
        
        if category not in by_category:
            by_category[category] = []
        by_category[category].append(payload)
    
    for category in sorted(by_category.keys()):
        print(f"\n{category.upper()}:")
        print("=" * 80)
        for payload in sorted(by_category[category], key=lambda x: x['manifest_name']):
            print(f"  {payload['manifest_name']}")
            if payload['title']:
                print(f"    Title: {payload['title']}")
            if payload['domain']:
                print(f"    Domain: {payload['domain']}")
            if payload['platforms']:
                print(f"    Platforms: {', '.join(payload['platforms'])}")
            if payload['options']:
                print(f"    Options: {len(payload['options'])} available")
            print()


def show_payload_options(payloads_dir: Path, manifest_name: str):
    """Show detailed options for a specific payload."""
    found = False
    
    for nix_file in sorted(payloads_dir.rglob('*.nix')):
        if nix_file.name in ('default.nix', 'all-payloads.nix'):
            continue
        
        info = extract_payload_info(nix_file)
        if info and info['manifest_name'] == manifest_name:
            found = True
            print(f"Payload: {info['manifest_name']}")
            print("=" * 80)
            
            if info['title']:
                print(f"Title: {info['title']}")
            if info['domain']:
                print(f"Domain: {info['domain']}")
            if info['platforms']:
                print(f"Platforms: {', '.join(info['platforms'])}")
            if info['file']:
                print(f"File: {info['file']}")
            
            print("\nOptions:")
            print("-" * 80)
            
            # Always show enable
            print("  enable")
            if info['enable_desc']:
                print(f"    Description: {info['enable_desc']}")
            print("    Type: boolean (lib.mkEnableOption)")
            print()
            
            # Show other options
            for opt in sorted(info['options']):
                print(f"  {opt}")
                if opt in info['option_descriptions']:
                    desc = info['option_descriptions'][opt]
                    # Truncate long descriptions
                    if len(desc) > 100:
                        desc = desc[:97] + "..."
                    print(f"    Description: {desc}")
                print()
            
            break
    
    if not found:
        print(f"Payload '{manifest_name}' not found.", file=sys.stderr)
        print("\nAvailable payloads:", file=sys.stderr)
        list_all_payloads(payloads_dir)
        sys.exit(1)


def query_with_nix_eval(manifest_name: Optional[str] = None):
    """Query options using nix eval (requires nix and home-manager in PATH)."""
    import subprocess
    
    if manifest_name:
        # Query specific payload options
        nix_expr = f'''
        with import <nixpkgs> {{}};
        let
          hm = import (builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz");
          eval = hm.lib.evalModules {{
            modules = [
              ./nix-modules/generateMacOSProfile.nix
            ];
          }};
          opts = eval.options.programs.macprofile.payloads."{manifest_name}";
        in
          builtins.mapAttrs (name: opt: {{
            description = opt.description or "";
            type = builtins.toString opt.type;
            default = opt.default or null;
          }}) opts
        '''
    else:
        # List all payloads
        nix_expr = '''
        with import <nixpkgs> {};
        let
          hm = import (builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz");
          eval = hm.lib.evalModules {
            modules = [
              ./nix-modules/generateMacOSProfile.nix
            ];
          };
          payloads = eval.options.programs.macprofile.payloads;
        in
          builtins.attrNames payloads
        '''
    
    try:
        result = subprocess.run(
            ['nix', 'eval', '--json', '--expr', nix_expr],
            cwd=Path(__file__).parent,
            capture_output=True,
            text=True,
            check=True
        )
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print(f"Error running nix eval: {e.stderr}", file=sys.stderr)
        print("Make sure nix is installed and the module path is correct.", file=sys.stderr)
        sys.exit(1)
    except FileNotFoundError:
        print("Error: 'nix' command not found. Install Nix to use --nix-eval mode.", file=sys.stderr)
        sys.exit(1)


def list_option_names(payloads_dir: Path):
    """List all option names in format suitable for optnix (one per line)."""
    options = set()
    
    for nix_file in sorted(payloads_dir.rglob('*.nix')):
        if nix_file.name in ('default.nix', 'all-payloads.nix'):
            continue
        
        info = extract_payload_info(nix_file)
        if info:
            manifest_name = info['manifest_name']
            # Main payload option
            options.add(f"programs.macprofile.payloads.\"{manifest_name}\"")
            # Enable option
            options.add(f"programs.macprofile.payloads.\"{manifest_name}\".enable")
            # Sub-options
            for opt in sorted(info['options']):
                options.add(f"programs.macprofile.payloads.\"{manifest_name}\".{opt}")
    
    # Print sorted
    for opt in sorted(options):
        print(opt)


def main():
    script_dir = Path(__file__).parent
    payloads_dir = script_dir / 'nix-modules' / 'payloads'
    
    if not payloads_dir.exists():
        print(f"Error: payloads directory not found at {payloads_dir}", file=sys.stderr)
        sys.exit(1)
    
    if len(sys.argv) > 1:
        if sys.argv[1] == '--optnix':
            # Output option names for optnix (one per line)
            list_option_names(payloads_dir)
        elif sys.argv[1] == '--nix-eval':
            if len(sys.argv) > 2:
                query_with_nix_eval(sys.argv[2])
            else:
                query_with_nix_eval()
        elif sys.argv[1] in ('-h', '--help'):
            print("Usage:")
            print("  python3 list-macprofile-options.py                    # List all payloads")
            print("  python3 list-macprofile-options.py <payload-name>    # Show options for a payload")
            print("  python3 list-macprofile-options.py --optnix          # List option names for optnix")
            print("  python3 list-macprofile-options.py --nix-eval         # Use nix eval (requires nix)")
            print("  python3 list-macprofile-options.py --nix-eval <name> # Query specific payload with nix")
        else:
            manifest_name = sys.argv[1]
            show_payload_options(payloads_dir, manifest_name)
    else:
        list_all_payloads(payloads_dir)


if __name__ == '__main__':
    main()
