# create infrastructure
RG_NAME="apim-demo-rg"
LOCATION='australiaeast'
EMAIL_ADDRESS='cbellee@kainiindustries.net'
VERSION='0.0.1'
TENANT_ID='3d49be6f-6e38-404b-bbd4-f61c1a2d25bf'

source ./.env

# create resource group
az group create --name $RG_NAME --location $LOCATION

# create ACR
az deployment group create \
    --name 'acr-deployment' \
    --resource-group $RG_NAME \
    --template-file ./infra/modules/acr.bicep \
    --parameters location=$LOCATION \
    --parameters sku='Basic'

ACR_NAME=$(az deployment group show --name 'acr-deployment' --resource-group $RG_NAME --query "properties.outputs.name.value" --output tsv)

CUSTOMER_IMAGE_NAME="$ACR_NAME.azurecr.io/customer:$VERSION"
FLIGHT_IMAGE_NAME="$ACR_NAME.azurecr.io/flight:$VERSION"
BOOKING_IMAGE_NAME="$ACR_NAME.azurecr.io/booking:$VERSION"

az acr login -n $ACR_NAME

# build images in ACR concurrently
az acr build -t $CUSTOMER_IMAGE_NAME -r $ACR_NAME --build-arg BUILD_TARGET=customer --build-arg PORT=8081 ./app &
az acr build -t $FLIGHT_IMAGE_NAME -r $ACR_NAME --build-arg BUILD_TARGET=flight --build-arg PORT=8082 ./app &
az acr build -t $BOOKING_IMAGE_NAME -r $ACR_NAME --build-arg BUILD_TARGET=booking --build-arg PORT=8083 ./app &

APPS='[{"port":"8081","name":"customer","image":"'$CUSTOMER_IMAGE_NAME'"},{"port":"8082","name":"flight","image":"'$FLIGHT_IMAGE_NAME'"},{"port":"8083","name":"booking","image":"'$BOOKING_IMAGE_NAME'"}]'
COLLECTIONS='[{"name":"customers","partitionKey":"id"},{"name":"flights","partitionKey":"id"},{"name":"bookings","partitionKey":"id"}]'

az deployment group create \
    --name 'infra-deployment' \
    --resource-group $RG_NAME \
    --template-file ./infra/main.bicep \
    --parameters location=$LOCATION \
    --parameters acrName=$ACR_NAME \
    --parameters emailAddress=$EMAIL_ADDRESS \
    --parameters apps=$APPS \
    --parameters collections=$COLLECTIONS

# get deployment outputs
export MONGO_DB_CXN=$(az deployment group show --name 'infra-deployment' --resource-group $RG_NAME --query "properties.outputs.mongoDbCxn.value" --output tsv)
echo "MONGO_DB_CXN=$MONGO_DB_CXN" > ./app/.env
export APP_URLS=$(az deployment group show --name 'infra-deployment' --resource-group $RG_NAME --query "properties.outputs.apps.value" --output json)
export MONGO_DB_NAME=$(az deployment group show --name 'infra-deployment' --resource-group $RG_NAME --query "properties.outputs.mongoDbName.value" --output tsv)
export MONGO_DB_COLLECTIONS=$(az deployment group show --name 'infra-deployment' --resource-group $RG_NAME --query "properties.outputs.mongoDbCollections.value" --output json)
export APIM_BASE_URL=$(az deployment group show --name 'infra-deployment' --resource-group $RG_NAME --query "properties.outputs.apimBaseUrl.value" --output tsv)

echo $APP_URLS  | jq .[].fqdn -r

# get access token
URI='https://login.microsoftonline.com/3d49be6f-6e38-404b-bbd4-f61c1a2d25bf/oauth2/v2.0/token'
ACCESS_TOKEN=$(curl -X POST -H 'Content-Type: application/x-www-form-urlencoded' --data $TOKEN_URL $URI | jq -r '.access_token')

# without an access token, access is denied
curl $APIM_BASE_URL/customer-api/customers -v | jq
curl $APIM_BASE_URL/booking-api/bookings -v | jq
curl $APIM_BASE_URL/flight-api/flights -v | jq

# with access token
curl -H "Authorization: Bearer $ACCESS_TOKEN" $APIM_BASE_URL/customer-api/customers -v | jq
curl -H "Authorization: Bearer $ACCESS_TOKEN" $APIM_BASE_URL/flight-api/flights -v | jq
curl -H "Authorization: Bearer $ACCESS_TOKEN" $APIM_BASE_URL/booking-api/bookings -v | jq



: '
# https://json-generator.com/

[
  '{{repeat(100)}}',
  {
    firstName: '{{firstName()}}',
    lastName: '{{surname()}}',
    streetAddress: '{{integer(100, 999)}} {{street()}}',
    city: '{{random("Sydney","Melbourne","Brisbane","Adelaide","Perth","Hobart","Darwin","Canberra")}}',
    state: '{{random("NSW","VIC","QLD","SA","WA","TAS","NT","ACT")}}',
    zip: '{{integer(2000,3000)}}',
    country: 'Australia'
  }
]

[
  '{{repeat(100)}}',
  {
    flightNumber: '{{random("QF","BA","EM","NZ")}}{{integer(100,300)}}',
    carrier: '{{random("Qantas","British Airways","Emirates","Air New Zealand")}}',
    origin: '{{random("Sydney","Melbourne","London","Los Angeles","Mexico City","Paris","Berlin","Madrid")}}',
    destination: '{{random("Adelaide","Perth","Glasgow","Amsterdam","Oslo","NewYork","HongKong","Tokyo")}}',
    departureDate: '{{date(new Date(2024,5,0), new Date(2024,6,0), "YYYY-MM-dd-hh-mm")}}',
    arrivalDate: '{{date(new Date(2024,5,0), new Date(2024,6,0), "YYYY-MM-dd-hh-mm")}}',
    price: '{{integer(700,3000)}}'
  }
]
'