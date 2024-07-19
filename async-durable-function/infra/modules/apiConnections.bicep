param location string
param storageAccountName string
param uamiName string

var azureBlobConnectionName = '${storageAccountName}-blob-connection'
var azureQueueConnectionName = '${storageAccountName}-queue-connection'

resource storageAccount 'Microsoft.Storage/storageAccounts@2019-06-01' existing = {
  name: storageAccountName
}

resource uami 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' existing = {
  name: uamiName
}

resource azureBlobConnection 'Microsoft.Web/connections@2016-06-01' = {
  name: azureBlobConnectionName
  location: location
  kind: 'V2'
  properties: {
    displayName: azureBlobConnectionName
    parameterValues: {
      accountName: storageAccount.name
      accessKey: concat(listKeys(
        '${resourceGroup().id}/providers/Microsoft.Storage/storageAccounts/${storageAccount.name}',
        storageAccount.apiVersion
      ).keys[0].value)
    }
    api: {
      name: 'azureblob'
      displayName: 'Azure Blob Storage'
      description: 'Microsoft Azure Storage provides a massively scalable, durable, and highly available storage for data on the cloud, and serves as the data storage solution for modern applications. Connect to Blob Storage to perform various operations such as create, update, get and delete on blobs in your Azure Storage account.'
      iconUri: 'https://connectoricons-prod.azureedge.net/releases/v1.0.1683/1.0.1683.3685/azureblob/icon.png'
      brandColor: '#804998'
      id: '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Web/locations/${location}/managedApis/azureblob'
    }
  }
}

resource azureBlobAccessPolicy 'Microsoft.Web/connections/accessPolicies@2016-06-01' = {
  parent: azureBlobConnection
  name: 'azure_blob_access_policy'
  location: location
  properties: {
    principal: {
      type: 'ActiveDirectory'
      identity: {
        tenantId: tenant().tenantId
        objectId: uami.properties.principalId
      }
    }
  }
}

resource azureQueueConnection 'Microsoft.Web/connections@2016-06-01' = {
  name: azureQueueConnectionName
  location: location
  kind: 'V2'
  properties: {
    displayName: azureQueueConnectionName
    parameterValues: {
      storageaccount: storageAccount.name
      sharedKey: concat(listKeys(
        '${resourceGroup().id}/providers/Microsoft.Storage/storageAccounts/${storageAccount.name}',
        storageAccount.apiVersion
      ).keys[0].value)
    }
    api: {
      name: 'azurequeues'
      displayName: 'Azure Queues'
      description: 'Azure Queue storage provides cloud messaging between application components. Queue storage also supports managing asynchronous tasks and building process work flows.'
      iconUri: 'https://connectoricons-prod.azureedge.net/releases/v1.0.1546/1.0.1546.2665/azurequeues/icon.png'
      brandColor: '#0072C6'
      id: '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Web/locations/${location}/managedApis/azurequeues'
      type: 'Microsoft.Web/locations/managedApis'
    }
  }
}

output blobConnectionRuntimeUrl string = reference(azureBlobConnection.id, azureBlobConnection.apiVersion, 'full').properties.connectionRuntimeUrl
output queueConnectionRuntimeUrl string = reference(azureQueueConnection.id, azureQueueConnection.apiVersion, 'full').properties.connectionRuntimeUrl
output azureBlobApiConnectionName string = azureBlobConnectionName
