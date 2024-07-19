param location string
param containerNames array
param userPrincipalId string = ''
param uamiPrincipalId string = ''
param deployUamiRbac bool = true
param deployUserRbac bool = false
param privateEndpointSubnetName string
param vnetName string
param name string
param isPrivate bool
param fileShareName string

@description('Storage Account type')
@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
])
param storageAccountType string = 'Standard_LRS'

var suffix = uniqueString(resourceGroup().id)
var storageAccountName = 'stor${name}${suffix}'
var storageAccountContributorRoleId = 'ba92f5b4-2d11-453d-a403-e96b0029c9fe'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountType
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}

resource storageAccountBlobService 'Microsoft.Storage/storageAccounts/blobServices@2023-01-01' = {
  parent: storageAccount
  name: 'default'
  properties: {
    containerDeleteRetentionPolicy: {
      allowPermanentDelete: false
      days: 7
      enabled: true
    }
  }
}

resource storageAccountTableService 'Microsoft.Storage/storageAccounts/tableServices@2023-01-01' = {
  parent: storageAccount
  name: 'default'
}

resource storageAccountQueueService 'Microsoft.Storage/storageAccounts/queueServices@2023-01-01' = {
  parent: storageAccount
  name: 'default'
}

resource storageAccountFileService 'Microsoft.Storage/storageAccounts/fileServices@2023-01-01' = {
  parent: storageAccount
  name: 'default'
}

resource storageAccountBlobServiceContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = [
  for containerName in containerNames: {
    parent: storageAccountBlobService
    name: containerName
  }
]

resource storageAccountFileShare 'Microsoft.Storage/storageAccounts/fileServices/shares@2023-01-01' = {
  parent: storageAccountFileService
  name: fileShareName
}

module privateEndpointBlob 'privateEndpoint.bicep' =
  if (isPrivate) {
    name: 'privateEndpoint-blob-module'
    params: {
      location: location
      privateDnsZoneName: 'privatelink.blob.${environment().suffixes.storage}'
      resourceId: storageAccount.id
      subnetName: privateEndpointSubnetName
      vnetName: vnetName
      groupId: 'blob'
    }
  }

module privateEndpointTable 'privateEndpoint.bicep' =
  if (isPrivate) {
    name: 'privateEndpoint-table-module'
    params: {
      location: location
      privateDnsZoneName: 'privatelink.table.${environment().suffixes.storage}'
      resourceId: storageAccount.id
      subnetName: privateEndpointSubnetName
      vnetName: vnetName
      groupId: 'table'
    }
  }

module privateEndpointQueue 'privateEndpoint.bicep' =
  if (isPrivate) {
    name: 'privateEndpoint-queue-module'
    params: {
      location: location
      privateDnsZoneName: 'privatelink.queue.${environment().suffixes.storage}'
      resourceId: storageAccount.id
      subnetName: privateEndpointSubnetName
      vnetName: vnetName
      groupId: 'queue'
    }
  }

module privateEndpointFile 'privateEndpoint.bicep' =
  if (isPrivate) {
    name: 'privateEndpoint-file-module'
    params: {
      location: location
      privateDnsZoneName: 'privatelink.file.${environment().suffixes.storage}'
      resourceId: storageAccount.id
      subnetName: privateEndpointSubnetName
      vnetName: vnetName
      groupId: 'file'
    }
  }

module uamiRbac 'storageAccountRbac.bicep' =
  if (deployUamiRbac) {
    name: 'uamiRbac-module'
    params: {
      principalId: uamiPrincipalId
      storageAccountName: storageAccount.name
      roleId: storageAccountContributorRoleId
    }
  }

module userRbac 'storageAccountRbac.bicep' =
  if (deployUserRbac) {
    name: 'userPrincipalRbac-module'
    params: {
      principalId: userPrincipalId
      storageAccountName: storageAccount.name
      roleId: storageAccountContributorRoleId
    }
  }

output name string = storageAccount.name
output id string = storageAccount.id
output key string = storageAccount.listKeys().keys[0].value
