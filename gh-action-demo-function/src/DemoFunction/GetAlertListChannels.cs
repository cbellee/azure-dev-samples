using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using DemoFunction.Models;
using System;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;

namespace DemoFunction
{
    public class GetAlertListChannels
    {
        private readonly ILogger<GetAlertListChannels> _logger;

        public GetAlertListChannels(ILogger<GetAlertListChannels> log)
        {
            _logger = log;
        }

        [FunctionName(nameof(GetAlertListChannels))]
        [OpenApiOperation(operationId: nameof(GetAlertListChannels), Summary = "Get Alert List - Channels")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(
            statusCode: HttpStatusCode.OK,
            contentType: "application/json",
            bodyType: typeof(AlertListTeamsChannel[]),
            Description = "A list of Alert List - Channel pairs")]
        public async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "alertlistchannels")] HttpRequest req,
            [Blob(
                "data/alertlists-channels.json",
                FileAccess.Read, Connection = "DataBlobStorageConnectionString")] Stream blob
            )
        {
            _logger.LogInformation($"C# HTTP trigger function processed a request. Method:{req.Method} Protocol:{req.Protocol} Path:{req.Path}");

            try
            {
                _logger.LogInformation("reading blob 'data/alertlists-channels.json'");
                var reader = new StreamReader(blob);
                return new OkObjectResult(JsonConvert.DeserializeObject<AlertListTeamsChannel[]>(await reader.ReadToEndAsync()));
            }
            catch (Exception e)
            {
                _logger.LogError($"error reading blob 'data/alertlists-channels.json': {e.Message}");
                return new InternalServerErrorResult();
            }
        }
    }
}
