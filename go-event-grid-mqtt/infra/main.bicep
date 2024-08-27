param location string = resourceGroup().location
param prefix string = 'go-event-grid-mqqt'
param encodedIntermediateCaCertificate string
param topicSpaceName string
param topicTemplate string
param clientAuthName string
param acrName string
param addressPrefix string = '10.0.0.0/16'
param imageName string
param eventGridNamespaceTopicName string
param eventGridTopicName string
param objectId string
param appId string
param containerPort string = '8080'
param eventSubscriptionName string
param routeName string
param handshakePort string = '9000'
param daprEventGridComponentName string

@secure()
param appSecret string
param tags object = {
  environment: 'dev'
}

var eventGridNamespaceUamiName = '${prefix}-uami'
var containerAppUmidName = '${prefix}-container-app-umid'
var containerAppName = '${prefix}-app'
var containerAppEnvironmentName = '${prefix}-container-app-env'
var lawName = '${prefix}-law'
var daprAppId = 'subscriberapp'

resource eventGridNamespaceUami 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-07-31-preview' = {
  name: eventGridNamespaceUamiName
  location: location
  tags: tags
}

resource vnet 'Microsoft.Network/virtualNetworks@2024-01-01' = {
  name: '${prefix}-vnet'
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: 'containerAppSubnet'
        properties: {
          addressPrefix: cidrSubnet(addressPrefix, 23, 0)
        }
      }
    ]
  }
}

resource caCert 'Microsoft.EventGrid/namespaces/caCertificates@2024-06-01-preview' = {
  name: 'Intermediate01'
  parent: eventGridNamespace
  properties: {
    encodedCertificate: encodedIntermediateCaCertificate
  }
}

resource eventGridNamespace 'Microsoft.EventGrid/namespaces@2024-06-01-preview' = {
  name: '${prefix}-eg-ns'
  location: location
  sku: {
    name: 'Standard'
  }
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${eventGridNamespaceUami.id}': {}
    }
  }
  properties: {
    isZoneRedundant: true
    topicsConfiguration: {}
    topicSpacesConfiguration: {
      state: 'Enabled'
    }
  }
  tags: tags
}

resource eventGridClient 'Microsoft.EventGrid/namespaces/clients@2024-06-01-preview' = {
  parent: eventGridNamespace
  name: clientAuthName
  properties: {
    authenticationName: clientAuthName
    state: 'Enabled'
    clientCertificateAuthentication: {
      validationScheme: 'SubjectMatchesAuthenticationName'
    }
    attributes: {
      type: clientAuthName
    }
    description: 'test publisher client'
  }
}

resource eventGridTopicSpaces 'Microsoft.EventGrid/namespaces/topicSpaces@2024-06-01-preview' = {
  parent: eventGridNamespace
  name: topicSpaceName
  properties: {
    topicTemplates: [
      topicTemplate
    ]
  }
}

resource eventGridTopicPublisherPermissionBinding 'Microsoft.EventGrid/namespaces/permissionBindings@2024-06-01-preview' = {
  parent: eventGridNamespace
  name: 'samplesPub'
  properties: {
    clientGroupName: '$all'
    topicSpaceName: topicSpaceName
    permission: 'Publisher'
  }
  dependsOn: [
    eventGridTopicSpaces
  ]
}

resource eventGridTopicSubscriberPermissionBinding 'Microsoft.EventGrid/namespaces/permissionBindings@2024-06-01-preview' = {
  parent: eventGridNamespace
  name: 'samplesSub'
  properties: {
    clientGroupName: '$all'
    topicSpaceName: topicSpaceName
    permission: 'Subscriber'
  }
  dependsOn: [
    eventGridTopicSpaces
  ]
}

resource eventGridTopic 'Microsoft.EventGrid/topics@2024-06-01-preview' = {
  name: eventGridTopicName
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    publicNetworkAccess: 'Enabled'
    inputSchema: 'CloudEventSchemaV1_0'
  }
}

resource containerAppUserManagedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-07-31-preview' = {
  name: containerAppUmidName
  location: location
}

resource acr 'Microsoft.ContainerRegistry/registries@2023-11-01-preview' existing = {
  name: acrName
}

resource eventGridNamespaceTopic 'Microsoft.EventGrid/namespaces/topics@2024-06-01-preview' = {
  name: eventGridNamespaceTopicName
  parent: eventGridNamespace
  properties: {
    inputSchema: 'CloudEventSchemaV1_0'
    publisherType: 'Custom'
    eventRetentionInDays: 7
  }
}

/* resource egEventSubscription 'Microsoft.EventGrid/topics/eventSubscriptions@2024-06-01-preview' = {
  name: eventSubscriptionName
  parent: eventGridTopic
  properties: {
    eventDeliverySchema: 'CloudEventSchemaV1_0'
    destination: {
      endpointType: 'WebHook'
      properties: {
        endpointUrl: 'https://${eventGridSubscriberContainerApp.properties.configuration.ingress.fqdn}/${routeName}'
      }
    }
  }
}
 */
resource acrPullRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(acr.id, containerAppUserManagedIdentity.id, 'AcrPullRole')
  scope: acr
  properties: {
    principalId: containerAppUserManagedIdentity.properties.principalId
    roleDefinitionId: '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/7f951dda-4ed3-4680-a7ca-43fe172d538d'
    principalType: 'ServicePrincipal'
  }
}

resource eventGridSubscriptionContributorRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(eventGridTopic.id, objectId, 'eventGridSubscriptionContributorRole')
  scope: eventGridTopic
  properties: {
    principalId: objectId
    roleDefinitionId: '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/428e0ff0-5e57-4d9c-a221-2c70d0e0a443'
    principalType: 'ServicePrincipal'
  }
}

resource eventGridDataSenderRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(eventGridTopic.id, eventGridNamespaceUami.id, 'eventGridDataSenderRole')
  scope: eventGridTopic
  properties: {
    principalId: eventGridNamespaceUami.properties.principalId
    roleDefinitionId: '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/d5a91429-5739-47e2-a06b-3470a27159e7'
    principalType: 'ServicePrincipal'
  }
}

resource law 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: lawName
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
  }
}

resource containerAppEnv 'Microsoft.App/managedEnvironments@2024-03-01' = {
  name: containerAppEnvironmentName
  location: location
  tags: tags
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: law.properties.customerId
        sharedKey: listKeys(law.id, law.apiVersion).primarySharedKey
      }
    }
    vnetConfiguration: {
      internal: false
      infrastructureSubnetId: vnet.properties.subnets[0].id
    }
  }
}

resource eventGridSubscriberContainerApp 'Microsoft.App/containerApps@2024-03-01' = {
  name: containerAppName
  location: location
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${containerAppUserManagedIdentity.id}': {}
    }
  }
  tags: tags
  properties: {
    configuration: {
      dapr: {
        appId: daprAppId
        appPort: 8080
        appProtocol: 'http'
        enableApiLogging: true
        enabled: true
        logLevel: 'info'
      }
      secrets: []
      registries: [
        {
          identity: containerAppUserManagedIdentity.id
          server: acr.properties.loginServer
        }
      ]
      activeRevisionsMode: 'Single'
      ingress: {
        /* corsPolicy: {
          allowedOrigins: [
            '*'
          ]
          allowCredentials: false
          allowedHeaders: [
            '*'
          ]
          allowedMethods: [
            'GET'
            'POST'
            'PUT'
            'DELETE'
            'OPTIONS'
          ]
        } */
        targetPort: 8080
        external: true
        transport: 'auto'
        additionalPortMappings: [
          {
            external: true
            targetPort: 9000
            exposedPort: 9000
          }
        ]
      }
    }
    environmentId: containerAppEnv.id
    template: {
      containers: [
        {
          name: 'egcontainer'
          image: imageName
          resources: {
            cpu: '0.25'
            memory: '0.5Gi'
          }
          env: [
            {
              name: 'AZURE_CLIENT_ID'
              value: containerAppUserManagedIdentity.properties.clientId
            }
            {
              name: 'PUBSUB_NAME'
              value: daprEventGridComponentName
            }
            {
              name: 'PORT'
              value: containerPort
            }
            {
              name: 'TOPIC_NAME'
              value: eventGridTopic.name
            }
            {
              name: 'ROUTE_NAME'
              value: routeName
            }
          ]
        }
      ]
      scale: {
        maxReplicas: 3
        minReplicas: 1
      }
    }
  }
  dependsOn: [
    acrPullRole
    //eventGridSubscriptionContributorRole
  ]
}

resource daprEventGridComponent 'Microsoft.App/managedEnvironments/daprComponents@2024-03-01' = {
  parent: containerAppEnv
  name: daprEventGridComponentName
  properties: {
    componentType: 'bindings.azure.eventgrid'
    version: 'v1'
    scopes: [
      daprAppId
    ]
    metadata: [
      {
        name: 'azureTenantId'
        value: subscription().tenantId
      }
      {
        name: 'azureSubscriptionId'
        value: subscription().subscriptionId
      }
      {
        name: 'azureClientId'
        value: appId
      }
      {
        name: 'azureClientSecret'
        value: appSecret
      }
      {
        name: 'subscriberEndpoint'
        value: 'https://${eventGridSubscriberContainerApp.properties.configuration.ingress.fqdn}:${handshakePort}/${routeName}'
      }
      {
        name: 'handshakePort'
        value: '9000'
      }
      {
        name: 'scope'
        value: eventGridTopic.id
      }
      {
        name: 'eventSubscriptionName'
        value: eventSubscriptionName
      }
      {
        name: 'direction'
        value: 'input'
      }
    ]
  }
}

output topicSpaceHostName string = eventGridNamespace.properties.topicSpacesConfiguration.hostname
output topicResourceId string = eventGridTopic.id
output appName string = eventGridSubscriberContainerApp.name
