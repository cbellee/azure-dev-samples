param location string
param userPrincipalId string

var prefix = uniqueString(resourceGroup().id)
var kvName = '${prefix}-kv'

resource kv 'Microsoft.KeyVault/vaults@2024-04-01-preview' = {
  name: kvName
  location: location
  properties: {
    sku: {
      name: 'standard'
      family: 'A'
    }
    enableRbacAuthorization: true
    tenantId: subscription().tenantId
  }
}

resource kvAdminRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(kvName, userPrincipalId)
  scope: kv
  properties: {
    principalId: userPrincipalId
    roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/00482a5a-887f-4fb3-b363-3b7fe8e74483'
    principalType: 'User'
  }
}

output keyVaultName string = kvName
