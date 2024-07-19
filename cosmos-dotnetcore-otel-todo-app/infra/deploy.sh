# create infrastructure
RG_NAME="aspnet-ai-otel-demo-rg"
LOCATION='australiaeast'
EMAIL_ADDRESS='cbellee@microsoft.com'

# create resource group
az group create --name $RG_NAME --location $LOCATION

ACR_NAME=$(az deployment group create \
    --name 'acr-deployment' \
    --resource-group $RG_NAME \
    --template-file ./acr.bicep \
    --parameters location=$LOCATION \
    --query "properties.outputs.name.value" \
    --output tsv)

IMAGE_NAME="$ACR_NAME.azurecr.io/todoapi:v3"
az acr login -n $ACR_NAME
cd ../src
az acr build -t $IMAGE_NAME -r $ACR_NAME -f Dockerfile .
cd ../infra

az deployment group create \
    --name 'infra-deployment' \
    --resource-group $RG_NAME \
    --template-file ./deploy.bicep \
    --parameters location=$LOCATION acrName=$ACR_NAME imageName=$IMAGE_NAME emailAddress=$EMAIL_ADDRESS

APP_FQDN=$(az deployment group show --name 'infra-deployment' --resource-group $RG_NAME --query "properties.outputs.appFqdn.value" --output tsv)
