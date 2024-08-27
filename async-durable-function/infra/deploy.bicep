param location string = 'australiaeast'
param blobName string
param userPrincipalId string
param isPrivate bool = false

var appServicePrivateDnsZoneName = 'privatelink.azurewebsites.net'
var storageAccountPrivateDnsZoneName = 'privatelink.blob.${environment().suffixes.storage}'
var suffix = uniqueString(resourceGroup().id)
var uamiName = 'uami-${suffix}'

resource storageAccountPrivateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = if (isPrivate) {
  name: storageAccountPrivateDnsZoneName
  location: 'global'
}

resource appServicePrivateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = if (isPrivate) {
  name: appServicePrivateDnsZoneName
  location: 'global'
}

resource storagePrivateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = if (isPrivate) {
  parent: storageAccountPrivateDnsZone
  name: '${storageAccountPrivateDnsZoneName}-link'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet.outputs.id
    }
  }
}

resource appServicePrivateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = if (isPrivate) {
  parent: appServicePrivateDnsZone
  name: '${appServicePrivateDnsZoneName}-link'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet.outputs.id
    }
  }
}

resource uami 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-07-31-preview' = {
  name: uamiName
  location: location
}

module ai 'modules/ai.bicep' = {
  name: 'app-insights-module'
  params: {
    location: location
  }
}

module vnet 'modules/vnet.bicep' = {
  name: 'vnet-module'
  params: {
    location: location
    addressPrefix: '10.0.0.0/16'
  }
}

module logicAppAsp 'modules/asp.bicep' = {
  name: 'logic-app-service-plan-module'
  params: {
    name: 'logic'
    location: location
    planType: {
      name: 'WS1'
      tier: 'WorkflowStandard'
    }
  }
}

module funcAppAsp 'modules/asp.bicep' = {
  name: 'func-app-service-plan-module'
  params: {
    name: 'func'
    location: location
    planType: {
      name: 'EP1'
      tier: 'ElasticPremium'
    }
  }
}

module blobStorageAccount 'modules/storageAccount.bicep' = {
  name: 'storage-account-module'
  params: {
    location: location
    uamiPrincipalId: uami.properties.principalId
    userPrincipalId: userPrincipalId
    name: 'blob'
    vnetName: vnet.outputs.name
    privateEndpointSubnetName: vnet.outputs.subnets[4].name
    isPrivate: isPrivate
    deployUamiRbac: true
    deployUserRbac: true
    fileShareName: toLower('testshare')
    containerNames: [
      'source'
      'dest'
    ]
  }
}

module logicApp './modules/logicApp.bicep' = {
  name: 'logicApp-module'
  params: {
    location: location
    virtualNetworkName: vnet.outputs.name
    appServicePlanName: logicAppAsp.outputs.name
    vnetIntegrationSubnetName: vnet.outputs.subnets[2].name
    uamiName: uamiName
    aiName: ai.outputs.name
    functionAppName: funcApp.outputs.name
    functionAppKey: funcApp.outputs.key
    isPrivate: isPrivate
  }
}

module funcApp './modules/funcApp.bicep' = {
  name: 'funcApp-module'
  params: {
    location: location
    virtualNetworkName: vnet.outputs.name
    appServicePlanName: funcAppAsp.outputs.name
    subnetName: vnet.outputs.subnets[3].name
    privateEndpointSubnetName: vnet.outputs.subnets[4].name
    functionWorkerRuntime: 'dotnet'
    uamiName: uamiName
    aiName: ai.outputs.name
    blobStorageAccountName: blobStorageAccount.outputs.name
    blobName: blobName
    isPrivate: isPrivate
  }
}

module privateEndpoint 'modules/privateEndpoint.bicep' =
  if (isPrivate) {
    name: 'private-endpoint-module'
    params: {
      location: location
      privateDnsZoneName: 'privatelink.azurewebsites.net'
      vnetName: vnet.outputs.name
      subnetName: vnet.outputs.subnets[4].name
      groupId: 'sites'
      resourceId: funcApp.outputs.id
    }
  }

output logicAppName string = logicApp.outputs.name
output funcAppName string = funcApp.outputs.name
output blobStorageAccountName string = blobStorageAccount.outputs.name
