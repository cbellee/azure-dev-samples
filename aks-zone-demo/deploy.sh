LOCATION='australiaeast'
RESOURCE_GROUP='aks-zones-3-plus-0-rg'
VERSION='v0.0.10'

az group create --location $LOCATION --resource-group $RESOURCE_GROUP

az deployment group create \
    --name acr-deployment \
    --template-file ./iac/bicep/modules/acr.bicep \
    --resource-group $RESOURCE_GROUP \
    --parameter location=$LOCATION

ACR_NAME=$(az deployment group show --resource-group $RESOURCE_GROUP --name acr-deployment --query 'properties.outputs.acrName.value' -o tsv)

az deployment group create \
    --name main-deployment \
    --template-file ./iac/bicep/main.bicep \
    --resource-group $RESOURCE_GROUP \
    --parameters developmentEnvironment='true'

CLUSTER_NAME=$(az deployment group show --resource-group $RESOURCE_GROUP --name main-deployment --query 'properties.outputs.clusterName.value' -o tsv)
az aks get-credentials -g $RESOURCE_GROUP -n $CLUSTER_NAME --admin --context 'aks-zones' --overwrite-existing
az aks update --name $CLUSTER_NAME --resource-group $RESOURCE_GROUP --attach-acr $ACR_NAME

# update helm repo
helm repo add nginx-ingress https://kubernetes.github.io/ingress-nginx

# deploy ingress controller
helm install ingress-nginx ingress-nginx/ingress-nginx \
    --create-namespace \
    --namespace nginx-ingress \
    --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/healthz

# grant default service account view permissions at Cluster scope
kubectl apply -f ./manifests/roles.yml

# build and push container
IMAGE_NAME="$ACR_NAME.azurecr.io/zone-info:$VERSION"
az acr login -n $ACR_NAME
az acr build -r $ACR_NAME -t $IMAGE_NAME . 

# apply the ingress manifest
kubectl apply -f ./manifests/ingress.yml
