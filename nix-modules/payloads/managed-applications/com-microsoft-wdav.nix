# Auto-generated from ProfileManifests: com.microsoft.wdav.plist
# Domain: com.microsoft.wdav
# Title: Microsoft Defender for Endpoint
# Platforms: macOS
# Unique: yes

{ lib, ... }:

with lib;

let
  payloadModule = {
    options = {
      enable = lib.mkEnableOption "Microsoft Defender for Endpoint";

      _domain = lib.mkOption {
        internal = true;
        type = lib.types.str;
        default = "com.microsoft.wdav";
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
        default = [ "antivirusEngine" "cloudService" "userInterface" "edr" "tamperProtection" "deviceControl" "features" "networkProtection" "dlp" "scheduledScan" ];
        description = "Payload keys of this manifest, used to detect legacy flat syntax.";
      };

      antivirusEngine = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            behaviorMonitoring = lib.mkOption {
              type = types.nullOr (types.enum [ "disabled" "enabled" ]);
              default = null;
              description = "Determines whether behavior monitoring and blocking capability is enabled on the device or not.";
            };
            enforcementLevel = lib.mkOption {
              type = types.nullOr (types.enum [ "passive" "on_demand" "real_time" ]);
              default = null;
              description = "Enforcement level of antivirus engine. On-demand: Files are scanned only on demand; Passive: Same as on-demand, but also security intelligence updates are enabled, and the status menu icon is hidden; Real-time: Scan files as they are accessed.";
            };
            enableFileHashComputation = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Enables or disables file hash computation feature. When this feature is enabled Defender will compute hashes for files it scans. This will help in improving the accuracy of Custom Indicator matches. However, enabling EnableFileHashComputation may impact device performance.";
            };
            scanAfterDefinitionUpdate = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Specifies whether to start a process scan after new security intelligence updates are downloaded on the device. Enabling this setting will trigger an antivirus scan on the running processes of the device.";
            };
            scanArchives = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "If true, Defender will unpack archives and scan files inside them. Otherwise archive content will be skipped, that will improve scanning performance.";
            };
            maximumOnDemandScanThreads = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "Specifies the degree of parallelism for on-demand scans. This corresponds to the number of threads used to perform the scan and impacts the CPU usage, as well as the duration of the on-demand scan.";
            };
            exclusionsMergePolicy = lib.mkOption {
              type = types.nullOr (types.enum [ "merge" "admin_only" ]);
              default = null;
              description = "Specify the merge policy for exclusions. This can be a combination of administrator-defined and user-defined exclusions (merge) or only administrator-defined exclusions (admin_only). This setting can be used to restrict local users from defining their own exclusions.";
            };
            exclusions = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  _type = lib.mkOption {
                    type = types.nullOr (types.enum [ "excludedPath" "excludedFileExtension" "excludedFileName" ]);
                    default = null;
                    description = "Specify content excluded from being scanned by type.";
                  };
                  path = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Path to exclude, wildcards are supported";
                  };
                  isDirectory = lib.mkOption {
                    type = types.nullOr (types.bool);
                    default = null;
                    description = "Directory if selected, or file if not selected";
                  };
                  extension = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Specify content excluded from being scanned by file extension.";
                  };
                  name = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Process name, either or full path or file name, wildcards supported";
                  };
                };
              }));
              default = null;
              description = "Entities that have been excluded from the scan. Exclusions can be specified by full paths, extensions, or file names.";
            };
            allowedThreats = lib.mkOption {
              type = types.nullOr (types.listOf (types.str));
              default = null;
              description = "List of threats (identified by their name) that are not blocked by the product and are instead allowed to run.";
            };
            disallowedThreatActions = lib.mkOption {
              type = types.nullOr (types.listOf (types.enum [ "allow" "restore" ]));
              default = null;
              description = "Restricts the actions that the local user of a device can take when threats are detected. The actions included in this list are not displayed in the user interface. Use unique values.";
            };
            threatTypeSettings = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  key = lib.mkOption {
                    type = types.nullOr (types.enum [ "potentially_unwanted_application" "archive_bomb" ]);
                    default = null;
                    description = "Type of the threat for which the behavior is configured.";
                  };
                  value = lib.mkOption {
                    type = types.nullOr (types.enum [ "audit" "block" "off" ]);
                    default = null;
                    description = "Action to take when coming across a threat of the type specified in the preceding section.";
                  };
                };
              }));
              default = null;
              description = "The threatTypeSettings preference in the antivirus engine is used to control how certain threat types are handled by the product.";
            };
            threatTypeSettingsMergePolicy = lib.mkOption {
              type = types.nullOr (types.enum [ "merge" "admin_only" ]);
              default = null;
              description = "Specify the merge policy for threat type settings. This can be a combination of administrator-defined and user-defined settings (merge) or only administrator-defined settings (admin_only). This setting can be used to restrict local users from defining their own settings for different threat types.";
            };
            scanResultsRetentionDays = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "Specify the number of days that results are retained in the scan history on the device. Old scan results are removed from the history. Old quarantined files that are also removed from the disk.";
            };
            scanHistoryMaximumItems = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "Specify the maximum number of entries to keep in the scan history. Entries include all on-demand scans performed in the past and all antivirus detections.";
            };
            enableRealTimeProtection = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Locates and stops malware from installing or running on your device. You can turn off this setting for a short time before it turns back on automatically.";
            };
            passiveMode = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Whether the antivirus engine runs in passive mode or not.";
            };
          };
        });
        default = null;
        description = "Manages the preferences of the antivirus component of Microsoft Defender for Endpoint.";
      };

      cloudService = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            enabled = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Provides increased, faster protection with access to the latest protection data in the cloud. Works best with automatic sample submission turned on";
            };
            diagnosticLevel = lib.mkOption {
              type = types.nullOr (types.enum [ "optional" "required" ]);
              default = null;
              description = "We encourage you to share your diagnostic and usage data with us to help improve Microsoft products and services.";
            };
            cloudBlockLevel = lib.mkOption {
              type = types.nullOr (types.enum [ "normal" "moderate" "high" "high_plus" "zero_tolerance" ]);
              default = null;
              description = "Determines how aggressive Defender for Endpoint will be in blocking and scanning suspicious files.";
            };
            automaticSampleSubmission = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Determines whether suspicious samples are sent to Microsoft.";
            };
            automaticDefinitionUpdateEnabled = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Determines whether security intelligence updates are installed automatically:";
            };
            automaticSampleSubmissionConsent = lib.mkOption {
              type = types.nullOr (types.enum [ "none" "safe" "all" ]);
              default = null;
              description = "Sends sample files to Microsoft to help protect device users and your organization from potential threats";
            };
          };
        });
        default = null;
        description = "Configure the cloud-driven protection features of Microsoft Defender for Endpoint.";
      };

      userInterface = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            hideStatusMenuIcon = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Whether the status menu icon (shown in the top-right corner of the screen) is hidden or not.";
            };
            userInitiatedFeedback = lib.mkOption {
              type = types.nullOr (types.enum [ "enabled" "disabled" ]);
              default = null;
              description = "Specify whether users can submit feedback to Microsoft by going to Help > Send Feedback.";
            };
            consumerExperience = lib.mkOption {
              type = types.nullOr (types.enum [ "enabled" "disabled" ]);
              default = null;
              description = "Specify whether users can sign into the consumer version of Microsoft Defender";
            };
          };
        });
        default = null;
        description = "Manage the preferences for the user interface.";
      };

      edr = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            tags = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  key = lib.mkOption {
                    type = types.nullOr (types.enum [ "GROUP" ]);
                    default = null;
                    description = "Specifies the type of tag";
                  };
                  value = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Specifies the value of tag";
                  };
                };
              }));
              default = null;
              description = "Device tags";
            };
            groupIds = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
            };
          };
        });
        default = null;
        description = "Manage the preferences of the endpoint detection and response (EDR) component.";
      };

      tamperProtection = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            enforcementLevel = lib.mkOption {
              type = types.nullOr (types.enum [ "disabled" "audit" "block" ]);
              default = null;
              description = "Specifies if tamper protection is disabled, in audit mode, or enforced";
            };
            exclusions = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  path = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Full and exact path to the process binary";
                  };
                  teamId = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Code signature TeamIdentifier";
                  };
                  signingId = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "Code signature Identifier";
                  };
                  args = lib.mkOption {
                    type = types.nullOr (types.listOf (types.str));
                    default = null;
                    description = "Command line arguments";
                  };
                };
              }));
              default = null;
              description = "Defines process that can interfere with Defender without considering it tampering";
            };
          };
        });
        default = null;
        description = "Tamper protection helps prevent unauthorized removal of Microsoft Defender for Endpoint.";
      };

      deviceControl = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            navigationTarget = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "Configure the URL that is opened when end users click the notification shown when a device control policy is enforced.";
            };
            removableMediaPolicy = lib.mkOption {
              type = types.nullOr (types.submodule {
                options = {
                  enforcementLevel = lib.mkOption {
                    type = types.nullOr (types.enum [ "audit" "block" ]);
                    default = null;
                    description = "Set the removable media enforcement level.";
                  };
                  permission = lib.mkOption {
                    type = types.nullOr (types.listOf (types.enum [ "none" "read" "write" "execute" ]));
                    default = null;
                    description = "The default permission level for devices that do not match anything else in the policy.";
                  };
                  vendors = lib.mkOption {
                    type = types.nullOr (types.submodule {
                      options = {
                        __key__ = lib.mkOption {
                          type = types.nullOr (types.str);
                          default = null;
                          description = "Vendor ID";
                        };
                        __value__ = lib.mkOption {
                          type = types.nullOr (types.submodule {
                            options = {
                              permission = lib.mkOption {
                                type = types.nullOr (types.listOf (types.enum [ "none" "read" "write" "execute" ]));
                                default = null;
                                description = "Permission level";
                              };
                              products = lib.mkOption {
                                type = types.nullOr (types.submodule {
                                  options = {
                                    __key__ = lib.mkOption {
                                      type = types.nullOr (types.str);
                                      default = null;
                                      description = "Product ID";
                                    };
                                    __value__ = lib.mkOption {
                                      type = types.nullOr (types.submodule {
                                        options = {
                                          permission = lib.mkOption {
                                            type = types.nullOr (types.listOf (types.enum [ "none" "read" "write" "execute" ]));
                                            default = null;
                                            description = "Permission level";
                                          };
                                          serialNumbers = lib.mkOption {
                                            type = types.nullOr (types.submodule {
                                              options = {
                                                __key__ = lib.mkOption {
                                                  type = types.nullOr (types.str);
                                                  default = null;
                                                  description = "Serial Number";
                                                };
                                                __value__ = lib.mkOption {
                                                  type = types.nullOr (types.listOf (types.enum [ "none" "read" "write" "execute" ]));
                                                  default = null;
                                                  description = "Serial Number Details";
                                                };
                                              };
                                            });
                                            default = null;
                                            description = "Serial Numbers";
                                          };
                                        };
                                      });
                                      default = null;
                                      description = "Product Details";
                                    };
                                  };
                                });
                                default = null;
                                description = "Products";
                              };
                            };
                          });
                          default = null;
                          description = "Vendor Details";
                        };
                      };
                    });
                    default = null;
                    description = "Restrict removable media by vendor.";
                  };
                };
              });
              default = null;
              description = "Restrict access to removable media.";
            };
            policy = lib.mkOption {
              type = types.nullOr (types.str);
              default = null;
              description = "JSON string representing the device control policy";
            };
          };
        });
        default = null;
        description = "Device control can be used to customize the URL target for notifications raised by device control, and allow or block removable devices.";
      };

      features = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            dataLossPrevention = lib.mkOption {
              type = types.nullOr (types.enum [ "enabled" "disabled" ]);
              default = null;
              description = "Whether data loss prevention enforcement is enabled on the machine.";
            };
            scheduledScan = lib.mkOption {
              type = types.nullOr (types.enum [ "enabled" "disabled" ]);
              default = null;
              description = "Schedule scans with Microsoft Defender for Endpoint.";
            };
          };
        });
        default = null;
        description = "Features";
      };

      networkProtection = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            enforcementLevel = lib.mkOption {
              type = types.nullOr (types.enum [ "disabled" "audit" "block" ]);
              default = null;
              description = "Specifies if network protection is disabled, in audit mode, or enforced";
            };
          };
        });
        default = null;
        description = "Network protection";
      };

      dlp = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            exclusions = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  signingId = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The signing id of the application to exclude from data loss prevention.";
                  };
                  flag = lib.mkOption {
                    type = types.nullOr (types.int);
                    default = null;
                    description = "Bit flags to control the type of exclusion(s) to apply.  EPS=0x1, AX=0x2.";
                  };
                };
              }));
              default = null;
              description = "Exclusions";
            };
            features = lib.mkOption {
              type = types.nullOr (types.listOf (types.submodule {
                options = {
                  name = lib.mkOption {
                    type = types.nullOr (types.str);
                    default = null;
                    description = "The name of a DLP feature to enable or disable.";
                  };
                  state = lib.mkOption {
                    type = types.nullOr (types.enum [ "enabled" "disabled" ]);
                    default = null;
                    description = "Enable a feature up to a deployment ring (default production), or force disable a feature for all rings.";
                  };
                  ring = lib.mkOption {
                    type = types.nullOr (types.enum [ "insiderFast" "external" "production" ]);
                    default = null;
                    description = "Limit enabling the feature to a specific deployment ring.";
                  };
                };
              }));
              default = null;
              description = "Features";
            };
          };
        });
        default = null;
        description = "Data Loss Prevention";
      };

      scheduledScan = lib.mkOption {
        type = types.nullOr (types.submodule {
          options = {
            checkForDefinitionsUpdate = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Check for definitions update before initiating a scheduled scan";
            };
            dailyConfiguration = lib.mkOption {
              type = types.nullOr (types.submodule {
                options = {
                  timeOfDay = lib.mkOption {
                    type = types.nullOr (types.int);
                    default = null;
                    description = "Specifies the time of day, as the number of minutes after midnight, to perform a daily quick scan.";
                  };
                  interval = lib.mkOption {
                    type = types.nullOr (types.int);
                    default = null;
                    description = "Specify how many hours should elapse before the next hourly quick scan. 0 indicates no hourly quick scan. 1 indicates a scan every hour. 24 indicates a scan once a day.";
                  };
                };
              });
              default = null;
              description = "Check for definitions update before initiating a scheduled scan";
            };
            ignoreExclusions = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Should exclusions be ignored during a scheduled scan";
            };
            lowPriorityScheduledScan = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Should scheduled scan be run with low priority. (Scan might take longer to complete).";
            };
            runScanWhenIdle = lib.mkOption {
              type = types.nullOr (types.bool);
              default = null;
              description = "Run scheduled scan when the device is idle. Only applicable for weekly full scans.";
            };
            weeklyConfiguration = lib.mkOption {
              type = types.nullOr (types.submodule {
                options = {
                  scanType = lib.mkOption {
                    type = types.nullOr (types.enum [ "quick" "full" ]);
                    default = null;
                    description = "Specifies the type of scan to perform.";
                  };
                  dayOfWeek = lib.mkOption {
                    type = types.nullOr (types.int);
                    default = null;
                    description = "Specifies the day of the week to perform a weekly scan. 0 indicates never. 1-7 indicates Sunday - Saturday. 8 indicates every day.";
                  };
                  timeOfDay = lib.mkOption {
                    type = types.nullOr (types.int);
                    default = null;
                    description = "Specifies the time of day, as the number of minutes after midnight, to perform a weekly scan.";
                  };
                };
              });
              default = null;
              description = "Should scheduled scan be run with low priority. (Scan might take longer to complete).";
            };
            randomizeScanStartTime = lib.mkOption {
              type = types.nullOr (types.int);
              default = null;
              description = "Randomize the start time of a daily and weekly scheduled scan to any interval from 0 to 23 hours.";
            };
          };
        });
        default = null;
        description = "Scheduled scan configuration";
      };

    };
  };
in
{
  options.programs.macprofile.payloads."managed-applications-com-microsoft-wdav" = lib.mkOption {
    type = types.attrsOf (types.submodule payloadModule);
    default = { };
    description = "Microsoft Defender for Endpoint (com.microsoft.wdav) payload instances, keyed by instance name. Use \"default\" if you only need one.";
  };
}