param (
    [Parameter(Mandatory=$true)]
    [string]$RepoId,

    [Parameter(Mandatory=$true)]
    [string]$Token
)

$environments = Get-Content ./env_vars.json | ConvertFrom-Json

# create GH environment vars from JSON file
foreach ($e in $environments) {
    foreach ($variable in $e.variables) {
        $envName = $e.environment
        $varName = $variable.name
        $varValue = $variable.value

        $body = @{'name'="$varName"; 'value'="$varValue"} | ConvertTo-Json

        Invoke-WebRequest -Uri https://api.github.com/repositories/$repoId/environments/$envName/variables `
        -Method Post `
        -Headers @{"Accept"="application/vnd.github+json";"Authorization"="Bearer $($Token)";"X-GitHub-Api-Version"="2022-11-28"} `
        -Body $body
    }
}

# read GH environment vars
foreach ($e in $environments) {
    Invoke-WebRequest `
    -Uri https://api.github.com/repositories/$repoId/environments/$($e.environment)/variables `
    -Headers @{"Accept"="application/vnd.github+json";"Authorization"="Bearer $($env:token)";"X-GitHub-Api-Version"="2022-11-28"}
}
