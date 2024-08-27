param location string
param minNodeCount int = 1
param maxNodeCount int = 3
param maxPodsPerNode int = 50 
param adminGroupObjectId string
param retentionInDays int = 30

@description('Containers DNS server IP address.')
param virtualNetworkAddressPrefix string = '10.0.0.0/8'

@description('Containers DNS server IP address.')
param aksSubnetAddressPrefix string = '10.0.0.0/16'

@description('Containers DNS server IP address.')
param applicationGatewaySubnetAddressPrefix string = '10.1.0.0/16'

@description('Optional DNS prefix to use with hosted Kubernetes API server FQDN.')
param aksDnsPrefix string = 'aks'

@description('Disk size (in GB) to provision for each of the agent pool nodes. This value ranges from 30 to 1023.')
@minValue(30)
@maxValue(1023)
param aksAgentOsDiskSizeGB int = 40

@description('The number of agent nodes for the cluster.')
@minValue(1)
@maxValue(50)
param aksAgentCount int = 3

@description('The size of the Virtual Machine.')
param aksAgentVMSize string = 'Standard_D3_v2'

@description('The version of Kubernetes.')
param kubernetesVersion string = '1.25.6'

@description('A CIDR notation IP range from which to assign service cluster IPs.')
param aksServiceCIDR string = '10.2.0.0/16'

@description('Containers DNS server IP address.')
param aksDnsServiceIP string = '10.2.0.10'

@description('A CIDR notation IP for Docker bridge.')
param aksDockerBridgeCIDR string = '172.17.0.1/16'

@description('Enable RBAC on the AKS cluster.')
param aksEnableRBAC bool = true

@description('The sku of the Application Gateway. Default: WAF_v2 (Detection mode). In order to further customize WAF, use azure portal or cli.')
@allowed([
  'Standard_v2'
  'WAF_v2'
])
param applicationGatewaySku string = 'WAF_v2'

var suffix = substring(replace(guid(resourceGroup().id), '-', ''), 0, 4)
var vnetName = 'virtualnetwork-${suffix}'
var applicationGatewayName = 'applicationgateway-${suffix}'
var acrName = 'acr${suffix}'
var lawName = 'law-${suffix}'
var identityName = 'appgwContrIdentity-${suffix}'
var kubeletManagedIdentityName = 'kubeletManagedIdentity-${suffix}'
var applicationGatewayPublicIpName = 'appgwpublicip-${suffix}'
var kubernetesSubnetName = 'kubesubnet'
var applicationGatewaySubnetName = 'appgwsubnet'
var aksClusterName = 'aks-${suffix}'
var applicationGatewayPublicIpId = applicationGatewayPublicIp.id
var virtualMachineContributorRole = resourceId('Microsoft.Authorization/roleDefinitions', '9980e02c-c2be-4d73-94e8-173b1dc7cf3c')
var networkContributorRole = resourceId('Microsoft.Authorization/roleDefinitions', '4d97b98b-1d4f-4787-a291-c67834d212e7')
var contributorRole =  resourceId('Microsoft.Authorization/roleDefinitions', 'b24988ac-6180-42a0-ab88-20f7382dd24c')
var managedIdentityOperatorRole = resourceId('Microsoft.Authorization/roleDefinitions', 'f1a07417-d97a-45cb-824c-7a7467783830')
var readerRole = resourceId('Microsoft.Authorization/roleDefinitions', 'acdd72a7-3385-48ef-bd42-f606fba81ae7')
var acrPullRole = resourceId('Microsoft.Authorization/roleDefinitions', '7f951dda-4ed3-4680-a7ca-43fe172d538d')

var webApplicationFirewallConfiguration = {
  enabled: 'true'
  firewallMode: 'Detection'
}

resource identity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: identityName
  location: location
}

resource kubeletManagedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: kubeletManagedIdentityName
  location: location
}

resource acr 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' = {
  location: location
  name: acrName
  sku: {
    name: 'Standard'
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        virtualNetworkAddressPrefix
      ]
    }
    subnets: [
      {
        name: kubernetesSubnetName
        properties: {
          addressPrefix: aksSubnetAddressPrefix
        }
      }
      {
        name: applicationGatewaySubnetName
        properties: {
          addressPrefix: applicationGatewaySubnetAddressPrefix
        }
      }
    ]
  }
}

resource applicationGatewayPublicIp 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: applicationGatewayPublicIpName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource applicationGateway 'Microsoft.Network/applicationGateways@2022-11-01' = {
  name: applicationGatewayName
  location: location
  tags: {
    'managed-by-k8s-ingress': 'true'
  }
  properties: {
    sku: {
      name: applicationGatewaySku
      tier: applicationGatewaySku
      capacity: 2
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, applicationGatewaySubnetName)
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGatewayFrontendIP'
        properties: {
          publicIPAddress: {
            id: applicationGatewayPublicIpId
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'httpPort'
        properties: {
          port: 80
        }
      }
      {
        name: 'httpsPort'
        properties: {
          port: 443
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'bepool'
        properties: {
          backendAddresses: []
        }
      }
    ]
    httpListeners: [
      {
        name: 'httpListener'
        properties: {
          protocol: 'Http'
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', applicationGatewayName, 'httpPort')
            
          }
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', applicationGatewayName, 'appGatewayFrontendIP')
          }
        }
      }
    ]
    backendHttpSettingsCollection: [
      {
        name: 'setting'
        properties: {
          port: 80
          protocol: 'Http'
        }
      }
    ]
    requestRoutingRules: [
      {
        name: 'rule1'
        properties: {
          priority: 100
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', applicationGatewayName, 'httpListener')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', applicationGatewayName, 'bepool')
          }
          backendHttpSettings: {
            id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection', applicationGatewayName, 'setting')
          }
        }
      }
    ]
    webApplicationFirewallConfiguration: ((applicationGatewaySku == 'WAF_v2') ? webApplicationFirewallConfiguration : null)
  }
}

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: lawName
  location: location
  properties: {
    retentionInDays: retentionInDays
  }
}

resource appGwyDiagnostics 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'app-gwy-diagnostics'
  scope: applicationGateway
  properties: {
    logs: [
      {
        category: 'ApplicationGatewayAccessLog'
        enabled: true
        retentionPolicy: {
          days: retentionInDays
          enabled: true
        }
      }
      {
        category: 'ApplicationGatewayPerformanceLog'
        enabled: true
        retentionPolicy: {
          days: retentionInDays
          enabled: true
        }
      }
      {
        category: 'ApplicationGatewayFirewallLog'
        enabled: true
        retentionPolicy: {
          days: retentionInDays
          enabled: true
        }
      }
    ]
    metrics: [
      {
        category: 'AllMetrics'
        enabled: true
        retentionPolicy: {
          days: retentionInDays
          enabled: true
        }
      }
    ]
    workspaceId: logAnalyticsWorkspace.id
  }
}


resource managedIdentityOperatorRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(resourceGroup().id, 'aksidentityaccess') 
  scope: resourceGroup()
  properties: {
    roleDefinitionId: managedIdentityOperatorRole
    principalId: kubeletManagedIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}

resource virtualMachineContributorRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name:  guid(resourceGroup().id, 'aksvmssaccess')
  scope: resourceGroup()
  properties: {
    roleDefinitionId: virtualMachineContributorRole
    principalId: aks.outputs.kubeletIdentityObjectId
  }
}

resource applicationGatewayIdentityAccess 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(resourceGroup().id, 'identityappgwaccess')
  scope: applicationGateway
  properties: {
    roleDefinitionId: contributorRole
    principalId: identity.properties.principalId
  }
}

resource applicationGatewayIdentityResourceGroupAccess 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(resourceGroup().id, 'identityrgaccess')
  scope: applicationGateway
  properties: {
    roleDefinitionId: readerRole
    principalId: identity.properties.principalId
  }
}

resource networkContributorRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name:  guid(resourceGroup().id, 'aksvnetaccess')
  scope: resourceGroup()
  properties: {
    roleDefinitionId: networkContributorRole
    principalId: aks.outputs.kubeletIdentityObjectId
  }
}

resource appGwyMidNetworkContributorRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name:  guid(resourceGroup().id, 'appgwynetworkaccess')
  scope: resourceGroup()
  properties: {
    roleDefinitionId: networkContributorRole
    principalId: identity.properties.principalId
  }
}

resource aksAcrPullRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name:  guid(resourceGroup().id, 'aksacrpull')
  scope: resourceGroup()
  properties: {
    roleDefinitionId: acrPullRole
    principalId: aks.outputs.kubeletIdentityObjectId
  }
}

module aks './modules/aks.bicep' = {
  name: 'aksModule'
  params: {
    adminGroupObjectId: adminGroupObjectId
    kubeletManagedIdentityId: kubeletManagedIdentity.id
    kubeletManagedIdentityClientId: kubeletManagedIdentity.properties.clientId
    kubeletManagedIdentityPrincipalId: kubeletManagedIdentity.properties.principalId
    aksAgentCount: aksAgentCount
    aksAgentOsDiskSizeGB: aksAgentOsDiskSizeGB
    aksAgentVMSize: aksAgentVMSize
    aksClusterName: aksClusterName
    aksDnsPrefix: aksDnsPrefix
    aksDnsServiceIP: aksDnsServiceIP
    aksDockerBridgeCIDR: aksDockerBridgeCIDR
    aksEnableRBAC: aksEnableRBAC
    aksServiceCIDR: aksServiceCIDR
    kubernetesSubnetName: kubernetesSubnetName
    kubernetesVersion: kubernetesVersion
    location: location
    maxNodeCount: maxNodeCount
    maxPodsPerNode: maxPodsPerNode
    minNodeCount: minNodeCount
    vnetName: vnetName
  }
}

/* resource aksCluster 'Microsoft.ContainerService/managedClusters@2023-03-02-preview' = {
  name: aksClusterName
  identity: {
    type: 'SystemAssigned'
  }
  sku: {
    name: 'Base'
    tier: 'Standard'
  }
  location: location
  properties: {
    kubernetesVersion: kubernetesVersion
    enableRBAC: aksEnableRBAC
    dnsPrefix: aksDnsPrefix
    aadProfile: {
      enableAzureRBAC: true
      managed: true
      adminGroupObjectIDs: [
        adminGroupObjectId
      ]
    }
    serviceMeshProfile: {
      mode: 'Disabled'
    }
    agentPoolProfiles: [
      {
        mode: 'System'
        name: 'agentpool'
        maxPods: maxPodsPerNode
        osDiskSizeGB: aksAgentOsDiskSizeGB
        enableAutoScaling: true
        maxCount: maxNodeCount
        minCount: minNodeCount
        count: aksAgentCount
        vmSize: aksAgentVMSize
        osType: 'Linux'
        vnetSubnetID: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, kubernetesSubnetName)
      }
    ]
    networkProfile: {
      networkPlugin: 'azure'
      serviceCidr: aksServiceCIDR
      dnsServiceIP: aksDnsServiceIP
      dockerBridgeCidr: aksDockerBridgeCIDR
    }
  }
} */

output subscriptionId string = subscription().subscriptionId
output resourceGroupName string = resourceGroup().name
output applicationGatewayName string = applicationGatewayName
output identityResourceId string = identity.id
output identityClientId string = identity.properties.clientId
output aksClusterName string = aks.outputs.aksClusterName
output acrName string = acr.name

