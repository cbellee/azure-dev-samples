tenantId = 

identity_json=$(az identity create --name $app_identity_name --resource-group $resource_group_name -o json)
client_id=$(echo $identity_json | jq -r .clientId)
principal_id=$(echo $identity_json | jq -r .principalId)
echo $client_id
echo $principal_id

subscription_id=$(az account show --query id -o tsv)

# Grant reader access to subscription for our newly created managed identity
az role assignment create \
 --assignee-object-id $principal_id \
 --assignee-principal-type ServicePrincipal \
 --scope /subscriptions/$subscription_id \
 --role "Reader"

 curl https://login.microsoftonline.com/$TENANT_ID/v2.0/.well-known/openid-configuration