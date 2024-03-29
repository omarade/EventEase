using MassTransit;
using Microsoft.Extensions.Options;
using OpenTelemetry.Metrics;
using SearchService.Consumers;
using SearchService.Data;
using Prometheus;

var builder = WebApplication.CreateBuilder(args);

// vars
var rabbitMQ = "";
// database
var connectionString = "";
var databaseName = "";
var eventsCollectionName = "";

//Env specific configuration
if (builder.Environment.IsProduction())
{
    rabbitMQ = Environment.GetEnvironmentVariable("RABBIT_MQ");
    Console.WriteLine(rabbitMQ);

    connectionString = Environment.GetEnvironmentVariable("SEARCH_DB_CONNECTION_STRING");
    Console.WriteLine(connectionString);
    databaseName = Environment.GetEnvironmentVariable("SEARCH_DB_NAME");
    Console.WriteLine(databaseName);
    eventsCollectionName = Environment.GetEnvironmentVariable("EVENTS_COLLECTION_NAME");
    Console.WriteLine(eventsCollectionName);

    // Map database settings in env variable to DatabaseSettings
    var databaseSettings = new DatabaseSettings 
    {
        ConnectionString = connectionString,
        DatabaseName = databaseName,
        EventsCollectionName = eventsCollectionName
    };

    builder.Services.AddSingleton(databaseSettings);

    builder.Services.Configure<DatabaseSettings>(config =>
    {
        config.ConnectionString = databaseSettings.ConnectionString;
        config.DatabaseName = databaseSettings.DatabaseName;
        config.EventsCollectionName = databaseSettings.EventsCollectionName;
    });
}
else 
{
    rabbitMQ = $"amqp://guest:guest@{builder.Configuration["RabbitMQHost"]}:{builder.Configuration["RabbitMQPort"]}";

    // Map database settings in appsettings to DatabaseSettings
    builder.Services.Configure<DatabaseSettings>(
        builder.Configuration.GetSection("EventEaseSearchDatabase")
    );
}

builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

//Configure MassTransit RMQ
builder.Services.AddMassTransit(config => {
    // register consumer
    config.AddConsumer<VenueUpdatedConsumer>();
    config.AddConsumer<VenueDeletedConsumer>();
    config.AddConsumer<EventCreatedConsumer>();
    config.AddConsumer<EventDeletedConsumer>();
    config.AddConsumer<EventUpdatedConsumer>();

    config.SetKebabCaseEndpointNameFormatter();

    config.UsingRabbitMq((ctx, cfg) => {
		Console.WriteLine(rabbitMQ);
        cfg.Host(rabbitMQ);

        cfg.ReceiveEndpoint("SearchService_venue-updated-endpoint", c => {
            // define the consumer class
            c.ConfigureConsumer<VenueUpdatedConsumer>(ctx);
        });

        cfg.ReceiveEndpoint("SearchService_venue-deleted-endpoint", c => {
            // define the consumer class
            c.ConfigureConsumer<VenueDeletedConsumer>(ctx);
        });

        cfg.ReceiveEndpoint("SearchService_event-created-endpoint", c => {
            // define the consumer class
            c.ConfigureConsumer<EventCreatedConsumer>(ctx);
        });

        cfg.ReceiveEndpoint("SearchService_event-updated-endpoint", c => {
            // define the consumer class
            c.ConfigureConsumer<EventUpdatedConsumer>(ctx);
        });

        cfg.ReceiveEndpoint("SearchService_event-deleted-endpoint", c => {
            // define the consumer class
            c.ConfigureConsumer<EventDeletedConsumer>(ctx);
        });
    });
});

// builder.Services.AddScoped<IEventRepo, EventRepo>();
builder.Services.AddSingleton<IEventRepo, EventRepo>();

//CORS
// var allowedSpecificOrigins = "_allowedSpecificOrigins";

// builder.Services.AddCors(options =>
// {
//     options.AddPolicy(name: allowedSpecificOrigins,
//         policy  =>
//         {
//             policy.WithOrigins("http://localhost:80",
//                                 "http://localhost:4200");
//         }
//     );
// });


builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Monitoring Prometheus: export metrics to Prometheus
// http://localhost:5268/api/search/metrics
app.UseMetricServer("/api/search/metrics");
app.UseHttpMetrics(options =>
{
    // This will preserve only the first digit of the status code.
    // For example: 200, 201, 203 -> 2xx
    options.ReduceStatusCodeCardinality();
});


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}


// app.UseHttpsRedirection();

// app.UseCors(allowedSpecificOrigins);

app.UseAuthorization();

app.MapControllers();

PrebDb.PrepPopulation(app, app.Environment.IsProduction());

app.Run();
