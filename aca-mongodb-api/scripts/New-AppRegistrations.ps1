param (
    [string]
    $ServerAppName = 'flight-server-app',
    [string]
    $ClientAppName = 'flight-client-app',
    [parameter(Mandatory = $true)]
    $TenantId
)

$ErrorActionPreference = 'Stop'

if ($null -eq (Get-Module -ListAvailable -Name Microsoft.Graph)) {
    Install-Module -Name Microsoft.Graph
}

Connect-MgGraph -Scopes "Application.ReadWrite.All", "AppRoleAssignment.ReadWrite.All" -TenantId $tenantId -NoWelcome

$appRoles = @(
    @{
        AllowedMemberTypes = 'Application'
        DisplayName        = 'flight.read'
        Id                 = 'f5944b16-5000-423b-9bd5-a0afa351a725'
        IsEnabled          = $true
        Description        = 'Read flights'
        Value              = 'flight.read'
    },
    @{
        AllowedMemberTypes = 'Application'
        DisplayName        = 'flight.write'
        Id                 = 'c4f3498d-97c9-4d46-bfa4-ead87ec573cf'
        IsEnabled          = $true
        Description        = 'Write flights'
        Value              = 'flight.write'
    },
    @{
        AllowedMemberTypes = 'Application'
        DisplayName        = 'customer.read'
        Id                 = '60b38dc3-9985-4989-9dd8-1682585ab536'
        IsEnabled          = $true
        Description        = 'Read customers'
        Value              = 'customer.read'
    },
    @{
        AllowedMemberTypes = 'Application'
        DisplayName        = 'customer.write'
        Id                 = 'f22ae649-487f-48a9-8b5e-6769be2a8dcc'
        IsEnabled          = $true
        Description        = 'Write customers'
        Value              = 'customer.write'
    },
    @{
        AllowedMemberTypes = 'Application'
        DisplayName        = 'booking.read'
        Id                 = 'eea93e04-6e36-4377-9df0-6d02a6962add'
        IsEnabled          = $true
        Description        = 'Read bookings'
        Value              = 'booking.read'
    },
    @{
        AllowedMemberTypes = 'Application'
        DisplayName        = 'booking.write'
        Id                 = '7778aa8e-ea57-4b20-926a-b85a12b6bf23'
        IsEnabled          = $true
        Description        = 'Write bookings'
        Value              = 'booking.write'
    }
)

Write-Information "Creating server application '$ServerAppName' with app roles"
if (!$($serverApp = Get-MgApplication -Filter "displayName eq '$ServerAppName'")) {
    $serverApp = New-MgApplication -AppRoles $appRoles -DisplayName $ServerAppName
}

Write-Information "Waiting for server application '$ServerAppName' to be created"
Start-Sleep -s 10

if (!$($serverPrincipal = Get-MgServicePrincipal -Filter "appId eq '$($serverApp.AppId)'")) {
    $serverPrincipal = New-MgServicePrincipal -AppId $serverApp.AppId
}

$passwordCreds = @{
    StartDateTime = [datetime]::Now
    EndDateTime   = [datetime]::Now.AddYears(1)
    DisplayName   = 'my-secret'
}

$requiredResourceAccess = @(
    @{
        ResourceAppId  = $serverApp.AppId
        ResourceAccess = $appRoles | ForEach-Object {
            @{
                Id   = $_.Id
                Type = 'Role'
            }
        }
    }
)

Write-Information "Creating client application '$ClientAppName' with resource access for '$ServerAppName'"

if (!$($clientApp = Get-MgApplication -Filter "displayName eq '$clientAppName'")) {
    $clientApp = New-MgApplication  `
        -DisplayName $clientAppName `
        -PasswordCredentials $passwordCreds `
        -RequiredResourceAccess $requiredResourceAccess
}

Write-Information "Waiting for client application '$ClientAppName' to be created"
Start-Sleep -s 10

if (!$($clientPrincipal = Get-MgServicePrincipal -Filter "appId eq '$($clientApp.AppId)'")) {
    $clientPrincipal = New-MgServicePrincipal -AppId $clientApp.AppId
}

# az ad app permission admin-consent --id $clientApp.AppId

$roles = Get-MgServicePrincipal -Filter "displayName eq '$ServerAppName'" -Property AppRoles | Select-Object -ExpandProperty appRoles

Write-Information "Assigning roles to client application"
$roles | ForEach-Object {
    $bodyParams = @{
        PrincipalId = $clientPrincipal.Id
        ResourceId  = $serverPrincipal.Id
        AppRoleId   = $_.Id
    }

    New-MgServicePrincipalAppRoleAssignment `
        -ServicePrincipalId $clientPrincipal.Id `
        -BodyParameter $bodyParams
}

"server id: $($serverApp.AppId)"
"client id: $($clientApp.Id)"
"client secret: $($clientApp.PasswordCredentials.SecretText)"

# write appIds & url to get client credential token to .env file
"SERVER_APP_ID=$($serverApp.AppId)" | Out-File ../.env -Encoding utf8
"CLIENT_APP_ID=$($clientApp.Id)" | Out-File ../.env -Encoding utf8 -Append
"CLIENT_APP_SECRET=$clientApp.PasswordCredentials.SecretText"
"TOKEN_URL='client_id=$($clientApp.AppId)&client_secret=$($clientApp.PasswordCredentials.SecretText)&scope=$($serverApp.AppId)%2F.default&grant_type=client_credentials'" | Out-File ../.env -Encoding utf8 -Append
