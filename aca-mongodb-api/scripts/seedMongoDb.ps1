param (
    [string]
    $clientId = '4d8f8238-4c75-48d9-a87d-a94a03de5430',
    [string]
    $scope = 'a39ecde7-73e9-4866-a016-88e28952cefd/.default',
    [string]
    $grantType = 'client_credentials',
    [string]
    $clientSecret,
    [string]
    $tenantId = '3d49be6f-6e38-404b-bbd4-f61c1a2d25bf',
    [string]
    $contentType = 'application/x-www-form-urlencoded',
    [string]
    $baseUri = 'https://apim-dev-p5at4gx2mnw7y.azure-api.net'
)

$body = @{
    grant_type=$grantType
    client_id=$clientId
    client_secret=$clientSecret
    scope=$scope
}

$tokenUri = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token"
$response = invoke-webRequest -Method Post -Uri $tokenUri -ContentType $contentType -Body $body
$parsedContent = ($response.Content | ConvertFrom-Json)

# add flights
Get-Content flightData.json | 
    ConvertFrom-Json | 
        ForEach-Object {
            $_
            $null = invoke-webRequest `
            -Headers @{'Authorization'="Bearer $($parsedContent.access_token)"} `
            -Uri "$baseUri/flight-api/flights" `
            -Method POST `
            -Body $($_ | ConvertTo-Json)   `
            -ContentType "application/json"
        }

# add customers
Get-Content customerData.json | 
    ConvertFrom-Json | 
        ForEach-Object {
            $_
            $null = invoke-webRequest `
            -Headers @{'Authorization'="Bearer $($parsedContent.access_token)"} `
            -Uri "$baseUri/customer-api/customers" `
            -Method POST `
            -Body $($_ | ConvertTo-Json)   `
            -ContentType "application/json"
        }

# add bookings
Get-Content bookingData.json | 
    ConvertFrom-Json | 
        ForEach-Object {
            $_
            $null = Invoke-WebRequest `
            -Headers @{'Authorization'="Bearer $($parsedContent.access_token)"} `
            -Uri "$baseUri/booking-api/bookings" `
            -Method POST `
            -Body $($_ | ConvertTo-Json)   `
            -ContentType "application/json"
        }

# get flights
$response = Invoke-WebRequest `
    -Headers @{'Authorization'="Bearer $($parsedContent.access_token)"} `
    -Uri "$baseUri/flight-api/flights"

$response.Content | ConvertFrom-Json

# get customers
$response = Invoke-WebRequest `
    -Headers @{'Authorization'="Bearer $($parsedContent.access_token)"} `
    -Uri "$baseUri/customer-api/customers"

$response.Content | ConvertFrom-Json

# get bookings
$response = Invoke-WebRequest `
    -Headers @{'Authorization'="Bearer $($parsedContent.access_token)"} `
    -Uri "$baseUri/booking-api/bookings"

$response.Content | ConvertFrom-Json

$customers = Get-Content .\customerData.json | convertfrom-json
$customers | % {
    $_ | Add-Member -MemberType NoteProperty -Name email -Value ($_.firstName + '.' + $_.lastName + '@gmail.com')
    $_ | Add-Member -MemberType NoteProperty -Name phone -Value (Get-Random)
    $_
} # | ConvertTo-Json | Set-Content .\customerData2.json
