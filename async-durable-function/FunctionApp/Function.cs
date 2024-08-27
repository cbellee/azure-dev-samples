using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.DurableTask;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.DurableTask.Protobuf;
using Microsoft.Extensions.Logging;
using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using Azure.Storage.Sas;
using static Microsoft.AspNetCore.Hosting.Internal.HostingApplication;
using Azure.Identity;
using DurableTask.AzureStorage;
using Azure.Storage.Blobs.Specialized;
using Grpc.Core;

namespace FunctionApp
{
    public static class Function
    {
        [FunctionName("Function")]
        public static async Task<List<string>> RunOrchestrator(
            [OrchestrationTrigger] IDurableOrchestrationContext context)
        {
            var outputs = new List<string>();

            var accountName = Environment.GetEnvironmentVariable("STORAGE_ACCOUNT_NAME");
            var sourceContainer = Environment.GetEnvironmentVariable("SOURCE_CONTAINER_NAME");
            var destContainer = Environment.GetEnvironmentVariable("DEST_CONTAINER_NAME");
            var blobName = Environment.GetEnvironmentVariable("BLOB_NAME");

            var storageDetails = new StorageDetails{
                SourceContainerName = sourceContainer,
                DestContainerName = destContainer,
                StorageAccountName = accountName,
                BlobName = blobName
            };

            // Wait for 7 minutes 
            DateTime dueTime = context.CurrentUtcDateTime.AddMinutes(7);
            await context.CreateTimer(dueTime, CancellationToken.None);

            outputs.Add(await context.CallActivityAsync<string>(nameof(CopyBlob), storageDetails));

            return outputs;
        }

        [FunctionName(nameof(CopyBlob))]
        public static string CopyBlob([ActivityTrigger] StorageDetails storageDetails, ILogger log)
        {
            // create default credential
            var cred = new DefaultAzureCredential();

            // create uri for storage account
            var uri = new Uri($"https://{storageDetails.StorageAccountName}.blob.core.windows.net");

            // create blob & container clients
            var blobServiceClient = new BlobServiceClient(uri, cred);

            var sourceContainerClient = blobServiceClient.GetBlobContainerClient(storageDetails.SourceContainerName);
            var sourceBlobClient = sourceContainerClient.GetBlobClient(storageDetails.BlobName);

            var destContainerClient = blobServiceClient.GetBlobContainerClient(storageDetails.DestContainerName);
            var destBlobClient = destContainerClient.GetBlobClient(storageDetails.BlobName);

            log.LogInformation($"Started copy operation...");

            // start async blob copy
            var blobProperties = sourceBlobClient.GetProperties().Value;
            var totalBytes = blobProperties.ContentLength;

            try
            {
                CopyFromUriOperation copyOperation = destBlobClient.StartCopyFromUri(sourceBlobClient.Uri);
                copyOperation.WaitForCompletion();

                /*
                while (copyOperation.HasCompleted == false)
                {
                    var bytesCopied = copyOperation.Value;
                    var percentageCopied = 100 * bytesCopied / totalBytes;
                    log.LogInformation($"copy progress: {percentageCopied}%");

                    Task.Delay(1 * 1000);
                }
                */
            } 
            catch (Exception e)
            {
                log.LogInformation($"copy failed with error: {e.Message}");
                return $"copy failed with error: {e.Message}";
            }

            log.LogInformation($"copy complete...");

            return $"copy complete...";
        }

        [FunctionName("Function_HttpStart")]
        public static async Task<HttpResponseMessage> HttpStart(
            [HttpTrigger(AuthorizationLevel.Anonymous, "get", "post")] HttpRequestMessage req,
            [DurableClient] IDurableOrchestrationClient starter,
            ILogger log)
        {
            // Function input comes from the request content.
            string instanceId = await starter.StartNewAsync("Function", null);

            log.LogInformation("Started orchestration with ID = '{instanceId}'.", instanceId);

            return starter.CreateCheckStatusResponse(req, instanceId);
        }
    }
}