param location string
param subnetName string
param privateEndpointSubnetName string
param uamiName string
param appServicePlanName string
param virtualNetworkName string
param blobStorageAccountName string
param aiName string
param blobName string
param isPrivate bool = false

@description('The language worker runtime to load in the function app.')
@allowed([
  'node'
  'dotnet'
  'java'
])
param functionWorkerRuntime string = 'dotnet'

var suffix = uniqueString(resourceGroup().id)
var name = 'func-${suffix}'
var storageAccountName = 'func'

resource ai 'Microsoft.Insights/components@2020-02-02' existing = {
  name: aiName
}

resource blobStorageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' existing = {
  name: blobStorageAccountName
}

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' existing = {
  name: virtualNetworkName
}

resource asp 'Microsoft.Web/serverfarms@2023-01-01' existing = {
  name: appServicePlanName
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-09-01' existing = {
  parent: vnet
  name: subnetName
}

resource uami 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-07-31-preview' existing = {
  name: uamiName
}

module storageAccount 'storageAccount.bicep' = {
  name: 'func-storage-account-module'
  params: {
    name: storageAccountName
    location: location
    containerNames: []
    deployUamiRbac: true
    deployUserRbac: false
    isPrivate: isPrivate
    privateEndpointSubnetName: privateEndpointSubnetName
    vnetName: vnet.name
    uamiPrincipalId: uami.properties.principalId
    fileShareName: toLower(name)
  }
}

resource funcApp 'Microsoft.Web/sites@2023-01-01' = {
  name: name
  location: location
  kind: 'functionapp'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${uami.id}': {}
    }
  }
  properties: {
    httpsOnly: true
    hostNameSslStates: [
      {
        name: '${name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: asp.id
    vnetRouteAllEnabled: true
    siteConfig: {
      functionsRuntimeScaleMonitoringEnabled: false
    }
    virtualNetworkSubnetId: subnet.id
  }
}

resource funcAppConfig 'Microsoft.Web/sites/config@2023-01-01' = {
  parent: funcApp
  name: 'web'
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
    ]
    netFrameworkVersion: 'v6.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    scmType: 'None'
    use32BitWorkerProcess: false
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetName: vnet.name
    vnetRouteAllEnabled: true
    vnetPrivatePortsCount: 2
    publicNetworkAccess: 'Enabled'
    cors: {
      supportCredentials: false
    }
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 1
    functionAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    appSettings: [
      {
        name: 'WEBSITE_CONTENTOVERVNET'
        value: (isPrivate) ? '1' : '0'
      }
      {
        name: 'WEBSITE_VNET_ROUTE_ALL'
        value: (isPrivate) ? '1' : '0'
      }
      {
        name: 'AzureWebJobsStorage'
        value: 'DefaultEndpointsProtocol=https;AccountName=${storageAccountName};EndpointSuffix=${environment().suffixes.storage};AccountKey=${storageAccount.outputs.key}'
      }
      {
        name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
        value: 'DefaultEndpointsProtocol=https;AccountName=${storageAccountName};EndpointSuffix=${environment().suffixes.storage};AccountKey=${storageAccount.outputs.key}'
      }
      {
        name: 'WEBSITE_CONTENTSHARE'
        value: toLower(name)
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
        name: 'AZURE_CLIENT_ID'
        value: uami.properties.clientId
      }
      {
        name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
        value: ai.properties.InstrumentationKey
      }
      {
        name: 'FUNCTIONS_WORKER_RUNTIME'
        value: functionWorkerRuntime
      }
      {
        name: 'STORAGE_ACCOUNT_NAME'
        value: blobStorageAccount.name
      }
      {
        name: 'SOURCE_CONTAINER_NAME'
        value: 'source'
      }
      {
        name: 'DEST_CONTAINER_NAME'
        value: 'dest'
      }
      {
        name: 'BLOB_NAME'
        value: blobName
      }
    ]
  }
}

resource vnetConnection 'Microsoft.Web/sites/virtualNetworkConnections@2023-01-01' = {
  parent: funcApp
  name: '${funcApp.name}-vnet-cxn'
  properties: {
    vnetResourceId: subnet.id
    isSwift: true
  }
}

output name string = funcApp.name
output apiVersion string = funcApp.apiVersion
output key string = listKeys('${funcApp.id}/host/default', funcApp.apiVersion).functionKeys.default
output id string = funcApp.id
