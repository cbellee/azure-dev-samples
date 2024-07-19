param (
    [string]$appPrefix = 'gh-actions-federated-identity',
    [string]$subscriptionId = $(az account show --query id --output tsv),
    [string]$orgName = 'cbellee',
    [string]$repoName = 'gh-action-demo-function',
    [string[]]$environments = @('dev', 'test', 'prod')
)

foreach ($environment in $environments) {
    $appName = "$appPrefix-$environment"
    Write-Output "Creating app registration '$appName'..."
    $appId = az ad app create --display-name $appName --query appId -o tsv

    Start-Sleep -Seconds 10
    
    $objectId = az ad sp show --id $appId --query id -o tsv
    if ($null -eq $objectId) {
        Write-Output "Creating service principal for app registration..."
        $objectId = az ad sp create --id $appId --query id -o tsv
    }
    
    Start-Sleep -Seconds 10

    Write-Output "Creating role assignment for app registration..."
    az role assignment create `
        --role owner `
        --subscription $subscriptionId `
        --assignee-object-id  $objectId `
        --assignee-principal-type ServicePrincipal `
        --scope /subscriptions/$subscriptionId

    $creds = Get-Content ./credential.json | ConvertFrom-Json
    $creds.subject = "repo:$orgName/$repoName`:environment:$environment"
    $creds.name = $appName
    $creds | ConvertTo-Json | Out-File "./$environment-credential.json"

    Write-Output "Creating federated credential for app registration..."
    az ad app federated-credential create --id $appId --parameters "./$environment-credential.json"
}
