param location string
@description('Optional DNS suffix to use with hosted Kubernetes API server FQDN.')
param aksDnsPrefix string = 'aks'

param availabilityZones array

@description('Disk size (in GB) to provision for each of the agent pool nodes. This value ranges from 30 to 1023.')
@minValue(30)
@maxValue(1023)
param aksAgentOsDiskSizeGB int = 100

@description('resource base name')
param baseName string 

@minValue(10)
@maxValue(250)
param maxPods int = 50

@allowed([
  'azure'
  'kubenet'
])
param networkPlugin string = 'azure'

@description('The default number of agent nodes for the cluster.')
@minValue(1)
@maxValue(100)
param aksNodeCount int = 3

@minValue(1)
@maxValue(100)
@description('The minimum number of agent nodes for the cluster.')
param aksMinNodeCount int = 1

@minValue(1)
@maxValue(100)
@description('The minimum number of agent nodes for the cluster.')
param aksMaxNodeCount int = 10

@description('The size of the Virtual Machine.')
param aksNodeVMSize string = 'Standard_D4s_v3'

@description('The version of Kubernetes.')
param aksVersion string

@description('A CIDR notation IP range from which to assign service cluster IPs.')
param aksServiceCIDR string = '10.100.0.0/16'

@description('Containers DNS server IP address.')
param aksDnsServiceIP string = '10.100.0.10'

@description('Enable RBAC on the AKS cluster.')
param aksEnableRBAC bool = true

@allowed([
  'Internal'
  'External'
])
param istioGatewayMode string = 'External'

param logAnalyticsWorkspaceId string
param enableAutoScaling bool = true
param aksSystemSubnetId string
param aksUserSubnetId string
param addOns object
param enablePodSecurityPolicy bool = false
param enablePrivateCluster bool = false
param enableIstioServiceMesh bool = false

var clusterName = 'aks-${baseName}'

var serviceMeshConfig =  {
  mode: 'Istio'
  istio: {
    revisions: [
     'asm-1-20'   
    ]
    components: {
      ingressGateways: [
        {
          enabled: true
          mode: istioGatewayMode
        }
      ]
    }
  }
}

var aksClusterId = aksCluster.id

resource aksCluster 'Microsoft.ContainerService/managedClusters@2024-03-02-preview' = {
  name: clusterName
  location: location
  sku: {
    name: 'Base'
    tier: 'Standard'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    kubernetesVersion: aksVersion
    enableRBAC: aksEnableRBAC
    enablePodSecurityPolicy: enablePodSecurityPolicy
    dnsPrefix: aksDnsPrefix
    addonProfiles: addOns
    apiServerAccessProfile: {
      enablePrivateCluster: enablePrivateCluster
    }
    agentPoolProfiles: [
      {
        name: 'system'
        mode: 'System'
        availabilityZones: availabilityZones
        count: 1
        enableAutoScaling: true
        minCount: aksMinNodeCount
        maxCount: aksMaxNodeCount
        maxPods: maxPods
        osDiskSizeGB: aksAgentOsDiskSizeGB
        nodeTaints: [
          'CriticalAddonsOnly=true:NoSchedule'
        ]
        osType: 'Linux'
        type: 'VirtualMachineScaleSets'
        vnetSubnetID: aksSystemSubnetId
        vmSize: aksNodeVMSize
        osDiskType: 'Ephemeral'
      }
      {
        name: 'linux'
        mode: 'User'
        availabilityZones: availabilityZones
        osDiskSizeGB: aksAgentOsDiskSizeGB
        count: aksNodeCount
        minCount: aksMinNodeCount
        maxCount: aksMaxNodeCount
        vmSize: aksNodeVMSize
        osType: 'Linux'
        osDiskType: 'Ephemeral'
        type: 'VirtualMachineScaleSets'
        vnetSubnetID: aksUserSubnetId
        enableAutoScaling: enableAutoScaling
        maxPods: maxPods
      }
    ]
    serviceMeshProfile: enableIstioServiceMesh ? serviceMeshConfig : null
    networkProfile: {
      networkPlugin: networkPlugin
      serviceCidr: aksServiceCIDR
      dnsServiceIP: aksDnsServiceIP
      loadBalancerSku: 'standard'
      networkPluginMode: 'overlay'
    }
    /* aadProfile: {
      managed: true
      enableAzureRBAC: true
      tenantID: subscription().tenantId
      adminGroupObjectIDs: [
        adminGroupObjectID
      ]
    } */
  }
}

resource aksDiagnostics 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  scope: aksCluster
  name: 'aksDiagnosticSettings'
  properties: {
    workspaceId: logAnalyticsWorkspaceId
    logs: [
      {
        category: 'kube-apiserver'
        enabled: true
        
      }
      {
        category: 'kube-audit'
        enabled: true
        
      }
      {
        category: 'kube-audit-admin'
        enabled: true
        
      }
      {
        category: 'kube-controller-manager'
        enabled: true
        
      }
      {
        category: 'kube-scheduler'
        enabled: true
        
      }
      {
        category: 'cluster-autoscaler'
        enabled: true
        
      }
      {
        category: 'guard'
        enabled: true
        
      }
    ]
    metrics: [
      {
        category: 'AllMetrics'
        enabled: true
        
      }
    ]
  }
}

output aksControlPlaneFQDN string = reference('Microsoft.ContainerService/managedClusters/${clusterName}').fqdn
output aksApiServerUri string = '${reference(aksClusterId, '2018-03-31').fqdn}:443'
output aksClusterName string = clusterName
output systemManagedIdentityPrincipalId string = aksCluster.identity.principalId
