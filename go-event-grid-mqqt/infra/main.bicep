param location string = resourceGroup().location
param prefix string = 'go-event-grid-mqqt'
param encodedIntermediateCaCertificate string
param topicSpaceName string
param topicTemplate string
param clientAuthName string
param tags object = {
  environment: 'dev'
}

resource uami 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-07-31-preview' = {
  name: '${prefix}-uami'
  location: location
  tags: tags
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
      '${uami.id}': {}
    }
  }
  properties: {
    isZoneRedundant: true
    topicsConfiguration: {
      inputSchema: 'CloudEventSchemaV1_0'
    }
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

output topicSpaceHostName string = eventGridNamespace.properties.topicSpacesConfiguration.hostname
