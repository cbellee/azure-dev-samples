location='australiaeast'
prefix='go-event-grid-mqqt'
resourceGroupName="$prefix-rg"
encodedIntermediateCaCertificate=$(cat ~/.step/certs/intermediate_ca.crt | tr -d "\n")
port=8883
topicTemplate='myTopics/topic1'
topicSpaceName='myTopicSpace'
clientAuthName='sample_client'

az group create --location $location --name $resourceGroupName

az deployment group create \
    --resource-group $resourceGroupName \
    --name 'infra-deployment' \
    --template-file ./main.bicep \
    --parameters prefix=$prefix \
    --parameters encodedIntermediateCaCertificate="$encodedIntermediateCaCertificate" \
    --parameters topicTemplate=$topicTemplate \
    --parameters topicSpaceName=$topicSpaceName \
    --parameters client

hostName=$(az deployment group show --resource-group $resourceGroupName --name 'infra-deployment' --query 'properties.outputs.topicSpaceHostName.value' -o tsv)

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
    $clientAuthName "$clientAuthName.pem" "$clientAuthName.key" \
    --ca ~/.step/certs/intermediate_ca.crt \
    --ca-key ~/.step/secrets/intermediate_ca_key \
    --no-password --insecure \
    --not-after 2400h

: '
    certificate paths

    ~/.step/certs/root_ca.crt
    ~/.step/certs/intermediate_ca.crt

    ~/.step/secrets/root_ca_key
    ~/.step/secrets/intermediate_ca_key

    ~/.step/secrets/sample_client.pem
    ~/.step/secrets/sample_client.key
'

cd ../client
go build

./mqtt-client \
    -brokerPort $port \
    -brokerUri $hostName \
    -caPath /home/cbellee/.step/certs/intermediate_ca.crt \
    -clientCertPath ./sample_client.pem \
    -clientKeyPath ./sample_client.key \
    -clientID $clientAuthName \
    -clientUsername $clientAuthName \
    -topicPath $topicTemplate
