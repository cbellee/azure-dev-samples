$tenantId = 'kainiindustries.net'
$requestBody = @{
    resource   = 'https://graph.microsoft.com'
    client_id  = 'a0ecd4cc-0d2e-4a37-bf39-a761b7185615'
    grant_type = "password"
    username   = 'cbellee@kainiindustries.net'
    scope      = "openid"
    password   = 'DCghkde4q8$P4$iH'
}

$auth = Invoke-RestMethod -Method post -Uri "https://login.microsoftonline.com/$tenantId/oauth2/token" -Body $requestBody
$auth