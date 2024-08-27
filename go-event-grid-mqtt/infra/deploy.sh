location='australiaeast'
prefix='go-event-grid-mqqt'
resourceGroupName="$prefix-rg"
encodedIntermediateCaCertificate=$(cat ~/.step/certs/intermediate_ca.crt | tr -d "\n")
subscriptionId=$(az account show --query id -o tsv)
port=8883
topicTemplate='myTopics/topic1'
topicSpaceName='myTopicSpace'
clientAuthName='sample_client'
certName="$prefix-cert"
userPrincipalId=$(az ad signed-in-user show --query id -o tsv)
version='0.0.9'
eventSubscriptionName='device-telemetry-subscription'          
eventGridNamespaceTopicName='device-telemetry'
eventGridTopicName='device-telemetry-topic'
appId=''
objectId=''
containerPort='8080'
handshakePort='9000'

source ./.env

az group create --location $location --name $resourceGroupName

# az ad sp create-for-rbac

az deployment group create \
    --resource-group $resourceGroupName \
    --name 'kv-deployment' \
    --template-file ./modules/kv.bicep \
    --parameters location=$location \
    --parameters userPrincipalId=$userPrincipalId

kvName=$(az deployment group show --resource-group $resourceGroupName --name 'kv-deployment' --query 'properties.outputs.keyVaultName.value' -o tsv)

az deployment group create \
    --resource-group $resourceGroupName \
    --name 'acr-deployment' \
    --template-file ./modules/acr.bicep \
    --parameters location=$location

acrName=$(az deployment group show --resource-group $resourceGroupName --name 'acr-deployment' --query 'properties.outputs.acrName.value' -o tsv)

cd ..
imageName="$acrName.azurecr.io/eg-dapr-subscriber:$version"
az acr login -n $acrName
docker build -t $imageName . && docker push $imageName
cd ./infra

az deployment group create \
    --resource-group $resourceGroupName \
    --name 'infra-deployment' \
    --template-file ./main.bicep \
    --parameters prefix=$prefix \
    --parameters encodedIntermediateCaCertificate="$encodedIntermediateCaCertificate" \
    --parameters topicTemplate=$topicTemplate \
    --parameters topicSpaceName=$topicSpaceName \
    --parameters clientAuthName=$clientAuthName \
    --parameters imageName=$imageName \
    --parameters acrName=$acrName \
    --parameters eventGridNamespaceTopicName=$eventGridTopicName \
    --parameters eventGridTopicName=$eventGridTopicName \
    --parameters objectId=$objectId \
    --parameters appId=$appId \
    --parameters appSecret=$PASSWORD \
    --parameters containerPort=$containerPort \
    --parameters handshakePort=$handshakePort \
    --parameters eventSubscriptionName='egsub1' \
    --parameters routeName='events' \
    --parameters daprEventGridComponentName='eventgridcomponent'

hostName=$(az deployment group show --resource-group $resourceGroupName --name 'infra-deployment' --query 'properties.outputs.topicSpaceHostName.value' -o tsv)
topicResourceId=$(az deployment group show --resource-group $resourceGroupName --name 'infra-deployment' --query 'properties.outputs.topicResourceId.value' -o tsv)
appName=$(az deployment group show --resource-group $resourceGroupName --name 'infra-deployment' --query 'properties.outputs.appName.value' -o tsv)

az role assignment create --assignee $appId --role "EventGrid EventSubscription Contributor" --scope $topicResourceId
az role assignment create --assignee "d29021bc-ae68-4665-ac80-7b70e7545bf1" --role "EventGrid Data Sender" --scope $topicResourceId

# install step client
# wget https://dl.smallstep.com/cli/docs-cli-install/latest/step-cli_amd64.deb
# sudo dpkg -i step-cli_amd64.deb

# create root & intermediate CA certificates
step ca init \
    --deployment-type standalone \
    --name MqttAppSamplesCA \
    --dns localhost \
    --address 127.0.0.1:443 \
    --provisioner MqttAppSamplesCAProvisioner

# create client certificates
step certificate create \
    $clientAuthName ../certs/$clientAuthName.pem ../certs/$clientAuthName.key \
    --ca ~/.step/certs/intermediate_ca.crt \
    --ca-key ~/.step/secrets/intermediate_ca_key \
    --no-password --insecure \
    --not-after 2400h

cd ../publisher
go build
cd ../infra

../publisher/mqtt-publisher \
    -brokerPort $port \
    -brokerUri $hostName \
    -caPath ~/.step/certs/intermediate_ca.crt \
    -clientCertPath ../certs/sample_client.pem \
    -clientKeyPath ../certs/sample_client.key \
    -clientID $clientAuthName \
    -clientUsername $clientAuthName \
    -topicPath $topicTemplate

body='[{"id": "2d1781af-3a4c-4d7c-bd0c-e34b19da4e66","topic": "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx","subject": "","data": {"validationCode": "512d38b6-c7b8-40c8-89fe-f46f9e9622b6","validationUrl": "https://rp-eastus2.eventgrid.azure.net:553/eventsubscriptions/myeventsub/validate?id=0000000000-0000-0000-0000-00000000000000&t=2022-10-28T04:23:35.1981776Z&apiVersion=2018-05-01-preview&token=1A1A1A1A"},"eventType": "Microsoft.EventGrid.SubscriptionValidationEvent","eventTime": "2022-10-28T04:23:35.1981776Z","metadataVersion": "1","dataVersion": "1"}]'

curl -X POST "https://go-event-grid-mqqt-app.salmondesert-f9fe6820.australiaeast.azurecontainerapps.io:9000/events" -b $body
curl -X POST -d '[{"id": "2d1781af-3a4c-4d7c-bd0c-e34b19da4e66","topic": "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx","subject": "","data": {"validationCode": "512d38b6-c7b8-40c8-89fe-f46f9e9622b6"},"eventType": "Microsoft.EventGrid.SubscriptionValidationEvent","eventTime": "2018-01-25T22:12:19.4556811Z", "metadataVersion": "1","dataVersion": "1"}]' -H 'Content-Type: application/json' https://go-event-grid-mqqt-container-app.proudpebble-724e54ff.australiaeast.azurecontainerapps.io/subscribe

REVISION_NAME=$(az containerapp revision list -g $resourceGroupName -n $appName | jq .[].name -r)
az containerapp revision restart -g $resourceGroupName -n $appName --revision $REVISION_NAME
