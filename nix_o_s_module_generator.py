
#!/usr/bin/env python3
"""
Convert Apple ProfileManifests to NixOS/Home Manager options expressions.

This script reads plist files from the ProfileManifests repository and generates
NixOS module options that can be used to configure mobile profiles (`.mobileconfig`).
"""
from __future__ import annotations

import plistlib
import os
import re
import sys
from pathlib import Path
from typing import Any


def sanitize_nix_identifier(name: str) -> str:
    """Convert a plist key name to a valid Nix identifier."""
    # Replace invalid characters with underscores
    sanitized = re.sub(r'[^a-zA-Z0-9_]', '_', name)
    # Ensure it doesn't start with a digit
    if sanitized and sanitized[0].isdigit():
        sanitized = '_' + sanitized
    # Handle reserved words
    if sanitized in ('if', 'then', 'else', 'let', 'in', 'with', 'rec', 'inherit', 'or', 'and'):
        sanitized = sanitized + '_'
    return sanitized

def escape_nix_string(s: str) -> str:
    """Escape a string for use in a Nix multi-line string (''...'')."""
    # In Nix ''...'' strings:
    # - '' needs to become '''
    # - ${ needs to become ''${
    # - Single ' followed by anything other than ' is fine
    result = s.replace("''", "'''")
    result = result.replace("${", "''${")
    return result

def nix_value(value: Any) -> str:
    """Convert a Python value to a Nix literal."""
    if value is None:
        return 'null'
    elif isinstance(value, bool):
        return 'true' if value else 'false'
    elif isinstance(value, str):
        # Always use double-quoted strings for values, escape properly
        escaped = value.replace('\\', '\\\\').replace('"', '\\"').replace('\n', '\\n').replace('\t', '\\t').replace('${', '\\${')
        return f'"{escaped}"'
    elif isinstance(value, (int, float)):
        return str(value)
    elif isinstance(value, list):
        if not value:
            return '[ ]'
        items = ' '.join(nix_value(v) for v in value)
        return f'[ {items} ]'
    elif isinstance(value, dict):
        if not value:
            return '{ }'
        items = ' '.join(f'{sanitize_nix_identifier(k)} = {nix_value(v)};' for k, v in value.items())
        return f'{{ {items} }}'
    else:
        return 'null'


def pfm_type_to_nix_type(pfm_type: str, subkeys: list | None = None, range_list: list | None = None) -> str:
    """Convert a pfm_type to a NixOS option type."""
    type_mapping = {
        'string': 'types.str',
        'integer': 'types.int',
        'real': 'types.float',
        'boolean': 'types.bool',
        'date': 'types.str',  # Dates as ISO 8601 strings
        'data': 'types.str',  # Base64 encoded data
    }

    if pfm_type == 'array':
        if subkeys and len(subkeys) > 0:
            inner_type = convert_subkey_to_type(subkeys[0])
            return f'types.listOf ({inner_type})'
        return 'types.listOf types.anything'

    if pfm_type == 'dictionary':
        if subkeys:
            return 'types.submodule'  # Will be handled specially
        return 'types.attrsOf types.anything'

    if range_list:
        # Create an enum type
        if all(isinstance(v, str) for v in range_list):
            enum_values = ' '.join(f'"{v}"' for v in range_list)
            return f'types.enum [ {enum_values} ]'
        elif all(isinstance(v, int) for v in range_list):
            enum_values = ' '.join(str(v) for v in range_list)
            return f'types.enum [ {enum_values} ]'

    return type_mapping.get(pfm_type, 'types.anything')


def convert_subkey_to_type(subkey: dict) -> str:
    """Convert a subkey definition to a Nix type string."""
    pfm_type = subkey.get('pfm_type', 'string')
    subkeys = subkey.get('pfm_subkeys')
    range_list = subkey.get('pfm_range_list')

    return pfm_type_to_nix_type(pfm_type, subkeys, range_list)


def generate_option(subkey: dict, indent: int = 4, seen_names: set = None) -> str:
    """Generate a NixOS option definition from a pfm subkey."""
    if seen_names is None:
        seen_names = set()

    name = subkey.get('pfm_name', '')
    if not name:
        return ''

    # Skip Payload* keys (these are managed by the profile wrapper)
    if name.startswith('Payload'):
        return ''

    # Sanitize the name for Nix
    nix_name = sanitize_nix_identifier(name)

    # Skip duplicate names
    if nix_name in seen_names:
        return ''
    seen_names.add(nix_name)

    pfm_type = subkey.get('pfm_type', 'string')
    description = subkey.get('pfm_description', subkey.get('pfm_title', ''))
    default = subkey.get('pfm_default')
    required = subkey.get('pfm_require') == 'always'
    subkeys = subkey.get('pfm_subkeys')
    range_list = subkey.get('pfm_range_list')

    ind = ' ' * indent

    lines = []
    lines.append(f'{ind}{nix_name} = lib.mkOption {{')

    # Type - always use nullOr unless there's a default value
    # This allows users to only specify what they want
    nix_type = pfm_type_to_nix_type(pfm_type, subkeys, range_list)
    has_default = default is not None

    if pfm_type == 'dictionary' and subkeys:
        # Generate submodule with its own seen_names set
        sub_seen = set()
        lines.append(f'{ind}  type = types.nullOr (types.submodule {{')
        lines.append(f'{ind}    options = {{')
        for sk in subkeys:
            sub_option = generate_option(sk, indent + 6, sub_seen)
            if sub_option:
                lines.append(sub_option)
        lines.append(f'{ind}    }};')
        lines.append(f'{ind}  }});')
        lines.append(f'{ind}  default = null;')
    elif pfm_type == 'array' and subkeys and len(subkeys) > 0 and subkeys[0].get('pfm_type') == 'dictionary':
        # Array of submodules with its own seen_names set
        inner_subkeys = subkeys[0].get('pfm_subkeys', [])
        if inner_subkeys:
            sub_seen = set()
            lines.append(f'{ind}  type = types.nullOr (types.listOf (types.submodule {{')
            lines.append(f'{ind}    options = {{')
            for sk in inner_subkeys:
                sub_option = generate_option(sk, indent + 6, sub_seen)
                if sub_option:
                    lines.append(sub_option)
            lines.append(f'{ind}    }};')
            lines.append(f'{ind}  }}));')
        else:
            lines.append(f'{ind}  type = types.nullOr (types.listOf types.attrs);')
        lines.append(f'{ind}  default = null;')
    else:
        # For simple types, always use nullOr to make everything optional
        # Only set a real default if one was specified in the manifest
        lines.append(f'{ind}  type = types.nullOr ({nix_type});')
        if has_default:
            lines.append(f'{ind}  default = {nix_value(default)};')
        else:
            lines.append(f'{ind}  default = null;')

    # Description - use double-quoted string for safety
    if description:
        # Escape for double-quoted Nix string
        escaped_desc = description.replace('\\', '\\\\').replace('"', '\\"').replace('\n', '\\n').replace('${', '\\${')
        lines.append(f'{ind}  description = "{escaped_desc}";')

    lines.append(f'{ind}}};')

    return '\n'.join(lines)
def generate_nix_module(plist_path: Path, category: str = '') -> str:
    """Generate a complete NixOS module from a plist manifest without collisions."""
    with open(plist_path, 'rb') as f:
        manifest = plistlib.load(f)

    domain = manifest.get('pfm_domain', plist_path.stem)
    title = manifest.get('pfm_title', domain)
    description = manifest.get('pfm_description', '')
    subkeys = manifest.get('pfm_subkeys', [])
    platforms = manifest.get('pfm_platforms', [])

    # Filter out Payload* keys as they are standard profile keys
    config_subkeys = [sk for sk in subkeys if not sk.get('pfm_name', '').startswith('Payload')]

    # Use manifest file name for uniqueness, include category to avoid conflicts across directories
    manifest_base_name = plist_path.stem.replace('.', '-')
    if category:
        manifest_name = f"{category}-{manifest_base_name}"
    else:
        manifest_name = manifest_base_name

    lines = []
    lines.append(f'# Auto-generated from ProfileManifests: {plist_path.name}')
    lines.append(f'# Domain: {domain}')
    lines.append(f'# Title: {title}')
    if platforms:
        lines.append(f'# Platforms: {", ".join(platforms)}')
    lines.append('')
    lines.append('{ lib, ... }:')
    lines.append('')
    lines.append('with lib;')
    lines.append('')
    lines.append('{')
    # Use manifest_name as the key to ensure uniqueness (multiple manifests can share the same domain)
    lines.append(f'  options.programs.macprofile.payloads."{manifest_name}" = {{')
    lines.append('    enable = lib.mkEnableOption "' + title.replace('"', '\\"') + '";')
    lines.append('')
    
    # Store the domain as an internal option for use when generating the mobileconfig
    # This is needed because PayloadType must be the domain, not the manifest name
    lines.append('    _domain = lib.mkOption {')
    lines.append('      internal = true;')
    lines.append('      type = lib.types.str;')
    lines.append(f'      default = "{domain}";')
    lines.append('      description = "The payload domain (PayloadType) for this manifest.";')
    lines.append('    };')
    lines.append('')

    # Track seen names to avoid duplicates in this manifest
    seen_names = set()

    # Generate options for each subkey
    for subkey in config_subkeys:
        option_str = generate_option(subkey, indent=4, seen_names=seen_names)
        if option_str:
            lines.append(option_str)
            lines.append('')

    # Close braces
    lines.append('  };')    # end manifest_name
    lines.append('}')

    return '\n'.join(lines)

def convert_manifest_directory(manifest_dir: Path, output_dir: Path, category: str = ''):
    """Convert all manifests in a directory to NixOS modules."""
    output_dir.mkdir(parents=True, exist_ok=True)

    plist_files = list(manifest_dir.glob('*.plist'))
    print(f"Found {len(plist_files)} manifest files in {manifest_dir}")

    for plist_path in plist_files:
        try:
            nix_content = generate_nix_module(plist_path, category)

            # Create output filename
            output_name = plist_path.stem.replace('.', '-') + '.nix'
            output_path = output_dir / output_name

            with open(output_path, 'w') as f:
                f.write(nix_content)

            print(f"  Generated: {output_path.name}")
        except Exception as e:
            print(f"  Error processing {plist_path.name}: {e}", file=sys.stderr)


def main():
    """Main entry point."""
    # Determine paths
    script_dir = Path(__file__).parent
    profile_manifests_dir = script_dir / 'ProfileManifests' / 'Manifests'
    output_base_dir = script_dir / 'nix-modules' / 'payloads'

    if not profile_manifests_dir.exists():
        print(f"Error: ProfileManifests directory not found at {profile_manifests_dir}")
        sys.exit(1)

    # Process each manifest category
    categories = [
        'ManifestsApple',
        'ManagedPreferencesApple',
        'ManagedPreferencesApplications',
        'ManagedPreferencesDeveloper',
    ]

    for category in categories:
        category_dir = profile_manifests_dir / category
        if category_dir.exists():
            print(f"\nProcessing {category}...")
            # Simplify output directory names
            category_name = category.lower()
            if category_name == 'manifestsapple':
                category_name = 'apple'
            elif category_name.startswith('managedpreferences'):
                category_name = 'managed-' + category_name[len('managedpreferences'):]
            output_dir = output_base_dir / category_name
            convert_manifest_directory(category_dir, output_dir, category_name)

    print(f"\nDone! NixOS modules written to {output_base_dir}")

    # Generate payload imports module
    generate_payload_imports(output_base_dir)


def generate_payload_imports(output_base_dir: Path):
    """Generate a module that imports all payload definitions."""
    lines = []
    lines.append('# Auto-generated: imports all payload option definitions')
    lines.append('{ lib, ... }:')
    lines.append('')
    lines.append('{')
    lines.append('  imports = [')

    for nix_file in sorted(output_base_dir.rglob('*.nix')):
        if nix_file.name not in ('default.nix', 'all-payloads.nix'):
            rel_path = nix_file.relative_to(output_base_dir)
            lines.append(f'    ./{rel_path}')

    lines.append('  ];')
    lines.append('}')

    imports_path = output_base_dir / 'all-payloads.nix'
    with open(imports_path, 'w') as f:
        f.write('\n'.join(lines))

    print(f"\nGenerated payload imports: {imports_path}")


if __name__ == '__main__':
    main()
