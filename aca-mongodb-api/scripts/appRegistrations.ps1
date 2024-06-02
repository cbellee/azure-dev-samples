param (
    [string]
    $serverAppName = 'go-flight-server-api',
    [string]
    $clientAppName = 'go-flight-client-api',
    [parameter(Mandatory = $true)]
    $tenantId
)

$ErrorActionPreference = 'Stop'

if ($null -eq (Get-Module -ListAvailable -Name Microsoft.Graph)) {
    Install-Module -Name Microsoft.Graph
}

Connect-MgGraph -Scopes "Application.ReadWrite.All", "AppRoleAssignment.ReadWrite.All" -TenantId $tenantId -NoWelcome

$apiApplication = @{
    Oauth2PermissionScopes = @(
        @{
            Id='e95b2304-8ea2-4af7-8279-7969e7be15bd'
            Value="full"
            AdminConsentDescription="Full Access"
            AdminConsentDisplayName="Full Access"
            IsEnabled=$true
            Type="User"
            UserConsentDescription="Full Access"
            UserConsentDisplayName="Full Access"
        }
    )
}

$appRoles = @(
    @{
        AllowedMemberTypes = 'Application'
        DisplayName        = 'flight.read'
        Id                 = '48420134-fcf9-426d-a47d-65c0ae1dc707'
        IsEnabled          = $true
        Description        = 'Read flights'
        Value              = 'flight.read'
    },
    @{
        AllowedMemberTypes = 'Application'
        DisplayName        = 'flight.write'
        Id                 = '8ebb39c7-eb7d-4a50-8749-d55624772e14'
        IsEnabled          = $true
        Description        = 'Write flights'
        Value              = 'flight.write'
    },
    @{
        AllowedMemberTypes = 'Application'
        DisplayName        = 'customer.read'
        Id                 = '3b30ebe7-f1d2-4cd1-972b-3b4c48ff91a8'
        IsEnabled          = $true
        Description        = 'Read customers'
        Value              = 'customer.read'
    },
    @{
        AllowedMemberTypes = 'Application'
        DisplayName        = 'customer.write'
        Id                 = '6fd63b51-a45b-4955-b8c4-d63415bb111f'
        IsEnabled          = $true
        Description        = 'Write customers'
        Value              = 'customer.write'
    },
    @{
        AllowedMemberTypes = 'Application'
        DisplayName        = 'booking.read'
        Id                 = 'cb7e0b58-1b60-46c2-8c01-8bff12660fa9'
        IsEnabled          = $true
        Description        = 'Read bookings'
        Value              = 'booking.read'
    },
    @{
        AllowedMemberTypes = 'Application'
        DisplayName        = 'booking.write'
        Id                 = '5bf05836-b906-4f5b-9b23-81d886f40cf2'
        IsEnabled          = $true
        Description        = 'Write bookings'
        Value              = 'booking.write'
    }
)

Write-Information "Creating server application '$serverAppName' with app roles"
if (!$($serverApp = Get-MgApplication -Filter "displayName eq '$serverAppName'")) {
    $serverApp = New-MgApplication -AppRoles $appRoles -DisplayName $serverAppName
}

Write-Information "Waiting for server application '$serverAppName' to be created"
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

Write-Information "Creating client application '$clientAppName' with resource access for '$serverAppName'"

if (!$($clientApp = Get-MgApplication -Filter "displayName eq '$clientAppName'")) {
    $clientApp = New-MgApplication  `
        -DisplayName $clientAppName `
        -PasswordCredentials $passwordCreds `
        -RequiredResourceAccess $requiredResourceAccess
}

Write-Information "Waiting for client application '$clientAppName' to be created"
Start-Sleep -s 10

if (!$($clientPrincipal = Get-MgServicePrincipal -Filter "appId eq '$($clientApp.AppId)'")) {
    $clientPrincipal = New-MgServicePrincipal -AppId $clientApp.AppId
}

# az ad app permission admin-consent --id $clientApp.AppId

$roles = Get-MgServicePrincipal -Filter "displayName eq '$serverAppName'" -Property AppRoles | Select-Object -ExpandProperty appRoles

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

"TOKEN_URL='client_id=$($clientApp.AppId)&client_secret=$($clientApp.PasswordCredentials.SecretText)&scope=$($serverApp.AppId)%2F.default&grant_type=client_credentials'" | 
Out-File ./.env -Encoding utf8
