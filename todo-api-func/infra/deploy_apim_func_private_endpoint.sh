#!/bin/bash

# set -x
SKIP_BUILD=
PRIVATE_LINK=
while getopts "sp" opt
do
  case $opt in
    s) SKIP_BUILD=1;;
    p) PRIVATE_LINK=1;;
  esac
done

LOCATION='australiaeast'
APP_NAME='todo-api'
RG_NAME="$APP_NAME-rg"
ENVIRONMENT=dev
SEMVER=0.1.0
TAG="$ENVIRONMENT-$SEMVER"
IMAGE_NAME="func-api:$TAG"
IS_PRIVATE='false'

if [ ! -z "$PRIVATE_LINK" ]
then
    IS_PRIVATE='true'
    echo "IS_PRIVATE: $IS_PRIVATE"

    RG_NAME="$APP_NAME-private-rg"
    echo "RG_NAME: $RG_NAME"
fi

# load the .env variable file
source ./.env

# create resource group
az group create --name $RG_NAME --location $LOCATION

# deploy ACR
az deployment group create \
    --resource-group $RG_NAME \
    --name 'acr-deployment' \
    --template-file ./modules/acr.bicep \
    --parameters location=$LOCATION

ACR_NAME=$(az deployment group show --resource-group $RG_NAME --name 'acr-deployment' --query properties.outputs.acrName.value -o tsv)

if [ ! -z "$SKIP_BUILD" ]
then
    echo "skipping container image build..." 
else
    echo "building container image..." 
    az acr build -r $ACR_NAME -t $IMAGE_NAME -f ../func/Dockerfile ../func
fi

IMAGE_FULL_NAME="${ACR_NAME}.azurecr.io/${IMAGE_NAME}"

# deploy solution
az deployment group create \
    --name 'infra-deployment' \
    --resource-group $RG_NAME \
    --template-file ./main.bicep \
    --parameters location=$LOCATION \
    --parameters appName=$APP_NAME \
    --parameters environment='dev' \
    --parameters isPrivate=$IS_PRIVATE \
    --parameters sqlAdminUserPassword=$SQL_ADMIN_USER_PASSWORD \
    --parameters containerImageName=$IMAGE_FULL_NAME \
    --parameters acrName=$ACR_NAME

FUNCTION_FQDN=$(az deployment group show --name 'infra-deployment' -g $RG_NAME --query properties.outputs.functionFqdn.value -o tsv)
echo $FUNCTION_FQDN
