param location string
param addressPrefix string = '10.0.0.0/16'

var suffix = uniqueString(resourceGroup().id)
var name = 'vnet${suffix}'

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: 'GatewaySubnet'
        properties: {
          addressPrefixes: [
            cidrSubnet(addressPrefix, 24, 0)
          ]
        }
      }
      {
        name: 'vm-subnet'
        properties: {
          addressPrefixes: [
            cidrSubnet(addressPrefix, 24, 1)
          ]
        }
      }

      {
        name: 'logic-app-subnet'
        properties: {
          addressPrefixes: [
            cidrSubnet(addressPrefix, 24, 2)
          ]
          delegations: [
            {
              name: 'asp-delegation'
              type: 'Microsoft.Web/serverfarms'
              properties: {
                serviceName: 'Microsoft.Web/serverfarms'
              }
            }
          ]
        }
      }
      {
        name: 'func-app-subnet'
        properties: {
          addressPrefixes: [
            cidrSubnet(addressPrefix, 24, 3)
          ]
          delegations: [
            {
              name: 'asp-delegation'
              type: 'Microsoft.Web/serverfarms'
              properties: {
                serviceName: 'Microsoft.Web/serverfarms'
              }
            }
          ]
        }
      }
      {
        name: 'plink-subnet'
        properties: {
          addressPrefixes: [
            cidrSubnet(addressPrefix, 24, 4)
          ]
        }
      }
    ]
  }
}

output id string = vnet.id
output name string = vnet.name
output subnets array = vnet.properties.subnets
