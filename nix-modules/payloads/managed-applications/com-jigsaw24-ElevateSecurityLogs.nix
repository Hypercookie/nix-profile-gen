# Auto-generated from ProfileManifests: com.jigsaw24.ElevateSecurityLogs.plist
# Domain: com.jigsaw24.Elevate24SecurityExtension
# Title: Elevate24 Security Logging
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Elevate24 Security Logging";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.jigsaw24.Elevate24SecurityExtension";
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
        default = [ "PFC_SegmentedControl_0" "siemUploadURL" "siemUploadHeaders" "siemNewLineSeperated" "SentinelTennantId" "SentinelClientId" "SentinelClientSecret" "SentinelUploadURL" "MaxDataUploadSize" "DefaultFilterRules" "SelfProtectionRules" "DisableAll" "UploadEventsToJigsaw" "UploadOnHotspot" "HideBlockedEventHistory" "FileOperationRules" "ExecuteProcessRules" "logAllEventTypes" "EventsToLog" "filterRules" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      PFC_SegmentedControl_0 = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
      };

      siemUploadURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Events will be uploaded to the supplied url via HTTP POST. Note that events can be uploaded to the supplied URL or to sentinel not both.";
      };

      siemUploadHeaders = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            Header = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Header";
            };
            Value = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Value";
            };
          };
        }));
        default = null;
        description = "Headers to be included in the HTTP request.";
      };

      siemNewLineSeperated = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "By default events are uploaded in JSON format as an array of events. Some systems require events to be seperated with a new line.";
      };

      SentinelTennantId = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Tennant ID";
      };

      SentinelClientId = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Client ID";
      };

      SentinelClientSecret = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "Client Secret";
      };

      SentinelUploadURL = lib.mkOption {
        type = types.nullOr (types.str);
        default = null;
        description = "URL to upload events to Microsoft Sentinel";
      };

      MaxDataUploadSize = lib.mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "Max size of single HTTP request uploading data. (Uncompressed size in bytes default size is 1,000,000 bytes)";
      };

      DefaultFilterRules = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Deploys default rules to discard some events which can be considered noise.";
      };

      SelfProtectionRules = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Deploys authorisation rules to attempt to stop the user making changes to Elevate24 database.";
      };

      DisableAll = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Stops all blocking/logging operations. Effectively a switch to disable this tool.";
      };

      UploadEventsToJigsaw = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Enable the security monitoring to be sent to the Jigsaw24 Portal.";
      };

      UploadOnHotspot = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Upload Events when connected to iPhone personal hotspot.";
      };

      HideBlockedEventHistory = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "When enabled, hides the blocked events history from the Elevate24 UI.";
      };

      FileOperationRules = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            fileOperation = lib.mkOption {
              type = types.nullOr (types.enum [ "file:open" "file:unlink" ]);
              default = null;
              description = "File Operation";
            };
            action = lib.mkOption {
              type = types.nullOr (types.enum [ "allow" "block" "readOnly" ]);
              default = null;
              description = "Action";
            };
            fileTargetPath = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "File Target Path";
            };
            signingID = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Signing ID";
            };
            username = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Username";
            };
            alwaysActive = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Always Active";
            };
          };
        }));
        default = null;
        description = "Rules to restrict file operations. Allow rules can be used in conjunction with block rules to allow a process to execute under the specified conditions.\n			\nFile open operations can be restricted to read only access where required.";
      };

      ExecuteProcessRules = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            action = lib.mkOption {
              type = types.nullOr (types.enum [ "allow" "block" ]);
              default = null;
              description = "Action";
            };
            processPath = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Process Path";
            };
            signingID = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Signing ID";
            };
            sourceSigningID = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Parent Signing ID";
            };
            matchingArgumentsContaining = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Match Arguments Containing";
            };
            alwaysActive = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Always Active";
            };
            silentBlock = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Silent Block";
            };
          };
        }));
        default = null;
        description = "Rules to restrict execution of processes. Allow rules can be used in conjunction with block rules to allow a process to execute under the specified conditions.\n			\nMultiple arguments can be specified by seperating them with a comma.";
      };

      logAllEventTypes = lib.mkOption {
        type = types.nullOr (types.bool);
        default = null;
        description = "Set all event types to be logged. Use with caution, as this could produce a lot of data entries.";
      };

      EventsToLog = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            eventType = lib.mkOption {
              type = types.nullOr (types.enum [ "File:Write" "File:Unlink" "File:Clone" "File:CopyFile" "File:Create" "File:Rename" "User:Create" "User:Delete" "Profile:Add" "Profile:Remove" "LaunchItem:Add" "LaunchItem:Remove" "Sudo" "Process:Exec" ]);
              default = null;
              description = "Event Type";
            };
          };
        }));
        default = null;
        description = "Define which event types to log.";
      };

      filterRules = lib.mkOption {
        type = types.nullOr (types.listOf (types.submodule {
          options = {
            eventType = lib.mkOption {
              type = types.nullOr (types.enum [ "All" "File:Write" "File:Unlink" "File:Clone" "File:CopyFile" "File:Create" "File:Rename" "User:Create" "User:Delete" "Profile:Add" "Profile:Remove" "LaunchItem:Add" "LaunchItem:Remove" "Sudo" "Process:Exec" ]);
              default = null;
              description = "Event Type";
            };
            path = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "File Path";
            };
            signingId = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Signing ID";
            };
          };
        }));
        default = null;
        description = "Define rules to not store events matching the following rules.";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-jigsaw24-ElevateSecurityLogs" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Elevate24 Security Logging (com.jigsaw24.Elevate24SecurityExtension) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}