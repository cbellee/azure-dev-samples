namespace todo
{
    using System;
    using System.Threading.Tasks;
    using Azure.Identity;
    using Microsoft.AspNetCore.Builder;
    using Microsoft.AspNetCore.Hosting;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.DependencyInjection;
    using Microsoft.Extensions.Hosting;
    // Import the Azure.Monitor.OpenTelemetry.AspNetCore namespace.
    using Azure.Monitor.OpenTelemetry.AspNetCore;
    using OpenTelemetry.Trace;
    using OpenTelemetry.Instrumentation;
    using OpenTelemetry.Logs;
    using OpenTelemetry.Metrics;

    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // <ConfigureServices> 
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews();
            services.AddSingleton<ICosmosDbService>(InitializeCosmosClientInstanceAsync(Configuration.GetSection("CosmosDb")).GetAwaiter().GetResult());
            services.AddOpenTelemetry()
                .UseAzureMonitor(o =>
                {
                    o.SamplingRatio = 0.1F;
                })
                .WithMetrics(o =>
                {
                    o.AddAspNetCoreInstrumentation();
                    o.AddHttpClientInstrumentation();
                }
                )
                .WithTracing(o =>
                {
                    o.AddAspNetCoreInstrumentation();
                    o.AddHttpClientInstrumentation();
                }
            );
            services.ConfigureOpenTelemetryMeterProvider((o) =>
                        {
                            //o.AddAspNetCoreInstrumentation();
                            //o.AddRuntimeInstrumentation();
                            o.AddMeter("OTel.Todo.AzureMonitor");
                        });
            services.ConfigureOpenTelemetryTracerProvider((o) =>
            {
                //o.AddAspNetCoreInstrumentation();
                // o.AddHttpClientInstrumentation();
            });
        }
        // </ConfigureServices> 

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            //app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Item}/{action=Index}/{id?}");
            });
        }

        // <InitializeCosmosClientInstanceAsync>
        /// <summary>
        /// Creates a Cosmos DB database and a container with the specified partition key. 
        /// </summary>
        /// <returns></returns>
        private static async Task<CosmosDbService> InitializeCosmosClientInstanceAsync(IConfigurationSection configurationSection)
        {
            string databaseName = configurationSection.GetSection("DatabaseName").Value;
            string containerName = configurationSection.GetSection("ContainerName").Value;
            string account = configurationSection.GetSection("Account").Value;

            // If key is not set, assume we're using managed identity
            string key = configurationSection.GetSection("Key").Value;
            ManagedIdentityCredential miCredential;

            Microsoft.Azure.Cosmos.CosmosClient client;
            if (string.IsNullOrEmpty(key))
            {
                Console.WriteLine("Using managed identity clientId:");
                miCredential = new ManagedIdentityCredential();
                client = new Microsoft.Azure.Cosmos.CosmosClient(account, miCredential);
            }
            else
            {
                Console.WriteLine($"Using key: {key}");
                client = new Microsoft.Azure.Cosmos.CosmosClient(account, key);
            }

            CosmosDbService cosmosDbService = new CosmosDbService(client, databaseName, containerName);
            Microsoft.Azure.Cosmos.DatabaseResponse database = await client.CreateDatabaseIfNotExistsAsync(databaseName);
            await database.Database.CreateContainerIfNotExistsAsync(containerName, "/id");

            return cosmosDbService;
        }
        // </InitializeCosmosClientInstanceAsync>
    }
}
