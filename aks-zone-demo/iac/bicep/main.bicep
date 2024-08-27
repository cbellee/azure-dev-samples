@description('The location in which all resources should be deployed.')
param location string = resourceGroup().location

var availabilityZones = [ '1', '2', '3' ]
var baseName = uniqueString(resourceGroup().id)
var logWorkspaceName = 'log-${baseName}'

resource logWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logWorkspaceName
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

module networkModule './modules/network.bicep' = {
  name: 'networkDeploy'
  params: {
    location: location
    baseName: baseName
  }
}

module aksModule './modules/aks.bicep' = {
  name: 'aksDeploy'
  params: {
    location: location
    addOns: {}
    aksSystemSubnetId: networkModule.outputs.aksSystemSubnetId
    aksUserSubnetId: networkModule.outputs.aksUserSubnetId
    aksVersion: '1.30'
    baseName: baseName
    logAnalyticsWorkspaceId: logWorkspace.id
    availabilityZones: availabilityZones
    aksMinNodeCount: 3
    aksMaxNodeCount: 6
    aksNodeCount: 3
  } 
}

output clusterName string = aksModule.outputs.aksClusterName
