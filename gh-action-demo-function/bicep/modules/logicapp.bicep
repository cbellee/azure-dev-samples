param workflows_aks_alert_demo_name string = 'aks-alert-demo'
param connections_azuremonitorlogs_externalid string = '/subscriptions/b2375b5f-8dab-4436-b87c-32bc7fdce5d0/resourceGroups/fta-aks-ops-rg/providers/Microsoft.Web/connections/azuremonitorlogs'
param connections_office365_externalid string = '/subscriptions/b2375b5f-8dab-4436-b87c-32bc7fdce5d0/resourceGroups/fta-aks-ops-rg/providers/Microsoft.Web/connections/office365'
param location string
param emailAddress string

resource workflows_aks_alert_demo_name_resource 'Microsoft.Logic/workflows@2019-05-01' = {
  name: workflows_aks_alert_demo_name
  location: location
  properties: {
    state: 'Enabled'
    definition: {
      '$schema': 'https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#'
      contentVersion: '1.0.0.0'
      parameters: {
        '$connections': {
          defaultValue: {
          }
          type: 'Object'
        }
      }
      triggers: {
        manual: {
          type: 'Request'
          kind: 'Http'
          inputs: {
            schema: {
              properties: {
                body: {
                  properties: {
                    data: {
                      properties: {
                        alertContext: {
                          properties: {
                            condition: {
                              properties: {
                                allOf: {
                                  items: {
                                    properties: {
                                      dimensions: {
                                        items: {
                                          properties: {
                                            name: {
                                              type: 'string'
                                            }
                                            value: {
                                              type: 'string'
                                            }
                                          }
                                          required: [
                                            'name'
                                            'value'
                                          ]
                                          type: 'object'
                                        }
                                        type: 'array'
                                      }
                                      metricName: {
                                        type: 'string'
                                      }
                                      metricNamespace: {
                                        type: 'string'
                                      }
                                      metricValue: {
                                        type: 'integer'
                                      }
                                      operator: {
                                        type: 'string'
                                      }
                                      threshold: {
                                        type: 'string'
                                      }
                                      timeAggregation: {
                                        type: 'string'
                                      }
                                      webTestName: {
                                      }
                                    }
                                    required: [
                                      'metricName'
                                      'metricNamespace'
                                      'operator'
                                      'threshold'
                                      'timeAggregation'
                                      'dimensions'
                                      'metricValue'
                                      'webTestName'
                                    ]
                                    type: 'object'
                                  }
                                  type: 'array'
                                }
                                windowEndTime: {
                                  type: 'string'
                                }
                                windowSize: {
                                  type: 'string'
                                }
                                windowStartTime: {
                                  type: 'string'
                                }
                              }
                              type: 'object'
                            }
                            conditionType: {
                              type: 'string'
                            }
                            properties: {
                            }
                          }
                          type: 'object'
                        }
                        essentials: {
                          properties: {
                            alertContextVersion: {
                              type: 'string'
                            }
                            alertId: {
                              type: 'string'
                            }
                            alertRule: {
                              type: 'string'
                            }
                            alertTargetIDs: {
                              items: {
                                type: 'string'
                              }
                              type: 'array'
                            }
                            configurationItems: {
                              items: {
                                type: 'string'
                              }
                              type: 'array'
                            }
                            description: {
                              type: 'string'
                            }
                            essentialsVersion: {
                              type: 'string'
                            }
                            firedDateTime: {
                              type: 'string'
                            }
                            monitorCondition: {
                              type: 'string'
                            }
                            monitoringService: {
                              type: 'string'
                            }
                            originAlertId: {
                              type: 'string'
                            }
                            resolvedDateTime: {
                              type: 'string'
                            }
                            severity: {
                              type: 'string'
                            }
                            signalType: {
                              type: 'string'
                            }
                          }
                          type: 'object'
                        }
                      }
                      type: 'object'
                    }
                    schemaId: {
                      type: 'string'
                    }
                  }
                  type: 'object'
                }
                headers: {
                  properties: {
                    Connection: {
                      type: 'string'
                    }
                    'Content-Length': {
                      type: 'string'
                    }
                    'Content-Type': {
                      type: 'string'
                    }
                    Expect: {
                      type: 'string'
                    }
                    Host: {
                      type: 'string'
                    }
                    'User-Agent': {
                      type: 'string'
                    }
                    'X-CorrelationContext': {
                      type: 'string'
                    }
                  }
                  type: 'object'
                }
              }
              type: 'object'
            }
          }
        }
      }
      actions: {
        Run_query_and_list_results: {
          runAfter: {
          }
          type: 'ApiConnection'
          inputs: {
            body: 'KubeEvents | sort by TimeGenerated desc'
            host: {
              connection: {
                name: '@parameters(\'$connections\')[\'azuremonitorlogs\'][\'connectionId\']'
              }
            }
            method: 'post'
            path: '/queryData'
            queries: {
              resourcegroups: 'fta-aks-ops-rg'
              resourcename: 'fta-aks-ops-wks-3u5rnt64xzuze'
              resourcetype: 'Log Analytics Workspace'
              subscriptions: 'b2375b5f-8dab-4436-b87c-32bc7fdce5d0'
              timerange: 'Last hour'
            }
          }
        }
        'Send_an_email_(V2)': {
          runAfter: {
            Run_query_and_list_results: [
              'Succeeded'
            ]
          }
          type: 'ApiConnection'
          inputs: {
            body: {
              Body: '<p>Response Body: @{body(\'Run_query_and_list_results\')}</p>'
              Importance: 'Normal'
              Subject: 'Alert fired!'
              To: emailAddress
            }
            host: {
              connection: {
                name: '@parameters(\'$connections\')[\'office365\'][\'connectionId\']'
              }
            }
            method: 'post'
            path: '/v2/Mail'
          }
        }
      }
      outputs: {
      }
    }
    parameters: {
      '$connections': {
        value: {
          azuremonitorlogs: {
            connectionId: connections_azuremonitorlogs_externalid
            connectionName: 'azuremonitorlogs'
            id: '/subscriptions/b2375b5f-8dab-4436-b87c-32bc7fdce5d0/providers/Microsoft.Web/locations/australiaeast/managedApis/azuremonitorlogs'
          }
          office365: {
            connectionId: connections_office365_externalid
            connectionName: 'office365'
            id: '/subscriptions/b2375b5f-8dab-4436-b87c-32bc7fdce5d0/providers/Microsoft.Web/locations/australiaeast/managedApis/office365'
          }
        }
      }
    }
  }
}
