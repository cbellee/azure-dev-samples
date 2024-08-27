param aksClusterName string
param location string
param kubernetesVersion string
param aksEnableRBAC bool
param aksDnsPrefix string
param adminGroupObjectId string
param maxPodsPerNode int
param maxNodeCount int
param minNodeCount int
param aksAgentCount int
param aksAgentOsDiskSizeGB int
param aksAgentVMSize string
param aksServiceCIDR string
param aksDnsServiceIP string
param aksDockerBridgeCIDR string
param vnetName string
param kubernetesSubnetName string
param kubeletManagedIdentityId string
param kubeletManagedIdentityPrincipalId string
param kubeletManagedIdentityClientId string

resource aksCluster 'Microsoft.ContainerService/managedClusters@2023-03-02-preview' = {
  name: aksClusterName
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${kubeletManagedIdentityId}': {}
    }
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
    identityProfile: {
      kubeletidentity: {
        objectId: kubeletManagedIdentityPrincipalId
        resourceId: kubeletManagedIdentityId
        clientId: kubeletManagedIdentityClientId
      }
    }
  }
}

output nodeResourceGroupName string = aksCluster.properties.nodeResourceGroup
output kubeletIdentityObjectId string = aksCluster.properties.identityProfile.kubeletidentity.objectId
output aksClusterName string = aksCluster.name
