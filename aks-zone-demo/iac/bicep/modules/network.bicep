@description('This is the base name for each Azure resource name (6-12 chars)')
param baseName string

@description('The resource group location')
param location string = resourceGroup().location

@description('vnet CIDR')
param vnetAddressPrefix string = '10.0.0.0/16'

var vnetName = 'vnet-${baseName}'
var aksSystemSubnetPrefix = cidrSubnet(cidrSubnet(vnetAddressPrefix, 20, 0), 24, 0)
var aksUserSubnetPrefix = cidrSubnet(cidrSubnet(vnetAddressPrefix, 20, 1), 2, 1)

resource vnet 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        //AKS System subnet
        name: 'snet-system-aks'
        properties: {
          addressPrefix: aksSystemSubnetPrefix
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        //AKS User subnet
        name: 'snet-user-aks'
        properties: {
          addressPrefix: aksUserSubnetPrefix
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
  }

  resource privateEnpointsSubnet 'subnets' existing = {
    name: 'snet-privateEndpoints'
  }

  resource aksSystemSubnet 'subnets' existing = {
    name: 'snet-system-aks'
  }

  resource aksUserSubnet 'subnets' existing = {
    name: 'snet-user-aks'
  }
}

@description('The vnet.')
output vnetName string = vnet.name

@description('The name of the aks system subnet.')
output aksSystemSubnetName string = vnet::aksSystemSubnet.name

@description('The name of the aks user subnet.')
output aksUserSubnetname string = vnet::aksUserSubnet.name

output aksSystemSubnetId string = vnet::aksSystemSubnet.id
output aksUserSubnetId string = vnet::aksUserSubnet.id
