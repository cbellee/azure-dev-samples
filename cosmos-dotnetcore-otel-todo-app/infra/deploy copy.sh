# create infrastructure
PREFIX='app-insights-otel'
RG="${PREFIX}-rg"
LOCATION='australiaeast'
COSMOS_ACC_NAME="${PREFIX}-cosmos-account"
COSNOS_DB_NAME='todoDb'
COSMOS_CONTAINER_NAME='todoItems'
PARTITION_KEY='/id'
MAX_THROUGHPUT=4000
ACR_NAME="acrvsi892397rmqdfq"
ACA_ENV_NAME="${PREFIX}-aca-env"
ACA_APP_NAME="${PREFIX}-todo-app"

# create resource group
az group create -n $RG -l $LOCATION

# create log analytics workspace
az monitor log-analytics workspace create \
    --resource-group $RG \
    --workspace-name "$PREFIX-law"

# create app insights
az monitor app-insights component create \
    --app "$PREFIX-ai" \
    --resource-group $RG \
    --application-type web \
    --location $LOCATION \
    --workspace "$PREFIX-law"

export APPLICATIONINSIGHTS_CONNECTION_STRING=$(az monitor app-insights component show \
    --resource-group $RG \
    --app "$PREFIX-ai" \
    --query "connectionString" \
    --output tsv)

# creste cosmosdb
az cosmosdb create \
    --name $COSMOS_ACC_NAME \
    --resource-group $RG \
    --locations regionName=$LOCATION failoverPriority=0 isZoneRedundant=False \
    --default-consistency-level "Session" \
    --query "documentEndpoint"

az cosmosdb sql database create \
    -a $COSMOS_ACC_NAME \
    -g $RG \
    -n $COSNOS_DB_NAME

az cosmosdb sql container create \
    -a $COSMOS_ACC_NAME \
    -g $RG \
    -d $COSNOS_DB_NAME \
    -n $COSMOS_CONTAINER_NAME \
    -p $PARTITION_KEY \
    --max-throughput $MAX_THROUGHPUT

COSMOS_ACC_KEY=$(az cosmosdb keys list \
    -n $COSMOS_ACC_NAME \
    -g $RG \
    --type keys | jq -r '.primaryMasterKey')

# create ACR
az acr create -n $ACR_NAME -g $RG --sku Standard
ACR_ID=$(az acr show --name $ACR_NAME --resource-group $RG --query id --output tsv)

# create container image
az acr login -n $ACR_NAME
az acr build -t todoapi:v1 -r $ACR_NAME -f Dockerfile .

# create Azure Container App Environent
az containerapp env create \
    --name $ACA_ENV_NAME \
    --resource-group $RG \
    --location $LOCATION

UMID_OID=$(az identity create --name "$ACA_APP_NAME-umid" --resource-group $RG --location $LOCATION --query principalId --output tsv)
UMID_RID=$(az identity show --name "$ACA_APP_NAME-umid" --resource-group $RG --query id --output tsv)

az role assignment create --assignee-principal-type ServicePrincipal --assignee-object-id $UMID_OID --role AcrPull --scope $ACR_ID
az role assignment create --assignee-principal-type ServicePrincipal --assignee-object-id $UMID_OID --role "Monitoring Metrics Publisher" --scope $COSMOS_ID

az containerapp create \
    --name $ACA_APP_NAME \
    --resource-group $RG \
    --image $ACR_NAME.azurecr.io/todoapi:v1 \
    --environment $ACA_ENV_NAME \
    --cpu 0.5 \
    --registry-identity $UMID_RID \
    --registry-server $ACR_NAME.azurecr.io \
    --memory 1.0 \
    --target-port 80 \
    --env-vars "APPLICATIONINSIGHTS_CONNECTION_STRING=$APPLICATIONINSIGHTS_CONNECTION_STRING" \
    --user-assigned $UMID_RID \
    --ingress external
