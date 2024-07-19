location='australiaeast'
resourceGroupName='aks-agic-mtls-4-rg'
subscriptionId=`az account show --query id -o tsv`

source ../.env

# deply resource group
az group create --location $location --name $resourceGroupName

# deploy resources
az deployment group create \
    --resource-group $resourceGroupName \
    --template-file ../deploy.bicep \
    --name 'deploy' \
    --parameters location=$location \
    --parameters adminGroupObjectId=$aksAdminGroupObjectId

identityClientId=`az deployment group show -n 'deploy' -g $resourceGroupName --query "properties.outputs.identityClientId.value" -o tsv`
identityResourceId=`az deployment group show -n 'deploy' -g $resourceGroupName --query "properties.outputs.identityResourceId.value" -o tsv`
clusterName=`az deployment group show -n 'deploy' -g $resourceGroupName --query "properties.outputs.aksClusterName.value" -o tsv`
applicationGatewayName=`az deployment group show -n 'deploy' -g $resourceGroupName --query "properties.outputs.applicationGatewayName.value" -o tsv`
acrName=`az deployment group show -n 'deploy' -g $resourceGroupName --query "properties.outputs.acrName.value" -o tsv`

# replace values in ./helm-config-template.yaml & output to ./helm-config.yaml
sed "s|<SUBSCRIPTION_ID>|${subscriptionId}|g; \
s|<RESOURCE_GROUP_NAME>|${resourceGroupName}|g; \
s|<APP_GWY_NAME>|${applicationGatewayName}|g; \
s|<APP_GWY_MID_RID>|${identityResourceId}|g; \
s|<APP_GWY_MID_CLIENT_ID>|${identityClientId}|g" helm-config-template.yaml > helm-config.yaml

# get cluster credentials
az aks get-credentials --resource-group $resourceGroupName --name $clusterName --admin

# grant acrPull role to AKS cluster
az aks update -n $clusterName -g $resourceGroupName --attach-acr $acrName

# install Pod Identity
kubectl create -f https://raw.githubusercontent.com/Azure/aad-pod-identity/master/deploy/infra/deployment-rbac.yaml

# add helm repo
helm repo add application-gateway-kubernetes-ingress https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/
helm repo update

# install AGIC
helm install \
    -f ../helm-config.yaml \
    --generate-name application-gateway-kubernetes-ingress/ingress-azure \
    --version '1.6.0'

# create kubernetes secrets
# kubectl create secret tls frontend-tls --key="./certs/frontend.kainiindustries.net.key" --cert="./certs/frontend.kainiindustries.net.crt"
kubectl create secret tls frontend-tls --key="./certs/star.kainiindustries.net.key" --cert="./certs/star.kainiindustries.net.crt"
kubectl create secret tls backend-tls --key="./certs/backend.kainiindustries.net.key" --cert="./certs/backend.kainiindustries.net.crt"

# install frontend TLS certificate to Application Gateway
az network application-gateway root-cert create \
    --gateway-name $applicationGatewayName  \
    --resource-group $resourceGroupName \
    --name 'backend-root-ca-cert' \
    --cert-file ./certs/rootca.cer

certs=`az network application-gateway root-cert list  \
    --gateway-name $applicationGatewayName  \
    --resource-group $resourceGroupName`

az network application-gateway root-cert delete  \
    --gateway-name $applicationGatewayName  \
    --resource-group $resourceGroupName -n "backend-tls"

# build & push image
versionTag='v1.0.12'
imageTag="$acrName.azurecr.io/mtls-app:$versionTag"

docker build -t mtls-app:latest .
docker tag mtls-app:latest $imageTag
az acr login --name $acrName
docker push $acrName.azurecr.io/mtls-app:$versionTag

# replace imageTag in .yaml manifest
sed "s|<IMAGE_TAG>|${imageTag}|g;" app.template.yaml > app.yaml

# apply manifest to cluster
kubectl delete deploy mtls-app-deployment
kubectl apply -f ./app.yaml

# copy root CA certificate to local machine
sudo apt-get install -y ca-certificates
sudo cp ./certs/rootca.crt /usr/local/share/ca-certificates
sudo update-ca-certificates

curl -vk -H "Host: mtls.com" https://20.28.144.156 --cert ./certs/frontend.kainiindustries.net.crt --key ./certs/frontend.kainiindustries.net.key
curl -vk -H "Host: mtls.com" https://20.28.144.156 --cert ./certs/backend.kainiindustries.net.crt --key ./certs/backend.kainiindustries.net.key

openssl s_client -connect 20.28.144.156:443 -key ./certs/frontend.kainiindustries.net.key -cert ./certs/frontend.kainiindustries.net.crt
openssl pkcs12 -export -out ./certs/backend.kainiindustries.net.pfx -inkey ./certs/backend.kainiindustries.net.key -in ./certs/backend.kainiindustries.net.crt -in ./certs/RootCACert.pem

openssl pkey -text_pub -in ./certs/backend.kainiindustries.net.key -noout
openssl req -in ./certs/backend.kainiindustries.net.csr -noout -text

# rolling update
k set image deployments/mtls-app-deployment mtls-app=$acrName.azurecr.io/mtls-app:$versionTag


export CERT_FILE_PATH="../../certs/backend.kainiindustries.net.crt"
export KEY_FILE_PATH="../../certs/backend.kainiindustries.net.key"
export SERVER_URL='20.28.144.156'
