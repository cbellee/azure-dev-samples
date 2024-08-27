# Azure Function custom handler
This example builds and deploys a custom Azure function container image to a Linux App Service plan. 

The Bicep template also deploys the following resources:
- Azure SQL Server
- Azure SQL Database
- Virtual Network and subnets
- Storage Account
- Azure Container Registry
- Application Insights
- User managed identity.

Optionally, if the ./deploy.sh script is passed the '-p' flag the SQL Server, Azure Container Registry and Storage Account will each be provisioned behind their own Private Endpoints.

## Prerequisites
1. local Bash or Azure Cloud shell instance
2. [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

## Deployment
1. create a file ./deploy/.env containing 'SQL_ADMIN_USER_PASSWORD' variable name and value contents show below

NOTE: double quotes are required around the password value
```
SQL_ADMIN_USER_PASSWORD="<your password>"
```
2. run the deployment script
```
$ cd ./deploy
$ ./deploy.sh
```
  - optional: add the '-p' flag to deploy the Azure SQL Database, Azure Container Registry and Azure Function storage account behind private endpoints. 
```
$ cd ./deploy
$ ./deploy.sh -p
```
  - optional: add the '-s' flag to skip the container image build
```
$ cd ./deploy
$ ./deploy.sh -s
```
  - optional: add the both flags to skip the container image build and deploy private endpoints
```
$ cd ./deploy
$ ./deploy.sh -s -p
```

## Test the API
1. the function FQDN will be output to the console once the deployment completes. Add the value to an environment variable named 'FUNCTION_FQDN'
```
$ FUNCTION_FQDN=<function fqdn>
```
2. add new todo items
```
$ curl https://$FUNCTION_FQDN/api/todos -X POST -d '{"description":"feed the dogs"}'
$ curl https://$FUNCTION_FQDN/api/todos -X POST -d '{"description":"get milk"}'
$ curl https://$FUNCTION_FQDN/api/todos -X POST -d '{"description":"walk the dogs"}'
```
3. display all todo items
```
$ curl https://$FUNCTION_FQDN/api/todos
```
4. complete a todo item
```
$ curl https://$FUNCTION_FQDN/api/todos/complete/1 -X PATCH
```
5. get completed todo items
```
$ curl https://$FUNCTION_FQDN/api/todos/completed
```
6. get incomplete todo items
```
$ curl https://$FUNCTION_FQDN/api/todos/incomplete
```
7. update todo item
```
$ curl https://$FUNCTION_FQDN/api/todos/2 -X PATCH -d '{"description":"get chocolate"}'
```
8. delete todo item
```
$ curl https://$FUNCTION_FQDN/api/todos/1 -X DELETE
```
9. display all todo items
```
$ curl https://$FUNCTION_FQDN/api/todos
```