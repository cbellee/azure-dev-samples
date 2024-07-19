param storageAccountName string
param principalId string
param roleId string = 'ba92f5b4-2d11-453d-a403-e96b0029c9fe'
param contribRoleId string = '17d1049b-9a84-46fb-8f53-869881c3d3ab'
param fileContribRoleId string = '69566ab7-960f-475b-8e7c-b3118f30c6bd'

var blobContribRole = '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/${roleId}'
var contribRole = '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/${contribRoleId}'
var fileContribRole = '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/${fileContribRoleId}'


resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: storageAccountName
}

resource storageAccountBlobContributorRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(subscription().subscriptionId, 'storageAccountBlobRoleAssignment', storageAccountName, principalId, blobContribRole)
  scope: storageAccount
  properties: {
    principalId: principalId
    roleDefinitionId: blobContribRole
  }
}

resource storageAccountContributorRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(subscription().subscriptionId, 'storageAccountBlobRoleAssignment', storageAccountName, principalId, contribRole)
  scope: storageAccount
  properties: {
    principalId: principalId
    roleDefinitionId: contribRole
  }
}

resource storageAccountFileContributorRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(subscription().subscriptionId, 'storageAccountBlobRoleAssignment', storageAccountName, principalId, fileContribRole)
  scope: storageAccount
  properties: {
    principalId: principalId
    roleDefinitionId: fileContribRole
  }
}
