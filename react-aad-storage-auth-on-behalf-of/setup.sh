location='australiaeast'
rgName='react-spa-on-behalf-of-rg'
storageAccountName='storf7sf89sdf98s9ef'
appName='react-obo-app'
currentUserPrincipalId=$(az ad signed-in-user show --query id -o tsv)

# login & set subscription context 
# az login
# az account set -s <subscriptionId>

az group create --name $rgName --location $location

storageResourceId=$(az storage account create --name $storageAccountName --resource-group $rgName --query id -o tsv)

az storage cors add \
    --account-name $storageAccountName \
    --allowed-headers '*' \
    --exposed-headers '*' \
    --origins '*' \
    --methods GET HEAD PUT OPTIONS \
    --services 'b'

az role assignment create \
    --assignee $currentUserPrincipalId \
    --role "Storage Account Contributor" \
    --scope $storageResourceId

az role assignment create \
    --assignee $currentUserPrincipalId \
    --role "Storage Blob Data Contributor" \
    --scope $storageResourceId

id=$(az ad app create \
    --display-name $appName \
    --required-resource-accesses @resourceAccesses.json \
    --sign-in-audience "AzureADMyOrg" \
    --query id -o tsv)

az rest \
    --method PATCH \
    --uri 'https://graph.microsoft.com/v1.0/applications/'$id \
    --headers 'Content-Type=application/json' \
    --body '{"spa":{"redirectUris":["'http://localhost:5173/home'"]}}'

# add your tenantId, clientId & storage account name to ./app/src/authConfig.js

# export const authConfig = {
#    clientId: "<clientId>",
#    tenantId: "<tenantId>",
#    redirectUri: "http://localhost:5173/home",
#    storageAccount: "<storageAccountName>"
# }

# run the react app
# $ npm run dev