export AZURE_RESOURCE_GROUP_NAME='todo-api-private-rg'
export SOURCE_APIM_SERVICE_NAME='api-mgmt-2bvgivuoqfww4'
export DEST_APIM_SERVICE_NAME='api-mgmt-dest-2bvgivuoqfww4'
export AZURE_TENANT_ID='3d49be6f-6e38-404b-bbd4-f61c1a2d25bf'
export AZURE_SUBSCRIPTION_ID='b2375b5f-8dab-4436-b87c-32bc7fdce5d0'
export API_MANAGEMENT_SERVICE_OUTPUT_FOLDER_PATH=./apim-output

output=$(az ad sp create-for-rbac \
    --name apim-ops \
    --role contributor \
    --scopes /subscriptions/$AZURE_SUBSCRIPTION_ID/resourceGroups/$AZURE_RESOURCE_GROUP_NAME \
    --sdk-auth \
    --query "{ client_id: appId, client_secret: password, tenant_id: tenant }")

export AZURE_CLIENT_ID=$(echo $output | jq -r .clientId)
export AZURE_CLIENT_SECRET=$(echo $output | jq -r .clientSecret)

export API_MANAGEMENT_SERVICE_NAME=$SOURCE_APIM_SERVICE_NAME
./extractor.linux-x64.exe

export API_MANAGEMENT_SERVICE_NAME=$DEST_APIM_SERVICE_NAME
./publisher.linux-x64.exe
