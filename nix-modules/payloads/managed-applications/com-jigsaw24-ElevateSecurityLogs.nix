# Auto-generated from ProfileManifests: com.jigsaw24.ElevateSecurityLogs.plist
# Domain: com.jigsaw24.Elevate24SecurityExtension
# Title: Elevate24 Security Logging
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-applications-com-jigsaw24-ElevateSecurityLogs" = {
    enable = lib.mkEnableOption "Elevate24 Security Logging";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.jigsaw24.Elevate24SecurityExtension";
      description = "The payload domain (PayloadType) for this manifest.";
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
      default = false;
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
      default = 1000000;
      description = "Max size of single HTTP request uploading data. (Uncompressed size in bytes default size is 1,000,000 bytes)";
    };

    DefaultFilterRules = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Deploys default rules to discard some events which can be considered noise.";
    };

    SelfProtectionRules = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Deploys authorisation rules to attempt to stop the user making changes to Elevate24 database.";
    };

    DisableAll = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Stops all blocking/logging operations. Effectively a switch to disable this tool.";
    };

    EnableArchive = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Enables the local retention of Events after they have been uploaded to Jigsaw24/SIEM.";
    };

    MaxArchiveAge = lib.mkOption {
      type = types.nullOr (types.int);
      default = 7;
      description = "Sets maximum age of events retained locally.";
    };

    UploadOnHotspot = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Upload Events when connected to iPhone personal hotspot.";
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
            default = "block";
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
            default = "block";
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
        };
      }));
      default = null;
      description = "Rules to restrict execution of processes. Allow rules can be used in conjunction with block rules to allow a process to execute under the specified conditions.\n			\nMultiple arguments can be specified by seperating them with a comma.";
    };

    logAllEventTypes = lib.mkOption {
      type = types.nullOr (types.bool);
      default = false;
      description = "Set all event types to be logged. Use with caution, as this could produce a lot of data entries.";
    };

    EventsToLog = lib.mkOption {
      type = types.nullOr (types.listOf (types.submodule {
        options = {
          eventType = lib.mkOption {
            type = types.nullOr (types.enum [ "File:Write" "File:Unlink" "File:Clone" "File:CopyFile" "File:Create" "File:Rename" "User:Create" "User:Delete" "Profile:Add" "Profile:Remove" "LaunchItem:Add" "LaunchItem:Remove" "Sudo" "Process:Exec" ]);
            default = "All";
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
}