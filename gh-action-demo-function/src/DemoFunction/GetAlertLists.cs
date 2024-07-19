using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using DemoFunction.Models;
using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using System.Web.Http;
using System.Threading;

namespace DemoFunction
{
    public class GetAlertLists
    {
        private readonly ILogger<GetAlertLists> _logger;
        private static readonly double httpTimeout = 300; // set timeout to 5 minutes for long http requests to the remote API

        private static HttpClient _http = new()
        {
            Timeout = TimeSpan.FromSeconds(httpTimeout)
        };
        private readonly IConfiguration _config;

        public GetAlertLists(ILogger<GetAlertLists> log, IConfiguration config)
        {
            _logger = log;
            _config = config;
        }

        [FunctionName(nameof(GetAlertLists))]
        [OpenApiOperation(operationId: nameof(GetAlertLists), Summary = "Get Alert Lists")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        [OpenApiResponseWithBody(
            statusCode: HttpStatusCode.OK,
            contentType: "text/plain",
            bodyType: typeof(AlertList[]),
            Description = "A list of Alert List names and ids")]
        public async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "alertlists")] HttpRequest req)
        {
            _logger.LogInformation($"C# HTTP trigger function processed a request. Method:{req.Method} Protocol:{req.Protocol} Path:{req.Path}");

            if (!string.IsNullOrEmpty(_config["USE_MOCK_DATA"]))
            {
                return new OkObjectResult(
                    new[]
                    {
                        new AlertList { AlertListId = 1, AlertListName = "Alert List 1" },
                        new AlertList { AlertListId = 2, AlertListName = "Alert List 2" },
                        new AlertList { AlertListId = 3, AlertListName = "Alert List 3" }
                    });
            }

            string apiKey = _config["API_KEY"];
            _logger.LogInformation($"API_KEY: {apiKey}");
            
            string apiUrl = _config["API_URL"];
            _logger.LogInformation($"API_URL: {apiUrl}");

            if (string.IsNullOrEmpty(apiKey)) throw new InvalidOperationException("App setting API_KEY must be set.");
            if (string.IsNullOrEmpty(apiUrl)) throw new InvalidOperationException("App setting API_URL must be set.");

            try
            {
                _logger.LogInformation($"calling endpoint: {$"{apiUrl}/?api_key={apiKey}"}");
                var result = await _http.GetFromJsonAsync<AlertListsResult>($"{apiUrl}/?api_key={apiKey}");
                var response = result.results.Select(alert => new AlertList { AlertListId = alert.id, AlertListName = alert.name });
                _logger.LogInformation($"returning {response.Count()} alert lists");
                return new OkObjectResult(response);
            }
            catch (Exception e)
            {
                _logger.LogError($"error accessing API '{apiUrl}': {e.Message}");
                return new InternalServerErrorResult();
            }
        }
    }
}
