param apimName string
param apiName string
param apiPath string
param backendUri string
param openApiYaml string
param displayName string
// param xmlPolicy string
param isSubscriptionRequired bool = false

resource existingApim 'Microsoft.ApiManagement/service@2021-12-01-preview' existing = {
  name: apimName
}

resource openApi 'Microsoft.ApiManagement/service/apis@2021-12-01-preview' = {
  parent: existingApim
  name: apiName
  properties: {
    displayName: displayName
    serviceUrl: backendUri
    apiType: 'http'
    format: 'openapi'
    path: apiPath
    protocols: [
      'https'
    ]
    isCurrent: true
    subscriptionRequired: isSubscriptionRequired
    type: 'http'
    value: openApiYaml
  }
}

/* resource openApiPolicy 'Microsoft.ApiManagement/service/apis/policies@2021-12-01-preview' = {
  name: 'policy'
  parent: openApi
  properties: {
    format: 'xml'
    value: xmlPolicy
  }
}
 */
