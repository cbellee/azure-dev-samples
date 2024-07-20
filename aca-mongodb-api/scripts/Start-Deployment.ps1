# create infrastructure
$resourceGroupName = "apim-demo-rg"
$location = 'australiaeast'
$emailAddress = $(az ad signed-in-user show --query userPrincipalName -o tsv)
$tenantId = az account show --query tenantId -o tsv
$version = '0.0.1'

# ensure Az module 9.5.0 or greater is installed
if (-not $(Get-InstalledModule -Name az -MinimumVersion 9.5.0 -ErrorAction Stop)) {
  Find-Module Az | Install-Module -Name Az -Force    
} 

# import values from ../.env file to PowerShell Environment variables
foreach ($item in (Get-Content ../.env | ConvertFrom-StringData).GetEnumerator()) {
  Set-Item -Path env:$($item.Keys) -Value $item.Values 
}

# function to add application registration data to APIM jwt-policy.xml file
function  Set-XmlPolicy {
  param (
    $documentPath,
    $tenantId,
    $audienceId,
    $readClaim,
    $writeClaim
  )

  # Add Authentication Policy to API
  [xml]$xmlPolicy = Get-Content $documentPath
  
  $xmlPolicy.policies.inbound.'validate-jwt'.'openid-config'.url = "https://login.microsoftonline.com/$tenantId/.well-known/openid-configuration"

  $audienceNode = $xmlPolicy.SelectNodes("//policies/inbound/validate-jwt/audiences")
  $audience = $xmlPolicy.CreateElement('audience')
  $audience.PsBase.InnerText = $audienceId
  $audienceNode.AppendChild($audience) | Out-Null

  $issuersNode = $xmlPolicy.SelectNodes("//policies/inbound/validate-jwt/issuers")

  $issuer1 = $xmlPolicy.CreateElement('issuer')
  $issuer1.PsBase.InnerText = "https://sts.windows.net/$tenantId"
  $issuersNode.AppendChild($issuer1) | Out-Null

  $issuer2 = $xmlPolicy.CreateElement('issuer')
  $issuer2.PsBase.InnerText = "https://login.microsoftonline.com/$tenantId/v2.0"
  $issuersNode.AppendChild($issuer2) | Out-Null

  $claimsNode = $xmlPolicy.SelectNodes("//policies/inbound/validate-jwt/required-claims/claim")

  $claim1 = $xmlPolicy.CreateElement('value')
  $claim1.PsBase.InnerText = $readClaim
  $claimsNode.AppendChild($claim1) | Out-Null

  $claim2 = $xmlPolicy.CreateElement('value')
  $claim2.PsBase.InnerText = $writeClaim
  $claimsNode.AppendChild($claim2) | Out-Null

  $xmlPolicy.OuterXml
}

# create resource group
az group create --name $resourceGroupName --location $location

# create ACR
az deployment group create `
  --name 'acr-deployment' `
  --resource-group $resourceGroupName `
  --template-file ./infra/modules/acr.bicep `
  --parameters location=$location `
  --parameters sku='Basic'

$acrName = $(az deployment group show --name 'acr-deployment' --resource-group $resourceGroupName --query "properties.outputs.name.value" --output tsv)
$customerImageName = "$acrName.azurecr.io/customer:$version"
$flightImageName = "$acrName.azurecr.io/flight:$version"
$bookingImageName = "$acrName.azurecr.io/booking:$version"

# build images in ACR concurrently
az acr login -n $acrName
az acr build -t $customerImageName -r $acrName --build-arg BUILD_TARGET=customer --build-arg PORT=8081 ./api &
az acr build -t $flightImageName -r $acrName --build-arg BUILD_TARGET=flight --build-arg PORT=8082 ./api &
az acr build -t $bookingImageName -r $acrName --build-arg BUILD_TARGET=booking --build-arg PORT=8083 ./api &

# wait for jobs to complete
Get-Job | Wait-Job

$apis = @(
  [PSCustomObject]@{
    port              = '8081'
    name              = 'customer'
    image             = "$customerImageName"
    partitionKey      = 'id'
    apiDefinitionPath = 'customer_oapi.yaml'
  }
  [PSCustomObject]@{
    port              = '8082'
    name              = 'flight'
    image             = "$flightImageName"
    partitionKey      = 'id'
    apiDefinitionPath = 'flight_oapi.yaml'
  }
  [PSCustomObject]@{
    port              = '8083'
    name              = 'booking'
    image             = "$bookingImageName"
    partitionKey      = 'id'
    apiDefinitionPath = 'booking_oapi.yaml'
  }
)

# escape double quotes in JSON string
$jsonParam = $($apis | ConvertTo-Json -Depth 10 -Compress).Replace('"', '\"')

# deploy infrastructure
az deployment group create `
  --name 'infra-deployment' `
  --resource-group $resourceGroupName `
  --template-file ./infra/main.bicep `
  --parameters location=$location `
  --parameters acrName=$acrName `
  --parameters emailAddress=$emailAddress `
  --parameters apis="$jsonParam"

# get deployment outputs
$mongoDbCxn = $(az deployment group show --name 'infra-deployment' --resource-group $resourceGroupName --query "properties.outputs.mongoDbCxn.value" --output tsv)
$appUri = $(az deployment group show --name 'infra-deployment' --resource-group $resourceGroupName --query "properties.outputs.appUrl.value" --output tsv)
$apimName = $(az deployment group show --name 'infra-deployment' --resource-group $resourceGroupName --query "properties.outputs.apimName.value" --output tsv)
$apimBaseUri = $(az deployment group show --name 'infra-deployment' --resource-group $resourceGroupName --query "properties.outputs.apimBaseUrl.value" --output tsv)

"MONGO_DB_CXN=$mongoDbCxn" | Out-File ../.env -Append

# import OpenAPI definitions & add a JWT policy
$apimContext = New-AzApiManagementContext -ResourceGroupName $resourceGroupName -ServiceName $apimName      

$apis | ForEach-Object {
  $serviceUrl = "https://$($_.name).$appUri"
  $basePath = $PWD.Path

  az apim api import `
    --resource-group $resourceGroupName `
    --service-name $apimName `
    --protocol Https `
    --service-url $serviceUrl `
    --path $($_.name) `
    --specification-path $_.apiDefinitionPath `
    --specification-format OpenAPI

  Import-AzApiManagementApi `
    -SpecificationFormat OpenApi `
    -Context $apimContext `
    -SpecificationPath $_.apiDefinitionPath `
    -Path $($_.name) `
    -ApiType Http `
    -Protocol Https `
    -ServiceUrl $serviceUrl

  $basePath = $PWD.Path
  $policyPath = $((Join-Path $basePath 'validate-jwt.xml') | Resolve-Path).Path
  $policy = Set-XmlPolicy -documentPath $policyPath -tenantId $tenantId -audienceId $env:SERVER_APP_ID -readClaim "$($_.name).read" -writeClaim "$($_.name).write"

  # remove subscription key & add jwt policy
  $api = Get-AzApiManagementApi -Context $apimContext -Name $($_.name)
  $api.SubscriptionRequired = $false
  Set-AzApiManagementApi -InputObject $api

  Get-AzApiManagementApi -Context $apimContext -Name $($_.name) |
  Set-AzApiManagementPolicy -InputObject $api -Context $apimContext -Policy "$policy"
}                

# get access token
$headers = @{
  'Content-Type' = 'application/x-www-form-urlencoded'
}

$url = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token"
$accessToken = $(Invoke-RestMethod -Method POST -Headers $headers -Body $env:TOKEN_URL -Uri $url).access_token

# get access token
$headers = @{
  'Authorization' = "Bearer $($accessToken)"
}

# add flights
Get-Content ../data/flightData.json | 
ConvertFrom-Json | 
ForEach-Object {
  $_
  $null = Invoke-RestMethod `
    -Headers $headers `
    -Uri "$apimBaseUri/flight/flights" `
    -Method POST `
    -Body $($_ | ConvertTo-Json)   `
    -ContentType "application/json"
}

# add customers
Get-Content ../data/customerData.json | 
ConvertFrom-Json | 
ForEach-Object {
  $_
  $null = Invoke-RestMethod `
    -Headers $headers `
    -Uri "$apimBaseUri/customer/customers" `
    -Method POST `
    -Body $($_ | ConvertTo-Json)   `
    -ContentType "application/json"
}

# add bookings
Get-Content ../data/bookingData.json | 
ConvertFrom-Json | 
ForEach-Object {
  $_
  $null = Invoke-RestMethod `
    -Headers $headers `
    -Uri "$apimBaseUri/booking/bookings" `
    -Method POST `
    -Body $($_ | ConvertTo-Json)   `
    -ContentType "application/json"
}

# without an access token, access is denied
Invoke-RestMethod -Uri "$apimBaseUri/customer/customers"
Invoke-RestMethod -Uri "$apimBaseUri/booking/bookings"
Invoke-RestMethod -Uri "$apimBaseUri/flight/flights"

# with access token access is granted
Invoke-RestMethod -Headers $headers -Uri $apimBaseUri/customer/customers
Invoke-RestMethod -Headers $headers -Uri $apimBaseUri/flight/flights
Invoke-RestMethod -Headers $headers -Uri $apimBaseUri/booking/bookings
