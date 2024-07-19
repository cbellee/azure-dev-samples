location='australiaeast'
prefix='async-blob-copy'
resourceGroup="$prefix-rg"

# deploy resource group
az group create --location $location --name $resourceGroup

# deploy infrastructure
funcName=`az deployment group create \
  --name 'infra-deployment' \
  --resource-group $resourceGroup \
  --template-file deploy.bicep \
  --parameters location=$location \
  --parameters prefix=$prefix \
  --parameters sourceContainerName='src' \
  --parameters destinationContainerName='dst' \
  --query properties.outputs.funcName.value -o tsv`

sourceStorageAccountId=`az deployment group show \
  --resource-group $resourceGroup \
  --name 'infra-deployment' \
  --query properties.outputs.sourceStorageAccountId.value -o tsv`

cd ./handler

# compile binary
GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -trimpath -o ../bin/handler
cp ../bin/handler ./handler

# publish function
func azure functionapp publish $funcName
rm ./handler

cd ..

# deploy event system grid topic & subscription
az deployment group create \
  --resource-group $resourceGroup \
  --template-file ./modules/eventGrid.bicep \
  --parameters location=$location \
  --parameters prefix=$prefix \
  --parameters funcName=$funcName \
  --parameters sourceStorageAccountId=$sourceStorageAccountId
