# API Management OAuth example

A demonstration of how to secure access to API Management APIs using OAuth & OpenId Connect. This example uses the client credentials flow to login non-interactively to an EntraID client application which was previously granted Application roles to a server application registration representing the API Management API.

## Pre-requisites

- Azure Subscription
- PowerShell 7.2+
- [PowerShell Az module 9.5.0+](https://learn.microsoft.com/en-us/powershell/azure/install-azure-powershell?view=azps-12.1.0)
- [PowerShell Microsoft.Graph module 2.19.0+](https://learn.microsoft.com/en-us/powershell/microsoftgraph/installation?view=graph-powershell-1.0)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

## Resources

This example creates the following Azure infrastructure

- Azure API management instance (Consumption Tier)
- Azure Container Registry (Basic Tier)
- Azure Cosmos DB (Free tier)
- Azure Container App Environment (Consumption Tier)
- 3 container apps
- User Managed Identity

## Deployment

- Login to Azure CLI with an account that has permissions to create app registrations and Enterprise Applications (Service Principals)
  - `PS C:/> az login`
- Set your current working directory to `/scripts` & execute `./New-AppRegistrations.ps1` passing your EntraID tenant GUID to the `-TenantId` parameter
  - `PS C:\> cd ./scripts`
  - `PS C\> ./New-AppRegistrations.ps1 -TenantId 00000000-0000-0000-0000-000000000000`
- The previous script will create a `.env` file in the root folder containing the following variables, which will be loaded by the subsequent script
  - `SERVER_APP_ID`
  - `CLIENT_APP_ID`
  - `TOKEN_URL`
  - `MONGO_DB_CXN`
- Execute `./Start-Deployment.ps1` to create the Azure resources, import the OpenAPI definitions & set the API Management JWT validation policy
  - `PS C:/> ./Start-Deployment.ps1`
  - The script will also seed data to the Cosmos database and test the APIs are accessible using the JWT obtained from logging in non-interactively with the client credentials and secret to EntraID
