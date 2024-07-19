# Azure Durable Function deployment example

## Introduction

This is an example of how to write and deploy an Azure Durable Function. The example function is a simple HTTP triggered function that is called using a Logic app and starts an orchestrator function. The orchestrator function then executes a blob copy activity before returning a response. The solution is deployed using Azure Bicep and the Azure CLI.

## Deployment

To deploy the solution, you will need to have the Azure CLI installed and be logged in to your Azure account.

- Clone the repository
- Navigate to the cloned directory
- Execute the `./deploy.sh` script
  - NOTE: If you want to deploy private endpoints for the function app frontend and both the function and logic app's storage accounts, you will need to set the `isPrivate` variable to `true` in the `deploy.sh` script.
- The script will create a resource group, storage accounts, virtual network, app service plans, logic app, function app and private DNS zones.
- The script will also compile the Function App and zip both the function and logic apps.
- Due to private endpoint restrictions, final code deployment (lines 49 & 50) will need to occur from a VM within the virtual network.
- Before executing the logic app, you will need to upload a blob named `source_video.mp4` to the 'source' container in the storage account prefixed `storblob`.
