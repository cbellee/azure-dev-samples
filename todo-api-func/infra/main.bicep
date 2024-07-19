param location string
param appName string
param environment string
param sqlAdminUserName string = 'sqladmin'
param isPrivate bool = false
param containerImageName string
param acrName string
param sqlDbName string = 'todosDb'
// param adminUserName string = 'localuser'
param productApiYaml string

@secure()
param sqlAdminUserPassword string

var suffix = uniqueString(resourceGroup().id)
var funcAppName = '${environment}-${appName}-${suffix}'
var funcStorageAccountName = 'stor${suffix}'
var hostingPlanName = 'asp-${suffix}'
var appInsightsName = 'ai-${suffix}'
var sqlServerName = 'sql-server-${suffix}'
var vnetName = 'vnet-${suffix}'
var keyVaultName = 'kv-${suffix}'
var userManagedIdentityName = 'umid-${suffix}'
var dbCxnString = 'server=tcp:${sqlServer.properties.fullyQualifiedDomainName};user id=${sqlAdminUserName};password=${sqlAdminUserPassword};port=1433;database=${sqlDbName};'
var acrPullRoleDefinitionId = resourceId('Microsoft.Authorization/roleDefinitions', '7f951dda-4ed3-4680-a7ca-43fe172d538d')
var fileShareName = 'myshare'
var keyVaultSecretsUserRoleId = resourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')
var tags = {
  environment: environment
  costCenter: '1234567890'
}

resource acr 'Microsoft.ContainerRegistry/registries@2022-02-01-preview' existing = {
  name: acrName
}

resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
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
      {
        name: 'apimSubnet-1'
        properties: {
          addressPrefix: '10.0.2.0/24'
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'apimSubnet-2'
        properties: {
          addressPrefix: '10.0.3.0/24'
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
  }
}

resource userManagedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2022-01-31-preview' = {
  name: userManagedIdentityName
  tags: tags
  location: location
}

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: keyVaultName
  location: location
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

module keyVaultAccessPolicy 'modules/keyvault_policy.bicep' = {
  name: 'keyvault-access-policy-module'
  params: {
    keyVaultName: keyVaultName
    objectId: userManagedIdentity.properties.principalId
    permissions: {
      secrets: [
        'get'
        'list'
      ]
    }
  }
  dependsOn: [
    keyVault
  ]
}

resource secret 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  parent: keyVault
  name: 'dbCxnString'
  properties: {
    value: dbCxnString
  }
}

resource userManagedIdentityRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(resourceGroup().id, acr.id, acrPullRoleDefinitionId)
  scope: acr
  properties: {
    principalId: userManagedIdentity.properties.principalId
    roleDefinitionId: acrPullRoleDefinitionId
    principalType: 'ServicePrincipal'
  }
}

resource acrPrivateEndpoint 'Microsoft.Network/privateEndpoints@2021-05-01' = if (isPrivate) {
  name: 'acr-private-endpoint'
  location: location
  tags: tags
  properties: {
    subnet: {
      id: vnet.properties.subnets[1].id
    }
    privateLinkServiceConnections: [
      {
        name: 'acr-plink'
        properties: {
          privateLinkServiceId: acr.id
          groupIds: [
            'registry'
          ]
        }
      }
    ]
  }
}

resource acrPrivateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = if (isPrivate) {
  name: 'privatelink${az.environment().suffixes.acrLoginServer}'
  location: 'global'
  tags: tags
  dependsOn: [
    vnet
  ]
}

resource acrPrivateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = if (isPrivate) {
  parent: acrPrivateDnsZone
  name: 'acr-dns-zone-link'
  location: 'global'
  tags: tags
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet.id
    }
  }
}

resource acrPrivateEndpointDnsGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2021-05-01' = if (isPrivate) {
  name: '${acrPrivateEndpoint.name}/acr-pe-dns-group'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'config1'
        properties: {
          privateDnsZoneId: acrPrivateDnsZone.id
        }
      }
    ]
  }
}

resource sqlServer 'Microsoft.Sql/servers@2021-11-01-preview' = {
  name: sqlServerName
  location: location
  tags: tags
  properties: {
    administratorLogin: sqlAdminUserName
    administratorLoginPassword: sqlAdminUserPassword
    publicNetworkAccess: isPrivate ? 'Disabled' : 'Enabled'
  }
}

resource sqlServerFirewall 'Microsoft.Sql/servers/firewallRules@2022-05-01-preview' = if (!isPrivate) {
  name: 'sqlFwRule'
  parent: sqlServer
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

resource sqlDb 'Microsoft.Sql/servers/databases@2021-11-01-preview' = {
  location: location
  name: sqlDbName
  parent: sqlServer
  tags: tags
  sku: {
    name: 'Basic'
  }
}

resource sqlPrivateEndpoint 'Microsoft.Network/privateEndpoints@2021-05-01' = if (isPrivate) {
  name: 'sql-private-endpoint'
  location: location
  tags: tags
  properties: {
    subnet: {
      id: vnet.properties.subnets[1].id
    }
    privateLinkServiceConnections: [
      {
        name: 'sql-plink'
        properties: {
          privateLinkServiceId: sqlServer.id
          groupIds: [
            'sqlServer'
          ]
        }
      }
    ]
  }
}

resource sqlPrivateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = if (isPrivate) {
  name: 'privatelink${az.environment().suffixes.sqlServerHostname}'
  location: 'global'
  tags: tags
  properties: {}
  dependsOn: [
    vnet
  ]
}

resource privateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = if (isPrivate) {
  parent: sqlPrivateDnsZone
  name: 'sql-dns-zone-link'
  location: 'global'
  tags: tags
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet.id
    }
  }
}

resource sqlPrivateEndpointDnsGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2021-05-01' = if (isPrivate) {
  name: '${sqlPrivateEndpoint.name}/sql-pe-dns-group'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'config1'
        properties: {
          privateDnsZoneId: sqlPrivateDnsZone.id
        }
      }
    ]
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
    allowBlobPublicAccess: isPrivate ? false : true
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

resource storageBlobPrivateEndpoint 'Microsoft.Network/privateEndpoints@2022-01-01' = if (isPrivate) {
  name: 'storage-blob-private-endpoint'
  location: location
  tags: tags
  properties: {
    subnet: {
      id: vnet.properties.subnets[1].id
    }
    privateLinkServiceConnections: [
      {
        name: 'storage-blob-plink'
        properties: {
          privateLinkServiceId: funcStorageAccount.id
          groupIds: [
            'blob'
          ]
        }
      }
    ]
  }
}

resource storageFilePrivateEndpoint 'Microsoft.Network/privateEndpoints@2022-01-01' = if (isPrivate) {
  name: 'storage-file-private-endpoint'
  location: location
  tags: tags
  properties: {
    subnet: {
      id: vnet.properties.subnets[1].id
    }
    privateLinkServiceConnections: [
      {
        name: 'storage-file-plink'
        properties: {
          privateLinkServiceId: funcStorageAccount.id
          groupIds: [
            'file'
          ]
        }
      }
    ]
  }
}

resource storageTablePrivateEndpoint 'Microsoft.Network/privateEndpoints@2022-01-01' = if (isPrivate) {
  name: 'storage-table-private-endpoint'
  location: location
  tags: tags
  properties: {
    subnet: {
      id: vnet.properties.subnets[1].id
    }
    privateLinkServiceConnections: [
      {
        name: 'storage-table-plink'
        properties: {
          privateLinkServiceId: funcStorageAccount.id
          groupIds: [
            'table'
          ]
        }
      }
    ]
  }
}

resource storageBlobPrivateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = if (isPrivate) {
  name: 'privatelink.blob.${az.environment().suffixes.storage}'
  location: 'global'
  tags: tags
}

resource storageFilePrivateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = if (isPrivate) {
  name: 'privatelink.file.${az.environment().suffixes.storage}'
  location: 'global'
  tags: tags
}

resource storageTablePrivateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = if (isPrivate) {
  name: 'privatelink.table.${az.environment().suffixes.storage}'
  location: 'global'
  tags: tags
}

resource storageBlobPrivateDNSZoneGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2022-01-01' = if (isPrivate) {
  name: '${storageBlobPrivateEndpoint.name}/default'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'privatelink-blob-storage'
        properties: {
          privateDnsZoneId: storageBlobPrivateDnsZone.id
        }
      }
    ]
  }
}

resource storageFilePrivateDNSZoneGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2022-01-01' = if (isPrivate) {
  name: '${storageFilePrivateEndpoint.name}/default'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'privatelink-file-storage'
        properties: {
          privateDnsZoneId: storageFilePrivateDnsZone.id
        }
      }
    ]
  }
}

resource storageTablePrivateDNSZoneGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2022-01-01' = if (isPrivate) {
  name: '${storageTablePrivateEndpoint.name}/default'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'privatelink-table-storage'
        properties: {
          privateDnsZoneId: storageTablePrivateDnsZone.id
        }
      }
    ]
  }
}

resource storageBlobPrivateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = if (isPrivate) {
  name: 'blob-storage-dns-zone-link'
  parent: storageBlobPrivateDnsZone
  location: 'global'
  tags: tags
  properties: {
    virtualNetwork: {
      id: vnet.id
    }
    registrationEnabled: false
  }
}

resource storageFilePrivateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = if (isPrivate) {
  name: 'file-storage-dns-zone-link'
  parent: storageFilePrivateDnsZone
  location: 'global'
  tags: tags
  properties: {
    virtualNetwork: {
      id: vnet.id
    }
    registrationEnabled: false
  }
}

resource storageTablePrivateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = if (isPrivate) {
  name: 'table-storage-dns-zone-link'
  parent: storageTablePrivateDnsZone
  location: 'global'
  tags: tags
  properties: {
    virtualNetwork: {
      id: vnet.id
    }
    registrationEnabled: false
  }
}

resource hostingPlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: hostingPlanName
  location: location
  tags: tags
  sku: {
    name: 'EP1'
    tier: 'ElasticPremium'
  }
  kind: 'elastic'
  properties: {
    reserved: true
    maximumElasticWorkerCount: 20
  }
  dependsOn: [
    storageBlobPrivateDnsZoneLink
    storageFilePrivateDnsZoneLink
    storageTablePrivateDnsZoneLink
  ]
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
    reserved: true
    siteConfig: {
      ftpsState: 'Disabled'
      minTlsVersion: '1.2'
      detailedErrorLoggingEnabled: true
      httpLoggingEnabled: true
      vnetRouteAllEnabled: isPrivate ? true : false
      keyVaultReferenceIdentity: userManagedIdentity.id
      acrUseManagedIdentityCreds: true
      acrUserManagedIdentityID: userManagedIdentity.id
      linuxFxVersion: 'DOCKER|${containerImageName}'
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
    acrUseManagedIdentityCreds: true
    acrUserManagedIdentityID: userManagedIdentity.properties.clientId
    /*  keyVaultReferenceIdentity: userManagedIdentity.id */
    appSettings: [
      {
        name: 'WEBSITE_DNS_SERVER'
        value: '168.63.129.16'
      }
      {
        name: 'WEBSITE_CONTENTOVERVNET'
        value: isPrivate ? '1' : '0'
      }
      {
        name: 'FUNCTIONS_WORKER_RUNTIME'
        value: 'custom'
      }
      {
        name: 'DSN'
        value: '@Microsoft.KeyVault(SecretUri=${secret.properties.secretUri})'
      }
      {
        name: 'FUNCTIONS_EXTENSION_VERSION'
        value: '~4'
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
        value: 'DefaultEndpointsProtocol=https;AccountName=${funcStorageAccount.name};AccountKey=${listKeys(funcStorageAccount.id, '2019-06-01').keys[0].value};'
      }
      {
        name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
        value: 'DefaultEndpointsProtocol=https;AccountName=${funcStorageAccount.name};AccountKey=${listKeys(funcStorageAccount.id, '2019-06-01').keys[0].value};'
      }
      {
        name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE' // https://github.com/Azure/Azure-Functions/wiki/When-and-Why-should-I-set-WEBSITE_ENABLE_APP_SERVICE_STORAGE
        value: 'false'
      }
    ]
  }
}

resource vnetIntegration 'Microsoft.Web/sites/networkConfig@2021-03-01' = {
  name: 'virtualNetwork'
  parent: funcApp
  properties: {
    subnetResourceId: vnet.properties.subnets[0].id
    swiftSupported: true
  }
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

module apim 'modules/apim.bicep' = {
  name: 'apim-module'
  params: {
    location: location
    subnetId: vnet.properties.subnets[2].id
  }
}

module openApiDefinition 'modules/api.bicep' = {
  name: 'todo-api-module'
  params: {
    apimName: apim.outputs.apimName
    apiName: 'todo-api'
    apiPath: ''
    displayName: 'Todo API'
    isSubscriptionRequired: false
    openApiYaml: productApiYaml
    backendUri: 'https://${funcApp.properties.defaultHostName}'
  }
  dependsOn: [
    apim
  ]
}

/* 
resource kvPrivateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = if (isPrivate) {
  name: 'privatelink${az.environment().suffixes.keyvaultDns}'
  location: 'global'
  tags: tags
  dependsOn: [
    vnet
  ]
}

resource kvPrivateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = if (isPrivate) {
  parent: acrPrivateDnsZone
  name: 'acr-dns-zone-link'
  location: 'global'
  tags: tags
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet.id
    }
  }
}

resource acrPrivateEndpointDnsGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2021-05-01' = if (isPrivate) {
  name: '${acrPrivateEndpoint.name}/acr-pe-dns-group'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'config1'
        properties: {
          privateDnsZoneId: acrPrivateDnsZone.id
        }
      }
    ]
  }
}
 */

output apimFqdn string = apim.outputs.apimFqdn
output functionFqdn string = funcApp.properties.defaultHostName
output dbName string = sqlDb.name
