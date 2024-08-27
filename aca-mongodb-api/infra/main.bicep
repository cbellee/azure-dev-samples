param location string = 'australiaeast'
param apis array
param cosmosDbName string = 'flightDb'
param acrName string
param emailAddress string
param minReplicas int = 1
param maxReplicas int = 3

@allowed([
  'Developer'
  'Standard'
  'Basic'
  'Consumption'
  'Standardv2'
  'Premium'
])
param apimSku string = 'Consumption'

param cosmosDbOperatorRoleDefinitionId string = '230815da-be43-4aae-9cb4-875f7bd000aa'
param cosmosAccountContributorRoleDefinitionId string = '5bd9cd88-fe45-4216-938b-f97437e15450'

var suffix = uniqueString(resourceGroup().id)
var managedEnvironmentName = 'aca-env-${suffix}'
var umidName = 'umid-${suffix}'
var lawName = 'law-${suffix}'
var cosmosAccountName = 'cosmos-mongo-${suffix}'
var apimName = 'apim-dev-${suffix}'
var apimVipName = 'apim-vip-${suffix}'
var acrPullRoleId = '7f951dda-4ed3-4680-a7ca-43fe172d538d'

resource acr 'Microsoft.ContainerRegistry/registries@2023-11-01-preview' existing = {
  name: acrName
}

resource apim 'Microsoft.ApiManagement/service@2023-05-01-preview' = {
  name: apimName
  location: resourceGroup().location
  sku: {
    name: apimSku
    capacity: 0
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    publisherEmail: emailAddress
    publisherName: emailAddress
    virtualNetworkType: 'None'
    disableGateway: false
    apiVersionConstraint: {}
  }
}

resource apimVip 'Microsoft.Network/publicIPAddresses@2023-09-01' = {
  name: apimVipName
  location: resourceGroup().location
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  zones: [
    '1'
  ]
  properties: {
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    ipTags: []
    ddosSettings: {
      protectionMode: 'VirtualNetworkInherited'
    }
  }
}

resource managedEnvironment 'Microsoft.App/managedEnvironments@2023-11-02-preview' = {
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

resource umid 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-07-31-preview' = {
  name: umidName
  location: location
}

resource acrPullRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid('acrPullRoleAssignment', umid.name, acr.name, acrPullRoleId)
  scope: acr
  properties: {
    principalType: 'ServicePrincipal'
    principalId: umid.properties.principalId
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', acrPullRoleId)
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

resource containerApps 'Microsoft.App/containerapps@2023-11-02-preview' = [
  for (app, index) in apis: {
    name: app.name
    location: location
    identity: {
      type: 'UserAssigned'
      userAssignedIdentities: {
        '${umid.id}': {}
      }
    }
    properties: {
      managedEnvironmentId: managedEnvironment.id
      environmentId: managedEnvironment.id
      workloadProfileName: 'Consumption'
      configuration: {
        activeRevisionsMode: 'Single'
        ingress: {
          external: true
          targetPort: app.port
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
            image: app.image
            name: app.name
            env: [
              {
                name: 'PORT'
                value: string(app.port)
              }
              {
                name: 'AZURE_CLIENT_ID'
                value: umid.properties.clientId
              }
              {
                name: 'MONGO_DB_CXN'
                value: cosmosAccount.listConnectionStrings().connectionStrings[0].connectionString
              }
              {
                name: 'MONGO_DB_NAME'
                value: cosmosDbName
              }
              {
                name: 'MONGO_DB_COLLECTION'
                value: apis[index].name
              }
            ]
            resources: {
              cpu: '0.5'
              memory: '1Gi'
            }
          }
        ]
        scale: {
          minReplicas: minReplicas
          maxReplicas: maxReplicas
        }
      }
    }
  }
]

resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2024-02-15-preview' = {
  name: cosmosAccountName
  location: location
  kind: 'MongoDB'
  identity: {
    type: 'None'
  }
  properties: {
    capabilities: [
      {
        name: 'EnableMongo'
      }
      {
        name: 'EnableMongoRoleBasedAccessControl'
      }
    ]
    databaseAccountOfferType: 'Standard'
    enableFreeTier: true
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

resource mongoDb 'Microsoft.DocumentDB/databaseAccounts/mongodbDatabases@2024-02-15-preview' = {
  parent: cosmosAccount
  name: cosmosDbName
  properties: {
    resource: {
      id: cosmosDbName
      createMode: 'Default'
    }
  }
}

resource mongodDbCollections 'Microsoft.DocumentDB/databaseAccounts/mongodbDatabases/collections@2024-02-15-preview' = [
  for app in apis: {
    parent: mongoDb
    name: app.name
    properties: {
      resource: {
        id: app.name
        shardKey: {
          id: 'Hash'
        }
      }
    }
  }
]

resource cosmosDBRoleDefinition 'Microsoft.DocumentDB/databaseAccounts/mongodbRoleDefinitions@2024-02-15-preview' = {
  parent: cosmosAccount
  name: '${mongoDb.name}.apireadwrite'
  properties: {
    databaseName: mongoDb.name
    roleName: 'apireadwrite'
    roles: []
    privileges: [
      for app in apis: {
        resource: {
          db: mongoDb.name
          collection: app.name
        }
        actions: [
          'find'
          'insert'
          'update'
          'remove'
          'createIndex'
        ]
      }
    ]
  }
}

resource cosmosMgmtPlaneRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(cosmosDbOperatorRoleDefinitionId, cosmosAccount.name, mongoDb.name, umid.name)
  properties: {
    principalId: umid.properties.principalId
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', cosmosAccountContributorRoleDefinitionId)
    principalType: 'ServicePrincipal'
  }
}

output apimName string = apim.name
output appUrl string = managedEnvironment.properties.defaultDomain
output mongoDbAccountName string = cosmosAccount.name
output mongoDbCxn string = cosmosAccount.listConnectionStrings().connectionStrings[0].connectionString
output mongoDbName string = cosmosDbName
output apimBaseUrl string = apim.properties.gatewayUrl
