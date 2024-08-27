param location string = 'australiaeast'
param imageName string
param cosmosDbName string = 'todoDb'
param targetPort int = 80
param partitionKey string = '/id'
param acrName string
param maxThroughput int = 4000
param emailAddress string

@allowed([
  '00000000-0000-0000-0000-000000000001' // Built-in role 'Azure Cosmos DB Built-in Data Reader'
  '00000000-0000-0000-0000-000000000002' // Built-in role 'Azure Cosmos DB Built-in Data Contributor'
])
param cosmosDataPlaneRoleDefinitionId string = '00000000-0000-0000-0000-000000000002'

param cosmosDbOperatorRoleDefinitionId string = '230815da-be43-4aae-9cb4-875f7bd000aa'
param cosmosAccountContributorRoleDefinitionId string = '5bd9cd88-fe45-4216-938b-f97437e15450'

var suffix = uniqueString(resourceGroup().id)
var managedEnvironmentName = 'aca-env-${suffix}'
var umidName = 'umid-${suffix}'
var lawName = 'law-${suffix}'
var appName = 'todo-app-${suffix}'
var aiName = 'ai-${suffix}'
var cosmosAccountName = 'cosmos-${suffix}'
var acrPullRoleId = '7f951dda-4ed3-4680-a7ca-43fe172d538d'
var cosmosRoleId = '5bd9cd88-fe45-4216-938b-f97437e15450'

resource acr 'Microsoft.ContainerRegistry/registries@2023-11-01-preview' existing = {
  name: acrName
}

resource mmanagedEnvironment 'Microsoft.App/managedEnvironments@2023-11-02-preview' = {
  name: managedEnvironmentName
  location: location
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: law.properties.customerId
        sharedKey: law.listKeys().primarySharedKey
      }
    }
    zoneRedundant: false
    kedaConfiguration: {}
    daprConfiguration: {}
    customDomainConfiguration: {}
    workloadProfiles: [
      {
        workloadProfileType: 'Consumption'
        name: 'Consumption'
      }
    ]
    peerAuthentication: {
      mtls: {
        enabled: false
      }
    }
  }
}

resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2024-02-15-preview' = {
  name: cosmosAccountName
  location: location
  kind: 'GlobalDocumentDB'
  identity: {
    type: 'None'
  }
  properties: {
    databaseAccountOfferType: 'Standard'
    publicNetworkAccess: 'Enabled'
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
      maxIntervalInSeconds: 5
      maxStalenessPrefix: 100
    }
    locations: [
      {
        locationName: location
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
  }
}

resource umid 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-07-31-preview' = {
  name: umidName
  location: location
}

resource acrPullRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid('acrPullRoleAssignment', umid.name, acr.name)
  scope: acr
  properties: {
    principalType: 'ServicePrincipal'
    principalId: umid.properties.principalId
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', acrPullRoleId)
  }
}

resource cosmosRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid('cosmosRoleAssignment', umid.name, cosmosAccount.name)
  scope: cosmosAccount
  properties: {
    principalType: 'ServicePrincipal'
    principalId: umid.properties.principalId
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', cosmosRoleId)
  }
}

resource law 'Microsoft.OperationalInsights/workspaces@2021-12-01-preview' = {
  name: lawName
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
  }
}

resource todoDb 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2024-02-15-preview' = {
  parent: cosmosAccount
  name: cosmosDbName
  properties: {
    resource: {
      id: cosmosDbName
    }
  }
}

resource appInsights 'microsoft.insights/components@2020-02-02' = {
  name: aiName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Bluefield'
    Request_Source: 'rest'
    RetentionInDays: 90
    WorkspaceResourceId: law.id
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource containerApp 'Microsoft.App/containerapps@2023-11-02-preview' = {
  name: appName
  location: location
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${umid.id}': {}
    }
  }
  properties: {
    managedEnvironmentId: mmanagedEnvironment.id
    environmentId: mmanagedEnvironment.id
    workloadProfileName: 'Consumption'
    configuration: {
      secrets: [
        {
          name: 'ai-instrumentation-key'
          value: appInsights.properties.InstrumentationKey
        }
        {
          name: 'azure-client-id'
          value: umid.properties.clientId
        }
      ]
      activeRevisionsMode: 'Single'
      ingress: {
        external: true
        targetPort: targetPort
        exposedPort: 0
        transport: 'Auto'
        traffic: [
          {
            weight: 100
            latestRevision: true
          }
        ]
        allowInsecure: false
      }
      registries: [
        {
          server: '${acr.name}.azurecr.io'
          identity: umid.id
        }
      ]
      maxInactiveRevisions: 100
    }
    template: {
      containers: [
        {
          image: imageName
          name: 'todo'
          env: [
            {
              name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
              secretRef: 'ai-instrumentation-key'
              // value: appInsights.properties.ConnectionString
            }
            {
              name: 'AZURE_CLIENT_ID'
              secretRef: 'azure-client-id'
              // value: umid.properties.clientId
            }
          ]
          resources: {
            cpu: '0.5'
            memory: '1Gi'
          }
        }
      ]
      scale: {
        maxReplicas: 5
      }
    }
  }
}

resource container 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2024-02-15-preview' = {
  parent: todoDb
  name: 'todoItems'
  properties: {
    resource: {
      id: 'todoItems'
      indexingPolicy: {
        indexingMode: 'consistent'
        automatic: true
        includedPaths: [
          {
            path: '/*'
          }
        ]
        excludedPaths: [
          {
            path: '/"_etag"/?'
          }
        ]
      }
      partitionKey: {
        paths: [
          partitionKey
        ]
        kind: 'Hash'
      }
      uniqueKeyPolicy: {
        uniqueKeys: []
      }
      conflictResolutionPolicy: {
        mode: 'LastWriterWins'
        conflictResolutionPath: '/_ts'
      }
      computedProperties: []
    }
  }
}

resource containerThroughput 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/throughputSettings@2024-02-15-preview' = {
  parent: container
  name: 'default'
  properties: {
    resource: {
      throughput: 400
      autoscaleSettings: {
        maxThroughput: maxThroughput
      }
    }
  }
}

resource sqlRoledefinition 'Microsoft.DocumentDB/databaseAccounts/sqlRoleDefinitions@2023-04-15' existing = {
  parent: cosmosAccount
  name: cosmosDataPlaneRoleDefinitionId
}

resource cosmosDBRoleAssignment 'Microsoft.DocumentDB/databaseAccounts/sqlRoleAssignments@2024-02-15-preview' = {
  name: guid('cosmosDBRoleAssignment', cosmosAccount.name, cosmosDbName)
  parent: cosmosAccount
  properties: {
    principalId: umid.properties.principalId
    roleDefinitionId: sqlRoledefinition.id
    scope: cosmosAccount.id
  }
}

resource cosmosMgmtPlaneRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(cosmosDbOperatorRoleDefinitionId, cosmosAccount.name, cosmosDbName)
  properties: {
    principalId: umid.properties.principalId
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', cosmosAccountContributorRoleDefinitionId)
    principalType: 'ServicePrincipal'
  }
}

resource send_email 'microsoft.insights/actionGroups@2023-01-01' = {
  name: 'send_email'
  location: 'Global'
  properties: {
    groupShortName: 'Send Email'
    enabled: true
    emailReceivers: [
      {
        name: 'email_me'
        emailAddress: emailAddress
        useCommonAlertSchema: true
      }
    ]
    smsReceivers: []
    webhookReceivers: []
    eventHubReceivers: []
    itsmReceivers: []
    azureAppPushReceivers: []
    automationRunbookReceivers: []
    voiceReceivers: []
    logicAppReceivers: []
    azureFunctionReceivers: []
    armRoleReceivers: []
  }
}

resource failed_requests_rule 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: 'failed requests rule'
  location: 'global'
  properties: {
    description: 'My Failed requests rule'
    severity: 3
    enabled: true
    scopes: [
      appInsights.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      allOf: [
        {
          threshold: 0
          name: 'Metric1'
          metricNamespace: 'microsoft.insights/components'
          metricName: 'requests/failed'
          operator: 'GreaterThan'
          timeAggregation: 'Count'
          skipMetricValidation: false
          criterionType: 'StaticThresholdCriterion'
        }
      ]
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    }
    autoMitigate: true
    targetResourceType: 'microsoft.insights/components'
    targetResourceRegion: location
    actions: [
      {
        actionGroupId: send_email.id
        webHookProperties: {
          'This is a custom property...': 'this is a custom value..'
        }
      }
    ]
  }
}

output appFqdn string = containerApp.properties.configuration.ingress.fqdn
