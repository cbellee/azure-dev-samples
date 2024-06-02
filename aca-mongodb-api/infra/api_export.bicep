param apimName string

resource apim 'Microsoft.ApiManagement/service@2023-05-01-preview' = {
  name: apimName
  location: resourceGroup().location
  sku: {
    name: 'Consumption'
    capacity: 0
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    publisherEmail: 'cbellee@kainiindustries.net'
    publisherName: 'cbellee@kainiindustries.net'
    notificationSenderEmail: 'apimgmt-noreply@mail.windowsazure.com'
    hostnameConfigurations: [
      {
        type: 'Proxy'
        hostName: 'apim-dev-p5at4gx2mnw7y.azure-api.net'
        negotiateClientCertificate: false
        defaultSslBinding: true
        certificateSource: 'BuiltIn'
      }
    ]
    customProperties: {
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls10': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls11': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls10': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Tls11': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Backend.Protocols.Ssl30': 'False'
      'Microsoft.WindowsAzure.ApiManagement.Gateway.Protocols.Server.Http2': 'False'
    }
    virtualNetworkType: 'None'
    disableGateway: false
    natGatewayState: 'Unsupported'
    apiVersionConstraint: {}
    publicNetworkAccess: 'Enabled'
    legacyPortalStatus: 'Enabled'
    developerPortalStatus: 'Enabled'
  }
}

resource go_flight_api 'Microsoft.ApiManagement/service/apis@2023-05-01-preview' = {
  parent: apim
  name: 'go-flight-api'
  properties: {
    displayName: 'Go Flight API'
    subscriptionRequired: false
    path: 'api'
    protocols: [
      'http'
      'https'
    ]
  }
}

resource apim_dev_p5at4gx2mnw7y_policy 'Microsoft.ApiManagement/service/policies@2023-05-01-preview' = {
  parent: apim
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - Only the <forward-request> policy element can appear within the <backend> section element.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy position the cursor at the desired insertion point and click on the round button associated with the policy.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n-->\r\n<policies>\r\n  <inbound></inbound>\r\n  <backend>\r\n    <forward-request />\r\n  </backend>\r\n  <outbound></outbound>\r\n</policies>'
    format: 'xml'
  }
}

resource apim_dev_p5at4gx2mnw7y_master 'Microsoft.ApiManagement/service/subscriptions@2023-05-01-preview' = {
  parent: apim
  name: 'master'
  properties: {
    scope: '${apim.id}/'
    displayName: 'Built-in all-access subscription'
    state: 'active'
    allowTracing: true
  }
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_delete_booking_id_id 'Microsoft.ApiManagement/service/apis/operations@2023-05-01-preview' = {
  parent: go_flight_api
  name: 'delete-booking-id-id'
  properties: {
    displayName: 'Delete a booking'
    method: 'DELETE'
    urlTemplate: '/booking?id={id}'
    templateParameters: [
      {
        name: 'id'
        type: 'string'
        required: true
        values: []
        schemaId: '664697f0313e2f28a4270cb8'
        typeName: 'BookingDeleteRequest'
      }
    ]
    description: 'Delete a booking'
    responses: [
      {
        statusCode: 204
        description: 'Booking deleted'
        representations: []
        headers: []
      }
      {
        statusCode: 404
        description: 'Booking not found'
        representations: []
        headers: []
      }
      {
        statusCode: 500
        description: 'Unable to delete booking'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_delete_customer_id_id 'Microsoft.ApiManagement/service/apis/operations@2023-05-01-preview' = {
  parent: go_flight_api
  name: 'delete-customer-id-id'
  properties: {
    displayName: 'Delete a customer'
    method: 'DELETE'
    urlTemplate: '/customer?id={id}'
    templateParameters: [
      {
        name: 'id'
        type: 'string'
        required: true
        values: []
        schemaId: '664697f0313e2f28a4270cb8'
        typeName: 'CustomerDeleteRequest'
      }
    ]
    description: 'Delete a customer'
    responses: [
      {
        statusCode: 200
        description: 'Customer deleted'
        representations: []
        headers: []
      }
      {
        statusCode: 404
        description: 'Customer not found'
        representations: []
        headers: []
      }
      {
        statusCode: 500
        description: 'Unable to delete customer'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_delete_flight_id_id 'Microsoft.ApiManagement/service/apis/operations@2023-05-01-preview' = {
  parent: go_flight_api
  name: 'delete-flight-id-id'
  properties: {
    displayName: 'Delete a flight'
    method: 'DELETE'
    urlTemplate: '/flight?id={id}'
    templateParameters: [
      {
        name: 'id'
        type: 'string'
        required: true
        values: []
        schemaId: '664697f0313e2f28a4270cb8'
        typeName: 'FlightDeleteRequest'
      }
    ]
    description: 'Delete a flight'
    responses: [
      {
        statusCode: 200
        description: 'Flight deleted'
        representations: []
        headers: []
      }
      {
        statusCode: 404
        description: 'Flight not found'
        representations: []
        headers: []
      }
      {
        statusCode: 500
        description: 'Unable to delete flight'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_get_booking_id_id 'Microsoft.ApiManagement/service/apis/operations@2023-05-01-preview' = {
  parent: go_flight_api
  name: 'get-booking-id-id'
  properties: {
    displayName: 'Get a booking'
    method: 'GET'
    urlTemplate: '/booking?id={id}'
    templateParameters: [
      {
        name: 'id'
        type: 'string'
        required: true
        values: []
        schemaId: '664697f0313e2f28a4270cb8'
        typeName: 'BookingGetRequest'
      }
    ]
    description: 'Get a booking'
    responses: [
      {
        statusCode: 200
        description: 'Booking details'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: {}
              }
            }
            schemaId: '664697f0313e2f28a4270cb8'
            typeName: 'Booking'
          }
        ]
        headers: []
      }
      {
        statusCode: 404
        description: 'Booking not found'
        representations: []
        headers: []
      }
      {
        statusCode: 500
        description: 'Unable to retrieve booking'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_get_bookings 'Microsoft.ApiManagement/service/apis/operations@2023-05-01-preview' = {
  parent: go_flight_api
  name: 'get-bookings'
  properties: {
    displayName: 'Get all bookings'
    method: 'GET'
    urlTemplate: '/bookings'
    templateParameters: []
    description: 'Get all bookings'
    responses: [
      {
        statusCode: 200
        description: 'A list of bookings'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: [
                  {
                    id: 'string'
                    customerId: 'string'
                    flightId: 'string'
                    date: 'string'
                  }
                ]
              }
            }
            schemaId: '664697f0313e2f28a4270cb8'
            typeName: 'BookingsGet200ApplicationJsonResponse'
          }
        ]
        headers: []
      }
      {
        statusCode: 500
        description: 'Unable to retrieve bookings'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_get_customer_id_id 'Microsoft.ApiManagement/service/apis/operations@2023-05-01-preview' = {
  parent: go_flight_api
  name: 'get-customer-id-id'
  properties: {
    displayName: 'Get a customer'
    method: 'GET'
    urlTemplate: '/customer?id={id}'
    templateParameters: [
      {
        name: 'id'
        type: 'string'
        required: true
        values: []
        schemaId: '664697f0313e2f28a4270cb8'
        typeName: 'CustomerGetRequest'
      }
    ]
    description: 'Get a customer'
    responses: [
      {
        statusCode: 200
        description: 'Customer details'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: {}
              }
            }
            schemaId: '664697f0313e2f28a4270cb8'
            typeName: 'Customer'
          }
        ]
        headers: []
      }
      {
        statusCode: 404
        description: 'Customer not found'
        representations: []
        headers: []
      }
      {
        statusCode: 500
        description: 'Unable to retrieve customer'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_get_customers 'Microsoft.ApiManagement/service/apis/operations@2023-05-01-preview' = {
  parent: go_flight_api
  name: 'get-customers'
  properties: {
    displayName: 'Get all customers'
    method: 'GET'
    urlTemplate: '/customers'
    templateParameters: []
    description: 'Get all customers'
    responses: [
      {
        statusCode: 200
        description: 'A list of customers'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: [
                  {
                    id: 'string'
                    firstName: 'string'
                    lastName: 'string'
                    streetAddress: 'string'
                    city: 'string'
                    zip: 'string'
                    country: 'string'
                  }
                ]
              }
            }
            schemaId: '664697f0313e2f28a4270cb8'
            typeName: 'CustomersGet200ApplicationJsonResponse'
          }
        ]
        headers: []
      }
      {
        statusCode: 500
        description: 'Unable to retrieve customers'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_get_flight_id_id 'Microsoft.ApiManagement/service/apis/operations@2023-05-01-preview' = {
  parent: go_flight_api
  name: 'get-flight-id-id'
  properties: {
    displayName: 'Get a flight'
    method: 'GET'
    urlTemplate: '/flight?id={id}'
    templateParameters: [
      {
        name: 'id'
        type: 'string'
        required: true
        values: []
        schemaId: '664697f0313e2f28a4270cb8'
        typeName: 'FlightGetRequest'
      }
    ]
    description: 'Get a flight'
    responses: [
      {
        statusCode: 200
        description: 'Flight details'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: {}
              }
            }
            schemaId: '664697f0313e2f28a4270cb8'
            typeName: 'Flight'
          }
        ]
        headers: []
      }
      {
        statusCode: 404
        description: 'Flight not found'
        representations: []
        headers: []
      }
      {
        statusCode: 500
        description: 'Unable to retrieve flight'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_get_flights 'Microsoft.ApiManagement/service/apis/operations@2023-05-01-preview' = {
  parent: go_flight_api
  name: 'get-flights'
  properties: {
    displayName: 'Get all flights'
    method: 'GET'
    urlTemplate: '/flights'
    templateParameters: []
    description: 'Get all flights'
    responses: [
      {
        statusCode: 200
        description: 'A list of flights'
        representations: [
          {
            contentType: 'application/json'
            examples: {
              default: {
                value: [
                  {
                    id: 'string'
                    origin: 'string'
                    destination: 'string'
                    departureDate: 'string'
                    arrivalDate: 'string'
                    carrierId: 'string'
                    carrierName: 'string'
                    price: 0
                  }
                ]
              }
            }
            schemaId: '664697f0313e2f28a4270cb8'
            typeName: 'FlightsGet200ApplicationJsonResponse'
          }
        ]
        headers: []
      }
      {
        statusCode: 500
        description: 'Unable to retrieve flights'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_post_booking 'Microsoft.ApiManagement/service/apis/operations@2023-05-01-preview' = {
  parent: go_flight_api
  name: 'post-booking'
  properties: {
    displayName: 'Create a new booking'
    method: 'POST'
    urlTemplate: '/booking'
    templateParameters: []
    description: 'Create a new booking'
    request: {
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'application/json'
          examples: {
            default: {
              value: {}
            }
          }
          schemaId: '664697f0313e2f28a4270cb8'
          typeName: 'Booking'
        }
      ]
    }
    responses: [
      {
        statusCode: 201
        description: 'Booking created'
        representations: []
        headers: []
      }
      {
        statusCode: 400
        description: 'Booking already exists'
        representations: []
        headers: []
      }
      {
        statusCode: 500
        description: 'Unable to insert booking'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_post_customer 'Microsoft.ApiManagement/service/apis/operations@2023-05-01-preview' = {
  parent: go_flight_api
  name: 'post-customer'
  properties: {
    displayName: 'Create a new customer'
    method: 'POST'
    urlTemplate: '/customer'
    templateParameters: []
    description: 'Create a new customer'
    request: {
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'application/json'
          examples: {
            default: {
              value: {}
            }
          }
          schemaId: '664697f0313e2f28a4270cb8'
          typeName: 'Customer'
        }
      ]
    }
    responses: [
      {
        statusCode: 201
        description: 'Customer created'
        representations: []
        headers: []
      }
      {
        statusCode: 400
        description: 'Customer already exists'
        representations: []
        headers: []
      }
      {
        statusCode: 500
        description: 'Unable to insert customer'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_post_flight 'Microsoft.ApiManagement/service/apis/operations@2023-05-01-preview' = {
  parent: go_flight_api
  name: 'post-flight'
  properties: {
    displayName: 'Create a new flight'
    method: 'POST'
    urlTemplate: '/flight'
    templateParameters: []
    description: 'Create a new flight'
    request: {
      queryParameters: []
      headers: []
      representations: [
        {
          contentType: 'application/json'
          examples: {
            default: {
              value: {}
            }
          }
          schemaId: '664697f0313e2f28a4270cb8'
          typeName: 'Flight'
        }
      ]
    }
    responses: [
      {
        statusCode: 201
        description: 'Flight created'
        representations: []
        headers: []
      }
      {
        statusCode: 400
        description: 'Flight already exists'
        representations: []
        headers: []
      }
      {
        statusCode: 500
        description: 'Unable to insert flight'
        representations: []
        headers: []
      }
    ]
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_policy 'Microsoft.ApiManagement/service/apis/policies@2023-05-01-preview' = {
  parent: go_flight_api
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <validate-jwt header-name="Authorization" failed-validation-httpcode="401" failed-validation-error-message="Unauthorized. Access token is missing or invalid.">\r\n      <openid-config url="https://login.microsoftonline.com/3d49be6f-6e38-404b-bbd4-f61c1a2d25bf/v2.0/.well-known/openid-configuration" />\r\n      <required-claims>\r\n        <claim name="aud">\r\n          <value>bb5d8da4-7c25-4907-bffb-e76648d808ca</value>\r\n        </claim>\r\n      </required-claims>\r\n    </validate-jwt>\r\n    <base />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_664697f0313e2f28a4270cb8 'Microsoft.ApiManagement/service/apis/schemas@2023-05-01-preview' = {
  parent: go_flight_api
  name: '664697f0313e2f28a4270cb8'
  properties: {
    contentType: 'application/vnd.oai.openapi.components+json'
    document: {}
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_default 'Microsoft.ApiManagement/service/apis/wikis@2023-05-01-preview' = {
  parent: go_flight_api
  name: 'default'
  properties: {
    documents: []
  }
  dependsOn: [
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_delete_booking_id_id_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2023-05-01-preview' = {
  parent: apim_dev_p5at4gx2mnw7y_go_flight_api_delete_booking_id_id
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://booking.kindcoast-48b03fbf.australiaeast.azurecontainerapps.io" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [
    go_flight_api
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_delete_customer_id_id_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2023-05-01-preview' = {
  parent: apim_dev_p5at4gx2mnw7y_go_flight_api_delete_customer_id_id
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://customer.kindcoast-48b03fbf.australiaeast.azurecontainerapps.io" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [
    go_flight_api
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_delete_flight_id_id_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2023-05-01-preview' = {
  parent: apim_dev_p5at4gx2mnw7y_go_flight_api_delete_flight_id_id
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://flight.kindcoast-48b03fbf.australiaeast.azurecontainerapps.io" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [
    go_flight_api
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_get_booking_id_id_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2023-05-01-preview' = {
  parent: apim_dev_p5at4gx2mnw7y_go_flight_api_get_booking_id_id
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://booking.kindcoast-48b03fbf.australiaeast.azurecontainerapps.io" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [
    go_flight_api
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_get_bookings_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2023-05-01-preview' = {
  parent: apim_dev_p5at4gx2mnw7y_go_flight_api_get_bookings
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://booking.kindcoast-48b03fbf.australiaeast.azurecontainerapps.io" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [
    go_flight_api
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_get_customer_id_id_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2023-05-01-preview' = {
  parent: apim_dev_p5at4gx2mnw7y_go_flight_api_get_customer_id_id
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://customer.kindcoast-48b03fbf.australiaeast.azurecontainerapps.io" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [
    go_flight_api
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_get_customers_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2023-05-01-preview' = {
  parent: apim_dev_p5at4gx2mnw7y_go_flight_api_get_customers
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://customer.kindcoast-48b03fbf.australiaeast.azurecontainerapps.io" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [
    go_flight_api
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_get_flight_id_id_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2023-05-01-preview' = {
  parent: apim_dev_p5at4gx2mnw7y_go_flight_api_get_flight_id_id
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://flight.kindcoast-48b03fbf.australiaeast.azurecontainerapps.io" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [
    go_flight_api
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_get_flights_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2023-05-01-preview' = {
  parent: apim_dev_p5at4gx2mnw7y_go_flight_api_get_flights
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://flight.kindcoast-48b03fbf.australiaeast.azurecontainerapps.io" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [
    go_flight_api
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_post_booking_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2023-05-01-preview' = {
  parent: apim_dev_p5at4gx2mnw7y_go_flight_api_post_booking
  name: 'policy'
  properties: {
    value: '<!--\r\n    - Policies are applied in the order they appear.\r\n    - Position <base/> inside a section to inherit policies from the outer scope.\r\n    - Comments within policies are not preserved.\r\n-->\r\n<!-- Add policies as children to the <inbound>, <outbound>, <backend>, and <on-error> elements -->\r\n<policies>\r\n  <!-- Throttle, authorize, validate, cache, or transform the requests -->\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://booking.kindcoast-48b03fbf.australiaeast.azurecontainerapps.io" />\r\n  </inbound>\r\n  <!-- Control if and how the requests are forwarded to services  -->\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <!-- Customize the responses -->\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <!-- Handle exceptions and customize error responses  -->\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [
    go_flight_api
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_post_customer_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2023-05-01-preview' = {
  parent: apim_dev_p5at4gx2mnw7y_go_flight_api_post_customer
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://customer.kindcoast-48b03fbf.australiaeast.azurecontainerapps.io" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [
    go_flight_api
    apim
  ]
}

resource apim_dev_p5at4gx2mnw7y_go_flight_api_post_flight_policy 'Microsoft.ApiManagement/service/apis/operations/policies@2023-05-01-preview' = {
  parent: apim_dev_p5at4gx2mnw7y_go_flight_api_post_flight
  name: 'policy'
  properties: {
    value: '<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy, place the cursor at the desired insertion point and select a policy from the sidebar.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Position the <base> element within a section element to inherit all policies from the corresponding section element in the enclosing scope.\r\n    - Remove the <base> element to prevent inheriting policies from the corresponding section element in the enclosing scope.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n    - Comments within policy elements are not supported and may disappear. Place your comments between policy elements or at a higher level scope.\r\n-->\r\n<policies>\r\n  <inbound>\r\n    <base />\r\n    <set-backend-service base-url="https://flight.kindcoast-48b03fbf.australiaeast.azurecontainerapps.io" />\r\n  </inbound>\r\n  <backend>\r\n    <base />\r\n  </backend>\r\n  <outbound>\r\n    <base />\r\n  </outbound>\r\n  <on-error>\r\n    <base />\r\n  </on-error>\r\n</policies>'
    format: 'xml'
  }
  dependsOn: [
    go_flight_api
    apim
  ]
}
