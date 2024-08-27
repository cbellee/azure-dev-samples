param location string
param subnetName string
param vnetName string
param resourceId string
param groupId string = 'sites'
param privateDnsZoneName string

var suffix = uniqueString(resourceGroup().id)
var peName = 'pe-${groupId}-${suffix}'

resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' existing = {
  name: privateDnsZoneName
}

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' existing = {
  name: vnetName
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-09-01' existing = {
  name: subnetName
  parent: vnet
}

resource privateEndpoint 'Microsoft.Network/privateEndpoints@2023-09-01' = {
  name: peName
  location: location
  properties: {
    subnet: {
      id: subnet.id
    }
    privateLinkServiceConnections: [
      {
        name: peName
        properties: {
          privateLinkServiceId: resourceId
          groupIds: [
            groupId
          ]
        }
      }
    ]
  }
}

resource pvtEndpointDnsGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2023-09-01' = {
  name: '${peName}-zone-group'
  parent: privateEndpoint
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'config1'
        properties: {
          privateDnsZoneId: privateDnsZone.id
        }
      }
    ]
  }
}
