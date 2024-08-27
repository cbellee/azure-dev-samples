param location string

var suffix = uniqueString(resourceGroup().id)
var name = 'ai-${suffix}'

resource ai 'Microsoft.Insights/components@2020-02-02' = {
  name: name
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

output name string = ai.name
output instrumentationKey string = ai.properties.InstrumentationKey
output connectionString string = ai.properties.ConnectionString

