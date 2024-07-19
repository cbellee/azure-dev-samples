RG_NAME='aca-perf-test-rg'
LOCATION='australiaeast'
SERVICE_PORT="80"
ENVIRONMENT=dev
SEMVER=0.1.0
REV=$(git rev-parse --short HEAD)
SERVICE_NAME='web'
TAG="$ENVIRONMENT-$SEMVER-$REV"
IMAGE="$SERVICE_NAME:$TAG"

ACR_NAME=$(az acr list --resource-group $RG_NAME --query [].name -o tsv)

# build image in ACR
az acr build -r $ACR_NAME \
    -t $IMAGE \
    --build-arg SERVICE_PORT=$SERVICE_PORT \
    -f ./Dockerfile .
