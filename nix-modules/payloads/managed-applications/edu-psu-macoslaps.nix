# Auto-generated from ProfileManifests: edu.psu.macoslaps.plist
# Domain: edu.psu.macoslaps
# Title: macOS LAPS
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "macOS LAPS";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "edu.psu.macoslaps";
        description = "The payload domain (PayloadType) for this manifest.";
      };

      _unique = lib.mkOption {
        internal = true;
        type = lib.types.bool;
        default = true;
        description = "Whether macOS allows only one instance of this payload per profile.";
      };

      _displayName = lib.mkOption {
        internal = true;
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "PayloadDisplayName for this instance. Defaults to the domain.";
      };

      _keyNames = lib.mkOption {
        internal = true;
        type = lib.types.listOf lib.types.str;
        default = [ "LocalAdminAccount" "DaysTillExpiration" "PasswordLength" "PasswordGrouping" "PasswordSeparator" "RemoveKeyChain" "RemovePassChars" "ExclusionSets" "Method" "PreferredDC" "FirstPass" "PasswordRequirements" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      LocalAdminAccount = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Local Admin Account Username";
      };

      DaysTillExpiration = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Days Till Password Expiration";
      };

      PasswordLength = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Password Length";
      };

      PasswordGrouping = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Password Grouping";
      };

      PasswordSeparator = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Password Separator";
      };

      RemoveKeyChain = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Remove Keychain";
      };

      RemovePassChars = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Password Characters to Exclude";
      };

      ExclusionSets = lib.mkOption {
        type = types.nullOr (types.listOf (types.enum [ "letters" "numbers" "symbols" ]));
        default = null;
        description = "Exclude any character set you'd like from the randomly generated password.";
      };

      Method = lib.mkOption {
        type = types.nullOr (types.enum [ "AD" "Local" ]);
        default = null;
      };

      PreferredDC = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Preferred Domain Controller";
      };

      FirstPass = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Use this key if your LAPS Admin is a FileVault user. The script will read this key in if there isn't a keyhcain entry in System keychain for macOSLAPS. Once this has been completed, the keychain entry will then be used.";
      };

      PasswordRequirements = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            Lowercase = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The minimum number of lowercase letters in a generated password.";
            };
            Uppercase = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The minimum number of uppercase letters in a generated password.";
            };
            Number = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The minimum number of numeric characters in a generated password.";
            };
            Symbol = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "The minimum number of non-alphanumeric characters in a generated password.";
            };
          };
        });
        default = null;
        description = "Specifies the password requirements.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-edu-psu-macoslaps" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "macOS LAPS (edu.psu.macoslaps) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}