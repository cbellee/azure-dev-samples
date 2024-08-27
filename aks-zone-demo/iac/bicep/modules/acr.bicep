param location string

@allowed(
  [
    'Basic'
    'Standard'
    'Premium'
  ]
)
param sku string = 'Premium'

var affix = uniqueString(resourceGroup().id)
var acrName = 'acr${affix}'

resource acr 'Microsoft.ContainerRegistry/registries@2023-11-01-preview' = {
  location: location
  name: acrName
  sku: {
    name: sku
  }
  properties: {
    zoneRedundancy: 'Enabled'
  }
}

output acrName string = acr.name
