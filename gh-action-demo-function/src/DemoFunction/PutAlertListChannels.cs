using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using DemoFunction.Models;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System;
using System.Web.Http;

namespace DemoFunction
{
    public class PutAlertListChannels
    {
        private readonly ILogger<PutAlertListChannels> _logger;

        public PutAlertListChannels(ILogger<PutAlertListChannels> log)
        {
            _logger = log;
        }

        [FunctionName(nameof(PutAlertListChannels))]
        [OpenApiOperation(operationId: nameof(PutAlertListChannels), Summary = "Update Alert List - Channels")]
        [OpenApiSecurity(
            "function_key",
            SecuritySchemeType.ApiKey,
            Name = "code",
            In = OpenApiSecurityLocationType.Query)]
        [OpenApiRequestBody(
            "application/json",
            typeof(AlertListTeamsChannel[]),
            Description = "The full Alert List - Channels list to put",
            Required = true)]
        [OpenApiResponseWithoutBody(statusCode: HttpStatusCode.OK, Description = "Returns 200 OK status if successful.")]
        public async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "put", Route = "alertlistchannels")] HttpRequest req,
            [Blob(
                "data/alertlists-channels.json",
                FileAccess.Write, Connection = "DataBlobStorageConnectionString")] Stream blob
            )
        {
            _logger.LogInformation($"C# HTTP trigger function processed a request. Method:{req.Method} Protocol:{req.Protocol} Path:{req.Path}");

            try
            {
                _logger.LogError($"writing blob 'data/alertlists-channels.json'");
                await req.Body.CopyToAsync(blob);
                return new OkResult();
            }
            catch (Exception e)
            {
                _logger.LogError($"error writing blob 'data/alertlists-channels.json': {e.Message}");
                return new InternalServerErrorResult();
            }
        }
    }
}
