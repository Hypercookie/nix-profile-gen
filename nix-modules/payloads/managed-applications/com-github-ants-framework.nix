# Auto-generated from ProfileManifests: com.github.ants-framework.plist
# Domain: com.github.ants-framework
# Title: ANTS Framework
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-github-ants-framework" = {
    enable = lib.mkEnableOption "ANTS Framework";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.github.ants-framework";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    main = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          git_repository = lib.mkOption {
            type = types.nullOr (types.str);
            default = "https://github.com/ANTS-Framework/playbook.git";
            description = "URL of the repository that contains your Ansible playbooks.";
          };
          branch = lib.mkOption {
            type = types.nullOr (types.str);
            default = "master";
            description = "Git branch to check out from your Git repository.";
          };
          ssh_key = lib.mkOption {
            type = types.nullOr (types.str);
            default = "/etc/ants/id_ants";
            description = "Absolute path to a SSH key with permission to access your Git repository.";
          };
          destination = lib.mkOption {
            type = types.nullOr (types.str);
            default = "~root/.ants_playbook";
            description = "Absolute path on the local machine to check out your Git repository.";
          };
          inventory_script = lib.mkOption {
            type = types.nullOr (types.str);
            default = "inventory_default";
            description = "Relative or absolute path to an ansible inventory script.";
          };
          wait_interval = lib.mkOption {
            type = types.nullOr (types.int);
            default = 900;
            description = "The number of seconds to wait in between ansible-pull runs.";
          };
          ansible_playbook = lib.mkOption {
            type = types.nullOr (types.str);
            default = "main.yml";
            description = "File name of the primary Ansible playbook to run relative to your <Destination> directory.";
          };
          log_dir = lib.mkOption {
            type = types.nullOr (types.str);
            default = "/var/log/ants";
            description = "Absolute path of where to store log files from runs.";
          };
          ssh_stricthostkeychecking = lib.mkOption {
            type = types.nullOr (types.bool);
            default = false;
            description = "Whether or not to use strict host key checking when running Git commands.";
          };
          ansible_pull_exe = lib.mkOption {
            type = types.nullOr (types.str);
            default = "";
            description = "Absolute path to a different ansible-pull binary installed on the local machine.";
          };
          tags = lib.mkOption {
            type = types.nullOr (types.str);
            default = "";
            description = "Limit the Ansible playbook run to a comma separated list of tags.";
          };
          skip_tags = lib.mkOption {
            type = types.nullOr (types.str);
            default = "";
            description = "Run the Ansible playbook on all tags except the provided comma separated list.";
          };
        };
      });
      default = null;
      description = "General";
    };

    ad = lib.mkOption {
      type = types.nullOr (types.submodule {
        options = {
          ldap_user = lib.mkOption {
            type = types.nullOr (types.str);
            default = "ldap\\changeme";
            description = "User name to use to connect to LDAP.";
          };
          ldap_pw = lib.mkOption {
            type = types.nullOr (types.str);
            default = "changeme";
            description = "Password to use to connect to LDAP.";
          };
          ldap_host = lib.mkOption {
            type = types.nullOr (types.str);
            default = "LDAP.PRETENDCORP.COM";
            description = "LDAP server to connect to for inventory purposes.";
          };
          ldap_ou_computers = lib.mkOption {
            type = types.nullOr (types.str);
            default = "DC=ldap,DC=pretendcorp,DC=com";
            description = "LDAP location of computer objects.";
          };
          ldap_ou_groups = lib.mkOption {
            type = types.nullOr (types.str);
            default = "OU=ants,OU=Groups,DC=ldap,DC=pretendcorp,DC=com";
            description = "LDAP location of group objects.";
          };
          cache_file = lib.mkOption {
            type = types.nullOr (types.str);
            default = "/etc/ants/inventory_cache.json";
            description = "Absolute path to a cache file of Active Directory results.";
          };
          group_prefix = lib.mkOption {
            type = types.nullOr (types.str);
            default = "ants-";
            description = "Group prefix used to filter groups from Active Directory.";
          };
          common_group = lib.mkOption {
            type = types.nullOr (types.str);
            default = "ants-common";
            description = "A common group to put all computers in.";
          };
          common_ad_connected = lib.mkOption {
            type = types.nullOr (types.str);
            default = "common_ad_connected";
            description = "A common group that computers are put in when the inventory script actively connects to Active Directory.";
          };
        };
      });
      default = null;
      description = "Active Directory";
    };

  };
}