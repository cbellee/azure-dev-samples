param keyVaultName string
param objectId string
param roleDefinitionId string

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' existing = {
  name: keyVaultName
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2018-09-01-preview' = {
  scope: keyVault
  name: guid(keyVault.id, objectId, roleDefinitionId)
  properties: {
    roleDefinitionId: roleDefinitionId
    principalId: objectId
  }
}
