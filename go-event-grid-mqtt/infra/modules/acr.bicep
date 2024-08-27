param location string

var prefix = uniqueString(resourceGroup().id) 
var acrName = '${prefix}acr'

resource acr 'Microsoft.ContainerRegistry/registries@2023-11-01-preview' = {
  name: acrName
  location: location
  sku: {
    name: 'Standard'
  }
}

output acrName string = acrName
