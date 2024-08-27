param location string
param appName string
param environment string
param isLinuxPlan bool = false
param runtimeVersion string = 'Dotnet'
param apiUrl string
param apiKey string
param isDeployVnet bool = false
param tags object = {
  environment: environment
  costCenter: '1234567890'
}
param functionKind string = 'functionapp'
param sku object = {
  name: 'Y1'
  tier: 'Dynamic'
}

var suffix = uniqueString(resourceGroup().id)
var vnetName = 'vnet-${suffix}'
var funcAppName = '${environment}-${appName}-${suffix}'
var funcStorageAccountName = 'stor${suffix}'
var dataStorageAccountName = 'data${suffix}'
var hostingPlanName = 'asp-${suffix}'
var appInsightsName = 'ai-${suffix}'
var keyVaultName = 'kv-${suffix}'
var userManagedIdentityName = 'umid-${suffix}'
var fileShareName = 'myshare'
var keyVaultSecretsUserRoleId = resourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')

resource userManagedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2022-01-31-preview' = {
  name: userManagedIdentityName
  tags: tags
  location: location
}

resource appInsights 'Microsoft.Insights/components@2020-02-02-preview' = {
  name: appInsightsName
  kind: 'web'
  location: location
  tags: tags
  properties: {
    Application_Type: 'web'
  }
}

resource dataStorageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  kind: 'StorageV2'
  location: location
  name: dataStorageAccountName
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    allowBlobPublicAccess: false
    supportsHttpsTrafficOnly: true
  }
}

resource dataStorageAccountBlobService 'Microsoft.Storage/storageAccounts/blobServices@2023-01-01' = {
  parent: dataStorageAccount
  name: 'default'
}

resource dataStorageAccountContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  parent: dataStorageAccountBlobService
  name: 'data'
}

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: keyVaultName
  location: location
  tags: tags
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    enableSoftDelete: true
    enableRbacAuthorization: true
    tenantId: tenant().tenantId
  }
}

module keyVaultSecretsUserRoleAssignment 'modules/role_assignment.bicep' = {
  name: 'key-vault-secrets-user-role-assignment'
  params: {
    keyVaultName: keyVaultName
    objectId: userManagedIdentity.properties.principalId
    roleDefinitionId: keyVaultSecretsUserRoleId
  }
  dependsOn: [
    keyVault
  ]
}

resource apiUrlSecret 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  parent: keyVault
  name: 'api-url'
  properties: {
    value: apiUrl
  }
}

resource apiKeySecret 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  parent: keyVault
  name: 'api-key'
  properties: {
    value: apiKey
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = if (isDeployVnet) {
  name: vnetName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'vnetIntegrationSubnet'
        properties: {
          addressPrefix: '10.0.0.0/24'
          delegations: [
            {
              name: 'appSvcDelegation'
              properties: {
                serviceName: 'Microsoft.Web/serverFarms'
              }
            }
          ]
        }
      }
      {
        name: 'privateEndpointSubnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
  }
}

module logicApp 'modules/logicapp.bicep' = {
  name: 'logicAppDeploy'
  params: {
    location: location
    emailAddress: 'cbellee@microsoft.com'
  }
}

resource funcStorageAccount 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: funcStorageAccountName
  kind: 'StorageV2'
  location: location
  tags: tags
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    allowBlobPublicAccess: false
    supportsHttpsTrafficOnly: true
  }
}

resource funcStorageAccountFileService 'Microsoft.Storage/storageAccounts/fileServices@2022-05-01' = {
  parent: funcStorageAccount
  name: 'default'
}

resource funcStorageAccountFileShare 'Microsoft.Storage/storageAccounts/fileServices/shares@2022-05-01' = {
  parent: funcStorageAccountFileService
  name: fileShareName
}

resource hostingPlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: hostingPlanName
  location: location
  tags: tags
  sku: sku
  kind: functionKind
  properties: {
    reserved: isLinuxPlan ? true : false
  }
}

resource funcApp 'Microsoft.Web/sites@2021-01-01' = {
  name: funcAppName
  tags: tags
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${userManagedIdentity.id}': {}
    }
  }
  kind: 'functionapp,linux,container'
  location: location
  properties: {
    keyVaultReferenceIdentity: userManagedIdentity.id
    reserved: isLinuxPlan ? true : false
    containerSize: 1536
    siteConfig: {
      ftpsState: 'Disabled'
      minTlsVersion: '1.2'
      detailedErrorLoggingEnabled: true
      httpLoggingEnabled: true
      vnetRouteAllEnabled: isDeployVnet ? true : false
      keyVaultReferenceIdentity: userManagedIdentity.id
      use32BitWorkerProcess: false
    }
    serverFarmId: hostingPlan.id
    clientAffinityEnabled: false
  }
  dependsOn: [
    appInsights
  ]
}

resource webConfig 'Microsoft.Web/sites/config@2022-03-01' = {
  name: 'web'
  parent: funcApp
  properties: {
    appSettings: [
      {
        name: 'WEBSITE_DNS_SERVER'
        value: '168.63.129.16'
      }
      {
        name: 'WEBSITE_CONTENTOVERVNET'
        value: isDeployVnet ? '1' : '0'
      }
      {
        name: 'FUNCTIONS_WORKER_RUNTIME'
        value: runtimeVersion
      }
      {
        name: 'FUNCTIONS_EXTENSION_VERSION'
        value: '~4'
      }
      {
        name: 'WEBSITE_RUN_FROM_PACKAGE'
        value: '1'
      }
      {
        name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
        value: reference('microsoft.insights/components/${appInsightsName}', '2015-05-01').InstrumentationKey
      }
      {
        name: 'WEBSITE_CONTENTSHARE'
        value: fileShareName
      }
      {
        name: 'AzureWebJobsStorage'
        value: 'DefaultEndpointsProtocol=https;AccountName=${funcStorageAccount.name};AccountKey=${funcStorageAccount.listKeys().keys[0].value};'
      }
      {
        name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
        value: 'DefaultEndpointsProtocol=https;AccountName=${funcStorageAccount.name};AccountKey=${funcStorageAccount.listKeys().keys[0].value};'
      }
      {
        name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE' // https://github.com/Azure/Azure-Functions/wiki/When-and-Why-should-I-set-WEBSITE_ENABLE_APP_SERVICE_STORAGE
        value: 'false'
      }
      {
        name: 'API_KEY'
        value: '@Microsoft.KeyVault(SecretUri=${apiKeySecret.properties.secretUri})'
      }
      {
        name: 'API_URL'
        value: '@Microsoft.KeyVault(SecretUri=${apiUrlSecret.properties.secretUri})'
      }
      {
        name: 'AzureWebJobsDataBlobStorageConnectionString'
        value: 'DefaultEndpointsProtocol=https;AccountName=${dataStorageAccount.name};AccountKey=${dataStorageAccount.listKeys().keys[0].value};'
      }
    ]
  }
}

/* resource vnetIntegration 'Microsoft.Web/sites/networkConfig@2021-03-01' = if (isDeployVnet) {
  name: 'virtualNetwork'
  parent: funcApp
  properties: {
    subnetResourceId: vnet.properties.subnets[0].id
    swiftSupported: true
  }
} */

output functionFqdn string = funcApp.properties.defaultHostName
output functionName string = funcApp.name
output storageAccountName string = dataStorageAccount.name
output containerName string = dataStorageAccountContainer.name
