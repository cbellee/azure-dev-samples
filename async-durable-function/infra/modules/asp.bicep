param location string
param planType object
param name string

var suffix = uniqueString(resourceGroup().id)
var planName = '${name}-asp-${suffix}'

resource appServicePlan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: planName
  location: location
  sku: planType
  kind: 'windows'
  properties: {
    targetWorkerCount: 1
    maximumElasticWorkerCount: 20
    elasticScaleEnabled: true
    isSpot: false
    zoneRedundant: false
  }
}

output name string = appServicePlan.name
