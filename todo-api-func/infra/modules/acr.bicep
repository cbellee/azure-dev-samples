param location string
param anonymousPullEnabled bool = false
param adminUserEnabled bool = false
param sku string = 'Premium'

var affix = uniqueString(resourceGroup().id)
var acrName = 'acr${affix}'

resource acr 'Microsoft.ContainerRegistry/registries@2021-12-01-preview' = {
  name: acrName
  location: location
  sku: {
    name: sku
  }
  properties: {
    adminUserEnabled: adminUserEnabled
    anonymousPullEnabled: anonymousPullEnabled
  }
}

output acrName string = acr.name
