# set env vars
export CERT_FILE_PATH='/mnt/c/Users/cbellee/repos/github.com/cbellee/go-mtls-client-server/certs/cert.pem'
export KEY_FILE_PATH='/mnt/c/Users/cbellee/repos/github.com/cbellee/go-mtls-client-server/certs/key.pem'
export PORT='8080'

location='australiaeast'
prefix='aks-agic-mtls'
rg="$prefix-rg"
cluster="$prefix-aks"
ag="$prefix-ag"
agVip="$prefix-ag-vip"
acr="$prefix-acr"
mid="$ag-mid"
acr=`echo $acr | sed 's/-//g'`
dnsRg='external-dns-zones-rg'

az ad sp create-for-rbac --role Contributor --scopes /subscriptions/$subscriptionID -o json > ./certs/auth.json
appId=$(jq -r ".appId" ./certs/auth.json)
password=$(jq -r ".password" ./certs/auth.json)

objectId=$(az ad sp show --id $appId --query "id" -o tsv)

# generate certificate
openssl req -newkey rsa:2048 \
  -new -nodes -x509 \
  -days 3650 \
  -out cert.pem \
  -keyout key.pem \
  -pubkey \
  -addext "subjectAltName = DNS:go-api.internal.kainiindustries.net" \
  -subj "/C=AU/ST=NSW/L=Sydney/O=Kainiindustries/OU=IT/CN=go-api.internal.kainiindustries.net"

# openssl pkcs12 -export -out ./certs/appgwcert.pfx -inkey ./certs/key.pem -in ./certs/cert.pem
openssl x509 -in ./certs/ -text -noout

# deploy AKS, ACR & AGIC
az group create --name $rg --location $location

az acr create --resource-group $rg --name $acr --sku Standard

az aks create \
    --name $cluster \
    --resource-group $rg \
    --network-plugin azure \
    --enable-managed-identity \
    --generate-ssh-keys

az aks acr attach \
    --resource-group $rg \
    --name $cluster \
    --sku Standard \
    --acr $acr

az aks get-credentials --name $cluster --resource-group $rg
nodeRg=`az aks show -g $rg -n $cluster --query nodeResourceGroup -o tsv`

az network public-ip create -g $nodeRg -n $agVip --sku Standard

az network application-gateway create \
    --capacity 2 \
    --frontend-port 80 \
    --http-settings-port 80 \
    --http-settings-cookie-based-affinity Enabled \
    --http-settings-protocol Http \
    --location $location \
    --name $ag \
    --public-ip-address $agVip \
    --resource-group $nodeRg \
    --priority "1" \
    --routing-rule-type Basic \
    --sku Standard_v2 \
    --subnet aks-agic-mtls-ag-subnet \
    --vnet-name aks-vnet-20857893

az identity create -g $nodeRg -n $mid

az network application-gateway ssl-cert create \
    --resource-group $nodeRg \
    --gateway-name $ag \
    --name public-tls-cert \
    --cert-file ./certs/appgwcert.pfx \
    --cert-password '12345'

az network application-gateway root-cert create \
    --cert-file ./backend.crt \
    --gateway-name $ag \
    --name backend-tls \
    --resource-group $nodeRg

rootCertResourceId=`az network application-gateway root-cert show --gateway-name $ag -g $nodeRg -n root-ca-cert --query id -o tsv`

az network application-gateway ssl-profile add \
    --resource-group $nodeRg \
    --gateway-name $ag \
    --name 'mtls-profile' \
    --policy-type 'Predefined' \
    --policy-name 'AppGwSslPolicy20220101S'

az network application-gateway root-cert create \
    --gateway-name $ag  \
    --resource-group $nodeRg \
    --name backend-tls \
    --cert-file ./certs/internal.kainiindustries.net.cer

kubectl create secret tls backend-tls \
    --cert="./certs/go-api.internal.kainiindustries.net.crt" \
    --key="./certs/go-api.internal.kainiindustries.net.key"

kubectl create secret tls frontend-tls \
    --cert="./certs/frontend.crt" \
    --key="./certs/frontend.key"

# build & push image
docker build -t mtls-app:latest  .
docker tag mtls-app:latest $acr.azurecr.io/mtls-app:latest
az acr login --name $acr
docker push $acr.azurecr.io/mtls-app:latest

publicIpResourceId=`az network application-gateway frontend-ip show \
    -g $nodeRg \
    --gateway-name $ag \
    --name appGatewayFrontendIP \
    --query publicIPAddress.id \
    -o tsv`

publicIpAddress=`az network public-ip show --ids $publicIpResourceId --query ipAddress -o tsv`

# create DNS reord entry
az network dns record-set a add-record \
    --resource-group $dnsRg \
    --zone-name kainiindustries.net \
    --record-set-name go-api \
    --ipv4-address $publicIpAddress

# deploy workload
k apply -f ./app.yaml

# remove trusted root CA certs
# az network application-gateway root-cert delete -n 'ca-root-cert' -g $nodeRg --gateway-name $ag