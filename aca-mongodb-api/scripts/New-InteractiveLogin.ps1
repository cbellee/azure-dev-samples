$tenantId = $(az account show --query tenantId -o tsv)
$currentUser = $(az ad signed-in-user show --query userPrincipalName -o tsv)

# import values from ../.env file to PowerShell Environment variables
foreach ($item in (Get-Content ../.env | ConvertFrom-StringData).GetEnumerator()) {
    Set-Item -Path env:$($item.Keys) -Value $item.Values 
}

$requestBody = @{
    resource   = 'https://graph.microsoft.com'
    client_id  = $env:CLIENT_APP_ID
    grant_type = "password"
    username   = $currentUser
    scope      = "openid"
    password   = $env:CLIENT_APP_SECRET
}

$userAccessToken = Invoke-RestMethod -Method post -Uri "https://login.microsoftonline.com/$tenantId/oauth2/token" -Body $requestBody
$userAccessToken
