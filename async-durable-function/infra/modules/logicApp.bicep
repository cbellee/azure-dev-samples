param location string
param vnetIntegrationSubnetName string
param uamiName string
param appServicePlanName string
param virtualNetworkName string
param aiName string
param functionAppName string
param functionAppKey string
param isPrivate bool
param userPrincipalId string = ''

var suffix = uniqueString(resourceGroup().id)
var name = 'logic-${suffix}'
var storageAccountName = 'logic'

resource ai 'Microsoft.Insights/components@2020-02-02' existing = {
  name: aiName
}

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' existing = {
  name: virtualNetworkName
}

resource asp 'Microsoft.Web/serverfarms@2023-01-01' existing = {
  name: appServicePlanName
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-09-01' existing = {
  parent: vnet
  name: vnetIntegrationSubnetName
}

resource uami 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-07-31-preview' existing = {
  name: uamiName
}

module storageAccount 'storageAccount.bicep' = {
  name: 'logic-app-storage-module'
  params: {
    name: storageAccountName
    location: location
    containerNames: []
    deployUamiRbac: true
    deployUserRbac: true
    privateEndpointSubnetName: subnet.name
    isPrivate: isPrivate
    uamiPrincipalId: uami.properties.principalId
    userPrincipalId: userPrincipalId
    storageAccountType: 'Standard_LRS'
    vnetName: vnet.name
    fileShareName: toLower(name)
  }
}

resource logicApp 'Microsoft.Web/sites@2023-01-01' = {
  name: name
  location: location
  kind: 'functionapp,workflowapp'
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

resource logicAppConfig 'Microsoft.Web/sites/config@2023-01-01' = {
  parent: logicApp
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
        name: 'WEBSITE_DNS_SERVER'
        value: '168.63.129.16'
      }
      {
        name: 'WEBSITE_CONTENTOVERVNET'
        value: (isPrivate) ? '1' : '0'
      }
      {
        name: 'WEBSITE_VNET_ROUTE_ALL'
        value: (isPrivate) ? '1' : '0'
      }
      {
        name: 'APP_KIND'
        value: 'workflowApp'
      }
      {
        name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
        value: ai.properties.InstrumentationKey
      }
      {
        name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
        value: ai.properties.ConnectionString
      }
      {
        name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
        value: 'DefaultEndpointsProtocol=https;AccountName=${storageAccountName};EndpointSuffix=${environment().suffixes.storage};AccountKey=${storageAccount.outputs.key}'
      }
      {
        name: 'AzureWebJobsStorage'
        value: 'DefaultEndpointsProtocol=https;AccountName=${storageAccountName};EndpointSuffix=${environment().suffixes.storage};AccountKey=${storageAccount.outputs.key}'
      }
      {
        name: 'WEBSITE_CONTENTSHARE'
        value: '${toLower(logicApp.name)}-share'
      }
      {
        name: 'WEBSITE_NODE_DEFAULT_VERSION:'
        value: '~18'
      }
      {
        name: 'AzureFunctionsJobHost__extensionBundle__id'
        value: 'Microsoft.Azure.Functions.ExtensionBundle.Workflows'
      }
      {
        name: 'AzureFunctionsJobHost__extensionBundle__version'
        value: '[1.*, 2.0.0)'
      }
      {
        name: 'FUNCTIONS_EXTENSION_VERSION'
        value: '~4'
      }
      {
        name: 'FUNCTIONS_WORKER_RUNTIME'
        value: 'node'
      }
      {
        name: 'workflow_subscription_id'
        value: subscription().subscriptionId
      }
      {
        name: 'workflow_rg_name'
        value: resourceGroup().name
      }
      {
        name: 'func_app_name'
        value: functionAppName
      }
      {
        name: 'azureFunctionOperation_functionAppKey'
        value: functionAppKey
      }
    ]
  }
}

resource vnetConnection 'Microsoft.Web/sites/virtualNetworkConnections@2023-01-01' = {
  parent: logicApp
  name: '${logicApp.name}-vnet-cxn'
  properties: {
    vnetResourceId: subnet.id
    isSwift: true
  }
}

output name string = logicApp.name
output apiVersion string = logicApp.apiVersion
