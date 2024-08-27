export RESOURCE_GROUP='azure-arc-rg'
export LOCATION='australiaeast'
export TENANT_NAME='kainiindustries.net'
export SUBSCRIPTION_ID='21f3cc5d-605c-4b38-8d29-4add56f2f8be'
export ARC_CLUSTER_NAME='home-k8s-cluster-01'
  
az login -t $TENANT_NAME
az account set -s $SUBSCRIPTION_ID

SP_DETAILS=$(az ad sp create-for-rbac -n arc-home-cluster-sp --role "Owner" --scopes /subscriptions/$SUBSCRIPTION_ID)
export APP_ID=$(echo $SP_DETAILS | jq .appId -r)
export APP_SECRET=$(echo $SP_DETAILS | jq .password -r)
export TENANT_ID=$(echo $SP_DETAILS | jq .tenant -r)

az provider register --namespace Microsoft.Kubernetes
az provider register --namespace Microsoft.KubernetesConfiguration
az provider register --namespace Microsoft.ExtendedLocation

az group create --location $LOCATION --name $RESOURCE_GROUP

az extension add --name connectedk8s
az extension add --name k8s-configuration

az login --service-principal --username $APP_ID --password $APP_SECRET --tenant $TENANT_ID

az connectedk8s connect --name $ARC_CLUSTER_NAME --resource-group $RESOURCE_GROUP --correlation-id "d009f5dd-dba8-4ac7-bac9-b54ef3a6671a"
