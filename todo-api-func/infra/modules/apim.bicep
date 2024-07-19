param apimSku object = {
  name: 'Developer'
  capacity: 1
}

param subnetId string
param location string

var suffix = uniqueString(resourceGroup().id)
var apimName = 'api-mgmt-${suffix}'

resource apim 'Microsoft.ApiManagement/service@2021-01-01-preview' = {
  name: apimName
  location: location
  sku: apimSku
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    publisherEmail: 'cbellee@microsoft.com'
    publisherName: 'KainiIndustries'
    notificationSenderEmail: 'apim-noreply@mail.windowsazure.com'
    virtualNetworkConfiguration: {
      subnetResourceId: subnetId
    }
    customProperties: {
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls10': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls11': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Ssl30': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TripleDes168': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls10': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls11': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Ssl30': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Protocols.Server.Http2': 'False'
    }
    virtualNetworkType: 'External'
  }
  dependsOn: []
}

output apimFqdn string = apim.properties.gatewayUrl
output apimName string = apim.name
